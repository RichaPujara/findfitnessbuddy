require "application_system_test_case"

class WorkoutSessionsTest < ApplicationSystemTestCase
  setup do
    @workout_session = workout_sessions(:one)
  end

  test "visiting the index" do
    visit workout_sessions_url
    assert_selector "h1", text: "Workout sessions"
  end

  test "should create workout session" do
    visit workout_sessions_url
    click_on "New workout session"

    fill_in "Date", with: @workout_session.date
    fill_in "Description", with: @workout_session.description
    fill_in "Difficulty level", with: @workout_session.difficulty_level
    fill_in "Duration", with: @workout_session.duration
    fill_in "Fees", with: @workout_session.fees
    fill_in "Start time", with: @workout_session.start_time
    fill_in "Workout category", with: @workout_session.workout_category
    fill_in "Workout type", with: @workout_session.workout_type
    click_on "Create Workout session"

    assert_text "Workout session was successfully created"
    click_on "Back"
  end

  test "should update Workout session" do
    visit workout_session_url(@workout_session)
    click_on "Edit this workout session", match: :first

    fill_in "Date", with: @workout_session.date
    fill_in "Description", with: @workout_session.description
    fill_in "Difficulty level", with: @workout_session.difficulty_level
    fill_in "Duration", with: @workout_session.duration
    fill_in "Fees", with: @workout_session.fees
    fill_in "Start time", with: @workout_session.start_time
    fill_in "Workout category", with: @workout_session.workout_category
    fill_in "Workout type", with: @workout_session.workout_type
    click_on "Update Workout session"

    assert_text "Workout session was successfully updated"
    click_on "Back"
  end

  test "should destroy Workout session" do
    visit workout_session_url(@workout_session)
    click_on "Destroy this workout session", match: :first

    assert_text "Workout session was successfully destroyed"
  end
end
