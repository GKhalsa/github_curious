module SearchHelper

  def search_hottest_repos
    connection.params["q"] = "created:>2016-05-19"
    connection.params["sort"] = "stars"
    connection.params["order"] = "desc"
    get("/search/repositories")
  end

  def most_commented_on_issues
    connection.params["q"] = "created:>2016-04-19"
    connection.params["sort"] = "comments"
    connection.params["order"] = "desc"
    get("/search/issues")
  end

  def such_sorrow
    connection.params["q"] = "followers:0"
    connection.params["sort"] = "joined"
    connection.params["order"] = "asc"
    get("/search/users")
  end
  
end
