require "rails_helper"

describe Organization do
  it "lists me organizations" do
      user = User.from_omniauth({
                   :uid=>"11367377",
                   :info=>{:nickname=>"GKhalsa",
                           :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                   :credentials=>{
                           :token=> ENV["TOKEN"] }})

      Thread.current[:user] = user
      orgs = Organization.all
      expect(orgs.count).to eq(1)

  end
end
