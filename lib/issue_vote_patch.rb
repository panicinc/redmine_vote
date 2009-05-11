require 'vote'
require 'acts_as_voteable'

module IssueVotePatch
  def self.included(base)
    base.class_eval do
      acts_as_voteable
    end
  end  
end

# 
# Issue.class_eval do
#   acts_as_voteable
# end