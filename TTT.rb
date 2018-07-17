#########################################################
# Welcoming==>OK
def begining
  puts "...........**************............"
  puts "Welcome to the TIC TAC TOE game"
  puts "...........**************............"
  end

########################################################
# Définition du nom des joueurs==>OK
 def test_1_initialize
 	  puts "Quel est ton nom?"
    #STDOUT.flush
    @user_name_1 = gets.chomp
  puts "Bienvenu #{@user_name_1}!!"
  puts ".........................."
  puts "Ok, et toi, quel est ton nom?"
    @user_name_2 = gets.chomp
  puts "Bienvenu à toi aussi #{@user_name_1}!!"
  puts ".........................."
end

#########################################################
#Définition du symbole par joueur==>OK
def symbole_pr_user
  @user_1 = rand() > 0.5 ? 'X' : 'O' # formule permettant de bénéficier des joies de l'aléatoire
  @user_2 = @user_1 == 'X' ? 'O' : 'X' # si le result en haut est X, de fait, user_2 aura l'autre symbole
  puts "#{@user_name_1} ton symbole sera : #{@user_1}, et donc #{@user_name_2}, tu auras ce symbole:  #{@user_2}"
end
# end
test_1_initialize
symbole_pr_user
########################################################"
# class Board
#   include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases



  def test_2_initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
#####################################################
# Creation de mon board  hash avec chacune des valeurs empty
    @board = [" ", " "," ",
      " ", " ", " ",
      " "," ", " "]

# Rappel de chacune des valeurs via leur index: pour initialiser à chaque tour

  end
test_2_initialize

def aff_tab
    puts " #{@board[0]}    | #{@board[1]}    | #{@board[2]} "
    puts "----------------"
    puts " #{@board[3]}    | #{@board[4]}    | #{@board[5]} "
    puts "----------------"
    puts " #{@board[6]}    | #{@board[7]}    | #{@board[8]} "
  end
#########################################################################
#OK manque les if pour conditionner les champs (mvs num) + case deja prise + le win
 def play
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    i= 0
    while i < 8
    puts " #{@user_name_1} choisis un numéro entre 0 et 8 pour placer ton symbole "
    choice_user_1 = gets.chomp.to_i

    if @board[choice_user_1] == " "
    @board[choice_user_1] = @user_1
    @board << @user_1
    aff_tab
    i +=1


    puts " #{@user_name_2} choisis un numéro entre 1 et 8 pour placer ton symbole "
    choice_user_2 = gets.chomp.to_i

    if @board[choice_user_2] == " "
    @board[choice_user_2] = @user_2
    @board << @user_2
    aff_tab
    i +=1


  end
  end
end
end

play
##########################################################
def victory?
  #TO DO : qui gagne ?
  if  @board[0] = @board[1] = @board[2] = @user_1 ||
      @board[3] = @board[4] = @board[5] = @user_1 ||
      @board[6] = @board[7] = @board[8] = @user_1 ||
      @board[0] = @board[3] = @board[6] = @user_1 ||
      @board[1] = @board[4] = @board[7] = @user_1 ||
      @board[2] = @board[5] = @board[8] = @user_1 ||
      @board[0] = @board[4] = @board[8] = @user_1 ||
      @board[2] = @board[4] = @board[6] = @user_1
      puts "Bravo #{@user_name_1}, TU AS GAGNE!!!"
  elsif
      @board[0] = @board[1] = @board[2] = @user_2 ||
      @board[3] = @board[4] = @board[5] = @user_2 ||
      @board[6] = @board[7] = @board[8] = @user_2 ||
      @board[0] = @board[3] = @board[6] = @user_2 ||
      @board[1] = @board[4] = @board[7] = @user_2 ||
      @board[2] = @board[5] = @board[8] = @user_2 ||
      @board[0] = @board[4] = @board[8] = @user_2 ||
      @board[2] = @board[4] = @board[6] = @user_2
      puts "Bravo #{@user_name_2}, TU AS GAGNE!!!"
  end

end
victory?
