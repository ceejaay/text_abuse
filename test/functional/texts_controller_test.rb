require 'test_helper'

class TextsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    text = Text.create!(text: 'hello world')
    get :show, id: text.id
    assert_response :success
  end

end
