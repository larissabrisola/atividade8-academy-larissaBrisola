import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { faker } from "@faker-js/faker";
import LoginPage from "../pages/login.page";
const pageLogin = new LoginPage()


let email;
let passw;
let name; 


before(()=>{
    name = faker.person.firstName()
    email = faker.internet.exampleEmail()
    passw = faker.internet.password({length: 8})

    cy.createUser(name, email, passw)

})


Given('usuário está na página de Login', ()=>{
    cy.visit('https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/login')
    cy.url().should('eq', 'https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/login')
})


When('preencher o formulário com email válido', ()=>{
    pageLogin.typeEmail(email)

})

When('preencher o formulário com senha válida', ()=>{
    pageLogin.typePassword(passw)

})

When('clicar em Login', ()=>{
    cy.get("#root > div > main > div > form > button").click()

    
})

Then('o login será efetuado', ()=>{
    cy.intercept('POST', 'https://raromdb-3c39614e42d4.herokuapp.com/api/auth/login').as('sucess')
    cy.url().should('eq','https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/')


})

////////////////////////////////////////////////////////////////////////////////////////// bad ending 

When('preencher o formulário com email {string}', (string)=>{
    pageLogin.typeEmail(string)

})

When('preencher o formulário com senha {string}', (string)=>{
    pageLogin.typePassword(string)

})


Then('o login não será efetuado e receberá o aviso {string}', (string)=>{
    cy.contains(string).should('be.visible')
})

