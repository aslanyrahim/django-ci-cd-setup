pipeline {
    agent any

    environment {
        // Set your Python version and virtualenv path
        VENV_DIR = 'venv'
        PYTHON = 'python3'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/aslanyrahim/django-ci-cd-setup.git', branch: 'main'
            }
        }

        stage('Set up Python Virtualenv') {
            steps {
                sh '''
                    $PYTHON -m venv $VENV_DIR
                    . $VENV_DIR/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    . $VENV_DIR/bin/activate
                    python manage.py test
                '''
            }
        }

        // stage('Collect Static Files') {
        //     steps {
        //         sh '''
        //             . $VENV_DIR/bin/activate
        //             python manage.py collectstatic --noinput
        //         '''
        //     }
        // }

        stage('Run Migrations') {
            steps {
                sh '''
                    . $VENV_DIR/bin/activate
                    python manage.py migrate --noinput
                '''
            }
        }
		
		stage('Deploy') {
			steps {
				echo 'Deploying application...'
			}
		}
    }

    post {
        always {
            // Clean up virtualenv after build
            sh 'rm -rf $VENV_DIR'
			echo 'Pipeline completed.'
        }
        failure {
            // mail to: 'aslany.rahim@gmail.com',
            //      subject: "Jenkins Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            //      body: "Check Jenkins for details: ${env.BUILD_URL}"
			echo 'Pipeline failed!'
        }
    }
}