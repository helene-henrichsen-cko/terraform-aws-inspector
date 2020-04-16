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
    stage('Initialize') {
    steps() {
        echo 'Starting clone'
        git(url: "${GIT_URL}",
            credentialsId: "${GIT_CRED_ID}",
            branch: "${BRANCH}")
        withCredentials([usernamePassword(credentialsId: "${GIT_CRED_ID}", passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USER')]) {
            sh '''
                git config --global credential.helper 'store --file ~/.my-credentials'
                echo "https://${GIT_USER}:${GIT_TOKEN}@github.com" > ~/.my-credentials
                git config --global user.user ${GIT_USER}
                git config --global user.email ${GIT_USER}@checkout.com
            '''
        }
    }
}
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
