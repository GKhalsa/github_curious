require "rails_helper"

RSpec.describe "user can visit data page" do
  scenario "they see different data sets" do
    user = User.from_omniauth({
                 :uid=>"11367377",
                 :info=>{:nickname=>"GKhalsa",
                         :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                 :credentials=>{
                         :token=> ENV["TOKEN"] }})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on("welcome")
    click_on("Super Kewl Data")

    expect(current_path).to eq(data_path)
    expect(page).to have_content("Popular Repos")
    expect(page).to have_content("Popular Issues")
    expect(page).to have_content("So sad")
  end
end
