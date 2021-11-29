require "test_helper"

class NotesCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notes_category = notes_categories(:one)
  end

  test "should get index" do
    get notes_categories_url, as: :json
    assert_response :success
  end

  test "should create notes_category" do
    assert_difference('NotesCategory.count') do
      post notes_categories_url, params: { notes_category: { categories_id: @notes_category.categories_id, notes_id: @notes_category.notes_id } }, as: :json
    end

    assert_response 201
  end

  test "should show notes_category" do
    get notes_category_url(@notes_category), as: :json
    assert_response :success
  end

  test "should update notes_category" do
    patch notes_category_url(@notes_category), params: { notes_category: { categories_id: @notes_category.categories_id, notes_id: @notes_category.notes_id } }, as: :json
    assert_response 200
  end

  test "should destroy notes_category" do
    assert_difference('NotesCategory.count', -1) do
      delete notes_category_url(@notes_category), as: :json
    end

    assert_response 204
  end
end
