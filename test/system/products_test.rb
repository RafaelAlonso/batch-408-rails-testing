require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # exercise
    visit "/"

    # verify
    assert_selector "h1", text: "Toppest Products"
    assert_selector ".card-product", count: Product.count
  end

  test "creating a new product" do
    # exercise
    # me logar
    login_as users(:rafa)
    # entrar no new_product
    visit '/products/new'
    # save_and_open_screenshot

    # preencher o formuário
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot
    # enviar o form
    click_on 'Create Product'


    # verify
    # ele deve me mostrar uma outra página
    assert_equal root_path, page.current_path
    # o sistema deve ter criado o produto no BD
    assert_text "Change your life: Learn to code"
    save_and_open_screenshot
  end

  # test "failing to create a new product" do
  #   # exercise
  #   # me logar
  #   login_as users(:rafa)
  #   # entrar no new_product
  #   visit '/products/new'
  #   # save_and_open_screenshot

  #   # preencher o formuário
  #   fill_in "product_tagline", with: "Change your life: Learn to code"
  #   # save_and_open_screenshot
  #   # enviar o form
  #   click_on 'Create Product'


  #   # verify
  #   # ele deve me mostrar uma outra página
  #   assert_equal '/products/new', page.current_path
  #   # o sistema deve ter criado o produto no BD
  #   assert_text "Change your life: Learn to code"
  #   save_and_open_screenshot
  # end
end
