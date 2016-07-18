class PoliticianMailer < ApplicationMailer
	default from: "mycongressdefaultmailer@gmail.com"

	def send_email(message)
		@message = message
		email = @message.user.email
		mail(to: email, subject: 'Message from MyCongress')
	end
end
