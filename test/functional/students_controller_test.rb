require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { blog_url: @student.blog_url, coderwall_url: @student.coderwall_url, codeschool_url: @student.codeschool_url, github_url: @student.github_url, image_url: @student.image_url, linkedin_url: @student.linkedin_url, name: @student.name, tagline: @student.tagline, treehouse_url: @student.treehouse_url, twitter_url: @student.twitter_url }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    put :update, id: @student, student: { blog_url: @student.blog_url, coderwall_url: @student.coderwall_url, codeschool_url: @student.codeschool_url, github_url: @student.github_url, image_url: @student.image_url, linkedin_url: @student.linkedin_url, name: @student.name, tagline: @student.tagline, treehouse_url: @student.treehouse_url, twitter_url: @student.twitter_url }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
