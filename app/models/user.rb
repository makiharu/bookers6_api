class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy

  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image, destroy: false

   validates :name, presence: true, length: {maximum: 20, minimum: 2}
   validates :introduction, length: { maximum: 50}
end


