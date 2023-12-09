@token
Feature: getToken

  @getTOken
  Scenario: obtener toke para consumir
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    * url 'https://seguridad.test.uat.cl'
    * header 'Content-Type' = 'application/x-www-form-urlencode'
    * form field grand_type = 'password'
    * form field client_id = 'ID'
    * form field client_secret = 'secret'
    * form field username = 'user'
    * form field password = 'password'
    * method POST
    * status 200
    * match responseType == 'json'
