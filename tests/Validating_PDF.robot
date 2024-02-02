*** Settings ***
Resource               ../resources/common.robot
Library                QWeb
Suite Setup            Setup Browser
Suite Teardown         End suite
Library                DataDriver                  reader_class=TestDataApi    name=SecureWork.xlsx

# #                    *** Variables ***
#                      ${ExpectedText}             "The charges reflected hereunder do not include taxes. Unless Partner has provided Secureworks Japan K.K. ("Secureworks") with a valid resale or emption certificate, \n
# Partner will be responsible for any sales, use, value-added or import taxes, customs duties or similar taxes, if applicable,


*** Test Cases ***
Entering A Lead With Data
    [Tags]             AllData

*** Keywords ***
    [Arguments]        ${Product1}                 ${Product2}                 ${Product3}             ${Qty1}                     ${Qty2}    ${Qty3}
    [tags]             Lead
    Appstate           Home

    #Adding Product
    ClickText          Edit Products               # Account industry Error
    # UseTable         Action
    #ClickText         Expand All
    ClickText          Dell SafeGuard
    Clicktext          ManagedXDR OT
    #Product1
    ClickText          ${Product1}
    Verifytext         Qty
    ClickElement       xpath=//*[@id="j_id0:mainForm:QPBlock:priceTable:0:qty"]
    TypeText           Qty                         ${Qty1}                     Line Item Type          recognition_mode=vision
    #Product2
    ClickText          ${Product2}
    Verifytext         Qty
    ClickElement       xpath=//*[@id="j_id0:mainForm:QPBlock:priceTable:0:qty"]
    TypeText           Qty                         ${Qty2}                     Line Item Type          recognition_mode=vision
    #Product3
    ClickText          ${Product3}
    Verifytext         Qty
    ClickElement       xpath=//*[@id="j_id0:mainForm:QPBlock:priceTable:0:qty"]
    TypeText           Qty                         ${Qty3}                     Line Item Type          recognition_mode=vision
    ClickText          Save

    Clicktext          PDF
    # SwitchBrowser      New
    ScrollText         Notes
    UsePdf           QuotePDF.pdf

    ${FILE_PATH}       Set Variable                ${CURDIR}/../QuotePDF.pdf
    Log                ${FILE_PATH}                console=true
    UsePdf             ${FILE_PATH}

    ${text}            Verify pdf text    Proposal Code                        #Notes
    SwitchWindow       New
    ClickText          Edit Version
    ScrollText         MBG Detail
    TypeText           MBG Detail                               ${text}

    # ${text}            GetPdfText                  Locator=Notes               chars=100               #returns 10 chars, starting from text xyz.
    # VerifyText         ${text}



    Switch Window      index=1                     delay=1
    ClickText          Approve Quote
    ClickText          Return to Quote


























    # Runkeyword       Login
    # LaunchApp        Sales
    # ClickText        Accounts
    # ClickText        New
    # TypeText         *Account Name               GIT pdf file
    # ClickText        Save                        partial_match=False         # Do not accept partial match, i.e. "Save All"

    # ClickText        Related
    # ClickText        Upload Files

    # ${FILE_PATH}     Set Variable                ${EXECDIR}/files/${FILE}
    # Log              ${FILE_PATH}                console=true

    # QVision.DoubleClick                          suite                       anchor=9
    # # QVision.DoubleClick                        resources                   anchor=3
    # QVision.ClickText                            Shooter.pdf
    # QVision.ClickText                            Open                        anchor=Cancel

    # ClickText        Done

    # #Run keyword     LogOut