class Search < OpenStruct

  def self.service
    GithubService.new
  end

  def self.hot_repos
    repo_array = service.search_hottest_repos[:items][0..10]
    repo_array.map {|repo| Search.new(repo)}
  end

  def self.popular_issues_of_the_last_month
    issues_array = service.most_commented_on_issues[:items][0..10]
    issues_array.map {|issue| Search.new(issue)}
  end

  def self.oldest_users_with_zero_followers
    users_array = service.such_sorrow[:items][0..10]
    users_array.map {|user| Search.new(user)}
  end

end
