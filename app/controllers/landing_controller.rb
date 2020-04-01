class LandingController < ApplicationController
  before_action :setGsheets
  before_action :getDailyCount

  def index
    @daily_count = getDailyCount
    @trend = getCumulativeTrend
    @c_dist = getCovidDist
    @p_dist = getPUIDist
  end

  private
  def setGsheets
    @session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    @spreadsheet = @session.spreadsheet_by_title("PGH COVID Data")
    @running_total = @spreadsheet.worksheets.detect {|ws| ws.title == "SUMMARY (RUNNING TOTAL)" }
    @daily_total = @spreadsheet.worksheets.detect {|ws| ws.title == "SUMMARY (DAILY CASES)" }
  end

  def getDailyCount
    data = []
    names = ["Discharged", "Expired", "Guarded", "HCW", "Stable"]
    (3..7).each do |col|
      values = {}
      (5..@running_total.num_rows).each do |row|
        values[@running_total[row, 1]] = @running_total[row, col]
      end
      data << {name: names[col-3], data: values} 
    end
    return data
  end
  
  def getCumulativeTrend
    data = []
    names = ["Admitted Total", "Expired Total", "Sent Home Total"]
    (15..17).each do |col|
      values = {}
      (5..@running_total.num_rows).each do |row|
        values[@running_total[row, 1]] = @running_total[row, col]
      end
      data << {name: names[col-15], data: values} 
    end
    return data
  end

  def getCovidDist
    data = []
    names = ["Discharged", "Expired", "Guarded", "HCW", "Stable"]
    (3..7).each do |col|
      values = {}
      (5..@daily_total.num_rows-1).each do |row|
        values[@daily_total[row, 1]] = @daily_total[row, col]
      end
      data << {name: names[col-3], data: values} 
    end
    return data
  end

  def getPUIDist
    data = []
    letters = [10,11,13,14]
    names = ["Guarded", "HCW", "Reclassified", "Stable"]
    letters.each do |col|
      values = {}
      (5..@daily_total.num_rows-1).each do |row|
        values[@daily_total[row, 1]] = @daily_total[row, col]
      end
      if col<12
        data << {name: names[col-10], data: values} 
      else
        data << {name: names[col-11], data: values} 
      end
    end
    return data
  end
  
end
