require "application_system_test_case"

class Admin::ItemsTest < ApplicationSystemTestCase
  setup do
    @admin_item = admin_items(:one)
  end

  test "visiting the index" do
    visit admin_items_url
    assert_selector "h1", text: "Admin/Items"
  end

  test "creating a Item" do
    visit admin_items_url
    click_on "New Admin/Item"

    fill_in "Discount percent", with: @admin_item.discount_percent
    check "Is free" if @admin_item.is_free
    fill_in "Name", with: @admin_item.name
    fill_in "Parent", with: @admin_item.parent_id
    fill_in "Price", with: @admin_item.price
    fill_in "References", with: @admin_item.references
    fill_in "Tax rate", with: @admin_item.tax_rate
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit admin_items_url
    click_on "Edit", match: :first

    fill_in "Discount percent", with: @admin_item.discount_percent
    check "Is free" if @admin_item.is_free
    fill_in "Name", with: @admin_item.name
    fill_in "Parent", with: @admin_item.parent_id
    fill_in "Price", with: @admin_item.price
    fill_in "References", with: @admin_item.references
    fill_in "Tax rate", with: @admin_item.tax_rate
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit admin_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
