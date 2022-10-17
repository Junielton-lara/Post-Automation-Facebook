*** Settings ***
## 1.0.5
##########################################################################
#                                 Libraries                              #
##########################################################################

Library  SeleniumLibrary
Library  FakerLibrary  locale=pt_BR
Library  RequestsLibrary
Library  OperatingSystem
Library  Process
Library  Collections
Library  String
#Library  CryptoLibrary    variable_decryption=False
Library  ./libs/utilities.py


##########################################################################
#                                 Resources                              #
##########################################################################

Variables  ./environments/env.face.yaml


##########################################################################
#                                 Keywords                               #
##########################################################################

Resource  ./keywords/global.robot
Resource  ./keywords/automation_post.robot


##########################################################################
#                                 Elementos                              #
##########################################################################

Resource  ./pages/pg_facebook.robot
Resource  ./environments/msg.robot


*** Variables ***
${AMBIENTE}  prod
${url_type}  normal
${headless}  False
${download_folder}  ${EXECDIR}${/}resources${/}temp
${NAOVALIDA}   False
${CAPTACAO}    False