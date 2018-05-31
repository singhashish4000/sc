  require 'csv'    
  csv_text = File.read('sub-district-andhra.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    SubDistrict.create!(row.to_h)
  end

