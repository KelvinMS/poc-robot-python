*** Settings ***
Library    Browser

*** Keywords ***
Select account type
    [Tags]    Action
    [Documentation]    Select Account Type, "Pessoa Física" or "Pessoa Jurídica"
    [Arguments]    ${account_type}
    ${elements} =    Get Elements    button.button
    IF    $account_type == "Pessoa Física"
          Click    ${elements}[0]
    ELSE IF   $account_type == "Pessoa Jurídica"
              Click    ${elements}[1]
    END

Login with at application
    [Documentation]    Do the login process
    [Arguments]    ${email_user}    ${password_user}
    Fill Text    id=email    ${email_user}
    Fill Text    id=senha    ${password_user}
    Click        text=Entrar
    Click        text=Meu Perfil


Acess "Meus pagamentos"
    Acess Menu "Minha Conta"
    Select Option    Contas e pagamentos

Acess menu "${menu_item}"
    [Documentation]    Acess Menu option, as String
    ${button_MyAccount}    Get Elements    xpath=//button[@name='${menu_item}']
    Click    ${button_MyAccount}[0]


Select option
    [Documentation]    Select sub menu item to acess, as Parameter
    [Arguments]    ${sub_menu_item}
    Click    text=${sub_menu_item}

Get all Year's bills
    [Documentation]
    Log    test

Verify overdue bill
    [Documentation]    Check if there's any overdue bill
    Click    //md-radio-button[@value='Pendentes']
    ${overdue_bills} =    Get Elements    xpath=//md-list-item[@role='listitem']
    ${overdue_bills_number} =    Get Length    ${overdue_bills}
    Take Screenshot
    Should Be Equal    ${overdue_bills_number}    0    Found Overdue Bill
