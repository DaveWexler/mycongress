class PoliticianMailer < ApplicationMailer
	default from: "mycongressdefaultmailer@gmail.com"

	def send_email(message)
		@message = message
		mail(to: User.find(@message.user_id).email, subject: 'Message from MyCongress')
	end
end
