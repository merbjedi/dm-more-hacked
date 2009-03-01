require 'pathname'
__dir__ = Pathname(__FILE__).dirname.expand_path

# global first, then local to length validators
require __dir__.parent.parent + "spec_helper"
require __dir__ + 'spec_helper'

describe DataMapper::Validate::LengthValidator do
  it "passes if a default fulfills the requirements" do
    doc = BoatDock.new
    doc.should be_valid
  end

  it "does not pass if no value is set" do
    addr = Address.new
    addr.should_not be_valid
    addr.errors.on(:street).should include("Street too short")

    addr.street = "55 Sesame St"
    addr.should be_valid
  end

  it "passes if no value is set and :allow_nil is turned on" do
    addr = Address.new :street => "55 Sesame St"
    addr.should be_valid

    addr.state = ""
    addr.should_not be_valid
    addr.errors.on(:state).should include("State too short")
  end

  it "passes if value is blank and :allow_blank is turned on" do
    addr = Address.new :street => "55 Sesame St"
    addr.should be_valid

    addr.zip = ""
    addr.should be_valid
  end

end
