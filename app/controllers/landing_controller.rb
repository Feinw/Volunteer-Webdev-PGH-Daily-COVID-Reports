class LandingController < ApplicationController
  def index
    @session = GoogleDrive::Session.from_service_account_key("client_secret.json")

    @spreadsheet = @session.spreadsheet_by_title("PGH COVID Data")
    
    @worksheet = @spreadsheet.worksheets.detect {|ws| ws.title == "Sheet5" }

    @rows = @worksheet.rows
  end
end
