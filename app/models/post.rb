class Post < ActiveRecord::Base
	custom_slugs_with(:title)

	has_many :comments, dependent: :destroy

	has_attached_file :photo,
                  :url  => "/assets/photo/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/photo/:id/:style/:basename.:extension"
  	

  	validates_attachment_content_type :photo, :content_type => /\Aimage/
end
