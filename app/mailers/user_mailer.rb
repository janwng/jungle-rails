class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order, user)
    @order = order
    if user
      mail(to: user.email, subject: "Email Receipt For Jungle Order Number #{order.id}")
    end
  end
end
