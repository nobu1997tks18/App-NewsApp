require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get domestic" do
    get news_domestic_url
    assert_response :success
  end

  test "should get overseas" do
    get news_overseas_url
    assert_response :success
  end

  test "should get business" do
    get news_business_url
    assert_response :success
  end

  test "should get technology" do
    get news_technology_url
    assert_response :success
  end

  test "should get environmemt" do
    get news_environmemt_url
    assert_response :success
  end

  test "should get sports" do
    get news_sports_url
    assert_response :success
  end

end
