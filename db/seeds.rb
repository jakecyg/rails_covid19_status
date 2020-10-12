require 'csv'

# why do I refer to these with a capital?
# why does primary/secondary metric tables not have underscore(from model name)?
PrimaryMetric.delete_all
SecondaryMetric.delete_all
Country.delete_all
Region.delete_all
# SecondaryMetric.delete_all

filename = Rails.root.join('db/country_wise_latest.csv')

puts "Loading source csv from: #{filename}"

csv_data = File.read(filename)
stats = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

stats.each do |s|
  region = Region.find_or_create_by(name: s['WHO Region'])
  # puts region.name
  if region&.valid?
    country = region.countries.create(
      name: s['Country/Region']
    )
    pm = country.primary_metrics.create(
      confirmed: s['Confirmed'],
      deaths: s['Deaths'],
      recovered: s['Recovered'],
      active: s['Active']
    )
    sm = country.secondary_metrics.create(
      deathPerHundred: s['Deaths / 100 Cases'],
      recoveredPerHundred: s['Recovered / 100 Cases'],
      deathPerHundredRecovered: s['Deaths / 100 Recovered'],
    )
  else
    puts "Invalid region: #{region} for the country #{m['Country/Region']}."
  end
end
puts "Created #{Region.count} regions"
puts "Created #{Country.count} countries"
puts "Created #{PrimaryMetric.count} Primary metrics"
puts "Created #{SecondaryMetric.count} Secondary metrics"
