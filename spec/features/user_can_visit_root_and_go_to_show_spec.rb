require 'rails_helper'

RSpec.describe "non logged in user can visit root" do
  scenario "they can view a login button" do
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
  end

  scenario "logged in user can view show page" do
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
    expect(current_path).to eq(user_path(user))
  end
end
