class CommitFetcher
  def initialize(headers)
    @headers = headers
  end

  def get_commit(user, repo, commit_id)
    url = "https://api.github.com/repos/#{user}/#{repo}/commits/#{commit_id}"
    response = HTTParty.get(url, headers: @headers)
    response.success? ? response.parsed_response : nil
  end

  def get_commit_diff(user, repo, commit_id)
    commit = get_commit(user, repo, commit_id)
    return nil unless commit

    files = commit['files'] || []
    files.map do |file|
      {
        changeKind: file['status'].upcase,
        headFile: { filename: file['filename'] },
        baseFile: {},
        hunks: file['patch'] ? [file['patch']] : []
      }
    end
  end
end
