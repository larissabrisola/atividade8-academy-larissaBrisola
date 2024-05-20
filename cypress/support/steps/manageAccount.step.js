import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { faker } from "@faker-js/faker";
import ManageAccountPage from "../pages/manageAccount.page";
import LoginPage from "../pages/login.page";

const pageManage = new ManageAccountPage()
const pageLogin = new LoginPage()

let email 
let password = "1234567s"

before(()=>{
    email = faker.internet.email()
    cy.createUser('lola', email, password)
})

beforeEach(()=>{

    cy.visit('https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/login')

    pageLogin.typeEmail(email)
    pageLogin.typePassword(password)
    pageLogin.clickButtonLogin()

    cy.url().should('eq', 'https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/')

})
Given('que o usuário está logado e na página de gerenciar conta', ()=>{
    cy.visit('https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/account')    
})

When('preencher nome válido', ()=>{
    pageManage.typeName(faker.animal.snake())
})


When('preencher com senha válida', ()=>{
    pageManage.clickButtonAltPassword()
    pageManage.typePassword(password)
})

When('confirmar senha', ()=>{
    pageManage.typeConfirmPassword(password)
})

When('clicar em Salvar', ()=>{
    pageManage.clickButtonSave()
})

Then('a atualização será realizada', ()=>{
    cy.contains('Informações atualizadas!').should('be.visible')
})

///////////////bad ending

When('preencher nome {string}', (string)=>{
    pageManage.typeName(string)
})

When('preencher com senha {string}', (string)=>{
    pageManage.clickButtonAltPassword()
    pageManage.typePassword(string)
})

When('confirmar senha {string}', (string)=>{
    pageManage.typeConfirmPassword(string)
})

Then('a atualização não será realizada com aviso {string}', (string)=>{
    cy.contains(string).should('be.visible')
})

When('tentar atualizar email', ()=>{
    cy.get(pageManage.inputEmail).click({force: true})//????

})

Then('não deve ser possivel alterar o email', ()=>{
    cy.get(pageManage.inputEmail).should('be.disabled')
})

When('tentar atualizar tipo de usuário', ()=>{
    cy.contains('Comum').click({force: true})

})

When('clicar em Cancelar', ()=>{
    pageManage.clickButtonAltPassword()
})


Then('não deve ser possivel alterar o tipo de usuário', ()=>{
    cy.get(pageManage.selectTypeUser).should('be.disabled')
})

Then('a ação deverá ser cancelada', ()=>{
    // os campos deveriam estar vazios mas não sei se isso é só preferencia
    cy.get(pageManage.inputPassword).should('be.disabled')
    cy.get(pageManage.inputConfirmPassword).should('be.disabled')

})