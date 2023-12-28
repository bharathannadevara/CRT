# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                   ../resources/common.robot
Library                    QWeb
Library                    QForce
Library                    QVision
Library                    Collections
Suite Setup                Open Browser                about:blank                chrome
Suite Teardown             Close All Browsers

*** Variables ***
${FILE}                    copado.jpg

*** Test Cases ***
    Runkeyword             Login
    LaunchApp              Sales
    ClickText              Accounts
    ClickText              New
    TypeText               *Account Name               GIT image file
    ClickText              Save                        partial_match=False        # Do not accept partial match, i.e. "Save All"

    ClickText              Related
    ClickText              Upload Files

    ${FILE_PATH}           Set Variable                ${EXECDIR}/files/${FILE}
    Log                    ${FILE_PATH}                console=true

    QVision.DoubleClick    suite                       anchor=9
    # QVision.DoubleClick                              resources                  anchor=3
    QVision.ClickText     copado.jpg
    QVision.ClickText      Open                        anchor=Cancel

    ClickText              Done