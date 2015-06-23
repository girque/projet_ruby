class ExampleMailer < ActionMailer::Base
  require 'net/smtp'

  def sample_email

    print "start"

    message = <<EOF
From: SENDER <FROM@gmail.com>
To: RECEIVER <TO@gmail.com>
Subject: SMTP Test E-mail
This is a test message.
EOF
    begin
    smtp = Net::SMTP.new 'smtp.gmail.com', 587
    smtp.enable_starttls
    smtp.start('gmail.com', 'anas.bouzarouata@gmail.com', 'argetlam2', :login)
    smtp.send_message message, 'anas.bouzarouata@gmail.com', 'anas_yz@hotmail.fr'
    smtp.finish
    end
  rescue Exception => e
    print "Exception occured: " + e


  end
  end