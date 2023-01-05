class TodoList
    def initialize
      @todos = []
    end
  
    def add(todo)
      @todos << todo
    end

    def incomplete
        pending_list = @todos.select { |todo| todo.done? == false }
        return pending_list
    end
  
    def complete
      completed_list = @todos.select { |todo| todo.done? }
      return completed_list
    end
  
    def give_up!
      @todos.each { |todo| todo.mark_done!}
      return @todos
    end
  end