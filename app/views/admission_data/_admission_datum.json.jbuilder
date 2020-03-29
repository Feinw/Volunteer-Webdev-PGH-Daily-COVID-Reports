json.extract! admission_datum, :id, :date, :covid_status, :hospital_status, :details, :cases, :created_at, :updated_at
json.url admission_datum_url(admission_datum, format: :json)
