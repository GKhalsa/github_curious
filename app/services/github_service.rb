require 'open-uri'

class GithubService
  # include ApplicationHelper <=need

  def initialize
    @_connection = Faraday.new(url: "https://api.github.com")
    # @_connection.headers["Authorization"] = "token #{current_user.oauth_token}"

    # ENV["SENDGRID_USER_NAME"]
    @_connection.params["per_page"] = 100
  end

  def followers
    get("/users/gkhalsa/followers")
  end

  def following
    get("/users/gkhalsa/following")
  end

  def starred
    get("/users/gkhalsa/starred")
  end

  def repos
    get("/users/gkhalsa/repos")
  end

  def contribution_total
    doc = Nokogiri::HTML(open("https://www.github.com/gkhalsa"))
    doc.at('h3:contains("contributions")').text.strip
  end

  def commits
    get("/users/gkhalsa/events")
  end

  def commits_hash
    commits.find_all do |commit|
      commit[:type] == "PushEvent"
    end
  end

  def format_commits
    commits_hash.map do |commit|
      {repo: commit[:repo][:name], message: commit[:payload][:commits].first[:message]}
    end
  end

  def organizations
    get("/users/gkhalsa/events")
  end

  private

  def connection
    @_connection
  end

  def get(path)
    parse(connection.get(path))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
