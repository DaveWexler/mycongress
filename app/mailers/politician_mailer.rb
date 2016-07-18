class PoliticianMailer < ApplicationMailer
	default from: "mycongressdefaultmailer@gmail.com"

	def send_email(message)
		@message = message
		email = User.find(@message.user_id).email
		mail(to: email, subject: 'Message from MyCongress')
	end
end
