require 'redmine'
require 'dispatcher'
require 'issue_vote_patch'
require 'query_vote_patch'
Dispatcher.to_prepare do
  Issue.send(:include, IssueVotePatch)
  Query.send(:include, QueryVotePatch)
end

require_dependency 'issues_vote_hook'

Redmine::Plugin.register :redmine_vote do
  name 'Redmine Vote plugin'
  author 'Andrew Chaika'
  description 'This is a plugin for Redmine'
  version '0.0.2'
  project_module :issue_tracking do
    permission :issues_vote, {:issues => :vote}, :require => :loggedin
  end
end

class RedmineVoteListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag 'stylesheet', :plugin => 'redmine_vote' %>"
end 
