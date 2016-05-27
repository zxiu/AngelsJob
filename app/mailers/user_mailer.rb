class UserMailer < ApplicationMailer
  # IP Address  209.61.151.224
  # SMTP Hostname  smtp.mailgun.org
  # Default SMTP Login  postmaster@sandbox18aac9bcc8a849a1b3e42c4e578dfa75.mailgun.org
  # Default Password  8ae19767a513b30ca5661967e667fa6a  Manage SMTP credentials
  # API Base URL  https://api.mailgun.net/v3/sandbox18aac9bcc8a849a1b3e42c4e578dfa75.mailgun.org
  # API Key  key-f2afa1e9b1bfec21fb43f43dfbbadf21
  def welcome_mail(user)
    puts("welcome_mail")
    @user = user
    @url = 'http://example.com/login'
    # delivery_options = { user_name: "postmaster@",
    #                     password: "8ae19767a513b30ca5661967e667fa6a",
    #                     address: "sandbox18aac9bcc8a849a1b3e42c4e578dfa75.mailgun.org" }
    mail(to: "xiuzhuo@outlook.com", subject: 'Welcome to My Awesome Site')

  end


end
