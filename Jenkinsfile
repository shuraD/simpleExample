def performDeploymentStages(String node) {
       node{
            stage("${node}") {
                echo "Testing on node [${node}]"
        }
       }
}

def printme(String myd,ind)
{
    stage("${myd}") {
          
           echo "Testing on node [${myd}]"
           sh(script: "date -u")
           def count = 5
           for (int  i = 1; i <= ind; i++) {
               echo "inside the loop ${i}"
               sh(script: "sleep ${i}")
            } 
         
          
           /* sh(script: "ifconfig | grep 192")*/
            build job: 'daaa',
              parameters: [
                       string(name: 'daa1', value: String.valueOf("daa ${myd} ${ind}")),
                       string(name: 'sleep_num', value: String.valueOf("${ind}")),
                       
                       [$class: 'NodeParameterValue', name: 'node_name', labels: ["$myd"], nodeEligibility: [$class: 'AllNodeEligibility']]
                        
                ]
             
            sh(script: "sleep ${ind}")
            sh(script: "date -u")
         
    }
}


pipeline {
  agent any
   parameters {
        string(name: 'NODES', defaultValue: '1,2,1,1', description: 'Nodes to build, deploy and test')
        choice(name: 'ENV', choices: 'qa', description: 'Environment')
        string(name: 'urls', defaultValue: 'app01,app02', description: 'App names')
        extendedChoice(name: "favorite_letters",
type: "PT_CHECKBOX",
multiSelectDelimiter: " ", // this only defines delimiter used in the output string value, not used for parsing value input, which must be comma-separated!
value: """a, b, c, d, e, f""",
defaultValue: "d, f",
description: "Select your favorite letter(s)"
)

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
                    def id = 3
                    def id_fornode = 0
                    for (node1 in params.NODES.tokenize(',')) {
                         def mynode = node1
                         def myid = id -1 
                         id = id -1 
                         id_fornode = id_fornode +1
                         def id_forn = id_fornode
                         echo "Testing on node [${mynode}]" 
                        nodes["${node1}_${id_forn}"] = {
                       

                       /*     node("${mynode}"){*/
                        node("master"){
                                printme(mynode,myid)
                            }  
                        
                        }
                    }
                    parallel nodes
                }
            }
        }
    }
}
