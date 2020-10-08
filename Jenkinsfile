


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
        stage('1') {
            steps {
                script {
                    def tests = [:]
                    for (f = 0; f <10; f++) {
                        tests["${f}"] = {
                            node {
                                stage("${f}") {
                                    echo "[${f}]"
                                    sh(script: "date -u")
                                    sh(script: "sleep ${f}")
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
