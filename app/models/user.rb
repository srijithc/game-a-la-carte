class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, :confirmable

  has_one :personal_information, autosave: true
  has_many :quotes

  #
  # get_name
  #
  def get_name
    personal_information.name
  end

  #
  # get_age
  #
  def get_age
    personal_information.age
  end
end
