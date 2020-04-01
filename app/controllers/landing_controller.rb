class LandingController < ApplicationController
  def index
    @session = GoogleDrive::Session.from_service_account_key("client_secret.json")

    @spreadsheet = @session.spreadsheet_by_title("PGH COVID Data")
    
    @worksheet = @spreadsheet.worksheets.detect {|ws| ws.title == "PGH WORKER DATA" }

    @data = {}
    (1..5).each do |col|
      title = @worksheet[1, col]
      datum = []
      (2..@worksheet.num_rows).each do |row|
        datum << @worksheet[row, col]
      end
      @data[title] = datum
    end

    @w_covid = {}
    @pui = {}
    @discharged = {}
    @expired = {}
    (0..@worksheet.num_rows-2).each do |val|
      @w_covid[@data["DATE"][val]] = @data["WITH_COVID"][val]
      @pui[@data["DATE"][val]] = @data["ADMITTED_AS_PUI"][val]
      @discharged[@data["DATE"][val]] = @data["DISCHARGED"][val]
      @expired[@data["DATE"][val]] = @data["EXPIRED"][val]
    end

    @rows = @worksheet.rows
  end
end
