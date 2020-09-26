class Resource
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :name, type: String
  field :link, type: String

  has_mongoid_attached_file :image,
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    }

  validates_attachment_content_type :image, content_type: /image/
end