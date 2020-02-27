node {
    def app

    stage('Clone repository') {

        checkout scm
    }

    ['stretch','jessie','jessie32','buster','bullseye'].each {

//    ['stretch','buster','buster-mojo8'].each {
//    ['buster-mojo8'].each {

        stage( "${it} | Build image" ) {
            app = docker.build("kohaaloha/koha-apt", "--no-cache --rm -f dists/${it}/Dockerfile .")
        }

        if ( it == 'stretch' ) {
            stage( "${it} | Push image" ) {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    app.push( "master" );
                }
            }
        } else {
            stage( "${it} | Push image" ) {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    app.push( "master-${it}" );
                }
            }
        }
    }
}
