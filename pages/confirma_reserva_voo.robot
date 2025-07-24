*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${timeout}           5000ms
${reserva_voo}       css=h2
${txt_name}          css=label[for="inputName"]
${txt_address}       css=label[for="address"]
${dado_Name}         id=inputName
${dado_Address}      id=address
${dado_City}         id=city
${dado_State}        id=state
${dado_Cep}          name=zipCode
${Card_Type}         id=cardType
${Card_Number}       css=input[type="text"][placeholder="Credit Card Number"]
${dado_Month}        css=input[type="text"][value="11"]
${dado_Year}         name=creditCardYear
${Name_on_Card}      id=nameOnCard
${btn_Purchase}      css=.btn.btn-primary

*** Keywords ***
Preenche dados para reserva
    [Arguments]    ${Name}    ${Address}    ${City}    ${State}    ${Cep}    ${TipoCartao}    ${NumeroCartao}    ${Month}    ${Year}    ${Name_card}
    Input Text        ${dado_Name}       ${Name}
    Input Text        ${dado_Address}    ${Address}
    Input Text        ${dado_City}       ${City}
    Input Text        ${dado_State}      ${State}
    Input Text        ${dado_Cep}        ${Cep}
    Wait Until Element Is Visible    ${Card_Type}    ${timeout}  
    Select From List By Label    ${Card_Type}    ${TipoCartao}
    Input Text        ${Card_Number}     ${NumeroCartao}
    Input Text        ${dado_Month}      ${Month}
    Input Text        ${dado_Year}       ${Year}
    Input Text        ${Name_on_Card}    ${Name_Card}
Clica em Compra de voo
    Click Button      ${btn_Purchase}









