require "test_helper"

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping = shippings(:one)
  end

  test "should get index" do
    get shippings_url, as: :json
    assert_response :success
  end

  test "should create shipping" do
    assert_difference("Shipping.count") do
      post shippings_url, params: { shipping: { destination: @shipping.destination, item_id: @shipping.item_id, location: @shipping.location, price: @shipping.price, quantity: @shipping.quantity, source: @shipping.source, status: @shipping.status } }, as: :json
    end

    assert_response :created
  end

  test "should show shipping" do
    get shipping_url(@shipping), as: :json
    assert_response :success
  end

  test "should update shipping" do
    patch shipping_url(@shipping), params: { shipping: { destination: @shipping.destination, item_id: @shipping.item_id, location: @shipping.location, price: @shipping.price, quantity: @shipping.quantity, source: @shipping.source, status: @shipping.status } }, as: :json
    assert_response :success
  end

  test "should destroy shipping" do
    assert_difference("Shipping.count", -1) do
      delete shipping_url(@shipping), as: :json
    end

    assert_response :no_content
  end
end
