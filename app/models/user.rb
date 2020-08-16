class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable

  has_one :personal_information, autosave: true
  has_many :quotes

  accepts_nested_attributes_for :personal_information

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
