require 'test_helper'

class Admin::OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_offer = admin_offers(:one)
  end

  test "should get index" do
    get admin_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_offer_url
    assert_response :success
  end

  test "should create admin_offer" do
    assert_difference('Admin::Offer.count') do
      post admin_offers_url, params: { admin_offer: { discount_percent: @admin_offer.discount_percent, discounted_item_id: @admin_offer.discounted_item_id, is_free: @admin_offer.is_free, item_id: @admin_offer.item_id } }
    end

    assert_redirected_to admin_offer_url(Admin::Offer.last)
  end

  test "should show admin_offer" do
    get admin_offer_url(@admin_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_offer_url(@admin_offer)
    assert_response :success
  end

  test "should update admin_offer" do
    patch admin_offer_url(@admin_offer), params: { admin_offer: { discount_percent: @admin_offer.discount_percent, discounted_item_id: @admin_offer.discounted_item_id, is_free: @admin_offer.is_free, item_id: @admin_offer.item_id } }
    assert_redirected_to admin_offer_url(@admin_offer)
  end

  test "should destroy admin_offer" do
    assert_difference('Admin::Offer.count', -1) do
      delete admin_offer_url(@admin_offer)
    end

    assert_redirected_to admin_offers_url
  end
end
