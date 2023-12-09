Feature: plan de pruebas api REST

  @casoGET
  Scenario Outline: caso de prueba <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    #And match response.data.id == 2
    Then status <estadoHTTP>
    Examples:
      | nombreCASO        | ID | estadoHTTP |
      | caso id 1         | 1  | 200        |
      | caso id 2         | 2  | 200        |
      | caso id 3         | 3  | 200        |
      | caso id not found | 50 | 404        |

  @casoPOST
  Scenario Outline: caso de prueba <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": "<Vname>","<job>": "<Vjob"}
    And method POST
    Then status 201
    Examples:
      | nombreCaso2    | name | Vname   | job | Vjob |
      | name vacio     | name |         | job | QA   |
      | name nulo      | name | null    | job | QA   |
      | name 3 letras  | name | sol     | job | QA   |
      | sin campo name |      |         | job | QA   |
      | job vacio      | name | antonio | job |      |
      | job nulo       | name | antonio | job | null |
      | job 3 letras   | name | antonio | job | QAs  |
      | sin campo job  | name | antonio |     |      |


  Scenario: caso de prueba tipo POST numero 2
    Given url 'https://reqres.in/api/users'
    When request
    """
    {
    "name": "Antonio",
    "job": "BA"
    }
    """
    And method POST
    Then status 201

  Scenario: caso de prueba tipo DELETE
    Given url 'https://reqres.in/api/users/3'
    When method DELETE
    Then status 204