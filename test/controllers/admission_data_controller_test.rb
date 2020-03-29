require 'test_helper'

class AdmissionDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admission_datum = admission_data(:one)
  end

  test "should get index" do
    get admission_data_url
    assert_response :success
  end

  test "should get new" do
    get new_admission_datum_url
    assert_response :success
  end

  test "should create admission_datum" do
    assert_difference('AdmissionDatum.count') do
      post admission_data_url, params: { admission_datum: { cases: @admission_datum.cases, covid_status: @admission_datum.covid_status, date: @admission_datum.date, details: @admission_datum.details, hospital_status: @admission_datum.hospital_status } }
    end

    assert_redirected_to admission_datum_url(AdmissionDatum.last)
  end

  test "should show admission_datum" do
    get admission_datum_url(@admission_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_admission_datum_url(@admission_datum)
    assert_response :success
  end

  test "should update admission_datum" do
    patch admission_datum_url(@admission_datum), params: { admission_datum: { cases: @admission_datum.cases, covid_status: @admission_datum.covid_status, date: @admission_datum.date, details: @admission_datum.details, hospital_status: @admission_datum.hospital_status } }
    assert_redirected_to admission_datum_url(@admission_datum)
  end

  test "should destroy admission_datum" do
    assert_difference('AdmissionDatum.count', -1) do
      delete admission_datum_url(@admission_datum)
    end

    assert_redirected_to admission_data_url
  end
end
