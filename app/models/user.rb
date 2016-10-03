class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create do |user|
    UserNotifier.send_signup_email(user).deliver
  end

  ROLES = %w[admin staff member guest suspended banned]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def role?(role)
    raise 'Arguement must be a symbol!' unless role.is_a? Symbol

    self.role.to_sym == role.to_sym
  end

end
