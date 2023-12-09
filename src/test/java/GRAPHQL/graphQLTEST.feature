@graphQLTEST

Feature: plan de pruebas asociado a query graphQL

  Scenario Outline: caso de prueba query <nombre Caso>

    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query {
  character (id:<numero>)
  {
  gender
  }
}
      """
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
      | nombre Caso  | numero |
      | caso normal  | 2      |
      | genero id 13 | 13     |
      | genero id 3  | 3      |
      | genero id 40 | 40     |
      | genero id 10 | 10     |




  @bodyCALL
  Scenario Outline: caso de prueba body call <nombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When def query = read ('testGRAPH.txt')
    And replace query.num = <num>
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
      | nombreCaso   | num |
      | caso normal  | 2   |
      | genero id 13 | 13  |
      | genero id 3  | 3   |
      | genero id 40 | 40  |
      | genero id 10 | 10  |