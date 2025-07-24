*** Settings ***
Library    SeleniumLibrary
Library    DateTime                    # Serve para buscar horario de regsitro do computador
Resource    home_page.robot
Resource    voo_partida_destino.robot
Resource    confirma_reserva_voo.robot
Resource    confirma_compra_voo.robot

*** Variables ***
${timeout}    10000ms
${url}    https://blazedemo.com/
${browser}    Chrome
${date}

*** Keywords ***
Abrir navegador                                                    # 1ª Ação
    Register Keyword To Run On Failure    Tirar Screenshot              # Tira um print da falha, para mostrar que o navegador deu erro, caso isso venha a acontecer
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms                                 # Aguarda 10 segundos para carregar o navegador 
    Wait Until Element Is Visible    css=.brand    ${timeout}            # Espera pela apresentação da pagina principal com o logo (Swag Labs)
Fechar navegador                                                   # 2ª Ação
    Sleep    500ms                                                       # Pausa antes de fechar o browser
    Close Browser
Obter Data e hora
    ${date} =    Get Current Date                                                        # Lê e armazena a data e hora calendario do computador
    ${date} =     Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S                # Converte em formatação de ano/mês/dia e hora/min/seg
    ${date}    Set Global Variable    ${date}                                        # Necessário para uso em dois scripts - Torna a variavel usual durante todo o tempo de teste
Tirar Screenshot                                                                  # Tira fotos de cada final de teste por transição de pagina
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    screenshots/${date}/${TEST_NAME}/${screenshot_name}.jpg 
