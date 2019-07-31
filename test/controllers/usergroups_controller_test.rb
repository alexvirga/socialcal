require 'test_helper'

class UsergroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usergroups_new_url
    assert_response :success
  end

  test "should get show" do
    get usergroups_show_url
    assert_response :success
  end

  test "should get edit" do
    get usergroups_edit_url
    assert_response :success
  end

end
