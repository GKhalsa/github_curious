require 'open-uri'

class GithubService
  # include ApplicationHelper <=need

  def initialize
    @connection = Faraday.new(url: "https://api.github.com")
    # @connection.headers["Authorization"] = "token #{current_user.oauth_token}"
    # @connection.headers["Authorization"] = "#{ENV['TOKEN']}"

    # ENV["SENDGRID_USER_NAME"]
    @connection.params["per_page"] = 100
  end

  def get_followers
    @connection.get("/users/gkhalsa/followers")
  end

  def followers_hash
    parse(get_followers)
  end

  def get_following
    @connection.get("/users/gkhalsa/following")
  end

  def following_hash
    parse(get_following)
  end

  def get_starred
    @connection.get("/users/gkhalsa/starred")
  end

  def starred_hash
    parse(get_starred)
  end

  def get_repos
    @connection.get("/users/gkhalsa/repos")
  end

  def repos_hash
    parse(get_repos)
  end

  def contribution_total
    doc = Nokogiri::HTML(open("https://www.github.com/gkhalsa"))
    doc.at('h3:contains("contributions")').text.strip
  end

  def get_commits
    @connection.get("/users/gkhalsa/events")
  end

  def commits_hash
    parse(get_commits).find_all do |commit|
      commit[:type] == "PushEvent"
    end
  end

  def get_organizations
    @connection.get("/users/gkhalsa/events")
  end

  def organization_hash
    parse(get_organizations)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
