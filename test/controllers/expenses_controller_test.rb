require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expenses_index_url
    assert_response :success
  end

  test "should get show" do
    get expenses_show_url
    assert_response :success
  end

  test "should get new" do
    get expenses_new_url
    assert_response :success
  end
end
