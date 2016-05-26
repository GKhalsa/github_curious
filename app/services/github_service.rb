require 'open-uri'

class GithubService

  def initialize
    user = Thread.current[:user]
    token = user.oauth_token
    @_name = user.name
    @_connection = Faraday.new(url: "https://api.github.com")
    @_connection.headers["Authorization"] = "token #{token}"
    @_connection.params["per_page"] = 100
  end

  def followers
    get("/users/#{name}/followers")
  end

  def following
    get("/users/#{name}/following")
  end

  def starred
    get("/users/#{name}/starred")
  end

  def repos
    get("/users/#{name}/repos")
  end

  def contribution_total
    doc = Nokogiri::HTML(open("https://www.github.com/#{name}"))
    doc.at('h3:contains("contributions")').text.strip
  end

  def received_events
    get("/users/#{name}/received_events")
  end

  def following_events
    received_events[0..20].map do |event|
      {repo: event[:repo][:name], user: event[:actor][:login], occurred_at: event[:created_at]}
    end
  end

  def commits
    get("/users/#{name}/events")#, {:per_page => 100}
  end

  def commits_hash
    find_commits(commits)
  end

  def formatted_commits
    formatter(commits_hash)
  end

  def find_commits(hash)
    hash.find_all do |commit|
      commit[:type] == "PushEvent"
    end
  end

  def formatter(hash)
    hash.map do |commit|
      unless commit[:payload][:commits].first.nil?
        {repo: commit[:repo][:name], message: commit[:payload][:commits].first[:message]}
      end
    end
  end

  def organizations
    get("/users/#{name}/orgs")
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

  def name
    @_name
  end
end
