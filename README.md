### About The Project
This project utilizes Ruby on Rails to create API endpoints for retrieving commit details and differences from a GitHub repository,leveraging the GitHub API with PostgreSQL as the underlying database.

## Setup

To set up the project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/akshay2408/git_commit_diff
   cd new-repo
2. Install dependencies:
   ```bash
   bundle install
3. Set up the PostgreSQL database:
   ```bash
   rails db:create
   rails db:migrate
4. Create a .env file for your GitHub Personal Access Token and add .env to .gitignore:
   [Know how to get personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
   ```bash
   GITHUB_TOKEN=your_github_token_here
5. Start the server:
   ```bash
   rails server
## API Endpoints
### Get Commit Details:
   `GET /repositories/:owner/:repository/commits/:oid`

   Fetches metadata about a specific commit.

### Get Commit Diff:
   `GET /repositories/:owner/:repository/commits/:oid/diff`

   Fetches the list of files in the commit, including the diff of each file.
### Test API Endpoints using curl request
```bash
curl -X GET "http://localhost:3000/repositories/" \
-H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json"
```

```bash
curl -X GET "http://localhost:3000/repositories/" \
-H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json"
```
