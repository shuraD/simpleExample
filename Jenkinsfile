def performDeploymentStages(String node) {
                                node("${node}") {
                                stage("${node}") {
                                      echo "Testing on node [${node}]"
                                    sh(script: "date -u")
                                    sh(script: "ifconfig | grep 192")
                                    sh(script: "sleep ${f}")
                                    sh(script: "date -u")
                                }
                            }
}
properties([
    parameters([
        string(name: 'NODES', defaultValue: '1,2', description: 'Nodes to build, deploy and test'),
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
                    def nodes = [:]
                    for (node in params.NODES.tokenize(',')) {
                            echo "${node}"
                          
                    }
                    parallel nodes
                }
            }
        }       
    }
}
