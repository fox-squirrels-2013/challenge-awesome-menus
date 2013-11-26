class MenuItemsController < ApplicationController
  def index
    @menu = Menu.find(params[:menu_id])
    @menu_items = @menu.menu_items
    @menu_item = MenuItem.new
    render :text => render_to_string(:partial => "menu_details", locals: {menu: @menu, menu_item: @menu_item, menu_items: @menu_items})
  end

  def create
    @menu_item = MenuItem.new params[:menu_item]
    if @menu_item.save
      render :json => { :menu_item_template => render_to_string(:partial => 'menu_item', :locals => {:menu_item => @menu_item}) }
    else
      render :json => {:error => @menu_item.errors.full_messages.join(", ")}, :status => :unprocessable_entity
    end
  end
end