pipeline {
  agent any
  stages {
    stage('Non-Parallel Stage') {
      steps {
        echo 'Executing this stage first'
      }
    

    stage('Parallel Stage') {
     for (int i = 0; i < 10; ++i){
    node{
        stage('Build') {
           steps {
            echo 'Here trigger job: jenkins_job_1. Triggered at time:'
            sh 'date -u'
          }
        }
        stage('Run') {
            steps {
            echo 'Here trigger job: jenkins_job_1. Triggered at time:'
            sh 'date -u'
          }
        }
        stage('Reporting') {
            steps {
            echo 'Here trigger job: jenkins_job_1. Triggered at time:'
            sh 'date -u'
          }
        }
    }

}

}
