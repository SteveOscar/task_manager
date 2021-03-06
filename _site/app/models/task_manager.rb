require 'models/task_manager'
require_relative 'task'

class TaskManager
  def self.database
    @database ||= YAML::Store.new("db/task_manager")
  end

  def self.create(task)
    database.transactions do
      database['tasks'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    end
  end

  def self.raw_tasks
   database.transaction do
     database['tasks'] || []
   end
 end

 def self.all
   raw_tasks.map { |data| Task.new(data) }
 end

end
