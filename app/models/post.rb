class Post < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "50x50>" }, default_url: "no-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.Search(search)
  	if search && search != ''
  		where(["title LIKE ?", "%#{search}%"])
  	else
  		all.order("created_at DESC")
  	end
  end

  belongs_to :user

  has_many :comments, dependent: :destroy

  acts_as_votable
  
end
