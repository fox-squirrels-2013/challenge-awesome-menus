require 'spec_helper'
feature "Menu", :js => true do
  let!(:menu) { create :menu }
  before(:each) do
    visit root_path
  end
  context "index" do
    it "displays names of all menus" do
      expect(page).to have_content(menu.name)
    end
  end
  context "create menu" do
    it "appends the menu name to the list" do
      name = attributes_for(:menu)[:name]
      click_on "New Menu"
      fill_in "Name", :with => name
      click_on "Create Menu"
      expect(page).to have_content(name)
    end
    it "shows the errors if name is taken" do
      click_on "New Menu"
      fill_in "Name", :with => menu.name
      click_on "Create Menu"
      expect(page).to have_content("Name has already been taken")
    end
     it "shows the errors if name is blank" do
      click_on "New Menu"
      click_on "Create Menu"
      expect(page).to have_content("Name can't be blank")
    end
  end

  context "menu page" do
    it "takes you the menu page" do
      click_on menu.name
      expect(page).to have_content(menu.name)
      expect(page).to_not have_content("New Menu")
    end
  end
end
