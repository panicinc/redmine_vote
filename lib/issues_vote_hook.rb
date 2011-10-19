class IssuesVoteHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_details_bottom, :partial => "vote_issue", :if => :can_vote?

private
  
  def can_vote?(context = {})
    context[:project].module_enabled?('issue_voting') and User.current.allowed_to?(:vote_issue, context[:project])
  end

end

