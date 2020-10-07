pipeline {
    agent any
    stages {
        stage('Non-Parallel Stage') {
            steps {
                echo "Executing this stage first"
            }
        }
        stage('Parallel Stage') {
            parallel {
                stage('Parallel Test 1') {
                    steps {
                        echo "Here trigger job: jenkins_job_1. Triggered at time:"
                        sh(script: "date -u")
                        build(job: "jenkins_job_1")
                    }
                }
                stage('Parallel Test 2') {
                    steps {
                        echo "Here trigger job: jenkins_job_2. Triggered at time:"
                        sh(script: "date -u")
                        build(job: "jenkins_job_2")
                        echo "Here trigger job: jenkins_job_3. Triggered at time:"
                        sh(script: """date -u""")
                        build(job: "jenkins_job_3")
                    }
                }
            }
        }
    }
}
