require "application_system_test_case"

class BusinessProfilesTest < ApplicationSystemTestCase
  setup do
    @business_profile = business_profiles(:one)
  end

  test "visiting the index" do
    visit business_profiles_url
    assert_selector "h1", text: "Business profiles"
  end

  test "should create business profile" do
    visit business_profiles_url
    click_on "New business profile"

    fill_in "Description", with: @business_profile.description
    fill_in "Location", with: @business_profile.location
    fill_in "Name", with: @business_profile.name
    fill_in "User", with: @business_profile.user_id
    click_on "Create Business profile"

    assert_text "Business profile was successfully created"
    click_on "Back"
  end

  test "should update Business profile" do
    visit business_profile_url(@business_profile)
    click_on "Edit this business profile", match: :first

    fill_in "Description", with: @business_profile.description
    fill_in "Location", with: @business_profile.location
    fill_in "Name", with: @business_profile.name
    fill_in "User", with: @business_profile.user_id
    click_on "Update Business profile"

    assert_text "Business profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Business profile" do
    visit business_profile_url(@business_profile)
    click_on "Destroy this business profile", match: :first

    assert_text "Business profile was successfully destroyed"
  end
end
