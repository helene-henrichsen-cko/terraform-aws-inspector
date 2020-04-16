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
    stage('Terraform Pre-Commit w/ tflint, fmt and terraform-docs'){
        steps {
            sh "if [[ -n \"\$(pre-commit run -a)\" ]]; then echo \"Some terraform files need be formatted, run 'terraform fmt' to fix\"; exit 1; fi"
        }
    }
    stage('Validate Terraform Configs'){
        steps {
            sh 'terraform init -backend=false -input=false'
            sh 'terraform validate "$m" && echo "√ $m"'
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
