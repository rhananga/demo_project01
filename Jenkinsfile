pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
    AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    AWS_DEFAULT_REGION    = 'us-east-1'
  }

  stages {
    stage('Authenticate with AWS') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'aws-credentials'
        ]]) {
          sh 'echo "Successfully authenticated with AWS"'
        }
      }
    }
    
    stage('Terraform Init') {
      steps {
        sh 'echo "terraform init"'
      }
    }
    
    stage('Terraform Plan') {
      steps {
        sh 'echo "terraform plan"'
      }
    }
    
    stage('Terraform Apply') {
      steps {
        sh 'echo "terraform apply -auto-approve"'
      }
    }
  }
}
