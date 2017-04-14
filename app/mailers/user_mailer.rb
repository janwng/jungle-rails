class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order, user)
    @order = order
    mail(to: user.email, subject: 'Your Email Receipt')
  end
end
