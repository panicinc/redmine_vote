class IssuesVoteHook < Redmine::Hook::ViewListener
  render_on(:view_issues_show_details_bottom, :partial => 'hooks/votes_view_issue', :layout => false)
end
