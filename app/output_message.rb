class OutputMessage
  def send_message(message)
    puts " #{message} \n"
  end

  def send_message_exit(message)
    puts " #{message} \n"
    exit
  end

  def send_message_clear(message)
    system("clear")
    puts " #{message} \n"
  end
end
