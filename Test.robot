*** Settings ***
Documentation  GetReferd critical flow test
Library  Selenium2Library

*** Variables ***
${browser}  chrome
${main_page}  http://www.s3group.com/
${signup_page}  https://www.s3group.com/register/?came_from_url=http://www.s3group.com/
@{gmail_login}  automation@arabel.la
${begin_web_text}  Innovative Solutions
${signup_button}  link=Sign Up
${registerpage_data}  Register
${first_name_field}  id=input_2_1_6
${first_name_data}  test
${last_name_field}  id=input_2_1_6
${last_name_data}  test2
${company_field}  id=input_2_2
${company_data}  testcompany
${jobtitle_Field}  id=input_2_3
${jobtitle_data}  QATester
${email_field}  id=input_2_4
${email_data}  test12345@gmail.com
${register_button}  id=gform_submit_button_2
${missing_data_info}  There was a problem with your submission
${cookie_checkbox}  css=#cookie-acceptance > form > div > label > input[type="checkbox"]

*** Test Cases ***

Main_page_and_register_new_user
    [Documentation]  This test contains flow related to creating new user from main page.
    [Tags]  Creating user from main page
    Begin Web test
    Navigate to sign up page
    Fillin register form
    end web test

*** Keywords ***

Begin Web test
    open browser  ${main_page}  ${BROWSER}
    wait until page contains  ${begin_web_text}
    maximize browser window

Navigate to sign up page
    click link  ${signup_button}
    wait until page contains  ${registerpage_data}
    select checkbox  ${cookie_checkbox}

Fillin register form
    input text  ${first_name_field}  ${first_name_data}
    input text  ${last_name_field}  ${last_name_data}
    input text  ${company_field}  ${company_data}
    input text  ${jobtitle_field}  ${jobtitle_data}
    input text  ${email_field}  ${email_data}
    click button  ${register_button}
    wait until page contains  ${missing_data_info}

End Web test
    close browser