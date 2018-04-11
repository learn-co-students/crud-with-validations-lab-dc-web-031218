10.times do
  Song.create(
    title: Faker::Dune.saying.truncate(25, separator: ' ', omission: ''),
    released: [true, false].sample,
    release_year: rand(1920..2018),
    artist_name: Faker::RockBand.name,
    genre: Faker::Music.instrument
  )
end
