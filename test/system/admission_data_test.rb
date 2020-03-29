require "application_system_test_case"

class AdmissionDataTest < ApplicationSystemTestCase
  setup do
    @admission_datum = admission_data(:one)
  end

  test "visiting the index" do
    visit admission_data_url
    assert_selector "h1", text: "Admission Data"
  end

  test "creating a Admission datum" do
    visit admission_data_url
    click_on "New Admission Datum"

    fill_in "Cases", with: @admission_datum.cases
    fill_in "Covid status", with: @admission_datum.covid_status
    fill_in "Date", with: @admission_datum.date
    fill_in "Details", with: @admission_datum.details
    fill_in "Hospital status", with: @admission_datum.hospital_status
    click_on "Create Admission datum"

    assert_text "Admission datum was successfully created"
    click_on "Back"
  end

  test "updating a Admission datum" do
    visit admission_data_url
    click_on "Edit", match: :first

    fill_in "Cases", with: @admission_datum.cases
    fill_in "Covid status", with: @admission_datum.covid_status
    fill_in "Date", with: @admission_datum.date
    fill_in "Details", with: @admission_datum.details
    fill_in "Hospital status", with: @admission_datum.hospital_status
    click_on "Update Admission datum"

    assert_text "Admission datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Admission datum" do
    visit admission_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admission datum was successfully destroyed"
  end
end
