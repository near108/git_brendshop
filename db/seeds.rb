User.create(email: 'masayoshi108justin@gmail.com', password: 'momotora108', status: '1')

require "csv"
beans_csv = CSV.readlines("db/beans.csv")
beans_csv.each do |row|
  Bean.create(country: row[1], grade: row[2], roast: row[3], comment: [4])
end