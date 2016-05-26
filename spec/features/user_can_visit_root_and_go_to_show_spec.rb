require 'rails_helper'

RSpec.describe "non logged in user can visit root" do
  scenario "they can view a login button" do
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
  end

  scenario "logged in user can view show page" do
    # scenario "they can see their name"
    user = User.from_omniauth({
                 :uid=>"11367377",
                 :info=>{:nickname=>"GKhalsa",
                         :image=>"https://avatars.githubusercontent.com/u/11367377?v=3"},
                 :credentials=>{
                         :token=> ENV["TOKEN"] }})

    # ApplicationController.any_instance.stubs(:current_user).returns(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    expect(page).to have_content("welcome")
    click_on("welcome")
    expect(current_path).to eq(user_path(user))

  end
end




# RSpec.describe "Business Admin can see venue button" do
#   scenario "admin can click and fill out venue info" do
#     role = Role.create(name: "business_admin")
#     business_admin = User.create(name: "business admin",
#                                 email: "email",
#                              password: "password")
#     business_admin.roles = [role]
#     ApplicationController.any_instance.stubs(:current_user).returns(business_admin)
#     visit "/"
#     expect(page).to have_content("Venue")
#     click_on("Venue")
#     expect(current_path).to eq(admin_venues_path)
#     expect(page).to have_content("Create a New Venue")
#
#     click_on("Create a New Venue")
#     fill_in :Name, with: "staples center"
#     fill_in :Address, with: "123 fake st"
#     click_on("Submit")
#
#     expect(page).to have_content("Your Venue is Pending Approval")
#   end
