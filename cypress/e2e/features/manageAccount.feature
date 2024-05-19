# Feature: Gerenciar conta - Usuário comum

#     Background: usuário está logado 
#         Given que o usuário está logado e na página de gerenciar conta
    
#     Scenario: Deve ser possivel atualizar o próprio nome 
#         When preencher nome
#         And clicar em Salvar 
#         Then a atualização será realizada

#     Scenario: Deve ser possivel atualizar a própria senha 
#         When preencher com senha válida
#         And confirmar senha
#         And clicar em Salvar 
#         Then a atualização será realizada

#     Scenario: Deve ser possivel atualizar nome e senha simultaneamente 
#         When preencher nome
#         And preencher com senha válida 
#         And confirmar senha
#         And clicar em Salvar 
#         Then a atualização será realizada

#     Scenario: Não deve ser possivel atualizar o nome inserindo 101 ou mais caracteres
#     Scenario: Não deve ser possivel atualizar a senha inserindo 5 ou menos caracteres 
#     Scenario: Não deve ser possivel atualizar a senha inserindo 13 ou mais caracteres 
#     Scenario: Não deve ser possivel atualizar a senha se a confirmação de senha estiver com valor diferente
#     Scenario: Não deve ser possivel atualizar o email
#     Scenario: Não deve ser possivel atualizar tipo de usuário 