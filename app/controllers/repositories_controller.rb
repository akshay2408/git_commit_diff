class RepositoriesController < ApplicationController
  before_action :set_headers
  before_action :set_service
  before_action :set_commit_params

  def commit
    render_commit_response(@service.get_commit(@user, @repo, @commit_id))
  end

  def commit_diff
    render_commit_response(@service.get_commit_diff(@user, @repo, @commit_id))
  end

  private

  def set_headers
    @headers = { "Authorization" => "token #{ENV['GITHUB_TOKEN']}" }
  end

  def set_service
    @service = CommitFetcher.new(@headers)
  end

  def set_commit_params
    @user = params[:user]
    @repo = params[:repository]
    @commit_id = params[:commit_sha]
  end

  def render_commit_response(response)
    if response
      render json: response
    else
      render json: { error: 'Commit not found' }, status: :not_found
    end
  end
end
