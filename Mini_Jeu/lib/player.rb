require 'pry'

class Player

    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        print "#{@name} a #{@life_points} points de vie" 
    end

    def gets_damage(damage)
        @life_points -= damage
        if @life_points <= 0
            print "le joueur #{@name} a été tué !"
        end
    end

    def attacks(player)
        puts "le joueur #{@name} attaque le joueur #{player.name}"

        damage = compute_damage()
        player.gets_damage(damage)

    puts "#{@name} a infligé #{damage} points de dommages à #{player.name}"
    end

    def compute_damage
        return rand(1..6)
    end
end

#version 2.0

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @weapon_level = 1
        @life_points = 100
    end

    def show_state
        super
        print " et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{level}"

        if @weapon_level < level
            unity = level - @weapon_level
            @weapon_level = level
            puts "Youhou ! elle est meilleur que ton arme actuelle : tu la prends"
        else puts " Shit... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        level = rand(1..6)

        case level
        when 1
            puts "You found nothing Jon Snow .."

        when 2..5
            @life_points +=50

            if @life_points > 100
            @life_points = 100
            end

            puts "Bravo, tu as trouvé un pack de +50 points de vie !"

        when 6
            @life_points +=80

            if @life_points >100
            @life_point = 100

            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            end
        end
    end
end

