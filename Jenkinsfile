pipeline {
	agent any

	options {
		buildDiscarder(logRotator(numToKeepStr:'15'))
	}

	tools { 
		maven 'M3'
	}
	
	
	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}

		stage('Maven Build') {
			steps {
				sh 'sh ./1-maven-build.sh'
			}
		}
	}

	post {
		success {
			archiveArtifacts artifacts: 'build/**'
		}
	}
}
