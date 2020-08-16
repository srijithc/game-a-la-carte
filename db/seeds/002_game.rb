require 'open-uri'

games = [["Gran Turismo Sport", "https://i.imgur.com/fpVLFsO.jpg", "3 years and older", "Mystery", "Racing", "Low", 10],
["Stellaris", "https://i.imgur.com/1mlBaBs.jpg", "13 years and older", "War", "Strategy", "None", 10],
["Phoenix Wright Ace Attorney", "https://i.imgur.com/UCiQTbs.jpg", "18 years and older", "Mystery", "Adventure", "Medium", 10],
["The Last of Us", "https://i.imgur.com/b2CMhmT.jpg", "18 years and older", "Sci-Fi", "Adventure", "Low", 10],
["The Crew 2", "https://i.imgur.com/wm9BdG3.jpg", "3 years and older", "Horror", "Racing", "Medium", 10],
["AO Tennis 2", "https://i.imgur.com/7UaiZ6X.jpg", "18 years and older", "Horror", "Sports", "Medium", 10],
["PUBG", "https://i.imgur.com/oyNh4HG.jpg", "3 years and older", "Mystery", "Shooting", "None", 20],
["Project CARS 2", "https://i.imgur.com/n7FZ8XZ.png", "3 years and older", "Horror", "Racing", "None", 20],
["Madden NFL 20", "https://i.imgur.com/mYTrozi.jpg", "13 years and older", "Sci-Fi", "Sports", "None", 20],
["F1 2019", "https://i.imgur.com/Eyh23a1.png", "3 years and older", "Crime", "Racing", "Low", 20],
["Planet Coaster", "https://i.imgur.com/0medvFR.jpg", "13 years and older", "War", "Strategy", "High", 20],
["Need for Speed: Heat", "https://i.imgur.com/iPHkgQu.jpg", "13 years and older", "Crime", "Racing", "Medium", 20],
["Civilization VI", "https://i.imgur.com/t9aKHLw.jpg", "18 years and older", "War", "Strategy", "High", 20],
["Uncharted 4", "https://i.imgur.com/apazESG.png", "18 years and older", "Crime", "Adventure", "Medium", 30],
["FIFA 20", "https://i.imgur.com/ACrU3fJ.jpg", "3 years and older", "War", "Sports", "Low", 30],
["Killzone Shadowfall", "https://i.imgur.com/LY8jcfd.jpg", "13 years and older", "Mystery", "Shooting", "High", 30],
["Crash Team Racing: Nitro Fueled", "https://i.imgur.com/Dywo5tX.jpg", "18 years and older", "Horror", "Racing", "None", 30],
["Gears of War 4", "https://i.imgur.com/G9gp25N.jpg", "3 years and older", "Sci-Fi", "Shooting", "High", 30],
["Forza Horizon 4", "https://i.imgur.com/QVq6SAT.jpg", "13 years and older", "Horror", "Racing", "Low", 30],
["Farenheit", "https://i.imgur.com/hOv0Fkd.jpg", "3 years and older", "Horror", "Adventure", "None", 30],
["NBA 2K20", "https://i.imgur.com/XyEaW81.jpg", "13 years and older", "Sci-Fi", "Sports", "High", 30],
["Rocket League", "https://i.imgur.com/ZZXbPq9.jpg", "18 years and older", "Horror", "Sports", "Medium", 30],
["XCOM 2", "https://i.imgur.com/v1wq052.jpg", "3 years and older", "Mystery", "Strategy", "Low", 30],
["Rise of the Tomb Raider", "https://i.imgur.com/Fm3OQw2.jpg", "13 years and older", "Sci-Fi", "Adventure", "None", 30],
["Horizon Zero Dawn", "https://i.imgur.com/ZnTnDcG.png", "18 years and older", "Sci-Fi", "Adventure", "High", 30]
]

games.each do |name, picture_url, age_group, theme, genre, violence, price|
  game = Game.find_or_initialize_by(name: name)
  game.game_picture.attach(io: URI.open(picture_url, "r"), filename: name)
  game.update_attributes(target_age_group: TargetAgeGroup.find_by_title(age_group), theme: theme, genre: genre, violence: violence, price: price)
end