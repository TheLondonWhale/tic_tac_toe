class BoardCase

  attr_accessor :value

  def initialize (value)

    @value = value

  end

end

class Board

  attr_accessor :board

  def initialize
    # On créé les instances des 9 cases avec une valeur par défault étant un espace. On met un espace sinon la valeur qu'il nous balance est Nil.
    @case_1 = BoardCase.new(" ")
    @case_2 = BoardCase.new(" ")
    @case_3 = BoardCase.new(" ")
    @case_4 = BoardCase.new(" ")
    @case_5 = BoardCase.new(" ")
    @case_6 = BoardCase.new(" ")
    @case_7 = BoardCase.new(" ")
    @case_8 = BoardCase.new(" ")
    @case_9 = BoardCase.new(" ")

    # On met toutes les cases créés dans une array pour plus tard savoir la position de chacune des cases.
    @board = [@case_1, @case_2, @case_3, @case_4, @case_5, @case_6, @case_7, @case_8, @case_9]
  end

  def display_board
        # On affiche les valeurs de chaque case en fonction de leur index. Au final on prend la value de BoardCase.new(" ").
    puts
    puts
    puts "  #{@board[0].value} | #{@board[1].value} | #{@board[2].value} "
    puts "-------------"
    puts "  #{@board[3].value} | #{@board[4].value} | #{@board[5].value} "
    puts "-------------"
    puts "  #{@board[6].value} | #{@board[7].value} | #{@board[8].value} "
    puts
    puts

  end

  def play(array)
    # array a cette forme : [x, x.value_player, place]
    k = array[2] # L'index 2 la place entre 1 et 9 que le joueur a indiqué.
    #if board[(k-1)].value = " " # On vérifie si la place indiqué par le joueur est bien vide. Sinon ca saute son tour.
      case
      when array[1] == "X" # On regarde qu'elle est la couleur du pion du jour, ca correspond à l'index 1 de array.
        @board[(k-1)].value = "X" # L'index d'un array commence à 0, donc on soustrait 1 à k pour que ca colle. Et on change la valeur du BoardCase.
      when array[1] == "O"
        @board[(k-1)].value = "O"
      else
      end
    #end
  end

  def est_dispo?(place)
    # Tant que la valeur de la place indiqué n'est pas un espace, on retourne false
    unless @board[(place-1)].value == " "
      return false
    else
      return true
    end
  end

  def victory?
        # Pour qu'un joueur gagne il faut qu'il y est 3 valeurs identiques (X ou O) dans certaines cases.
        # Il ne faut pas que la case soit vide aussi (c'est notre valeur par défaut).
    case
      when @case_1.value == @case_2.value && @case_1.value == @case_3.value && @case_1.value != " " && @case_2.value != " " && @case_3.value != " "
        return true
      when @case_4.value == @case_5.value && @case_4.value == @case_6.value && @case_4.value != " " && @case_5.value != " " && @case_6.value != " "
        return true
      when @case_7.value == @case_8.value && @case_7.value == @case_9.value && @case_7.value != " " && @case_8.value != " " && @case_9.value != " "
        return true
      when @case_1.value == @case_4.value && @case_1.value == @case_7.value && @case_1.value != " " && @case_4.value != " " && @case_7.value != " "
        return true
      when @case_2.value == @case_5.value && @case_2.value == @case_8.value && @case_2.value != " " && @case_5.value != " " && @case_8.value != " "
        return true
      when @case_3.value == @case_6.value && @case_3.value == @case_9.value && @case_3.value != " " && @case_6.value != " " && @case_9.value != " "
        return true
      when @case_1.value == @case_5.value && @case_1.value == @case_9.value && @case_1.value != " " && @case_5.value != " " && @case_9.value != " "
        return true
      when @case_3.value == @case_5.value && @case_3.value == @case_7.value && @case_3.value != " " && @case_5.value != " " && @case_5.value != " "
        return true
      else
        return false
    end

  end

end

class Player

  attr_accessor :name, :value_player
  attr_writer :win

  def initialize (name, value_player, win = false)

    @name = name
    @value_player = value_player
    @win = win
  end

end

class Game

  def initialize
    puts
    puts "Synchronisation des composants..."
    sleep 2
    puts "Chargement de l'UI graphique.."
    sleep 2
    puts "Le jeu est bientôt prêt.."
    sleep 2
    puts

    puts "Nom du joueur 1 ?"
    name_player_1 = gets.chomp
    puts "Vous aurez les X comme pion #{name_player_1} !"
    value_player_1 = "X"
    @player_1 = Player.new(name_player_1,value_player_1) # Création du joueur 1
    puts "Nom du joueur 2 ?"
    name_player_2 = gets.chomp
    puts "Vous aurez les O comme pion #{name_player_2} !"
    value_player_2 = "O"
    @player_2 = Player.new(name_player_2,value_player_2) # Création du joueur 2

    @players = [@player_1, @player_2] # On met les deux joueurs dans un array pour itérer avec un each après coup.
    @board = Board.new
  end

  def go
    puts
    puts"=================================="
    puts "=======> Comment jouer ? <======="
    puts
    puts "Voici les numéros qu'il faudra indiquer "
    puts "pour placer vos pions :"
    puts
    puts "  1 | 2 | 3 "
    puts "-------------"
    puts "  4 | 5 | 6 "
    puts "-------------"
    puts "  7 | 8 | 9 "
    puts
    puts "====================================="
    puts "     Vous êtes chaud ??     "
    puts "C'est parti pour Tic Tac Toe !"
    puts "====================================="
    puts
    self.turn
  end

  def turn

    turns = 0 # On va incrémenter le nombre de tour. Il y a un total de 8 tours dans un jeu de Morpion

    while turns < 9 # On répère le tour des jours jusqu'à ce que personne ne puisse jouer.

      @players.each{ |player| # On itère sur l'array des joueurs créé plus haut.
      @board.display_board # On affiche le board pour que le joueur puisse prendre sa décision.
      puts "===================TOUR #{(turns + 1)}==================="
      puts "Où veux tu placer ton piont #{player.name} ? (0 - 9)"
      place = gets.chomp.to_i

        # while @board.est_dispo?(place) == false # Si la place est déjà occupé on relance la demande.
        #   puts                                  # ce while est dans le précédent au cas ou le joueur veut rentrer autre chose qu'un Integer.
        #   puts "La position renseigné est déjà occupée"
        #   puts "Veuillez en choisir une nouvelle"
        #   place = gets.chomp.to_i
        # end
        until place > 0 && place < 10 && @board.est_dispo?(place)

        #while @board.est_dispo?(place) == false # Si la place est déjà occupé on relance la demande.
          puts                                  # ce while est dans le précédent au cas ou le joueur veut rentrer autre chose qu'un Integer.
          puts "Veuillez renseigné un bon numéro"
          puts "Choisissez en un nouveau :"
          place = gets.chomp.to_i
        end



      @info_player = [player, player.value_player, place]
      @board.play(@info_player) # le @info_player est l'array que l'on envoie dans la méthode play de la Class Board.

        if @board.victory? # A chaque tour on vérifie si le joueur a gagné
          puts
          puts "============================================="
          puts "          Tu as gagné #{player.name}         "
          puts "============================================="
          break # on sort de la boucle each si c'est le joueur a gagné.
        end

      turns += 1 # On incrémente turns ici

      if turns == 9 # on sort de la boucle each si turns arrive à 9 et on annonce le draw.
        @board.display_board
        puts "============================================="
        puts "            C'est une égalité :(             "
        puts "============================================="
        puts
        puts
        puts "Voulez vous faire une nouvelle partie? (Y or N)"
        answer = gets.chomp
        if answer == "Y"
          Game.new.go
        else
          puts "Au revoir!"
        end
        break
      end

      }

        if @board.victory? # on vérifie une nouvelle fois si il y a victoire
          @board.display_board
          puts "============================================="
          puts "                 !! VICTORY !!               "
          puts "============================================="
          puts
          puts
          puts "Voulez vous faire une nouvelle partie? (Y or N)"
          answer = gets.chomp
          if answer == "Y"
            Game.new.go
          else
            puts "Au revoir!"
          break
          end # Si c'est le cas on sort de la boucle while
        end

    end

  end

end

Game.new.go
