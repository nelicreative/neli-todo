class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :set_workspaces
  before_action :set_locale

  private

  def current_user
    @current_user = User.find_by(id: 2) || User.second # TODO handle it after implement login
  end

  def set_workspaces
    @workspaces = Workspace.all #just show for template
    # @workspaces = current_user.workspaces
  end

  def set_locale
    I18n.locale = :en
  end
end
