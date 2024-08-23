require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get staticpages_home_url
    assert_response :success
  end

  test 'should get section' do
    get staticpages_section_url
    assert_response :success
  end

  test 'should get detail' do
    get staticpages_detail_url
    assert_response :success
  end

  test 'should get history' do
    get staticpages_history_url
    assert_response :success
  end
end
