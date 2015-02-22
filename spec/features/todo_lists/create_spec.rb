require 'spec_helper'
describe "Creating todo lists" do

  def create_todo_list(options={})
    options[:title] ||= "My Todo list"
    options[:description] ||= "This is what I'm doing today"
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New Todo List")
    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Todo list"
  end

  it "redirects to the todo list index page on succes" do
    create_todo_list
    expect(page).to have_content("My Todo list")
  end


  it "displays an error when title has less than 3 characters" do
    create_todo_list title:"Hi"
    expect(page).to have_content("error")
  end
end