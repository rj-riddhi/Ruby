
require 'mailtrap'
class ShowNotificationMailer < ApplicationMailer
    	# rails automatically call relavent view for this method from views dirctory 
	    def notification(show, user)
            @show = show
            @user = user
            response = mail(to: @user.email, subject: 'Show reminder')

puts response
           end
end
