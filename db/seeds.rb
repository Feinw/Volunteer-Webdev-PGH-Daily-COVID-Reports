# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

session = GoogleDrive::Session.from_service_account_key("client_secret.json")
spreadsheet = session.spreadsheet_by_title("PGH COVID Data")
worksheet = spreadsheet.worksheets.detect {|ws| ws.title == "ADMISSION DATA" }

worksheet.rows.drop(1).each do |row|
    AdmissionDatum.find_or_create_by(date: row[0], covid_status: row[1], hospital_status: row[2], details: row[3], cases: row[4])
end