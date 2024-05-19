
Cypress.Commands.add("createUser", (name, email, password) => {
  cy.request({
    method: "POST",
    url: "https://raromdb-3c39614e42d4.herokuapp.com/api/users",
    body: {
      name: name,
      email: email,
      password: password,
    },
  });
});



