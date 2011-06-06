class UserMailer < ActionMailer::Base
  default :from => "rfp@business.com"
  
  def reminder_chief
    mail(:to => 'aaristizaball@gmail.com',
         :subject => "RFP - Chief reminder")
  end
  
  def reminder
    mail(:to => 'aaristizaball@gmail.com',
         :subject => "RFP - Reminder")
  end
end
