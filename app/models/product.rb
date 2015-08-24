class Product < ActiveRecord::Base
	has_attached_file :photo,
                    :styles => { :thumb_small => "70x70#",:medium => "480x320#", :thumb => "100x100#", :small => "320x240#", :large => "640x480#" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/images/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/products/:id/:style/:basename.:extension"
  
    validates_attachment :photo, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}

    #config for search
    def self.search(query)
    	where("title like ?", "%#{query}%")
    end
end
