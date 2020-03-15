# Write your code here!
def game_hash()
  game_hash = {:home => {:team_name => 'Brooklyn Nets', :colors => ['Black','White'],
  :players => [{:player_name => 'Alan Anderson',:number => 0,:shoe => 16,:points => 22,:rebounds => 12,:assists => 12,:steals => 3,:blocks => 1,:slam_dunks => 1},
  {:player_name => 'Reggie Evans',:number => 30,:shoe => 14,:points => 12,:rebounds => 12,:assists => 12,:steals => 12,:blocks => 12,:slam_dunks => 7},
  {:player_name => 'Brook Lopez',:number => 11,:shoe => 17,:points => 17,:rebounds => 19,:assists => 10,:steals => 3,:blocks =>1,:slam_dunks => 15},
  {:player_name => 'Mason Plumlee',:number => 1,:shoe => 19,:points => 26,:rebounds => 11,:assists => 6,:steals => 3,:blocks =>8,:slam_dunks => 5},
  {:player_name => 'Jason Terry',:number => 31,:shoe => 15,:points => 19,:rebounds => 2,:assists => 2,:steals => 4,:blocks =>11,:slam_dunks => 1}]},
  :away => {:team_name => 'Charlotte Hornets', :colors => ['Turquoise', 'Purple'], :players => [
    {:player_name => 'Jeff Adrien',:number => 4,:shoe => 18,:points => 10,:rebounds => 1,:assists => 1,:steals => 2,:blocks => 7,:slam_dunks => 2},
  {:player_name => 'Bismack Biyombo',:number => 0,:shoe => 16,:points => 12,:rebounds => 4,:assists => 7,:steals => 22,:blocks => 15,:slam_dunks => 10},
  {:player_name => 'DeSagna Diop',:number => 2,:shoe => 14,:points => 24,:rebounds => 12,:assists => 12,:steals => 4,:blocks =>5,:slam_dunks => 5},
  {:player_name => 'Ben Gordon',:number => 8,:shoe => 15,:points => 33,:rebounds => 3,:assists => 2,:steals => 1,:blocks =>1,:slam_dunks => 0},
  {:player_name => 'Kemba Walker',:number => 33,:shoe => 15,:points => 6,:rebounds => 12,:assists => 12,:steals => 7,:blocks =>5,:slam_dunks => 12}]}}
  return game_hash
end

def num_points_scored(player)
	game_hash[:home][:players].each do |x|
		if x[:player_name] == player
			return x[:points]
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:player_name] == player 
			return x[:points]
		end
	end
end

def shoe_size(player)
	game_hash[:home][:players].each do |x|
		if x[:player_name] == player
			return x[:shoe]
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:player_name] == player 
			return x[:shoe]
		end
	end
end

def team_colors(name)
  if game_hash[:home][:team_name] == name
    return game_hash[:home][:colors] 
  end
  if game_hash[:away][:team_name] == name
    return game_hash[:away][:colors] 
  end
end

def team_names
  n = []
  n << game_hash[:home][:team_name]
  n << game_hash[:away][:team_name]
  return n
end

def player_numbers(name)
	n = []
	if game_hash[:home][:team_name] == name 
		game_hash[:home][:players].each do |x|
			n << x[:number]
		end 
		return n 
	end 
	if game_hash[:away][:team_name] == name 
		game_hash[:away][:players].each do |x|
			n << x[:number]
		end 
		return n 
	end 
end

def player_stats(n)
	game_hash[:home][:players].each do |x|
		if x[:player_name] == n
		# 	puts x
			return x.reject {|k,v| [:player_name].include? k}
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:player_name] == n
		# 	puts x
			return x.reject {|k,v| [:player_name].include? k}
		end
	end
end

def big_shoe_rebounds()
	biggest_shoe = 0
	reb = 0
	game_hash[:home][:players].each do |x|
		if x[:shoe] > biggest_shoe 
			biggest_shoe = x[:shoe]
			reb = x[:rebounds]
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:shoe] > biggest_shoe 
			biggest_shoe = x[:shoe]
			reb = x[:rebounds]
		end
	end
	return reb
end

def most_points_scored
	most_p = 0
	n = ''
	game_hash[:home][:players].each do |x|
		if x[:points] > most_p 
			most_p = x[:points]
			n = x[:player_name]
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:points] > most_p 
			most_p = x[:points]
			n = x[:player_name]
		end
	end
	return n 
	# return biggest_shoe
end

def winning_team
	s_home = 0 
	s_away = 0 
	game_hash[:home][:players].each do |x|
		s_home += x[:points]
	end
	game_hash[:away][:players].each do |x|
		s_away += x[:points]
	end
	if s_home > s_away 
		return game_hash[:home][:team_name]
	else 
		return game_hash[:away][:team_name]
	end
	# s_home > s_away ? puts( s_home ): puts (s_away) 
end

def player_with_longest_name
	l = 0  
	n = ''
	game_hash[:home][:players].each do |x|
		if x[:player_name].length > l 
			l = x[:player_name].length 
			n = x[:player_name]
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:player_name].length > l 
			l = x[:player_name].length 
			n = x[:player_name]
		end
	end
	return n 
end

def long_name_steals_a_ton?
	long_name = player_with_longest_name
	l = 0  
	n = ''
	game_hash[:home][:players].each do |x|
		if x[:steals] > l 
			l = x[:steals]
			n = x[:player_name]
		end
	end
	game_hash[:away][:players].each do |x|
		if x[:steals] > l 
			l = x[:steals] 
			n = x[:player_name]
		end
	end
	return long_name == n 
	# return n 
end




