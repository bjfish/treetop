require 'rubygems'
require 'spec/runner'

dir = File.dirname(__FILE__)
require "#{dir}/../spec_helper"

context "A character class with the range A-Z" do
  setup do
    @char_class = CharacterClass.new('A-Z')
  end
  
  specify "matches single characters within that range" do
    @char_class.parse_at('A', 0, mock("parser")).should_be_success
    @char_class.parse_at('N', 0, mock("parser")).should_be_success
    @char_class.parse_at('Z', 0, mock("parser")).should_be_success    
  end
  
  specify "does not match single characters outside of that range" do
    @char_class.parse_at('8', 0, mock("parser")).should_be_failure
    @char_class.parse_at('a', 0, mock("parser")).should_be_failure    
  end
  
  specify "has a string representation" do
    @char_class.to_s.should == '[A-Z]'
  end
  
end