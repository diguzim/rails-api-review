require "test_helper"

class MonstersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster = monsters(:one)
  end

  test "should get index" do
    get monsters_url, as: :json
    assert_response :success
  end

  test "should create monster" do
    assert_difference("Monster.count") do
      post monsters_url, params: { monster: { name: @monster.name, user_id: @monster.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show monster" do
    get monster_url(@monster), as: :json
    assert_response :success
  end

  test "should update monster" do
    patch monster_url(@monster), params: { monster: { name: @monster.name, user_id: @monster.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy monster" do
    assert_difference("Monster.count", -1) do
      delete monster_url(@monster), as: :json
    end

    assert_response :no_content
  end
end
