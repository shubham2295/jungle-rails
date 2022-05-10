describe('User login and signup', () => {

  it("User can sign up", () => {
    cy.visit('/');
    cy.get('a').contains('Signup').click();
    cy.get('#user_firstname').scrollIntoView({ easing: 'linear' });
    cy.get('#user_firstname').type('Jaremy', { force: true });
    cy.get('#user_lastname').type('Saki', { force: true });
    cy.get('#user_email').type('test1@test.com');
    cy.get('#user_password').type('test123');
    cy.get('#user_password_confirmation').type('test123');
    cy.get('.btn').click();
    cy.get('.nav-item.nav-link').contains('Signed in as Jaremy');
    cy.get('a').contains('Logout').click();
  });

  it("User can sign in", () => {
    cy.visit('/');
    cy.get('a').contains('Login').click();
    cy.get('#email').scrollIntoView({ easing: 'linear' });
    cy.get('#email').type('test1@test.com', { force: true });
    cy.get('#password').type('test123', { force: true });
    cy.get('.btn').click();
    cy.get('.nav-item.nav-link').contains('Signed in as Jaremy');
    cy.get('a').contains('Logout').click();
  });

});