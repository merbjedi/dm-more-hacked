class MotorLaunch
  include DataMapper::Resource
  property :id, Integer, :serial => true
  property :name, String, :auto_validation => false
end

class BoatDock
  include DataMapper::Resource
  property :id, Integer, :serial => true
  property :name, String, :auto_validation => false, :default => "I'm a long string"
  validates_length :name, :min => 3
end

class Address
  include DataMapper::Resource
  property :id, Integer, :serial => true
  property :street, String, :auto_validation => false
  property :state, String, :auto_validation => false
  property :zip, String, :auto_validation => false
  validates_length :street, :min => 3, :message => "Street too short"
  validates_length :state, :min => 2, :message => "State too short", :allow_nil => true
  validates_length :zip, :min => 5, :message => "Zip too short", :allow_blank => true
end