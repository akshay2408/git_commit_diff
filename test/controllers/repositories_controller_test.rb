require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get commits" do
    params = {
      commit_sha: "commit-id",
      user: "admin",
      repository: "repo-name"
    }
    get commit_url(params)
    assert_response :success
  end

  test "should get diff" do
    params = {
      commit_sha: "commit-id",
      user: "admin",
      repository: "repo-name"
    }
    get commit_url(params)
    assert_response :success
  end
end
