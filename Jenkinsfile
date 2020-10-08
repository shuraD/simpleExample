def performDeploymentStages(String node) {
       node{
            stage("${node}") {
                echo "Testing on node [${node}]"
        }
       }
}

def printme(String myd)
{
    stage("${myd}") {
         
            echo "Testing on node [${myd}]"
            sh(script: "date -u")
            sh(script: "ifconfig | grep 192")
            sh(script: "sleep ${f}")
            sh(script: "date -u")
         
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
                    for (node1 in params.NODES.tokenize(',')) {
                         def mynode = node1
                        nodes["${node1}"] = {
                            node("${mynode}"){
                                printme(mynode)
                            }  
                        
                        }
                    }
                    parallel nodes
                }
            }
        }
    }
}
