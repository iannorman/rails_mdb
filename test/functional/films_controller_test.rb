require 'test_helper'

class FilmsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Film.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Film.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Film.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to film_url(assigns(:film))
  end

  def test_edit
    get :edit, :id => Film.first
    assert_template 'edit'
  end

  def test_update_invalid
    Film.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Film.first
    assert_template 'edit'
  end

  def test_update_valid
    Film.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Film.first
    assert_redirected_to film_url(assigns(:film))
  end

  def test_destroy
    film = Film.first
    delete :destroy, :id => film
    assert_redirected_to films_url
    assert !Film.exists?(film.id)
  end
end
