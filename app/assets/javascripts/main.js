$(function() {
  let tabs = $(".menu-item");
  function tabSwitch() {
    $('.active').removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".show-contents").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);    
});

$(function() {
  let followTabs = $(".menu-title");
  function tabSwitch() {
    $('.active-follow').removeClass("active-follow");
    $(this).addClass("active-follow");
    const index = followTabs.index(this);
    $(".list-content").removeClass("show-follow").eq(index).addClass("show-follow");
  }
  followTabs.click(tabSwitch);    
});

