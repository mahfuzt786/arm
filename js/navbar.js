$(document).ready(function() {
    //menu item active
    var pathname = window.location.href;
	    
    if (pathname.toLowerCase().indexOf("home") >= 0)
    {
        homeHigh();
    }
    if (pathname.toLowerCase().indexOf("course") >= 0)
    {
        courseHigh();
    }
    if (pathname.toLowerCase().indexOf("subject") >= 0)
    {
        subjectHigh();
    }
    if (pathname.toLowerCase().indexOf("setting") >= 0)
    {
        settingHigh();
    }    
    function homeHigh()
    {
        $('#menu ul li.listHome').addClass('active');
        $('#menu ul li.listCourse').removeClass('active');
        $('#menu ul li.listSubject').removeClass('active');
        $('#menu ul li.listSetting').removeClass('active');
    }
    function courseHigh()
    {
        $('#menu ul li.listHome').removeClass('active');
        $('#menu ul li.listCourse').addClass('active');
        $('#menu ul li.listSubject').removeClass('active');
        $('#menu ul li.listSetting').removeClass('active');
    }
    function subjectHigh()
    {
        $('#menu ul li.listHome').removeClass('active');
        $('#menu ul li.listCourse').removeClass('active');
        $('#menu ul li.listSubject').addClass('active');
        $('#menu ul li.listSetting').removeClass('active');
    }
    function settingHigh()
    {
        $('#menu ul li.listHome').removeClass('active');
        $('#menu ul li.listEvent').removeClass('active');
        $('#menu ul li.listHouse').removeClass('active');
        $('#menu ul li.listJob').removeClass('active');
        $('#menu ul li.listPromote').removeClass('active');
        $('#menu ul li.listSetting').addClass('active');
    }
});