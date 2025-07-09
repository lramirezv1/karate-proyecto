Feature: Karate Backend Test

Background:
    * url baseUrl
    * def time = function(){ return new Date().toLocaleTimeString('en-US', { hour12: false, hour: '2-digit', minute: '2-digit', second: '2-digit' }).replace(/:/g, ''); }
    * def randomName = 'User_Karate_' + time()
    * def randomEmail = randomName + '@karateqa.com'
    * def userId = null
    * def updatedUserId = null
    
Scenario: Test user Karate
   Given path '/usuarios'
   When method GET
   Then status 200
   * print 'Listar Usuarios:', response.usuarios
   And match response.usuarios[*].nome contains 'Fulano da Silva'


#Escenario: Registrar usuario
   Given path '/usuarios'
   And request
   """
    {
        "nome": "#(randomName)",
        "email": "#(randomEmail)",
        "password": "teste@r",
        "administrador": "true"
    }
   """
   When method POST
   Then status 201
   And match response == { message: 'Cadastro realizado com sucesso', _id: '#string' }
   * def userId = response._id
   * print 'userId after registration:', userId


#Escenario: Registrar usuario con email existente
   Given path '/usuarios'
   And request
   """
    {
        "nome": "#(randomName)",
        "email": "#(randomEmail)",
        "password": "teste@r",
        "administrador": "true"
    }
   """
   When method POST
   Then status 400
   And match response == { message: 'Este email já está sendo usado' } 

#Escenario: Buscar usuario por ID  --> Usario encontrado/validado
   Given path '/usuarios', userId
   When method GET
   Then status 200
   * print 'Lista Usuario:', response
   And match response == { _id: '#(userId)', nome: '#(randomName)', email: '#(randomEmail)', "password": "teste@r", "administrador": "true",}


#Escenario: Buscar usuario por ID  --> Usario no encontrado
   Given path '/usuarios/manfZ2hmuQHHNmra'
   When method GET
   Then status 400
   * print 'Lista Usuario:', response
   And match response == { message: 'Usuário não encontrado' }


#Escenario: Actualizar usuario
   Given path '/usuarios', userId
   * def updatedName = 'Usuario_Actualizado_' + randomName
   * def updatedEmail = 'actualizado_' + randomEmail
   And request
   """
    {
       "nome": "#(updatedName)",
        "email": "#(updatedEmail)",
        "password": "@ctualizacion",
        "administrador": "false"
    }
   """
   When method PUT
   Then status 200
   And match response == { message: 'Registro alterado com sucesso' }

   
#Escenario: Eliminar usuario
   Given path '/usuarios', userId
   When method DELETE
   Then status 200
   And match response == { message: 'Registro excluído com sucesso' }

   
#Escenario: Verificamos usuario eliminado
   Given path '/usuarios', userId
   When method DELETE
   Then status 200
   And match response == { message: 'Nenhum registro excluído' }