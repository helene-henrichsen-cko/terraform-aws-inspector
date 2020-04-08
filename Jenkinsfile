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
            sh 'print "Terraform FMT"'
            sh 'terraform fmt -write=false'
        }
    }
    stage('Terraform Init') {
        steps {
            sh 'print "Terraform Initialize"'
            sh 'terraform init -backend=false -input=false'
        }
    }
    stage('Validate Terraform configurations') {
        steps {
            sh 'print "Validating The TF Files"'
            sh 'terraform validate "$m" && echo "√ $m"'
        }
    }
    stage('Check Terraform configurations with tflint'){
        steps {
            sh 'tflint'
        }
    }
    stage('Check Terraform configurations with tf docs'){
        steps {
            sh 'terraform-docs markdown .'
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
