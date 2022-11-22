pipeline {
    agent any
    environment {
        VARFILE = "config/${}.tfvars"
    }
    stages {
        stage('init'){
            steps {
                sh "terraform init"
            }
        }
        stage('validate'){
            steps {
                sh "terraform validate"
            }
        }
   
        stage('plan'){
            steps {
                sh "terraform plan --var-file='${VARFILE}'"
            }
        }
  
        stage('apply'){
            steps {
                input 'Apply ?'
                sh "terraform apply -var-file='${VARFILE}' --auto-approve"
            }
        }
   
        stage('destroy'){
            steps {
                input 'destroy ?'
                sh "terraform destroy -var-file='${VARFILE}' --auto-approve"
            }
        }


    }
}