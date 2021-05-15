class TaskPolicy < ApplicationPolicy
  attr_reader :project, :task

  def initialize(project, task)
    @task = task
    @project = @task.project

  end

  def show?
    task.project == project
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
