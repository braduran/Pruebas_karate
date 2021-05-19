Feature: Test API Prueba transfers

  Background:
    * url "https://pruebas-brayan.getsandbox.com"
    * def pathBase = "/transfer"

  Scenario: Transferir y esperar mensaje de transaccion exitosa
    Given path pathBase
    Given headers {Content-Type: 'application/json'}
    Given request ''
    When method post
    Then status 200
    And match $.detail == "TRANSACCION EXITOSA"
    And match $.code == "000"

  Scenario: Transferir cuando un path no existe
    Given path pathBase + "/cuenta"
    Given headers {Content-Type: 'application/json'}
    Given request ''
    When method post
    Then status 500

  Scenario: Transferir y validar toda la respuesta
    Given path pathBase
    Given headers {Content-Type: 'application/json'}
    Given request ''
    When method post
    Then status 200
    And match $ == {detail:'TRANSACCION EXITOSA', code:'000', voucher:'45697830'}