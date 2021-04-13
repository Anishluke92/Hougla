class ProjectPolicy
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

  def destory?
  	show?
  end 

end