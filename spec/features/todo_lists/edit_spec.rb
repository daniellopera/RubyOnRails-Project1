require 'spec_helper'

describe "Editing todo lists" do
  let!(:todo_list){TodoList.create(title: "Groceries", description: "Grocery list.")}
  def update_todo_list(options={})
    options[:title] ||= "New Title"
    options[:description] ||="New Description"
    visit "/todo_lists"
    todo_list = options[:todo_list]
    within "#todo_list_#{todo_list.id}" do
      click_link "Edit"
    end
    fill_in "todo_list_title", with: options[:title]
    fill_in "todo_list_description", with: options[:description]
  end

  it "updates a todo list succesfully with new information" do
    update_todo_list title:"Updated Title", desctiption: "Updates Description", todo_list:todo_list
    click_button "Update Todo list"
    todo_list.reload
    expect(page).to have_content("Updated")
    expect(todo_list.title).to eq("Updated Title")
  end

end