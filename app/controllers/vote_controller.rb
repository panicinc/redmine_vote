require 'redmine'

class VoteController < IssuesController

  skip_before_filter :authorize, :only => [:up,:down]

  def up
    vote(:up)
  end

  def down
    vote(:down)
  end

  private
  def vote(type)
    find_issue
    authorize
    @issue.vote(type)
    @issue.save
    # TODO
    reset_invocation_response
    redirect_to :controller => 'issues', :action => 'show', :id => @issue
  end

  def reset_invocation_response
    self.instance_variable_set(:@_response_body, nil)
    response.instance_variable_set(
      :@header,
      Rack::Utils::HeaderHash.new("cookie" => [], 'Content-Type' => 'text/html'))
  end
end  
