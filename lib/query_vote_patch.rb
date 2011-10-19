require_dependency 'query'

module QueryVotePatch
  def can_vote?(context = {})
    context[:project].module_enabled?('issue_voting') and User.current.allowed_to?(:view_votes, context[:project])
  end

  def self.included(base) # :nodoc:
    base.extend(ClassMethods)

#    base.send(:include, InstanceMethods)
    
    # Same as typing in the class 
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
#      if can_vote?
#      if Project.current.module_enabled?('issue_voting') and User.current._to?(:view_votes, Project.current)
        base.add_available_column(QueryColumn.new(:votes_value, :sortable => "#{Issue.table_name}.votes_value"))
#      end

#      alias_method :available_filters_before_question, :available_filters
#      alias_method :available_filters, :question_available_filters

#      alias_method :sql_for_field_before_question, :sql_for_field
#      alias_method :sql_for_field, :question_sql_for_field

    end

  end
  
  module ClassMethods
    unless Query.respond_to?(:available_columns=)
      # Setter for +available_columns+ that isn't provided by the core.
      def available_columns=(v)
        self.available_columns = (v)
      end
    end
    
    unless Query.respond_to?(:add_available_column)
      # Method to add a column to the +available_columns+ that isn't provided by the core.
      def add_available_column(column)
        self.available_columns << (column)
      end
    end
  
  end  
end

