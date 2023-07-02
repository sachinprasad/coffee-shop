require "application_system_test_case"

class Admin::OffersTest < ApplicationSystemTestCase
  setup do
    @admin_offer = admin_offers(:one)
  end

  test "visiting the index" do
    visit admin_offers_url
    assert_selector "h1", text: "Admin/Offers"
  end

  test "creating a Offer" do
    visit admin_offers_url
    click_on "New Admin/Offer"

    fill_in "Discount percent", with: @admin_offer.discount_percent
    fill_in "Discounted item", with: @admin_offer.discounted_item_id
    check "Is free" if @admin_offer.is_free
    fill_in "Item", with: @admin_offer.item_id
    click_on "Create Offer"

    assert_text "Offer was successfully created"
    click_on "Back"
  end

  test "updating a Offer" do
    visit admin_offers_url
    click_on "Edit", match: :first

    fill_in "Discount percent", with: @admin_offer.discount_percent
    fill_in "Discounted item", with: @admin_offer.discounted_item_id
    check "Is free" if @admin_offer.is_free
    fill_in "Item", with: @admin_offer.item_id
    click_on "Update Offer"

    assert_text "Offer was successfully updated"
    click_on "Back"
  end

  test "destroying a Offer" do
    visit admin_offers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Offer was successfully destroyed"
  end
end
