def performDeploymentStages(String node) {
                                    node("${node}") {
                                stage("${node}") {
                                      echo "Testing on node [${node}]"
                                    sh(script: "date -u")
                                    sh(script: "ifconfig | grep 192")
                                    sh(script: "sleep ${node}")
                                    sh(script: "date -u")
                                }
                            }
}



pipeline {
  agent any
   parameters {
        string(name: 'NODES', defaultValue: '1,2', description: 'Nodes to build, deploy and test')
        choice(name: 'ENV', choices: 'qa', description: 'Environment')
        string(name: 'APPS', defaultValue: 'app01,app02', description: 'App names')
    }

    stages {
        stage('Non-Parallel Build') {
            steps {
                echo "Executing this stage first"
            }
        }
        stage('parallel stage') {
            steps {
                script {
                    def nodes = [:]
                    for (node in params.NODES.tokenize(',')) {
                            performDeploymentStages(node)
                    }
                    parallel nodes
                }
            }
        }
    }
}
