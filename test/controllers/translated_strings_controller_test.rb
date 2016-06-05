require 'test_helper'

class TranslatedStringsControllerTest < ActionController::TestCase
  setup do
    @translated_string = translated_strings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translated_strings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create translated_string" do
    assert_difference('TranslatedString.count') do
      post :create, translated_string: { comment: @translated_string.comment, language_id: @translated_string.language_id, rootstring_id: @translated_string.rootstring_id, translation: @translated_string.translation }
    end

    assert_redirected_to translated_string_path(assigns(:translated_string))
  end

  test "should show translated_string" do
    get :show, id: @translated_string
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @translated_string
    assert_response :success
  end

  test "should update translated_string" do
    patch :update, id: @translated_string, translated_string: { comment: @translated_string.comment, language_id: @translated_string.language_id, rootstring_id: @translated_string.rootstring_id, translation: @translated_string.translation }
    assert_redirected_to translated_string_path(assigns(:translated_string))
  end

  test "should destroy translated_string" do
    assert_difference('TranslatedString.count', -1) do
      delete :destroy, id: @translated_string
    end

    assert_redirected_to translated_strings_path
  end
end
