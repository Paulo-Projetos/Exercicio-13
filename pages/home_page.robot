*** Settings ***
Library    SeleniumLibrary

*** Variables ***                            # Nesse caso as variaveis em "Page Object" são os seletores dos elementos da pagina 
${txt_cidade_partida}        name=fromPort
${txt_cidade_destino}        name=toPort
${btn_login}             css=.btn.btn-primary
${home}                  css=a.brand[href="home"]
${encontrar_voos}        css=input[type="submit"][value="Find Flights"]
${welcome}               css=h1

# Mapeamento da pagina inicial "Home"

*** Keywords ***
Preencher cidade de partida
    [Arguments]    ${cidade_partida}                    
    Select From List By Value    ${txt_cidade_partida}    ${cidade_partida}        # Dados erão recebidos de uma lista
Preencher cidade de destino
    [Arguments]    ${cidade_destino}
    Select From List By Value    ${txt_cidade_destino}    ${cidade_destino}         
Clicar botao encontrar voos
    Click Button    ${btn_login}

