class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :title
  field :body

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type: /image/
  # validates_attachment_presence :image, attachment_presence: true, on: :update
  validates_presence_of :title
  validates_presence_of :body
end