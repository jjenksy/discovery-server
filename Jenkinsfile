
node {

stage ('Checkout'){
    try {

       // git 'https://github.com/jjenksy/discovery-server.git'
        checkout scm

    }catch(err) {
        notify("Error ${err}")
        currentBuild.result = 'FAILURE'
    }

     mvnHome = tool 'M3'
}
// stage ('Verify'){
//     try {

//         sh "'${mvnHome}/bin/mvn' mvn clean verify"


//     }catch(err) {
//         notify("Error ${err}")
//         currentBuild.result = 'FAILURE'
//     }

// }
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
        //code coverage report but needs jacoco plugin
        // publishHTML(target: [allowMissing: true,
        //                 alwaysLinkToLastBuild: false,
        //                 keepAll: true,
        //                 reportDir: 'target/site/jacoco/',
        //                 reportFiles: 'index.html',
        //                 reportName: 'Code Coverage'])

        step([$class: 'JUnitResultArchiver',
              testResults: 'target/surefire-reports/TEST-*.xml'])

        step([$class: 'ArtifactArchiver',
               artifacts: "target/*.?ar",
               excludes: null])

        notify('Complete')
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

input 'Deploy?'

stage name: 'Deploy', concurrency: 1
node {
    //sh "<h1>echo 'Deploy: {env.BUILD_DISPLAY_NAME}</h1>'"
    //run the docker compose
    // sh 'docker-compose up -d --build'
}
