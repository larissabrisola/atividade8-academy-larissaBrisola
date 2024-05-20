export default class ManageAccountPage {

    inputName = "#root > div > main > div > form > div:nth-child(1) > input"
    inputEmail = "#root > div > main > div > form > div:nth-child(2) > input"
    selectTypeUser = "#root > div > main > div > form > div:nth-child(3) > select"
    buttonAltPassword = "#root > div > main > div > form > button"
    inputPassword = "#root > div > main > div > form > div:nth-child(5) > input"
    inputConfirmPassword = "#root > div > main > div > form > div:nth-child(6) > input"
    buttonSave = "#root > div > main > div > form > div.register-form-footer > button"


    typeName(name){
        cy.get(this.inputName).clear()
        cy.get(this.inputName).type(name)
    }

    typePassword(password){
        cy.get(this.inputPassword).type(password)
    }

    typeConfirmPassword(confirmPass){
        cy.get(this.inputConfirmPassword).type(confirmPass)
    }

    clickButtonSave (){
        cy.get(this.buttonSave).click()
    }

    clickButtonAltPassword (){
        cy.get(this.buttonAltPassword).click()
    }


    clickSelect(){
        cy.get(this.selectTypeUser).select()
    }

}