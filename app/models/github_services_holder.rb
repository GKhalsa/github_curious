class GithubServicesHolder
  attr_reader :commit_poro,    :follower_poro,
              :following_poro, :organization_poro,
              :repo_poro,      :starred_poro
              
  def initialize
    @commit_poro       = Commit.new
    @follower_poro     = Follower.new
    @following_poro    = Following.new
    @organization_poro = Organization.new
    @repo_poro         = Repo.new
    @starred_poro      = Starred.new
  end

end
