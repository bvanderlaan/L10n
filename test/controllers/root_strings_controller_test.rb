require 'test_helper'

class RootStringsControllerTest < ActionController::TestCase
  setup do
    @root_string = root_strings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:root_strings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create root_string" do
    assert_difference('RootString.count') do
      post :create, root_string: { comment: @root_string.comment, string: @root_string.string }
    end

    assert_redirected_to root_string_path(assigns(:root_string))
  end

  test "should show root_string" do
    get :show, id: @root_string
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @root_string
    assert_response :success
  end

  test "should update root_string" do
    patch :update, id: @root_string, root_string: { comment: @root_string.comment, string: @root_string.string }
    assert_redirected_to root_string_path(assigns(:root_string))
  end

  test "should destroy root_string" do
    assert_difference('RootString.count', -1) do
      delete :destroy, id: @root_string
    end

    assert_redirected_to root_strings_path
  end
end
