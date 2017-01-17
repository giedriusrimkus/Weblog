class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@giedriusblog.herokuapp.com"
  layout 'mailer'
end
