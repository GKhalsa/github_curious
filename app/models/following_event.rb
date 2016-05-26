class FollowingEvent < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_commits_hash = service.following_events
    temp_commits_hash.map do |event|
      FollowingEvent.new(event)
    end
  end

end
