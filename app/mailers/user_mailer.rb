class UserMailer < ApplicationMailer

  default form: 'tasleaf@example.com'

  def cammon_email
    @user =params[:user]
    @url = https://polar-ridge-80325.herokuapp.com/login
    mail(to:@user.email, subject: '新規登録頂きありがとうございます。')
  end
end
