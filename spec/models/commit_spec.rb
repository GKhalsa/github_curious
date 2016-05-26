require "rails_helper"

describe Commit do
  it "finds me my recent commits" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      recent_commits = Commit.all
      expect(recent_commits.count).to eq(23)

  end
end
