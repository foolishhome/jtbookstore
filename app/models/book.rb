class Book < ActiveRecord::Base
  belongs_to :store
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  attr_accessible :bdescript, :id, :bname, :bprice, :bpublication, :btype

  searchable do
    text :bname, :bdescript
  end
end
