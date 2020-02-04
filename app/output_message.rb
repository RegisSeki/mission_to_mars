class OutputMessage
  def send_message(message)
    puts "#{message} \n"
  end

  def send_message_exit(message)
    puts "#{message} \n"
    exit
  end
end
