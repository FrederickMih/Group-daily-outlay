require 'test_helper'

class OutlayControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get outlay_index_url
    assert_response :success
  end

  test 'should get new' do
    get outlay_new_url
    assert_response :success
  end
end
