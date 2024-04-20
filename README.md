#  Casos de uso
## Mostrar lista de cryptomonedas globales

Como usuario quiero poder consultar las crypto globales ordenadas por capitallización de mercado

GIVEN Tengo la app iniciada
WHEN aceder a la vista global
THEN vero un listado de las cryto globales
AND la información básica de cada crypto (nombre, symbol, precio, cambio de precio últimas 24hrs,
    volumen últimas 24hr, capitalización de mercado)

Entities 
    Cryptorcurrency
        Id
        name
        symbol
        price
        price24h
        volumen24h
        marketCap
        
Use Cases
    Get global cryto list
    
