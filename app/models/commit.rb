class Commit < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_commits_hash = service.formatted_commits
    temp_commits_hash.map {|commit_hash| Commit.new(commit_hash)}
  end

end
