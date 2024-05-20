Feature: Gerenciar conta

    Background: usuário comum na página de gerenciar conta
        Given que o usuário está logado e na página de gerenciar conta

    Scenario: Deve ser possivel atualizar o próprio nome
        When preencher nome válido
        And clicar em Salvar
        Then a atualização será realizada

    Scenario: Deve ser possivel atualizar a própria senha
        When preencher com senha válida
        And confirmar senha
        And clicar em Salvar
        Then a atualização será realizada

    Scenario: Deve ser possivel atualizar nome e senha simultaneamente
        When preencher nome válido
        And preencher com senha válida
        And confirmar senha
        And clicar em Salvar
        Then a atualização será realizada


    Scenario Outline: Não deve ser possivel atualizar o nome inserindo 101 ou mais caracteres
        When preencher nome "<nomeGrande>"
        And clicar em Salvar
        Then a atualização não será realizada com aviso "Não foi possível atualizar os dados."
        Examples:
            | nomeGrande                                                                                            |
            | avrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneav |
            | avrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavrilavigneavwe |

    Scenario Outline: Não deve ser possivel atualizar a senha inserindo 5 ou menos caracteres
        And preencher com senha "<senhaCurta>"
        And confirmar senha "<senhaCurta>"
        And clicar em Salvar
        Then a atualização não será realizada com aviso "A senha deve ter pelo menos 6 dígitos"
        Examples:
            | senhaCurta |
            | 12345      |
            | 1234       |
            | 1          |

    Scenario Outline: Não deve ser possivel atualizar a senha inserindo 13 ou mais caracteres
        When preencher com senha "<senhaLonga>"
        And confirmar senha "<senhaLonga>"
        And clicar em Salvar
        Then a atualização não será realizada com aviso "Não foi possível atualizar os dados."
        Examples:
            | senhaLonga     |
            | 1234567891234  |
            | 12345678912341 |


    Scenario: Não deve ser possivel atualizar a senha se a confirmação de senha estiver com valor diferente
        When preencher com senha válida
        And confirmar senha "njnjnj"
        And clicar em Salvar
        Then a atualização não será realizada com aviso "As senhas devem ser iguais."

    Scenario: Não deve ser possivel atualizar o email
        When tentar atualizar email 
        Then não deve ser possivel alterar o email 

    Scenario: Não deve ser possivel atualizar tipo de usuário
        When tentar atualizar tipo de usuário
        Then não deve ser possivel alterar o tipo de usuário

    Scenario: Deve ser possivel cancelar a alteração de senha
        When preencher com senha válida 
        And clicar em Cancelar
        Then a ação deverá ser cancelada

