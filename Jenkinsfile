pipeline {
agent {
    node {
        label 'terraform-v0.12-ecs'
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
    stage('Terraform Init') {
        steps {
            sh 'terraform init -input=false'
        }
    }
    stage('Validations'){
        parallel {
            stage('Validate Terraform configurations') {
                steps {
                    sh 'find . -type f -name "*.tf" -exec dirname {} \\;|sort -u | while read m; do (terraform validate -check-variables=false "$m" && echo "√ $m") || exit 1 ; done'
                }
            }
            stage('Check if Terraform configurations are properly formatted') {
                steps {
                    sh "if [[ -n \"\$(terraform fmt -write=false)\" ]]; then echo \"Some terraform files need be formatted, run 'terraform fmt' to fix\"; exit 1; fi"
                }
            }
            stage('Check Terraform configurations with tflint'){
                steps {
                    sh  "tflint"
                }
            }
            stage('Check Terraform configurations with tf docs'){
                steps {
                    sh  "if [[ -n \"\$(terraform-docs markdown . -write=false")\ ]]; then echo \"Documentation need to be added, run 'terraform-docs markdown . and add to README.md' to fix\"; exit 1; fi"
                }
            }
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
