# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                     ../resources/common.robot
Resource                     ../resources/omniscripts.robot
Library                      QWeb
Suite Setup                  Setup Browser
Suite Teardown               End suite

*** Keywords ***

*** Test Cases ***
Activate Omni Scripts 
    [Documentation]
    GoTo                     ${url}
    TypeText                 Username                    ${username}
    TypeText                 Password                    ${password}
    ClickText                Log In to Sandbox
    GoTo                     ${urlOmni}

    #Open the filter
    ClickText                Filter List
    ClickText                Add Filter
    DropDown                 Field                       Active
    TypeText                 Value                       true
    ClickText                Done
    ClickText                Save                        partial_match=false
    Activate Omni Scripts

File Upload
    [Documentation]
    [Tags]
    GoTo                     ${url}
    TypeText                 Username                    ${username}
    TypeText                 Password                    ${password}
    ClickText                Log In to Sandbox
    
    GoTo                     ${urlDesicion}
    ClickText                HomeInsAgeDeduction
    ClickText                Related
    ClickText                Show Actions         anchor=HomeInsAgeDeduction V1
    ClickText                Edit                 anchor=HomeInsAgeDeduction V1
    UseModal                 On
    ClickCheckbox            Enabled    off
    ClickText                Save    partial_match=False
    UseModal                 Off
    ClickText                HomeInsAgeDeduction V1
    ClickText                Upload CSV File
    ClickText                Upload FilesOr drop files
    ClickText                Close HomeInsAgeDeduction
    
    ${elem_count}=  GetElementCount      //th[@scope\='row']
    WHILE    ${elem_count} <= GetElementCount  //th[@scope\='row']
        ScrollTo               (//th[@scope\='row'])[${elem_count}]             timeout=1s
    END
    IF    '${elem_count}' != 
        ScrollTo               (//th[@scope\='row'])[${elem_count}]             timeout=1s
        
    END

    ${elem_count}=  GetElementCount      //th[@scope\='row']
    
    
    
    
    #UseTable    Item Number
    #ClickCell    r1c2
    #ClickText    Edit Name: Item 1
    
    #ScrollTo     50
    
    
    #VerifyTable    r1c2    Decision Matrices\nDecision Matrices\nKaikki Decision Matrices\n\nSelect a List View\n\nPin this list view.\nNew