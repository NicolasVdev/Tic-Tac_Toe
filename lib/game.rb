class Game


  attr_accessor :board, :player1, :player2, :play_turn

  
  def initialize
    @players = []
    system("clear")
    puts " " * 18 + "Bienvenue dans ce jeu du morpion ! \n\n".bold.yellow
    puts " " * 7 + "Le principe est de faire une ligne de 3 symboles identiques.".bold.yellow
    puts "La sélection de la case à cocher se fait sur le principe du pavé numérique. \n\n".bold.yellow
    puts " " * 25 + "----+---+----"
    puts " " * 25 + "| 7 | 8 | 9 | <= exemple"
    puts " " * 25 + "----+---+----"
    puts " " * 25 + "| 4 | 5 | 6 |"
    puts " " * 25 + "----+---+----"
    puts " " * 25 + "| 1 | 2 | 3 |"
    puts " " * 25 + "----+---+---- \n\n"
    puts "Par exemple, pour sélectionner la case en haut à droite , il suffit de taper 9. \n\n".bold.yellow
    print " " * 8 + "Si vous êtes prêt, appuyer sur 'Entrée' pour continuer :".bold.yellow
    gets.chomp

    system("clear")
    sleep 0.5
    puts "   Joueur 1, Quel est ton pseudo ?"
    print "> "

    player_name = gets.chomp
    @player1 = Player.new(player_name, "X")
    @players << @player1
    @player1.symbol = "X".bold.red
    @current_player = @player1


    puts "Joueur 2, Quel est ton pseudo ?"
    print "> "

    player_name = gets.chomp
    @player2 = Player.new(player_name, "O")
    @players << @player2
    @player2.symbol = "O".bold.blue

    sleep 1
    puts "press enter for next étape du jeu" #TROLL
    gets.chomp
    system 'clear'"\n\n"
    puts "Le jeu commence dans 3.."
    sleep 1
    puts "2"
    sleep 1
    puts "1"
    sleep 1
    puts "0.5"
    sleep 1
    puts "0.25"
    sleep 3
    puts "0.01"
    sleep 2
    system 'clear'
    puts "Bienvenue " + player1.name + " et " + player2.name + " ! "
    sleep 1
    puts player1.name + " jouera avec les " + player1.symbol + " et " + player2.name + " jouera avec les " + player2.symbol + "."
    sleep 3

    @board = Board.new

  end

  def switch_player
    @players.rotate!
    @current_player = @players.first
  end


  def turn          
    9.times do 
      system 'clear'
      puts @board.display_board
      if @board.victory? == false
        puts @board.play_turn(@current_player)
        @board.display_board 
        switch_player
      else
        break
      end
    end            
    if @board.victory? == true
      switch_player
      puts "VICTOIRE DE #{@current_player.name} !"
      @current_player.score += 1
    else
      puts "EGALITE"
    end
  end   

  def again?
    puts "Voulez-vous refaire une partie? "
    puts "(y/n) tapez 'y' pour yes / tapez 'n' pour no"
    answer = gets.chomp.downcase
    puts "\n"
    if answer == "y"
      return true
    elsif answer == "n"
      return false
    else
      self.again?
    end
  end

  def result
    puts "Résulat de la partie"
    puts "#{player1.name} à gagné #{player1.score} partie(s)"
    puts "#{player2.name} à gagné #{player2.score} partie(s)"
    if player1.score > player2.score
      puts "Bravo #{player1.name} tu es le grand gagnant de ce jeu !"
    elsif player2.score > player1.score
      puts "Bravo #{player2.name} tu es le grand gagnant de ce jeu !"
    else 
      puts "Vous avez terminé à égalité, vous êtes nuls."
    end
  end


end