class MyBlogController < ApplicationController

  def index
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    #ActionMailer::Base.mail(:from => @email,
    #    :to => 'yves.loiseau@videotron.ca',
    #    :subject => "A new contact form message from #{@name}",
    #    :body => @message).deliver_now
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  private
  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer || '').path
    @back_url = session[:my_previous_url]
  end

end
