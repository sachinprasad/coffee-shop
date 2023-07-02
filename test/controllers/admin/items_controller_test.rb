require 'test_helper'

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_item = admin_items(:one)
  end

  test "should get index" do
    get admin_items_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_item_url
    assert_response :success
  end

  test "should create admin_item" do
    assert_difference('Admin::Item.count') do
      post admin_items_url, params: { admin_item: { discount_percent: @admin_item.discount_percent, is_free: @admin_item.is_free, name: @admin_item.name, parent_id: @admin_item.parent_id, price: @admin_item.price, references: @admin_item.references, tax_rate: @admin_item.tax_rate } }
    end

    assert_redirected_to admin_item_url(Admin::Item.last)
  end

  test "should show admin_item" do
    get admin_item_url(@admin_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_item_url(@admin_item)
    assert_response :success
  end

  test "should update admin_item" do
    patch admin_item_url(@admin_item), params: { admin_item: { discount_percent: @admin_item.discount_percent, is_free: @admin_item.is_free, name: @admin_item.name, parent_id: @admin_item.parent_id, price: @admin_item.price, references: @admin_item.references, tax_rate: @admin_item.tax_rate } }
    assert_redirected_to admin_item_url(@admin_item)
  end

  test "should destroy admin_item" do
    assert_difference('Admin::Item.count', -1) do
      delete admin_item_url(@admin_item)
    end

    assert_redirected_to admin_items_url
  end
end
