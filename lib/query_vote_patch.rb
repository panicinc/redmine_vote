require_dependency 'issue_query'

module QueryVotePatch
  def can_vote?(context = {})
    context[:project].module_enabled?('issue_voting') and User.current.allowed_to?(:view_votes, context[:project])
  end
end

IssueQuery.send :include, QueryVotePatch
IssueQuery.add_available_column(QueryColumn.new(:votes_value, :sortable => "#{Issue.table_name}.votes_value"))