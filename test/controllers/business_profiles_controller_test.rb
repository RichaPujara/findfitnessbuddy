require "test_helper"

class BusinessProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_profile = business_profiles(:one)
  end

  test "should get index" do
    get business_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_business_profile_url
    assert_response :success
  end

  test "should create business_profile" do
    assert_difference("BusinessProfile.count") do
      post business_profiles_url, params: { business_profile: { description: @business_profile.description, location: @business_profile.location, name: @business_profile.name, user_id: @business_profile.user_id } }
    end

    assert_redirected_to business_profile_url(BusinessProfile.last)
  end

  test "should show business_profile" do
    get business_profile_url(@business_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_profile_url(@business_profile)
    assert_response :success
  end

  test "should update business_profile" do
    patch business_profile_url(@business_profile), params: { business_profile: { description: @business_profile.description, location: @business_profile.location, name: @business_profile.name, user_id: @business_profile.user_id } }
    assert_redirected_to business_profile_url(@business_profile)
  end

  test "should destroy business_profile" do
    assert_difference("BusinessProfile.count", -1) do
      delete business_profile_url(@business_profile)
    end

    assert_redirected_to business_profiles_url
  end
end
