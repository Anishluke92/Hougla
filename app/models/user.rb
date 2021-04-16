class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, dependent: :destroy
  #has_many :tasks, through: :projects

  validates :name, :surname, presence: true
  def username
    return self.email.split("@")[0].capitalize
  end
end
