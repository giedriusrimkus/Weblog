class MessageMailer < ApplicationMailer
	default from: "Giedrius BLOG <no-reply@giedrius-blog.com>"
	default to: "Giedrius Rimkus <giedrius.rimkus.a@gmail.com>"

	def new_message(message)
		@message = message

		mail subject: "Message from #{message.name}"
	end
end