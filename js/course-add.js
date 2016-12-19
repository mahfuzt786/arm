$(document).ready(function () {
    $('input:radio[name=course_category]').click(function () {
        //alert($('input:radio[name=course_category]:checked').val());
        if ($('input:radio[name=course_category]:checked').val() === 'c') {
            $('#fee-structure').show();
        } else {
            $('#fee-structure').hide();
        }
    });
    $('#course_fee,#course_duration').keyup(function () {
        if (!this.value.match(/^([0-9]{0,10})$/)) {
            this.value = this.value.replace(/[^0-9]/g, '').substring(0, 10);
        }
    });
    $('#course_name').focus();
    function clear() {
        $('#fee-structure').hide();
        $('#course_name').val('');
        $('input:radio[name=course_category]').attr('checked', false);
        $('#course_fee').val('');
        $('#course_duration').val('');
    }
    $('#btn-course-clear').click(function () {
        clear();
    });
    function checkDuplicate() {
        $.ajax({
            url: "includes/course_add.php",
            type: "POST",
            data: {
                action: 'checkCourseName',
                coursename: $('#course_name').val()
            },
            success: function (result) {
                if (result == 0) {

                    Lobibox.alert("error",
                            {
                                msg: 'Course Name "' + $('#course_name').val().toUpperCase() + '" already taken'
                            });
                    $('#course_name').val('');
                }
            }
        });
    }
    $('#course_name').focusout(function () {
        checkDuplicate();
    });
    $('#btn-course-add').on('click', function (e) {
        e.preventDefault();
        course_add();
    });
    function course_add() {
        if ($('#course_name').val() == "") {
            Lobibox.alert("error",
                    {
                        msg: 'Please enter course name !!'
                    });
        } else if (!$('input:radio[name=course_category]').is(':checked')) {
            Lobibox.alert("error",
                    {
                        msg: 'Please select a course category !!'
                    });
        } else if (($('input:radio[name=course_category]:checked').val() == 'c') && ($('#course_fee').val() == "")) {
            Lobibox.alert("error",
                    {
                        msg: 'Please enter course fee !!'
                    });
        } else if (($('input:radio[name=course_category]:checked').val() == 'c') && ($('#course_duration').val() == "")) {
            Lobibox.alert("error",
                    {
                        msg: 'Please enter course duration !!'
                    });
        } else {
            var cat = $('input:radio[name=course_category]:checked').val();
            var name = $('#course_name').val();
            $.ajax({
                url: "includes/course_add.php",
                type: "POST",
                data: {
                    action: 'courseAdd',
                    coursename: $('#course_name').val(),
                    coursecategory: $('input:radio[name=course_category]:checked').val(),
                    coursefee: $('#course_fee').val(),
                    courseduration: $('#course_duration').val(),
                },
                success: function (result) {
                    //alert(result);
                    if (result == 0) {
                        Lobibox.alert("success",
                                {
                                    msg: 'Course Name "' + $('#course_name').val().toUpperCase() + '" successfully added . Please add Subjects.',
                                    callback: function ($this, type, ev) {
                                        if (type == 'ok') {
                                            //alert(type);
                                            location.replace('subject.php?c=' + cat + '&n=' + name);
                                        }
                                    }
                                });
                    } else {
                        Lobibox.alert("error",
                                {
                                    msg: result
                                });
                    }
                }
            });
        }
    }
});

