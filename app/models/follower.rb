class Follower < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_followers_hash = service.followers
    temp_followers_hash.map do |follower|
      Follower.new(follower)
    end
  end

  def name
    login
  end

  def photo
    avatar_url
  end

  def url
    html_url
  end

end
