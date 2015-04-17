require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  setup do
    @actor = actors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actor" do
    assert_difference('Actor.count') do
      post :create, actor: { achievement: @actor.achievement, devote: @actor.devote, id: @actor.id, levels: @actor.levels, name: @actor.name, points: @actor.points, sex: @actor.sex }
    end

    assert_redirected_to actor_path(assigns(:actor))
  end

  test "should show actor" do
    get :show, id: @actor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actor
    assert_response :success
  end

  test "should update actor" do
    put :update, id: @actor, actor: { achievement: @actor.achievement, devote: @actor.devote, id: @actor.id, levels: @actor.levels, name: @actor.name, points: @actor.points, sex: @actor.sex }
    assert_redirected_to actor_path(assigns(:actor))
  end

  test "should destroy actor" do
    assert_difference('Actor.count', -1) do
      delete :destroy, id: @actor
    end

    assert_redirected_to actors_path
  end
end
