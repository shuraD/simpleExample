pipeline {
  agent any
  stages {
    stage('Non-Parallel Stage') {
      steps {
        echo 'Executing this stage first'

      }
    }

stage('Build, run, report') {
    for (int i = 0; i < 10; ++i) {
        def index = i

        jobs[i] = {
            node {
                build job: 'Build', parameters:
                build 'Run'
                build 'Reporting'
            }
        }
    }
    parallel jobs
}



  }
}
