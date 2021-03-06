class UserMailer < ApplicationMailer
  default from: "loiseau.y@gmail.com"

  # For messages sent from the Contact form
  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => "yves.loiseau@videotron.ca",
        :subject => "A new Birdy's golf blog message from #{name}")
  end

  # For messages sent from the User sign-up form
  def welcome(user)
    @appname = "Birdy's golf blog"
    mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end

end
