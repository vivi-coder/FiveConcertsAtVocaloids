=begin
  Okay so how this works
  Five Concerts At Vocaloids, known as FCAV is
  a game where you have to survive 5 concerts (but i like things that are infinite soo um its gonna be infinite nights at FCAV)
  Animatronics and how to defeat them
  miku  The lead of the vocaloids! To fend her off use the Signal Disruptor
  Len Funny banana boi! To fend him off just click the banana button, You'll know when to use it
  Rin Funny orange girl! To fend her off do the same by Len except do it by her
  Kaito, Luka and Meiko just close the door
=end

# Strings
listofcommands = "signaldisruptor, camera1, banana, camera2, orange, checkdoor, doorbutton, quit"
randomsignaltext = "You feel something in the WiFi \n", "A Sound is playing in the WiFi \n", "*Ding* The WiFi makes \n"
game_over = false

# Vocaloids state
vocaloids = {
  "Miku" => {"InSignal?" => false, "Speed" => 5},
  "Len" => {"InCamera1?" => false, "Banana" => false},
  "Rin" => {"InCamera2?" => false, "Orange" => false},
  "Kaito" => {"MoveCounter" => 3, "IsAtLeftDoor?" => false},
  "Meiko" => {"MoveCounter" => 5, "IsAtRightDoor?" => false},
  "Luka" => {"MoveCounter" => 4, "IsAtLeftDoor?" => false}
}

# Start
puts "Phone Guy: 'Heya! Names Vivi, Welcome to the backstage where you'll be sitting'"
sleep(1)
puts "Vivi: 'Okay so to make this quick i'll leave a list of commands and how to fend them off'"
sleep(1)
puts "Vivi: 'There is no other night since this is just a prototype'"
sleep(1)
puts "Vivi: 'Have fun~"

Thread.new do
 loop do
   wait_time = [8, 13, 15].sample
   sleep(wait_time) 
   vocaloids["Miku"]["InSignal?"] = true
   puts randomsignaltext.sample
   puts "INSERT COMMAND"
   # Give player 20 seconds to use signaldisruptor
   elapsed = 0
   while elapsed < 20
     sleep(0.1)
     elapsed += 0.1
     if vocaloids["Miku"]["InSignal?"] == false
     end
   end
   
   # If InSignal? is still true after 20 seconds, game over
   if vocaloids["Miku"]["InSignal?"] == true
     puts "GAME OVER, You Died by Miku, Try Using The Signal Disruptor Next time (signaldisruptor)"
      game_over = true
   end
 end
end

# User Comands
loop do
  puts "INSERT COMMAND"
  user_input = gets.chomp
  
  if user_input == "help"
    puts "Commands: #{listofcommands}"
  elsif user_input == "signaldisruptor"
    puts "Disrupting WiFi signals..."
    vocaloids["Miku"]["InSignal?"] = false
  elsif user_input == "quit"
    puts "ENDING JOB EARLY.."
    break
  elsif
    game_over == true
    break
  end
 end
