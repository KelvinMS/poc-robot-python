*** Settings ***
Library  Browser
Resource    ../keywords/GenericKeywords.resource
Resource    ../variables/Variables.resource


*** Variables ***
${url} =    https://portalhome.eneldistribuicaosp.com.br/#/autenticacao/tipo-de-acesso


*** Test Cases ***

Login as Pessoa Fisica
    Open Browser         ${url}
    Get Title    equal    Enel | Agência virtual
    Select account type  Pessoa Física
    Login with at application    ${email_user}    ${password_user}
    Acess "Meus pagamentos"
    Import Resource


Login as Pessoa Juridica
    Open Browser    ${url}
    Get Title    equal    Enel | Agência virtual
    Select account type     Pessoa Jurídica
    Login with at application        ${email_user}    ${password_user}


Check there's no Overdue Bill
    Open Browser    ${url}
    Get Title    equal    Enel | Agência virtual
    Select account type  Pessoa Física
    Login with at application        ${email_user}    ${password_user}
    Acess "Meus pagamentos"
    Verify overdue bill
