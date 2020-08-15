class RestaurantOwnerNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @user = info[:user]
    @review = info[:review]
    @restaurant = info[:restaurant]

    mail(to: recipient, subject: "#{@user.email} has left a review")
  end
end
