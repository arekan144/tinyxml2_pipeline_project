pipeline {
    agent any
    
    environment
    {
        DEPLOY_TAG = "V1.0.${env.BUILD_NUMBER}"
        IMAGE_NAME = "tinytest"
    }
    
    stages {
        stage("Build")
        {
            steps
            {
                echo "Build stage..."
                sh '''docker build -t build -f build.Dockerfile .'''
            }
        }
        stage('Test')
        {
            steps
            {
                echo "Test stage..."
                sh '''docker build -t test -f test.Dockerfile .'''
                script
                {
                    def output = sh(script: "docker run test cat /app/Result.txt", returnStdout: true)
                    echo "Captured test output:\n${output}"
                    writeFile file: "Result.log", text: output
                }
            }
        }
        stage('Archive')
        {
            steps
            {
                echo "Archive stage..."
               archiveArtifacts artifacts: 'Result.log', fingerprint: true
            }
        }
    }
}
