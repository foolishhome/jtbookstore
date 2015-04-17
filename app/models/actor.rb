class Actor < ActiveRecord::Base
  belongs_to :user
  has_many :stores, :dependent => :destroy

  attr_accessible :achievement, :devote, :id, :levels, :name, :points, :sex
end
