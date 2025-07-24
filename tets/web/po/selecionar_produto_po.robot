# Para teste "Page Object", sera utilizado a bliblioteca dos "Resource (do base)", logo não é necessário a biblioteca Library Selenuium;
# Sera utilizado somente o "Resource do Base" pois definimos no arquivo do bese que ele já consta de todos os outros Resouces a serem utilizados no teste.
*** Settings ***
Resource       ../../../pages/base_page.robot            # Chama o arquivo 'base_page.robot' onde estão todos os Resources

*** Test Cases ***
Compra Passagem Aerea
# Mapeamento da 1ª pagina - Home
    Abrir navegador
    Element Text Should Be    ${home}    home                                        # Verificando "Texto"
    Element Attribute Value Should Be    ${encontrar_voos}    value    Find Flights        # Como estamos verificando o botão de elemento "input", que não tem texto interno, devemos utilizar o comando de atributo "value"
    Element Text Should Be    ${welcome}    Welcome to the Simple Travel Agency!
    Preencher cidade de partida       Paris
    Preencher cidade de destino       Buenos Aires
    Clicar botao encontrar voos
# Mapeamento da 2ª pagina - Voos de Paris p/ Buenos Aires
    Element Should Contain    ${voo_partida_destino}    Flights from Paris to Buenos Aires    # Usamos "Should Contain" pois Contain esta definido no programa original
    Element Text Should Be    ${Choose}    Choose
    Element Text Should Be    ${Airline}    Airline
    Clicar no escolha este voo pelo numero    ${numero_voo}
# Mapeamento da 3ª pagina - Confirmação da reserva de voo
    Element Text Should Be    ${reserva_voo}    Your flight from TLV to SFO has been reserved.    
    Element Text Should Be    ${txt_name}    Name
    Element Text Should Be    ${txt_address}    Address
    Preenche dados para reserva    Ze Papinho    Rua Constantino 123    Piraposinha    Ceara    1122334    Visa    919293    3    2098    Ze
    Clica em Compra de voo
# Mapeamento da 4ª pagina - Confirmação Compra voo
    Element Text Should Be    ${Confirma_Compra}    Thank you for your purchase today!
    Element Text Should Be    ${Id}    Id
    Element Text Should Be    ${Status}    Status


