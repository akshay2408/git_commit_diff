Rails.application.routes.draw do
  get 'repositories/:user/:repository/commits/:commit_sha', to: 'repositories#commit', as: 'commit'
  get 'repositories/:user/:repository/commits/:commit_sha/diff', to: 'repositories#commit_diff', as: 'commit_diff'
end
