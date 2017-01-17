class MessageMailer < ApplicationMailer
	default from: "Personal Blog <no-reply@giedriusblog.herokuapp.com>"
	default to: "Giedrius Rimkus <giedrius.rimkus.a@gmail.com>"

	def new_message(message)
		@message = message

		mail subject: "Personal Blog - Message from #{message.name}"
	end
end