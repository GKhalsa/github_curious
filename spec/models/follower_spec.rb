require "rails_helper"

describe Follower do
  it "can count my followers" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      followers = Follower.all
      expect(followers.count).to eq(26)
  end
end
