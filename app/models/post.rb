class Post < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  	def self.Search(search)
  		if search && search != ''
  			where(["title LIKE ?", "%#{search}%"])
  		else
  			all.order("created_at DESC")
  		end
  	end

  	belongs_to :user
end
