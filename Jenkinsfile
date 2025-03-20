pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        TF_DIR = 'terraform'
        ANSIBLE_DIR = 'ansible'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-repo.git'
            }
        }
        stage('Terraform Init & Apply') {
            steps {
                dir(TF_DIR) {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                dir(ANSIBLE_DIR) {
                    sh 'ansible-playbook -i inventory.ini playbook.yml'
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline Completed"
        }
    }
}
