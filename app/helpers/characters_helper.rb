module CharactersHelper

  def rand_species
    #pick random page
    i = rand(1..4)
    url = 'http://swapi.co/api/species/?page=' + i.to_s
    uri = URI(url)
    response = Net::HTTP.get(uri)
    species_page = JSON.parse(response)
    species_arr = species_page["results"]
    #random species
    rand_idx = rand(0..(species_arr.length-1))
    random_species = species_arr[rand_idx]
    species_matchobj = /\bspecies\b\/\d+/.match(random_species.to_s)
    #distinguishing between 1 and 2 digit species numbers
    if species_matchobj.to_s.length == 9
      species_num = species_matchobj.to_s[-1].to_s
    elsif species_matchobj.to_s.length == 10
      species_num = species_matchobj.to_s[-2..-1].to_s
    end
    species_num
  end

  def rand_planet
    #pick random page
    i = rand(1..7)
    url = 'http://swapi.co/api/planets/?page=' + i.to_s
    uri = URI(url)
    response = Net::HTTP.get(uri)
    planet_page = JSON.parse(response)
    planet_arr = planet_page["results"]
    #random planet
    rand_idx = rand(0..(planet_arr.length-1))
    random_planet = planet_arr[rand_idx]
    planet_matchobj = /\bplanets\b\/\d+/.match(random_planet.to_s)
    if planet_matchobj.to_s.length == 9
      planet_num = planet_matchobj.to_s[-1].to_s
    elsif planet_matchobj.to_s.length == 10
      planet_num = planet_matchobj.to_s[-2..-1].to_s
    end
    planet_num
  end

  def rand_profession
    professions = ['Aerobat', 'Antarian Ranger', 'Big Game Hunter', 'Bodyguard',
                'Bounty Hunter', 'Changeling', 'Chief Engineer', 'Crime Lord',
                'Deep Space Pilot', 'Elite Trooper', 'Holovid Star', 'Infiltrator',
                'Loyal Protector', 'Martial Arts Master', 'Master Duelist', 'Master Gunner',
                'Master Spy', 'Naval Officer', 'Officer', 'Outlaw Slicer', 'Priest', 'Sharpshooter',
                'Sienar Engineer', 'Starship Ace', 'Treasure Hunter', 'Assassin',
                'Jedi Ace', 'Jedi Artisan', 'Jedi Healer', 'Jedi Instructor', 'Jedi Investigator', 'Jedi Master',
                'Jedi Scholar', 'Jedi Watchman', 'Jedi Weapon Master', 'Beastwarden', 'Force Witch', 'Force Warrior',
                'Berserker Droid', 'Black Sun Enforcer', 'Black Sun Vigo', 'Corporate Troubleshooter', 'Corporate Viceprex',
                'CorSec Officer', 'Crime Broker', 'Espionage Droid', 'Lord of the Expanse', 'Senate Guard', 'Shadow Wing Captain',
                'Dark Side Assassin', 'Dark Side Devotee', 'Dark Side Marauder', 'Sith Acolyte', 'Sith Lord', 'Sith Warrior']
    professions.sample
  end

end
