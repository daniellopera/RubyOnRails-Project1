require 'spec_helper'
describe "Creating todo lists" do

  it "redirects to the todo list index page on succes" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New Todo List")
    fill_in "Title", with: "My Todo list"
    fill_in "Description", with: "This is what I'm doing today"
    click_button "Create Todo list"
    expect(page).to have_content("My Todo list")
  end


  it "displays an error when title has less than 3 characters" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New Todo List")
    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what I'm doing today"
    click_button "Create Todo list"
    expect(page).to have_content("error")
  end
end