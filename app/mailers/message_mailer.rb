class MessageMailer < ApplicationMailer
	default from: "BLOG <no-reply@giedrius-blog.com>"
	default to: "Giedrius Rimkus <giedriusbox@gmail.com>"

	def new_message(message)
		@message = message

		mail subject: "Message from #{message.name}"
	end
end