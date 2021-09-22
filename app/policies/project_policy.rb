class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def show?
  	project.user == user
  end

  def edit?
  	show?
  end

  def create?
  	show?
  end

  def update?
    show?
  end

  def destroy?
  	show?
  end

end
