year = 2016
(1..4).each do |season|
  Cour.create!(year: year, season: season)
end