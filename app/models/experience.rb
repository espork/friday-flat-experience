class Experience < ActiveRecord::Base
  belongs_to :category
  has_many :programs
  belongs_to :location, :autosave =>  true
  
  accepts_nested_attributes_for :programs, reject_if: proc { |attributes| attributes['when'].blank? && attributes['what'].blank?  }, allow_destroy: true
  accepts_nested_attributes_for :location,reject_if: proc { |attributes| attributes.all? { |key, value| value.blank? } }, allow_destroy: true
  
  validates_presence_of :category
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :duration
  validates_presence_of :duration_type
  validates_presence_of :max_group_size

end
