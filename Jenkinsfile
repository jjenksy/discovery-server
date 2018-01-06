node {
    
    stage ('Checkout'){
    try {

       checkout scm
       
       stash includes: '**', name: 'chekout'

    }catch(err) {
       // notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }
}

}

node('build-agent-linux')  {
stage('Build') {
      // Run the maven build
          sh 'ls'
          unstash 'chekout'
          sh 'ls'
      try {

        sh ' mvn clean package'

      } catch(err) {
        notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }

}

stage ('archival') {

        step([$class: 'JUnitResultArchiver',
              testResults: 'target/surefire-reports/TEST-*.xml'])

        step([$class: 'ArtifactArchiver',
               artifacts: "target/*.?ar",
               excludes: null])
}

stage ('deploy'){

    sh 'sudo docker version'
}

}

def notify(status){
    emailext (
      to: "jjenksy@gmail.com",
      subject: "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a></p>""",
    )
}
