class Store < ActiveRecord::Base
  belongs_to :actor
  has_many :books, :dependent => :destroy

  attr_accessible :sdescript, :id, :sname, :stype
end
