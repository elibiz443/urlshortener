require "test_helper"

class ShortenersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shortener = shorteners(:one)
  end

  test "should get index" do
    get shorteners_url
    assert_response :success
  end

  test "should get new" do
    get new_shortener_url
    assert_response :success
  end

  test "should create shortener" do
    assert_difference('Shortener.count') do
      post shorteners_url, params: { shortener: { count: @shortener.count, given_url: @shortener.given_url, slug: @shortener.slug } }
    end

    assert_redirected_to shortener_url(Shortener.last)
  end

  test "should show shortener" do
    get shortener_url(@shortener)
    assert_response :success
  end

  test "should get edit" do
    get edit_shortener_url(@shortener)
    assert_response :success
  end

  test "should update shortener" do
    patch shortener_url(@shortener), params: { shortener: { count: @shortener.count, given_url: @shortener.given_url, slug: @shortener.slug } }
    assert_redirected_to shortener_url(@shortener)
  end

  test "should destroy shortener" do
    assert_difference('Shortener.count', -1) do
      delete shortener_url(@shortener)
    end

    assert_redirected_to shorteners_url
  end
end
