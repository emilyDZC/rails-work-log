class Goal
  include Mongoid::Document
  include Mongoid::Timestamps

  field :goal

  validates_presence_of :goal
end