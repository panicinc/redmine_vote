require File.join(File.dirname(__FILE__), '../app/models/vote')
require 'acts_as_voteable'

Issue.class_eval do
  acts_as_voteable
end
