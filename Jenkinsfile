


def performDeploymentStages(String node, String app) {
    stage("build") {
        echo "Building the app [${app}] on node [${node}]"
        sh 'date -u'
    }
    stage("deploy") {
        echo "Deploying the app [${app}] on node [${node}]"
         sh 'date -u'
    }
    stage("test") {
        echo "Testing the app [${app}] on node [${node}]"
        sh 'date -u'
    }
}





properties([
    parameters([
        string(name: 'countTotal', defaultValue: '4'),
        choice(name: 'servers', choices: ['all', '1', '2','3','4'], description: 'Run on specific platform'),
        choice(name: 'manage_steps', choices: ['all_tasks','common_task','deploy_task','test_task'], description: 'Choose task')
    ])
])


pipeline {
    agent any
    stages {
        stage('Non-Parallel Build') {
            steps {
                echo "Executing this stage first"
            }
        }
        stage('Parallel build') {
            steps {
                script {
                    def tests = [:]
                    for (f = 0; f <params.countTotal.toInteger(); f++) {
                        tests["${f}"] = {
                            node("${f}") {
                                stage("${f}") {
                                    echo "${f}]"
                                    sh(script: "date -u")
                                    sh(script: "ifconfig | grep 192")
                                    sh(script: "sleep ${f}")
                                    sh(script: "date -u")
                                }
                            }
                        }
                    }
                    parallel tests
                }
            }
        }       
    }
}
