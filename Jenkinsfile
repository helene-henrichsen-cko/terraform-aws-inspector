pipeline {
agent {
    node {
        label 'terraform-v0.12.24'
    }
}
    options {
        timeout(time: 1, unit: "HOURS")
        buildDiscarder(logRotator(numToKeepStr: "5"))
    }

    environment {
        TF_IN_AUTOMATION = 1
    }
           
    stages{
        stage('Terraform Pre-Commit'){
            steps {
                sh 'pre-commit run --verbose'
            }
        }
        stage('Validate Terraform Configs'){
            steps {
                sh 'terraform init -backend=false -input=false'
                sh 'terraform validate "$m" && echo "√ $m"'
            }
        }
        stage('Check Terraform configurations with tflint'){
        steps {
            sh  "tflint"
        }
      }
    }
    post {
        always{
            script {
                currentBuild.result = currentBuild.result ?: 'SUCCESS'
            }
            deleteDir()
        }
    }
}
