
$(document).ready(function () {
    var Base64 = {_keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) {
            var t = "";
            var n, r, i, s, o, u, a;
            var f = 0;
            e = Base64._utf8_encode(e);
            while (f < e.length) {
                n = e.charCodeAt(f++);
                r = e.charCodeAt(f++);
                i = e.charCodeAt(f++);
                s = n >> 2;
                o = (n & 3) << 4 | r >> 4;
                u = (r & 15) << 2 | i >> 6;
                a = i & 63;
                if (isNaN(r)) {
                    u = a = 64
                } else if (isNaN(i)) {
                    a = 64
                }
                t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a)
            }
            return t
        }, decode: function (e) {
            var t = "";
            var n, r, i;
            var s, o, u, a;
            var f = 0;
            e = e.replace(/[^A-Za-z0-9\+\/\=]/g, "");
            while (f < e.length) {
                s = this._keyStr.indexOf(e.charAt(f++));
                o = this._keyStr.indexOf(e.charAt(f++));
                u = this._keyStr.indexOf(e.charAt(f++));
                a = this._keyStr.indexOf(e.charAt(f++));
                n = s << 2 | o >> 4;
                r = (o & 15) << 4 | u >> 2;
                i = (u & 3) << 6 | a;
                t = t + String.fromCharCode(n);
                if (u != 64) {
                    t = t + String.fromCharCode(r)
                }
                if (a != 64) {
                    t = t + String.fromCharCode(i)
                }
            }
            t = Base64._utf8_decode(t);
            return t
        }, _utf8_encode: function (e) {
            e = e.replace(/\r\n/g, "\n");
            var t = "";
            for (var n = 0; n < e.length; n++) {
                var r = e.charCodeAt(n);
                if (r < 128) {
                    t += String.fromCharCode(r)
                } else if (r > 127 && r < 2048) {
                    t += String.fromCharCode(r >> 6 | 192);
                    t += String.fromCharCode(r & 63 | 128)
                } else {
                    t += String.fromCharCode(r >> 12 | 224);
                    t += String.fromCharCode(r >> 6 & 63 | 128);
                    t += String.fromCharCode(r & 63 | 128)
                }
            }
            return t
        }, _utf8_decode: function (e) {
            var t = "";
            var n = 0;
            var r = c1 = c2 = 0;
            while (n < e.length) {
                r = e.charCodeAt(n);
                if (r < 128) {
                    t += String.fromCharCode(r);
                    n++
                } else if (r > 191 && r < 224) {
                    c2 = e.charCodeAt(n + 1);
                    t += String.fromCharCode((r & 31) << 6 | c2 & 63);
                    n += 2
                } else {
                    c2 = e.charCodeAt(n + 1);
                    c3 = e.charCodeAt(n + 2);
                    t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63);
                    n += 3
                }
            }
            return t
        }}


    var flag = 0;
    $('#add-icon').click(function () {
        $('#addSubject').show();
        $('#subject_name').hide();
        $('#control1').hide();
        $('#control3').show();
        $(".course").attr('disabled', true);
        $(".course").css('opacity', '.2');
        $('#subject-textbox').focus();
        $('#subject-textbox').val('');
        flag = 1;
    });
    $('#edit-icon').click(function () {
        if ($('#subject_name').val() == 'select') {
            Lobibox.alert("error",
                    {
                        msg: 'Please Select a Subject',
                        callback: function ($this, type, ev) {
                            if (type == 'ok') {
                                $('#subject_name').focus();
                            }
                        }
                    });
        } else {
            $('#addSubject').show();
            $('#subject_name').hide();
            $('#control1').hide();
            $('#control2').show();
            $(".course").attr('disabled', true);
            $(".course").css('opacity', '.2');
            $('#subject-textbox').focus();

            $('#subject-textbox').val($('#subject_name option:selected').text());
            $('#subject_id').val(Base64.encode($('#subject_name').val()));
        }
        flag = 0;
    });
    $('#remove-textbox').click(function () {
        $('#addSubject').hide();
        $('#subject_name').show();
        $('#control1').show();
        $('#control3').hide();
        $('#control2').hide();
        $(".course").attr('disabled', false);
        $(".course").css('opacity', '1');
        $('#subject-textbox').val('');
        flag = 0;
    });
    $('#btn-subject-name-add').click(function (e) {
        e.preventDefault();
        subject_master_add();
    });


    $('#btn-subject-name-update').click(function (e) {
        e.preventDefault();
        subject_master_update();
    });




    $('#btn-subject-name-delete').click(function (e) {
        e.preventDefault();
        subject_master_delete();
    });
    $('#subject-textbox').focusout(function () {
        if (flag == 1) {
            checkDuplicate();
        }
    });
    $('#subject_name').on('change', function () {
        if ($('subject_name').val() != 'select') {
            $('#subject_id').val($('subject_name').val());
        }
    });
    function subject_master_delete() {
        Lobibox.confirm({
            msg: "Are you sure you want to delete this Subject?",
            callback: function ($this, type, ev) {
                //Your code goes here
                if (type == 'yes') {
                    $.ajax({
                        url: "includes/subject_arm.php",
                        type: "POST",
                        data: {
                            action: 'subjectmasterdelete',
                            id: $('#subject_id').val()
                        },
                        success: function (result) {
                            if (result == 0) {
                                Lobibox.alert("success",
                                        {
                                            msg: 'Subject Successfully Deleted ',
                                            callback: function ($this, type, ev) {
                                                if (type == 'ok') {
                                                    location.replace(window.location.href);
                                                }
                                            }
                                        });
                                if ($('.lobibox'))
                                {
                                    $('.lobibox .lobibox-btn').focus();
                                }
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
    }
    function subject_master_add() {
        //alert('inside subject master');
        if ($('#subject-textbox').val() == "") {
            Lobibox.alert("error",
                    {
                        msg: 'Please enter subject name !!',
                        callback: function ($this, type, ev) {
                            if (type == 'ok') {
                                $('#subject-textbox').val('');
                                $('#subject-textbox').focus();
                            }
                        }
                    });
        } else {
            $.ajax({
                url: "includes/subject_arm.php",
                type: "POST",
                data: {
                    action: 'subjectmaster',
                    subjectname: $('#subject-textbox').val()
                },
                success: function (result) {
                    //alert(result);
                    if (result == 0) {
                        Lobibox.alert("success",
                                {
                                    msg: 'Subject Name "' + $('#subject-textbox').val().toUpperCase() + '" successfully added.',
                                    callback: function ($this, type, ev) {
                                        if (type == 'ok') {
                                            //alert(type);
                                            location.replace(window.location.href);
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
    function subject_master_update() {
        //alert('inside subject master');
        //alert(updateflag);
        if ($('#subject-textbox').val() == "") {
            Lobibox.alert("error",
                    {
                        msg: 'Please enter subject name !!',
                        callback: function ($this, type, ev) {
                            if (type == 'ok') {
                                $('#subject-textbox').val('');
                                $('#subject-textbox').focus();
                            }
                        }
                    });
        } else if ($('#subject-textbox').val() != "") {
            $.ajax({
                url: "includes/subject_arm.php",
                type: "POST",
                data: {
                    action: 'subjectmasterupdate',
                    subjectid: $('#subject_id').val(),
                    subjectname: $('#subject-textbox').val()
                },
                success: function (result) {
                    //alert(result);
                    if (result == 0) {
                        Lobibox.alert("success",
                                {
                                    msg: 'Subject Name successfully updated.',
                                    callback: function ($this, type, ev) {
                                        if (type == 'ok') {
                                            //alert(type);
                                            location.replace(window.location.href);
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



    function checkDuplicate() {
        $.ajax({
            url: "includes/subject_arm.php",
            type: "POST",
            data: {
                action: 'checkSubjectName',
                subjectname: $('#subject-textbox').val()
            },
            success: function (result) {
                if (result == 0) {
                    Lobibox.alert("error",
                            {
                                msg: 'Subject Name "' + $('#subject-textbox').val().toUpperCase() + '" already taken',
                                callback: function ($this, type, ev) {
                                    if (type == 'ok') {
                                        $('#subject-textbox').focus();
                                    }
                                }
                            });

                } 
            }
        });
    }
});


