require "08_todo_list"
require "08_todo"

RSpec.describe "TodoList intergration" do
    it "can add a todo to the list" do
        todo_list = TodoList.new
        todo = Todo.new("Buy milk")
        expect(todo_list.add(todo)).to eq [todo]
    end
    it "can return all incomplete todos" do
        todo_list = TodoList.new
        todo = Todo.new("Buy milk")
        todo_list.add(todo)
        expect(todo_list.incomplete).to eq [todo]
    end
    it "can return all completed todos" do
        todo_list = TodoList.new
        todo = Todo.new("Buy milk")
        todo_list.add(todo)
        todo.mark_done!
        expect(todo_list.complete).to eq [todo]
    end
    it "marks all todos as complete" do
        todo_list = TodoList.new
        todo = Todo.new("Buy milk")
        todo_2 = Todo.new("Buy bread")
        todo_3 = Todo.new("Buy cheese")
        todo_list.add(todo)
        todo_list.add(todo_2)
        todo_list.add(todo_3)
        expect(todo_list.give_up!). to eq [todo, todo_2, todo_3]
    end
end