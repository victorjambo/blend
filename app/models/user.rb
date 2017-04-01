class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  
  has_attached_file :avi, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avi, content_type: /\Aimage\/.*\z/

  validates :user_name, presence: true
  
  has_many :comments, dependent: :destroy
end
