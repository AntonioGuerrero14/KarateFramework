Feature: token basic and bearer

  Scenario: bearer token
    Given url 'https://api.github.com/user/repos'
    When header Authorization = 'bearer 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'
    And method GET
    Then status 200

    Scenario: basic autentication test
      Given url 'https://postman-echo.com/basic-auth'
      When header Authorization = call read('tokenB.js') {username:'postman', password:'password'}
      And method GET
      Then status 200