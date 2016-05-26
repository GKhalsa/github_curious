require 'rails_helper'

RSpec.describe "user can visit follower page" do
  scenario "they will see a list of followers" do
    user = User.from_omniauth({
                 :uid=>"11367377",
                 :info=>{:nickname=>"GKhalsa",
                         :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                 :credentials=>{
                         :token=> ENV["TOKEN"] }})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    expect(page).to have_content("welcome")
    click_on("welcome")
    click_on("26")
    expect(current_path).to eq(followers_path)
    expect(page).to have_content("Salvi6God")
  end
  scenario "they will see a list of followers" do
    user = User.from_omniauth({
                 :uid=>"11367377",
                 :info=>{:nickname=>"GKhalsa",
                         :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                 :credentials=>{
                         :token=> ENV["TOKEN"] }})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    expect(page).to have_content("welcome")
    click_on("welcome")
    click_on("36")
    expect(current_path).to eq(following_path)
    expect(page).to have_content("Salvi6God")
  end
end
