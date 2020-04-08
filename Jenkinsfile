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
    stage('Terraform Format Check') {
        steps {
            sh 'terraform fmt -write=false'
        }
    }
    stage('Terraform Init') {
        steps {
            sh 'terraform init -backend=false -input=false'
        }
    }
    stage('Validate Terraform configurations') {
        steps {
            sh 'terraform validate "$m" && echo "√ $m"'
        }
    }
    stage('Check Terraform configurations with tflint'){
        steps {
            sh 'tflint /home/jenkins/workspace/helene-test_master/terraform-aws-inspector'
        }
    }
    stage('Check Terraform configurations with terraform docs'){
        steps {
            sh 'terraform-docs md .'
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
