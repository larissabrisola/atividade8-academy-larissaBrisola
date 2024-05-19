Feature: Login

    Background: Página Login
        Given usuário está na página de Login

    Scenario: Login realizado com sucesso
        When preencher o formulário com email válido
        And preencher o formulário com senha válida
        And clicar em Login
        Then o login será efetuado

    Scenario: Não deve ser possivel realizar o login com email não cadastrado
        When preencher o formulário com email "1239381@gmail.com"
        And preencher o formulário com senha válida
        And clicar em Login
        Then o login não será efetuado e receberá o aviso "Usuário ou senha inválidos."

    Scenario Outline: Não deve ser possivel realizar o login com formato de email inválido
        When preencher o formulário com email "<emailInvalido>"
        And preencher o formulário com senha válida
        And clicar em Login
        Then o login não será efetuado e receberá o aviso "Usuário ou senha inválidos."
        Examples:
            | emailInvalido             |
            | lori@              |
            | @                  |
            | lori🤓sm@gmail.com |
            | lori               |

    Scenario: Não deve ser possivel realizar o login com senha incorreta
        When preencher o formulário com email válido
        And preencher o formulário com senha "<senhaIncorreta>"
        And clicar em Login
        Then o login não será efetuado e receberá o aviso "Usuário ou senha inválidos."
        Examples:
            | senhaIncorreta |
            | 123qswe        |
            | 123            |
            | 1232çuju       |

    Scenario: Não deve ser possivel realizar o login com campo senha vazio
        When preencher o formulário com email válido
        And clicar em Login
        Then o login não será efetuado e receberá o aviso "Informe a senha"

    Scenario: Não deve ser possivel realizar o login com campo email vazio
        When preencher o formulário com senha válida
        And clicar em Login
        Then o login não será efetuado e receberá o aviso "Informe o e-mail"

    Scenario: Não deve ser possivel realizar o login com todos campos vazios
        And clicar em Login 
        Then o login não será efetuado e receberá o aviso "Informe o e-mail"
        Then o login não será efetuado e receberá o aviso "Informe a senha"
