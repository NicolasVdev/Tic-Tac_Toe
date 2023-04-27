class Board

  attr_accessor :board

  
  def initialize
    @board = []
    9.times do |i|
      @board << BoardCase.new("case#{i+1}").value
    end
  end


  def display_board
    puts " "* 21
    puts " "* 21 +"█████████████████████████████████".yellow
    puts " "* 21 +"█".yellow+"         █".yellow + "█".yellow+"         █".yellow + "█".yellow+"         █".yellow
    puts " "* 21 +"█".yellow+"    " +"#{@board[6]}"+"    ██".yellow+"    " +"#{@board[7]}"+"    ██".yellow+"    " +"#{@board[8]}"+"    █".yellow
    puts " "* 21 +"█".yellow+"       "+"7".yellow+" █".yellow + "█".yellow+"       "+"8".yellow+" █".yellow + "█".yellow+"       "+"9".yellow+" █".yellow
    puts " "* 21 +"█████████████████████████████████".yellow
    puts " "* 21 +"█".yellow+"         █".yellow + "█".yellow+"         █".yellow + "█".yellow+"         █".yellow
    puts " "* 21 +"█".yellow+"    " +"#{@board[3]}"+"    ██".yellow+"    " +"#{@board[4]}"+"    ██".yellow+"    " +"#{@board[5]}"+"    █".yellow
    puts " "* 21 +"█".yellow+"       "+"4".yellow+" █".yellow + "█".yellow+"       "+"5".yellow+" █".yellow + "█".yellow+"       "+"6".yellow+" █".yellow
    puts " "* 21 +"█████████████████████████████████".yellow
    puts " "* 21 +"█".yellow+"         █".yellow + "█".yellow+"         █".yellow + "█".yellow+"         █".yellow
    puts " "* 21 +"█".yellow+"    " +"#{@board[0]}"+"    ██".yellow+"    " +"#{@board[1]}"+"    ██".yellow+"    " +"#{@board[2]}"+"    █".yellow
    puts " "* 21 +"█".yellow+"       "+"1".yellow+" █".yellow + "█".yellow+"       "+"2".yellow+" █".yellow + "█".yellow+"       "+"3".yellow+" █".yellow
    puts " "* 21 +"█████████████████████████████████".yellow
    puts " "
  end


  def  play_turn(player)
    puts "A ton tour : #{player.name}, quel sera ton prochain moove ? Fais nous rêver !"
    print "> "
    case_number = gets.chomp.to_i
    if @board[(case_number-1)] == " "
      @board[(case_number-1)] = player.symbol
    else
      puts "On ne triche pas !"
      play_turn(player)
    end
  end


  def victory?
    if @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " "  || @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != " "  || @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != " "  || @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != " "  || @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != " "  || @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != " "  || @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != " "  || @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != " " 
      return true
    else
      return false
    end
  end 


end  