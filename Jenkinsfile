node {
    
    stage ('Checkout'){
    try {

       checkout scm
       mvnHome = tool 'M3'
       
       stash includes: '**', name: 'chekout'

    }catch(err) {
       // notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }
}
stage('Build') {
      // Run the maven build
      try {

        sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"

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

}

// input 'Deploy?'

stage name: 'Deploy', concurrency: 1
node('build-agent-linux')  {

stage ('deploy'){
    
    sh 'ls'
    unstash 'chekout'
    sh 'ls'
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
