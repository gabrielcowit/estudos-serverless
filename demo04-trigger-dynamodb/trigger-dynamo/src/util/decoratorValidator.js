const decoratorValidator = (fn, schema, argsType) => {

    return async function (event) {

        const data = JSON.parse(event[argsType])
        // abortEarly === mostra todos os erros de uma vez
        const {error,value} = await schema.validate( data, { abortEarly:false } )

        // isso faz alterar a instancia do argumento
        event[argsType] = value
        
        // arguments serve para pegar todos os argumentos que vieram na função
        // e mandar pra frente
        // o apply vai retornar a função que será executada posteriormente
        if(!error) {
            return fn.apply(this, arguments)
        }

        return {
            statusCode: 422,
            body: error.message
        }

        //console.log('event',event)
        //console.log('schema',schema)
        //console.log('argsType',argsType)
    }
}

module.exports = decoratorValidator