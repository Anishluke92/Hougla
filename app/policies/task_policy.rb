class TaskPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def show?
    task.user == user
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
