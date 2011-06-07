class UserMailer < ActionMailer::Base
  default :from => "rfp@business.com"
  
  def reminder_chief(user)
    mail(:to => user.email,
         :subject => "RFP - Chief reminder")
  end
  
  def reminder(user)
    mail(:to => user.email,
         :subject => "RFP - Reminder")
  end
end
