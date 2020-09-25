class TrainingLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :skills, type: String
  field :date, type: Date, default: Date.today
  field :links, type: String
end