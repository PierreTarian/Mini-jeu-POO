require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|                                              |"
puts "|         Welcome to the Poopoo Game           |"
puts "|            Be the last to survive            |"
puts "|                                              |"
puts "------------------------------------------------"


def human_init
    puts "Quel est ton nom de joueur"
    name = gets.chomp
    human = HumanPlayer.new(name)
    puts human.show_state
    return human
end

def ennemis_init
    ennemis = []
    player1 = Player.new("Josiane")
    player2 = Player.new("José")

    ennemis.push(player1,player2)
    return ennemis
  end

  def fight (human, ennemis)
  
  while human.life_points > 0 && (ennemis[0].life_points > 0 || ennemis[1].life_points >0)
    puts human.show_state

    puts"Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "attaquer un joueur en vue :"
    if ennemis[0].life_points > 0 
      print "0 - "
      print "#{ennemis[0].show_state}"
    end
    if ennemis[1].life_points > 0 
        print " 1 - "
        print "#{ennemis[1].show_state}"
    end
    
    puts "Fais ton choix :"
    choice = gets.chomp
    
    case choice
      when "a" 
        puts "----------------------------------------------"
        human.search_weapon
      when "s"
        puts "----------------------------------------------"
        human.search_health_pack
      when "0"
        puts "----------------------------------------------"
        human.attacks(ennemis[0])
      when "1"
        puts "----------------------------------------------"
        human.attacks(ennemis[1])
    
    end

    
    ennemis.each do |ennemis|
      if ennemis.life_points > 0
        puts "un autre joueur t'attaquent!"
        ennemis.attacks(human)
      end
    end
    
end

puts "La partie est finie"

if human.life_points > 0 
  puts "BRAVO CHAMPION! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
end


def perform

  human = human_init
  ennemis = ennemis_init
  fight(human, ennemis)
end

perform