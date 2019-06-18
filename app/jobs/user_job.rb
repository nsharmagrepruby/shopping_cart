class UserJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.sample_email(user).deliver_later
  end
end
