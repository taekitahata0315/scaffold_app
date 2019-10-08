class TaskMailer < ApplicationMailer
default form: 'tasleaf@example.com'

 
  def creation_email(task)
    @task = task
    mail(
      subject: 'タスク作成完了メール',
      to: 'user@example.com',
      form: 'tasleaf@example.com'
    )
  end
end
