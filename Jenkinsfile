pipeline {
    agent any
    environment {
        VARFILE = "config/${params.ENV}.tfvars"
        AWS_ACCESS_KEY_ID = "${params.ACCESS_KEY}"
        AWS_SECRET_ACCESS_KEY ="${params.SECRET_KEY}"

    }
    stages {
        stage('init'){
            steps { 
                sh "terraform init -backend-config config/${params.ENV}-backend.tfvars"
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