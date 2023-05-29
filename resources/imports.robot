*** Settings ***
Library     Collections
Library     CSVLibrary
Library     DateTime
Library     FakerLibrary
Library     FakerLibrary    locale=pt-br
Library     OperatingSystem
Library     Process
Library     RPA.Desktop
Library     String
Library     ./IntegraTestLink/IntegraTestLink.py
Variables   config/application_config.yaml
Variables   config/user_pass_config.yaml