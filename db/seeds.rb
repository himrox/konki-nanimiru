require 'net/http'
require 'uri'
require 'json'

cour_api_url = URI.parse('http://api.moemoe.tokyo/anime/v1/master/cours')
cour_json = Net::HTTP.get(cour_api_url)
cour_result = JSON.parse(cour_json)

cour_result.each_value do |api_cour|
  year = api_cour['year']
  cours = api_cour['cours']
  cour = Cour.find_or_create_by(year: year, season: cours)

  anime_api_url = URI.parse("http://api.moemoe.tokyo/anime/v1/master/#{year}/#{cours}")
  anime_json = Net::HTTP.get(anime_api_url)
  anime_result = JSON.parse(anime_json)

  anime_result.each do |api_anime|
    title = api_anime['title']
    public_url = api_anime['public_url']
    api_number = api_anime['id']
    cour.animes.find_or_create_by(title: title, public_url: public_url, api_number: api_number)
  end
end

User.create(email: "himrox77@gmail.com", password: "password",
            password_confirmation: "password")

User.create(email: "admin@gmail.com", password: "password",
            password_confirmation: "password", admin: true)