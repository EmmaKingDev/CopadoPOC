*** Settings ***
Library                   QForce
Library                   String

*** Keywords ***
Activate Omni Scripts
    ${amount}=            GetWebelement               locator=//button[@title="Toggle Group"]
    ${count}=             GetLength                   ${amount}

    FOR                   ${index}                    IN RANGE                    1                      ${count+1}
        ClickElement      xpath=(//button[@title="Toggle Group"])[${index}]
        ${dropdown_exist}=                            IsElement                   //*[@id\='omni-home-group-0-0-actions-toggle']    5s
        IF                ${dropdown_exist}
            ClickElement                              //*[@id\='omni-home-group-0-0-actions-toggle']
            ClickText     Deactivate
            ClickElement                              //*[@id\='omni-home-group-0-0-actions-toggle']     timeout=120s
            ClickText     Activate
            ClickText     Ok                          anchor=Activating the OmniScript                   partial_match=False
            VerifyElement                             //*[@id\='omni-home-group-0-0-actions-toggle']     timeout=120s
        END
        ClickElement      xpath=(//button[@title="Toggle Group"])[${index}]
        Sleep             1s
    END
