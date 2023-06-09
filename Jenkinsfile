pipeline {
  agent any
  //environment {
    //AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    //AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    //AWS_DEFAULT_REGION    = 'us-east-1'
  //}

  stages {
    stage('Authenticate with AWS') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'aws-access-key-id'
        ]]) {
          sh 'export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID'
          sh 'export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY'
          sh 'echo "Successfully authenticated with AWS"'
        }
      }
    }
    
    stage('Terraform Init') {
      steps {
        sh 'cd Terraform && terraform init'
      }
    }
    
    stage('Terraform Plan') {
      steps {
        sh 'cd Terraform'
        sh 'terraform plan -var="access_key=$AWS_ACCESS_KEY_ID" -var="secret_key=$AWS_SECRET_ACCESS_KEY"'
      }
    }
    
    stage('Terraform Apply') {
      steps {
        sh 'cd Terraform'
        sh 'terraform apply -var="access_key=$AWS_ACCESS_KEY_ID" -var="secret_key=$AWS_SECRET_ACCESS_KEY" -auto-approve'
      }
    }
  }
}
