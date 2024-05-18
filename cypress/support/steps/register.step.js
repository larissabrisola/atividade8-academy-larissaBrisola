import { Given, When, Then  } from "@badeball/cypress-cucumber-preprocessor";
import { faker } from "@faker-js/faker";
import RegisterPage from "../pages/register.page";
const pageRegister = new RegisterPage()

let truePassword = faker.internet.password({length: 8})


Given('que o usuário está na página de cadastro', ()=>{
    cy.visit('https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/register')
    cy.url().should('eq', 'https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/register')
})

When('preencher o formulário com nome válido', ()=>{
    pageRegister.typeName(faker.animal.snake())
})

When('preencher o formulário com email válido', ()=>{
    pageRegister.typeEmail(faker.internet.email())

})

When('preencher o formulário com senha válida', ()=>{
    pageRegister.typePassword(truePassword)

})

When('validar a senha', ()=>{
    pageRegister.typePasswordConfirm(truePassword)

})

When('clicar em Cadastrar', ()=>{
    pageRegister.clickButtonSave()
})

When('confirmar', ()=>{
    cy.intercept('POST', 'https://raromdb-3c39614e42d4.herokuapp.com/api/users', {
        statusCode: 409,
    }).as('fakeUser')


    pageRegister.clickButtonSave()
})
Then('o usuário será cadastrado como usuário comum', ()=>{
    cy.intercept('POST', 'https://raromdb-3c39614e42d4.herokuapp.com/api/users',).as('sucess')

    cy.wait('@sucess').its('response.body').should('have.nested.property', 'type').and('eq', 0)

    cy.get('#root > div > main > div > div.modal-overlay > div > div.modal-body').should('be.visible').and('contain', 'Cadastro realizado!')

})

When('preencher o formulário com email já cadastrado', ()=>{
    pageRegister.typeEmail('joana@gmail.com')

})

When('preencher o email com {string}', (string)=>{
    pageRegister.typeEmail(string)
})

Then('o usuário não será cadastrado e receberá um aviso {string}', (string)=>{
    cy.contains(string).should('be.visible')

})


When('preencher com valor diferente o campo Confirmação Senha {string}', (string)=>{
    pageRegister.typePasswordConfirm(string)
}) 

When('preencher o formulário com senha curta {string}', (string)=>{
    pageRegister.typePassword(string)
})

When('validar a senha curta {string}', (string)=>{
    pageRegister.typePasswordConfirm(string)
})