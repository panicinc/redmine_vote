require_dependency 'query'

module QueryVotePatch
  def can_vote?(context = {})
    context[:project].module_enabled?('issue_voting') and User.current.allowed_to?(:view_votes, context[:project])
  end

  def self.included(base)
    base.class_eval <<-END
      self.available_columns += [QueryColumn.new(:votes_value, :sortable => "#{Issue.table_name}.votes_value")]
END
  end
end

Query.send :include, QueryVotePatch
