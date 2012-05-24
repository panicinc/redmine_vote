require 'redmine'
require_dependency 'issues_controller' 

class IssuesController < ApplicationController
  skip_before_filter :authorize, :only => [:vote]

# This needs to be commented out or else I get a 403 error in our installation
#  before_filter :authorize, :except => [ :vote ]

  unloadable

  def vote
    find_issue
    authorize
    @issue.vote(params[:vote] == "up" ? :up : :down)
    @issue.save
    redirect_to :controller => 'issues', :action => 'show', :id => @issue
  end
end  