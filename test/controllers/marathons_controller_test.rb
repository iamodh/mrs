require "test_helper"

class MarathonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marathon = marathons(:one)
  end

  test "should get index" do
    get marathons_url
    assert_response :success
  end

  test "should get new" do
    get new_marathon_url
    assert_response :success
  end

  test "should create marathon" do
    assert_difference("Marathon.count") do
      post marathons_url, params: { marathon: { entry_end: @marathon.entry_end, entry_start: @marathon.entry_start, name: @marathon.name } }
    end

    assert_redirected_to marathon_url(Marathon.last)
  end

  test "should show marathon" do
    get marathon_url(@marathon)
    assert_response :success
  end

  test "should get edit" do
    get edit_marathon_url(@marathon)
    assert_response :success
  end

  test "should update marathon" do
    patch marathon_url(@marathon), params: { marathon: { entry_end: @marathon.entry_end, entry_start: @marathon.entry_start, name: @marathon.name } }
    assert_redirected_to marathon_url(@marathon)
  end

  test "should destroy marathon" do
    assert_difference("Marathon.count", -1) do
      delete marathon_url(@marathon)
    end

    assert_redirected_to marathons_url
  end
end
