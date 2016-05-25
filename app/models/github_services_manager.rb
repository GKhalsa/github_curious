class GithubServicesManager

  attr_reader :commit_poro,    :follower_poro,
              :following_poro, :organization_poro,
              :repo_poro,      :starred_poro,
              :contribution_total

  def initialize
    @commit_poro        = Commit.all
    @follower_poro      = Follower.all
    @following_poro     = Following.all
    # @organization_poro  = Organization.all
    @repo_poro          = Repo.all
    @starred_poro       = Starred.all
    @contribution_total = GithubService.contribution_total
  end

  def commits
    commit_poro[0..6].map do |commit|
      "repo: #{commit.repo}, activity: #{commit.message}"
    end
  end

  def total_commits
    contribution_total
  end

  def repos
    repo_poro.map do |repo|
      repo.name
    end
  end

  def follower_count
    follower_poro.count
  end

  def following_count
    following_poro.count
  end

  def starred_count
    starred_poro.count
  end

end
