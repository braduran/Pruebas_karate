Feature: Test API Prueba products

  Background:
    * url "https://pruebas-brayan.getsandbox.com"

  Scenario: Consultar productos responde codigo HTTP 200
    Given path '/products'
    Given headers {Content-Type: 'application/json'}
    When method get
    Then status 200

  Scenario: Consultar productos y verificar que primer elemento sea tarjeta-1
    Given path '/products'
    Given headers {Content-Type: 'application/json'}
    When method get
    Then status 200
    And match $.[0].nombre == "tarjeta-1"

  Scenario: Consultar productos y verificar que CVC de tarjeta sea igual a 123
    Given path '/products'
    Given headers {Content-Type: 'application/json'}
    When method get
    Then status 200
    And match $.[0].CVC == 123

  Scenario: Consultar productos y validar cuenta deposito es diferente a corriente
    Given path '/products'
    Given headers {Content-Type: 'application/json'}
    When method get
    Then status 200
    And match $.[1].tipo != "corriente"