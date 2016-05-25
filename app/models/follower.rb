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

end
