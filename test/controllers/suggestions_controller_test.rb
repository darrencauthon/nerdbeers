require "test_helper"

class SuggestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    
    assert_equal "/suggestions", @request.original_fullpath
    refute_equal "/suggestions/all", @request.original_fullpath
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestions/index"
    assert_template layout: "layouts/application"
  end

  test "should get index all" do
    get(:index, { :all => 'all', :viewing => :all })
    assert_response :success

    assert_equal "/suggestions/all", @request.original_fullpath
    refute_equal "/suggestions", @request.original_fullpath
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestions/index"
    assert_template layout: "layouts/application"
  end

  test "should get new" do
    get :new
    assert_response :success
    
    assert_equal "/suggestions/new", @request.original_fullpath
    refute_equal "/suggestions", @request.original_fullpath
    refute_equal "/suggestion/sall", @request.original_fullpath
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestions/new"
    assert_template layout: "layouts/application"
  end

end
