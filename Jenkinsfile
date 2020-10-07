@Library('adm-jenkins-lib@trunk') _
def performDeploymentStages(String node, String app) {
    stage("build") {
        echo "Building the app [${app}] on node [${node}]"
        sh 'date -u'
    }
    stage("deploy") {
        echo "Deploying the app ${app}] on node [${node}]"
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

node{
    stage('common task'){
        when(params.manage_steps ==~ /common_task|all_tasks/) {
            sh "echo common task"   
        }
    }
    def stages = [failFast: true]
    for (int i = 1; i < params.countTotal.toInteger()+1; i++) {
        if (params.servers == 'all' || params.servers == i.toString() )
        {
            def vmNumber = i //alias the loop variable to refer it in the closure
            stages["server${vmNumber}"] = {
                stage("deploy ${vmNumber}") {
                        when(params.manage_steps ==~ /deploy_task|all_tasks/) {
                        sh "echo deploy; sleep 5"
                  }
                }
                stage("test ${vmNumber}") {
                        when(params.manage_steps ==~ /test_task|all_tasks/) {
                        sh "echo testing; sleep 5"
                        }
                }
            }
        }
    }
    parallel stages
}
