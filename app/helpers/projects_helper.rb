module ProjectsHelper
  def iterrate_tasks(tasks, level=0, &block)
    tasks.each do |task|
      yield(task, level)
      if task.children
        iterrate_tasks(task.children, level+1, &block)
      end
    end
  end
end
