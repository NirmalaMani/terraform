pipeline {
  agent any

  tools {
    terraform 'terraform'
  }

  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
  }

  environment {
    varfile= "config/${params.ENVIRONMENT}.tfvars"
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
  }

  stages {
    stage('Init') {
      steps {
        sh "terraform init -backend-config config/${params.ENVIRONMENT}-backend.tfvars"
        echo 'Initialization done'
      }
    }

    stage('Validate') {
      steps {
        sh "terraform validate"
        echo 'Validation done'
      }
    }

    stage('plan') {
      steps {
        sh "terraform plan -var-file='${varfile}'"
        echo 'plan done'
      }
    }

    stage('apply') {
      steps {
          input 'Apply ?'
          sh "terraform apply -var-file='${varfile}' --auto-approve"
          echo 'Apply done'
      }
    }

     stage('destroy') {
      steps {
        input 'Destroy ?'
        sh "terraform destroy -var-file='${varfile}' --auto-approve"
        echo 'Destroy done'
      }
    }
  }
}
