class Following < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_following_hash = service.following
    temp_following_hash.map do |following_hash|
      Following.new(following_hash)
    end
  end
end
