# instalar serverless framework
npm i -g serverless

# inicializar serverless
sls

# sempre fazer deploy do ambiente para verificar se está ok com o ambiente
sls deploy

# invocar na AWS
sls invoke -f hello

# invocar local
sls invoke local -f hello --log

# Configurar dashboard
sls

# logs
sls logs -f hello -t

# remover
sls remove

