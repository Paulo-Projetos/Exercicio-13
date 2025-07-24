*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${timeout}        5000ms
${Confirma_Compra}    css=h1
${Id}                 css=tr > td:first-child
${Status}             xpath=//td[text()="Status"]
${Cartao_Numero}      xpath=//font[text()="Número do cartão"]  

*** Keywords ***

