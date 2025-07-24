*** Settings ***
Library    SeleniumLibrary

*** Variables ***                   
${voo_partida_destino}       css=h3
${Choose}                    css=table th:nth-child(1)                # Referente item 1
${Airline}                   css=table th:nth-child(3)                # Referente item 3
${btn_voo}                   css=.btn.btn-small
${numero_voo}                234

*** Keywords ***
Clicar no escolha este voo pelo numero
    [Arguments]    ${numero_voo}
    ${xpath_voo}=    Set Variable    //tr[td[2][text()='${numero_voo}']]
    Click Button    xpath=${xpath_voo}//input[@type='submit']
