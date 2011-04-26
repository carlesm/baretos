class Critic < ActiveRecord::Base
  validates_presence_of :nom
  
  has_many :resenyas
  has_many :restaurants, :through => :resenyas
end
