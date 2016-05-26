require "rails_helper"

describe Search do
  it "it returns hot repos" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      hot_repos = Search.hot_repos
      expect(hot_repos.count).to eq(11)
  end

  it "it returns popular issues" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      issues = Search.popular_issues_of_the_last_month
      expect(issues.count).to eq(11)
  end

  it "it returns sad users" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      users = Search.oldest_users_with_zero_followers
      expect(users.count).to eq(11)
  end
end
