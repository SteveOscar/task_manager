class Task
  attr_reader :title, :description, :id

  def initialize(data)
    @id = data["id"]
    @description = data["description"]
    @title = data["title"]
  end

  

end
