class MessagesController < ApplicationController
	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		# @message.subject = params[:message][:subject]
		# @message.content = params[:message][:content]
		@message.user_id = session[:user_id]
		@message.politician_id = request.referer[34..-1].to_i
		@message.save
		PoliticianMailer.send_email(@message).deliver
		redirect_to politician_path(Politician.find_by(id: @message.politician_id))
	end

	private

	def message_params
		 params.require(:message).permit(:subject, :content)
	end
end
