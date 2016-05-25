class Repo < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_repos_hash = service.repos
    temp_repos_hash.map {|repo_hash| Repo.new(repo_hash)}
  end

end
