describe('Product detail page', () => {


  it('visits the home page', () => {
    cy.visit('/');
  });

  it("Can navigate to product details page", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.contains('The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas.');
    cy.get('button').contains('Add');
  });

});