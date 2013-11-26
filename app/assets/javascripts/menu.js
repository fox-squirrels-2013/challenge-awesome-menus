var Menu = {
  init: function() {
    $('a.new-menu').on('click', this.toggleMenuForm);
    $('form#new_menu').on('ajax:success', this.appendMenu);
    $('form#new_menu').on('ajax:error', this.appendErrors);
  },

  toggleMenuForm: function(e) {
    e.preventDefault();
    $('form#new_menu').toggleClass('hidden');
  },

  appendMenu: function(event, data, status, xhr) {
    $('ul.menus').append(data.menu_template);
    $('.description-link').unbind('click');
    MenuDetails.init()
  },

  appendErrors: function(event, xhr, status, error) {
    $('ul.menus').before($.parseJSON(xhr.responseText).error);
  },
}

var MenuDetails = {
  menuID: 0,
  init: function() {
    $('.description-link').on('click', function(){
      linkedMenu = $(this).closest('li').children().first('a').attr('href')
      MenuDetails.menuID = MenuDetails.getMenuID(linkedMenu)
    });
    $('.description-link').on('ajax:success', function(event, data, status, xhr){
      $("#menu-" + MenuDetails.menuID).append(data)
    })
  },

  getMenuID: function(linkedMenu) {
    var menuInformation = linkedMenu.split('/')
    var menuID = parseInt(menuInformation[menuInformation.length-1], 10)
    return menuID
  },

}

$(document).ready(function() {
  Menu.init();
  MenuDetails.init();
})
