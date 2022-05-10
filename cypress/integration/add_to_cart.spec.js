describe('Add to cart functionality', () => {

  before(() => {
    cy.visit('/');
    cy.get("[alt='Scented Blade']").click();
    cy.get('.product-detail').find('.btn').click();
  });

  it("Can perform login and add item to cart", () => {
    cy.get('#email').type('test@test.com');
    cy.get('#password').type('test123');
    cy.get('.btn').click();
    cy.get("[alt='Scented Blade']").click();
    cy.get('.product-detail').find('.btn').click();
    cy.get('.end-0').contains('(1)');
  });

});