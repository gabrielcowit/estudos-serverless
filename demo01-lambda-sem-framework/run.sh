#1o passo criar um arquivo de politicas de segurança
#2o passo criar role de segurança na AWS importando as politicas

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

#3o passo criar arquivo com conteudo e zipa-lo
zip function.zip index.js

#4o passo criar funcao lambda
aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role #inserir-iam-retornado-em-role.log \
    | tee logs/lambda-create.log

#5o passo invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# --- Caso atualize arquivo, zipa novamente
zip function.zip index.js

# atualizar lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# remover
aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo