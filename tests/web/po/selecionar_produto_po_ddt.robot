*** Settings ***
Resource       ../../../pages/base_page.robot            # Chama o arquivo 'base_page.robot' onde estão todos os Resources
Test Template    Compra Passagem Aerea                        # Nova inclusão

*** Test Cases ***                                 
TC001    Paris                       Buenos Aires    234     Flights from Paris to Buenos Aires:       $432.98
TC002    Philadelphia                Rome            43      Flights from Philadelphia to Rome:        $472.56
TC003    Boston                      London          12      Flights from Boston to London:             $765.32
TC004    Portland                    Berlin          9696    Flights from Portland to Berlin:           $200.98
TC005    San Diego                   New York        4346    Flights from San Diego to New York:        $233.98
TC006    Mexico City                 Dublin          43      Flights from Mexico City to Dublin:        $472.56
TC007    São Paolo                   Cairo           234     Flights from São Paolo to Cairo:            $432.98

*** Keywords ***                                           
Compra Passagem Aerea                                        
    [Arguments]    ${txt_cidade_partida}    ${txt_cidade_destino}    ${Numero_voo}    ${partida_destino}    ${Price}
    Abrir navegador
    Element Text Should Be    ${home}    home                                              # Verificando "Texto"
    Element Attribute Value Should Be    ${encontrar_voos}    value    Find Flights        # Como estamos verificando o botão de elemento "input", que não tem texto interno, devemos utilizar o comando de atributo "value"
    Element Text Should Be    ${welcome}    Welcome to the Simple Travel Agency!
    Preencher cidade de partida       ${txt_cidade_partida}
    Preencher cidade de destino       ${txt_cidade_destino}
    Tirar Screenshot    1- Home
    Clicar botao encontrar voos
# Mapeamento da 2ª pagina - Voos Partida p/ destino
    Element Should Contain    ${voo_partida_destino}   ${partida_destino}    ${Price}                 # Usamos "Should Contain" pois Contain esta definido no programa original
    Element Text Should Be    ${Choose}    Choose
    Element Text Should Be    ${Airline}    Airline
    Tirar Screenshot    2- Confirma Voo Partida Destino
    Clicar no escolha este voo pelo numero    ${Numero_voo}
    Tirar Screenshot    3- Inicio da Reserva
# Mapeamento da 3ª pagina - Confirmação da reserva de voo
    Element Text Should Be    ${reserva_voo}    Your flight from TLV to SFO has been reserved.    
    Element Text Should Be    ${txt_name}    Name
    Element Text Should Be    ${txt_address}    Address
    Preenche dados para reserva    Ze Papinho    Rua Constantino 123    Piraposinha    Ceara    1122334    Visa    919293    3    2026    Ze
    Tirar Screenshot    3.1- Confirma Reserva Voo
    Clica em Compra de voo
# Mapeamento da 4ª pagina - Confirmação Compra voo
    Element Text Should Be    ${Confirma_Compra}    Thank you for your purchase today!
    Element Text Should Be    ${Id}    Id
    Element Text Should Be    ${Status}    Status
    Tirar Screenshot    4- Confirma Compra Voo
    
