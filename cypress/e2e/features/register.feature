Feature: Cadastro Usuário

    Background: Página de cadastro
        Given que o usuário está na página de cadastro

    Scenario: Cadastro realizado com sucesso
        When preencher o formulário com nome válido
        And preencher o formulário com email válido
        And preencher o formulário com senha válida
        And validar a senha
        And clicar em Cadastrar
        Then o usuário será cadastrado como usuário comum

    Scenario: Não deve ser possivel realizar o cadastro com um email já utilizado
        When preencher o formulário com nome válido
        And preencher o formulário com email já cadastrado
        And preencher o formulário com senha válida
        And validar a senha
        And clicar em Cadastrar2
        Then o usuário não será cadastrado e receberá um aviso 'E-mail já cadastrado. Utilize outro e-mail'

    Scenario Outline: Não deve ser possivel realizar o cadastro com um formato de email inválido
        When preencher o formulário com nome válido
        And preencher o email com "<email>"
        And preencher o formulário com senha válida
        And validar a senha
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'Não foi possível cadastrar o usuário.'
        Examples:
            | email              |
            | lori@              |
            | @                  |
            | lori🤓sm@gmail.com |
            | lori               |

    Scenario: Não deve ser possivel realizar o cadastro com campo nome vazio
        And preencher o formulário com email válido
        And preencher o formulário com senha válida
        And validar a senha
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'Informe o nome'

    Scenario: Não deve ser possivel realizar o cadastro com campo email vazio
        When preencher o formulário com nome válido
        And preencher o formulário com senha válida
        And validar a senha
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'Informe o e-mail'

    Scenario: Não deve ser possivel realizar o cadastro com campo senha vazio
        When preencher o formulário com nome válido
        And preencher o formulário com email válido
        And validar a senha
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'Campo obrigatório'

    Scenario: Não deve ser possivel realizar o cadastro com campo confirmação senha vazio
        When preencher o formulário com nome válido
        And preencher o formulário com email válido
        And preencher o formulário com senha válida
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'As senhas devem ser iguais.'

    Scenario: Não deve ser possivel realizar o cadastro com todos campos vazios
        When clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'Informe o nome'
        Then o usuário não será cadastrado e receberá um aviso 'Informe o e-mail'
        Then o usuário não será cadastrado e receberá um aviso 'Campo obrigatório'
        Then o usuário não será cadastrado e receberá um aviso 'As senhas devem ser iguais.'

    Scenario: Não deve ser possivel realizar o cadastro se a confirmação da senha não for igual a senha
        When preencher o formulário com nome válido
        And preencher o formulário com email válido
        And preencher o formulário com senha válida
        And preencher com valor diferente o campo Confirmação Senha "b4t4t4bbi4"
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'As senhas devem ser iguais.'

    Scenario Outline: Não deve ser possivel realizar o cadastro com senha igual/inferior a 5 caracteres
        When preencher o formulário com nome válido
        And preencher o formulário com email válido
        And preencher o formulário com senha curta "<senhaCurta>"
        And validar a senha curta "<senhaCurta>"
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'A senha deve ter pelo menos 6 dígitos'
        Examples:
            | senhaCurta |
            | 1          |
            | 12         |
            | 123        |
            | 1234       |
            | 12345      |


    Scenario Outline: Não deve ser possivel realizar o cadastro com senha igual/maior que 13 caracteres
        When preencher o formulário com nome válido
        And preencher o formulário com email válido
        And preencher o formulário com senha curta "<senhaLonga>"
        And validar a senha curta "<senhaLonga>"
        And clicar em Cadastrar
        Then o usuário não será cadastrado e receberá um aviso 'Não foi possível cadastrar o usuário.'
        Examples:
            | senhaLonga      |
            | abcdefghijklm   |
            | abcdefghijklmp  |
            | abcdefghijklmsd |




