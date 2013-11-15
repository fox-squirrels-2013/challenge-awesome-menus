require 'spec_helper'
describe MenusController do
  let(:menu) { create :menu }
  context "#index" do
    it "assigns a collection of all menus" do
      get :index
      expect(assigns(:menus)).to eq Menu.all
    end
    it "assigns a new menu object" do
      get :index
      expect(assigns(:menu)).to be_a_new(Menu)
    end
  end

  context "#show" do
    it "assigns the menu by params id" do
      get :show, :id => menu.id
      expect(assigns(:menu)).to eq menu
    end
  end

  context "#create" do
    let(:existing_name) { existing_name = menu.name }
    it "creates a menu with valid attributes" do
      expect {
        post :create, :menu => attributes_for(:menu)
      }.to change { Menu.count }.by(1)
    end
    it "doesn't create a menu with invalid attributes" do
      expect {
        post :create, :menu => {:name => existing_name}
      }.to change { Menu.count }.by(1)
    end
  end
end
