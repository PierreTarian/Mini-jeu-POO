require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Voici un nouvel affrontement"

def player_init1
    player1 = Player.new("Josiane")
    puts "A ma droite #{player1.name}"
    return player1
  end

def player_init2
    player2 = Player.new("José")
    puts "A ma gauche #{player2.name}"
    return player2
end


def player_show_state (player1, player2)
    puts "Voici l'état de chaque joueur :"
    puts player1.show_state
    puts player2.show_state
  end

  def fight (player1,player2)
    while player1.life_points > 0 && player2.life_points > 0
      player_show_state(player1, player2)
      puts "Passons à la phase d'attaque :"
      player1.attacks(player2)
            
      if player2.life_points <= 0 
        break
      else
        player2.attacks(player1)
      end

    end
  end

  def perform
    player1 = player_init1
    player2 = player_init2

    fight(player1, player2)
  end

perform