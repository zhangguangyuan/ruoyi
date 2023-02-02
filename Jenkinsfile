pipeline {
    agent {
            docker {
                image 'maven:3-alpine'
                args '-v /root/.m2:/root/.m2'
            }
        }
    // 存放所有任务的合集
    stages {

        stage('github拉取代码') {
            steps {
                echo 'github拉取代码'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://gitee.com/L1692312138/jenkins-demo.git']]])
            }
        }

//         stage('Sonar Scan') {
//             steps {
//                 sh '/var/jenkins_home/sonar-scanner/bin/sonar-scanner -Dsonar.sources=./ -Dsonar.projectname=${JOB_NAME} -Dsonar.projectKey=${JOB_NAME} -Dsonar.java.binaries=target/ -Dsonar.login=7d66af4b39cfe4f52ac0a915d4c9d5c513207098'
//             }
//         }

        stage('编译构建') {
            steps {
                echo 'mvn 编译构建'
                sh label: '', script: 'mvn clean package -Dmaven.test.skip=true'
            }
        }

        stage('构建镜像') {
            steps {
                echo '构建镜像'
                sh label: '', script: 'mvn dockerfile:build'
            }
        }

//         stage('Publish Over SSH') {
//             steps {
//                 sshPublisher(publishers: [sshPublisherDesc(configName: '131', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: "deploy.sh $harborHost $harborRepo $JOB_NAME $tag $container_port $host_port", execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
//             }
//         }
    }
//     post {
//       always {
//         emailext body: '${FILE,path="email.html"}', subject: '【构建通知】：$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'liush99@foxmail.com'
//       }
//     }
}