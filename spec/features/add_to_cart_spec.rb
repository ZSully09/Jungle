require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Product is added to cart" do
    # ACT
    visit root_path
    save_screenshot('home page')
    first('.product').click_button 'Add'
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_text(' My Cart (1)')
  end
end