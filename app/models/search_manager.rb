class SearchManager

  attr_reader :hot_repos,
              :popular_issues,
              :zero_followers

  def initialize
    @hot_repos      =  Search.hot_repos
    @popular_issues =  Search.popular_issues_of_the_last_month
    @zero_followers =  Search.oldest_users_with_zero_followers
  end

  def organized_repos
    hot_repos.map do |repo|
      {repo: repo.full_name, url: repo.owner[:html_url], starred: repo.stargazers_count}
    end
  end

  def organized_issues
    popular_issues.map do |issue|
      {title: issue.title, url: issue.url}
    end
  end

  def organized_followers
    zero_followers.map do |issue|
      {name: issue.login, image_link: issue.avatar_url}
    end
  end

end
