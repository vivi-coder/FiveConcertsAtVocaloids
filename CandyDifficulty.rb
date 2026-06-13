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
listofcommands = "signaldisruptor, camera1, banana, camera2, orange, checkleftdoor, checkrightdoor, checkstage, doorbuttonr, doorbuttonl, curtains, quit"
randomsignaltext = ["You feel something in the WiFi \n", "A Sound is playing in the WiFi \n", "*Ding* The WiFi makes \n"]
game_over = false

# Vocaloids state
vocaloids = {
  "Miku" => {"InSignal?" => false},
  "Len" => {"InCamera1?" => false},
  "Rin" => {"InCamera2?" => false},
  "Kaito" => {"IsAtLeftDoor?" => false},
  "Meiko" => {"IsAtRightDoor?" => false},
  "Luka" => {"IsAtStageCurtains?" => false}
}

# Start
puts "Phone Guy: 'Heya! Names Vivi, Welcome to the backstage where you'll be sitting'"
sleep(1)
puts "Vivi: 'Okay so to make this quick i'll leave a list of commands and how to fend them off'"
sleep(1)
puts "Vivi: 'There is no other night since this is just a prototype'"
sleep(1)
puts "Vivi: 'Have fun~'"

# Miku Thread
Thread.new do
  loop do
    break if game_over
    wait_time_miku = [17, 23, 25].sample
    sleep(wait_time_miku) 
    vocaloids["Miku"]["InSignal?"] = true
    puts randomsignaltext.sample
    puts "INSERT COMMAND"
    
    # Give player 20 seconds to use signaldisruptor
    elapsed_miku = 0
    while elapsed_miku < 70
      sleep(0.1)
      elapsed_miku += 0.1
      if vocaloids["Miku"]["InSignal?"] == false
        break
      end
    end
    
    # If InSignal? is still true after 20 seconds, game over
    if vocaloids["Miku"]["InSignal?"] == true
      puts "GAME OVER, You Died by Miku, Try Using The Signal Disruptor Next time (signaldisruptor)"
      game_over = true
      break
    end
  end
end

# Len Thread
Thread.new do
  loop do
    break if game_over
    wait_time_len = [40, 35, 29].sample
    sleep(wait_time_len)
    vocaloids["Len"]["InCamera1?"] = true
    elapsed_len = 0
    while elapsed_len < 82
      sleep(0.1)
      elapsed_len += 0.1
      if vocaloids["Len"]["InCamera1?"] == false
        break
      end
    end

    if vocaloids["Len"]["InCamera1?"] == true
      puts "GAME OVER, You Died by Len, Try checking camera 1 and give him the banana! (camera1 banana)"
      game_over = true
    end
  end
end

# Rin Thread
Thread.new do
  loop do
    break if game_over
    wait_time_rin = [55, 38, 53].sample
    sleep(wait_time_rin)
    vocaloids["Rin"]["InCamera2?"] = true 
    elapsed_rin = 0
    while elapsed_rin < 68
      sleep(0.1)
      elapsed_rin += 0.1
      if vocaloids["Rin"]["InCamera2?"] == false
      end
    end

    if vocaloids["Rin"]["InCamera2?"] == true
      puts "GAME OVER, You Died by Rin, Try checking camera 2 and give her the orange! (camera2 orange)"
      game_over = true
      break
    end
  end
end

# Kaito Thread
Thread.new do
  loop do
    break if game_over
    wait_time_kaito = [44, 33, 40].sample
    sleep(wait_time_kaito)
    vocaloids["Kaito"]["IsAtLeftDoor?"] = true
    elapsed_kaito = 0
    while elapsed_kaito < 50
      sleep(0.1)
      elapsed_kaito += 0.1
      if vocaloids["Kaito"]["IsAtLeftDoor?"] == false
      end
    end

    if vocaloids["Kaito"]["IsAtLeftDoor?"] == true
      puts "GAME OVER, You Died by Kaito, Try checking the left door and close it on his face! (checkleftdoor, doorbuttonl)"
      game_over = true
      break
    end
  end
end

# Meiko Thread
Thread.new do
  loop do
    break if game_over
    wait_time_meiko = [39, 29, 30].sample
    sleep(wait_time_meiko)
    vocaloids["Meiko"]["IsAtRightDoor?"] = true
    elapsed_meiko = 0
    while elapsed_meiko < 64
      sleep(0.1)
      elapsed_meiko += 0.1
      if vocaloids["Meiko"]["IsAtRightDoor?"] == false
      end
    end

    if vocaloids["Meiko"]["IsAtRightDoor?"] == true
      puts "GAME OVER, You Died by Meiko, Try checking the right door next time and close it! (checkrightdoor, doorbuttonr)"
      game_over = true
      break
    end
  end
end

# Luka Thread
Thread.new do
  loop do
    break if game_over
    wait_time_luka = [49, 39, 43].sample
    sleep(wait_time_luka)
    vocaloids["Luka"]["IsAtStageCurtains?"] = true
    elapsed_luka = 0
    while elapsed_luka < 33
      sleep(0.1)
      elapsed_luka += 0.1
      if vocaloids["Luka"]["IsAtStageCurtains?"] == false
      end
    end

    if vocaloids["Luka"]["IsAtStageCurtains?"] == true
      puts "GAME OVER, You Died by Luka, Try checking the stage curtains next time and close them! (checkstage, curtains)"
      game_over = true
      break
    end
  end
end

# User Commands
loop do
  break if game_over
  
  puts "INSERT COMMAND"
  user_input = gets.chomp
  
  if user_input == "help"
    puts "Commands: #{listofcommands}"
  elsif user_input == "checkrightdoor"
    if vocaloids["Meiko"]["IsAtRightDoor?"] == true
    puts "You feel something is there"
    elsif vocaloids["Meiko"]["IsAtRightDoor?"] == false
    puts "Theres nothing.."
    end
  elsif user_input == "checkleftdoor"
    if vocaloids["Kaito"]["IsAtLeftDoor?"] == true
    puts "You see 2 blue eyes"
    elsif vocaloids["Kaito"]["IsAtLeftDoor?"] == false
    puts "The other side of the door is dark.."
    end
  elsif user_input == "checkstage"
    if vocaloids["Luka"]["IsAtStageCurtains?"] == true
    puts "You see someone but its too blury"
    elsif vocaloids["Luka"]["IsAtStageCurtains?"] == false
    puts "You see the seats but only silence.."
    end
  elsif user_input == "signaldisruptor"
    puts "Disrupting WiFi signals..."
    vocaloids["Miku"]["InSignal?"] = false
  elsif user_input == "camera1"
    if vocaloids["Len"]["InCamera1?"] == true
      puts "You see Len standing there"
    elsif vocaloids["Len"]["InCamera1?"] == false
      puts "The room is empty.."
    end
  elsif user_input == "camera2"
    if vocaloids["Rin"]["InCamera2?"] == true
      puts "You see Rin waving at you.."
    elsif vocaloids["Rin"]["InCamera2?"] == false
      puts "You see nothing there.."
    end
  elsif user_input == "doorbuttonr"
    puts "You close the right door.."
    vocaloids["Meiko"]["IsAtRightDoor?"] = false
  elsif user_input == "doorbuttonl"
    puts "You close the left door.."
    vocaloids["Kaito"]["IsAtLeftDoor?"] = false
  elsif user_input == "banana"
    puts "Giving Len a banana..."
    vocaloids["Len"]["InCamera1?"] = false
  elsif user_input == "orange"
    puts "Giving Rin a orange..."
    vocaloids["Rin"]["InCamera2?"] = false
  elsif user_input == "curtains"
    puts "You click the lever to close the stage curtains"
    vocaloids["Luka"]["IsAtStageCurtains?"] = false
  elsif user_input == "quit"
    puts "ENDING JOB EARLY.."
    game_over = true
    break
  end
end
