require "rails_helper"

describe Commit do
  it "finds me my repos" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      repos = Repo.all
      expect(repos.count).to eq(54)

  end
end
