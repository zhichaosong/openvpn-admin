/**
 * main
 * @author aierui github  https://github.com/Aierui
 * @version 1.0
 */
 
$(document).ready(function () {

    // Add body-small class if window less than 768px
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }

    // MetsiMenu
    $('#side-menu').metisMenu();

    // Collapse ibox function
    $('.collapse-link').click(function () {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.find('div.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });

    // Close ibox function
    $('.close-link').click(function () {
        var content = $(this).closest('div.ibox');
        content.remove();
    });

    // Close menu in canvas mode
    $('.close-canvas-menu').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });

    // Open close right sidebar
    $('.right-sidebar-toggle').click(function () {
        $('#right-sidebar').toggleClass('sidebar-open');
    });

    // Initialize slimscroll for right sidebar
    $('.sidebar-container').slimScroll({
        height: '100%',
        railOpacity: 0.4,
        wheelStep: 10
    });

    // Open close small chat
    $('.open-small-chat').click(function () {
        $(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
        $('.small-chat-box').toggleClass('active');
    });

    // Initialize slimscroll for small chat
    $('.small-chat-box .content').slimScroll({
        height: '234px',
        railOpacity: 0.4
    });

    // Small todo handler
    $('.check-link').click(function () {
        var button = $(this).find('i');
        var label = $(this).next('span');
        button.toggleClass('fa-check-square').toggleClass('fa-square-o');
        label.toggleClass('todo-completed');
        return false;
    });

    // Append config box / Only for demo purpose
    // Uncomment on server mode to enable XHR calls
    //$.get("skin-config.html", function (data) {
    //    if (!$('body').hasClass('no-skin-config'))
    //        $('body').append(data);
    //});

    // Minimalize menu
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();

    });

    // Tooltips demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    });

    // Move modal to body
    // Fix Bootstrap backdrop issu with animation.css
    $('.modal').appendTo("body");

    // Full height of sidebar
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");

        var navbarHeigh = $('nav.navbar-default').height();
        var wrapperHeigh = $('#page-wrapper').height();

        if (navbarHeigh > wrapperHeigh) {
            $('#page-wrapper').css("min-height", navbarHeigh + "px");
        }

        if (navbarHeigh < wrapperHeigh) {
            $('#page-wrapper').css("min-height", $(window).height() + "px");
        }

        if ($('body').hasClass('fixed-nav')) {
            $('#page-wrapper').css("min-height", $(window).height() - 60 + "px");
        }

    }

    fix_height();

    // Fixed Sidebar
    $(window).bind("load", function () {
        if ($("body").hasClass('fixed-sidebar')) {
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });
        }
    });

    // Move right sidebar top after scroll
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });

    $(window).bind("load resize scroll", function () {
        if (!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    $("[data-toggle=popover]")
        .popover();

    // Add slimscroll to element
    $('.full-height-scroll').slimscroll({
        height: '100%'
    })
});


// Minimalize menu when screen is less than 768px
$(window).bind("resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }
});

// Local Storage functions
// Set proper body class and plugins based on user configuration
$(document).ready(function () {
    // if (localStorageSupport) {

    //     var collapse = localStorage.getItem("collapse_menu");
    //     var fixedsidebar = localStorage.getItem("fixedsidebar");
    //     var fixednavbar = localStorage.getItem("fixednavbar");
    //     var boxedlayout = localStorage.getItem("boxedlayout");
    //     var fixedfooter = localStorage.getItem("fixedfooter");

    //     var body = $('body');

    //     if (fixedsidebar == 'on') {
    //         body.addClass('fixed-sidebar');
    //         $('.sidebar-collapse').slimScroll({
    //             height: '100%',
    //             railOpacity: 0.9
    //         });
    //     }

    //     if (collapse == 'on') {
    //         if (body.hasClass('fixed-sidebar')) {
    //             if (!body.hasClass('body-small')) {
    //                 body.addClass('mini-navbar');
    //             }
    //         } else {
    //             if (!body.hasClass('body-small')) {
    //                 body.addClass('mini-navbar');
    //             }

    //         }
    //     }

    //     if (fixednavbar == 'on') {
    //         $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
    //         body.addClass('fixed-nav');
    //     }

    //     if (boxedlayout == 'on') {
    //         body.addClass('boxed-layout');
    //     }

    //     if (fixedfooter == 'on') {
    //         $(".footer").addClass('fixed');
    //     }
    // }
});

// check if browser support HTML5 local storage
function localStorageSupport() {
    return (('localStorage' in window) && window['localStorage'] !== null)
}

// For demo purpose - animation css script
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //wait for animation to finish before removing classes
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
        // Hide menu in order to smoothly turn on when maximize menu
        $('#side-menu').hide();
        // For smoothly turn on menu
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 100);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 300);
    } else {
        // Remove all inline style from jquery fadeIn function to reset menu state
        $('#side-menu').removeAttr('style');
    }
}

// Dragable panels
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable(
        {
            handle: handle,
            connectWith: connect,
            tolerance: 'pointer',
            forcePlaceholderSize: true,
            opacity: 0.8
        })
        .disableSelection();
}

// 菜单选中样式添加
$(function () {

        // 匹配链接
        var url = (window.location.pathname).toLowerCase() //获取相对路径转为小写

        var tmp = url.replace('/','').replace('/','')
        var end = Number(tmp.indexOf('/'))
        var need = tmp.substr(0,end)
        var urlStatus = false;
        var menuObj = $("#side-menu > li:gt(0) a");
        
        //遍历所有菜单
        menuObj.each(function () {

            var href = $(this).attr('href')
            var menuTmp = href.replace('/','').replace('/','')
            var menuEnd = Number(menuTmp.indexOf('/'))
            var menuStr = menuTmp.substr(0,menuEnd)
            //判断当前菜单是否存在
            if(need.indexOf(menuStr) > -1 && menuStr != ''){
                $(this).parent().addClass('active');
                $(this).parent().parent().addClass('in');
                $(this).parent().parent().parent().addClass('active'); //针对有二级菜单选中的样式添
                urlStatus = true;
            }else{
                $(this).parent().removeClass('active');
            }
        });

        if(!urlStatus){
            menuObj.parent().eq(0).addClass('active');
        }

    win.start();
})


// 常用函数封装
window.win = {
    menuSelector: '',
    headerSelector: '',
    start: function() {
        this.globalAjax();
        this.init('body');
    },
    init: function(selector) {
        selector = $(selector);
        this.validate(selector.find('form[data-validate="true"]'));
        var $form = selector.find('form[data-submit="ajax"]');
        $form.each(function(i, item) {
            if ($form.eq(i).data('validate') == true) {
                return true;
            }
            $form.eq(i).on('submit', function() {
                $form.eq(i).ajaxSubmit();
                return false;
            });
        });
        selector.find('.btn-back').on('click', function() { 
        	win.back();
            return false; 
        });

        this.bootstrapTable(selector.find('table[data-toggle="table"]'));

    },
    empty: function(obj) {
        if (obj === undefined || obj === null || obj === '') {
            return true;
        }

        var type = typeof(obj);
        if (type === 'object') {
            for (var i in obj) {
                return false;
            }

            return true;
        }

        if (type === 'string' && $.trim(obj) === '') {
            return true;
        }

        return false;
    },
    redirect: function(url, time) {
        if (url == undefined || url == '') {
            return;
        }

        if (time == undefined) {
            window.location.href = url;
        } else {
            setTimeout(function() {
                window.location.href = url;
            }, time);
        }
    },
    modal: function(url) {
        $.ajax({
            url: url,
            dataType: 'html',
            success: function(html) {
                var $html = $('<div>' + html + '</div>');

                var $modal = $html.find('.modal:eq(0)');
                if ($modal.length == 0) {
                    alertMsg(html);
                    return;
                }

                $html.appendTo('body');
                win.init($html);
                $modal.modal().show();
                $modal.on('hide', function() {
                    $html.remove();
                });
            }
        });
    },
    back: function(steep) {
        location.href = document.referrer;
    },
    globalAjax: function() {
        $.ajaxSetup({
            waitting: false,
            $msg_box: null,
            beforeSend: function(XHR) {
                if ((this.type == 'POST' && this.waitting != false) || this.waitting != false) {
                    if (true == this.waitting || this.waitting == '') {
                        this.waitting = '请稍后...';
                    }
                    if (this.waitting != undefined) {
                        this.$msg_box = alertMsg(this.waitting, -1);
                    }
                }
                this.custom = {};
                this.custom.success = this.success;
                this.custom.error = this.error;
                this.custom.complete = this.complete;

                this.success = function(data, textStatus, jqXHR) {
                    var response_type = jqXHR.getResponseHeader("Content-Type");
                    if (this.dataType != 'json' && response_type != 'application/json; charset=utf-8') {
                        if (typeof this.custom.success == 'function') {
                            this.custom.success(data, textStatus, jqXHR);
                        }
                        return;
                    }

                    if (this.dataType != 'json' && response_type == 'application/json; charset=utf-8') {
                        data = $.parseJSON(data);
                    }

                    if (typeof data.msg == 'string' && data.msg != '') {
                        alertMsg(data.msg);
                    }

                    if (!win.empty(data.url)) {
                        return win.redirect(data.url, 2);
                    }

                    if (!win.empty(data.code)) {
                        if (data.code == 1) {
                            if (typeof this.custom.success == 'function') {
                                return this.custom.success(typeof data.msg == 'object' ? data.msg : {}, textStatus, jqXHR);
                            } else {
                                return;
                            }
                        } else if (data.code == 0) {
                            if (typeof this.custom.error == 'function') {
                                if (typeof data.msg == 'object') {
                                    alertMsg('操作失败！', 'warning');
                                    return this.custom.error(data.msg, textStatus, jqXHR);
                                } else {
                                    return this.custom.error({}, textStatus, jqXHR);
                                }
                            } else {
                                return;
                            }
                        }
                    } else if (typeof this.custom.success == 'function') {
                        this.custom.success(data, textStatus, jqXHR);
                    }
                };
                this.error = function(data, textStatus, jqXHR) {
                    if (typeof this.custom.error == 'function') {
                        this.custom.error({}, textStatus, jqXHR);
                    } else {
                        alertMsg('网络连接失败，请稍后再试！', 'error');
                    }
                };
                this.complete = function(XHR, TS) {
                    if (this.$msg_box != null) {
                        this.$msg_box.remove();
                    }
                    if (typeof this.custom.complete == 'function') {
                        this.custom.complete(XHR, TS);
                    }

                    if (typeof this.dialog == 'object') {
                        this.dialog.remove();
                    }
                };
            }
        });
    },
    getScript: function(url, fn) { // 下载js
        $.ajax({
            url: url,
            dataType: "script",
            cache: true,
            success: function(data, str) {
                if (typeof fn == 'function') {
                    fn();
                }
            }
        });
    },
    getStyle: function(url) { // 下载样式
        var style = $('link[href="' + url + '"]');
        if (style.length > 0) {
            return;
        }

        $('head').append('<link rel="stylesheet" href="' + url + '">');
    },
 
    validate: function(object) { // jquery.validate验证
        var $form = $(object);
        if ($form.length == 0) {
            return;
        }
        if (typeof $.fn.validate == 'undefined') {
            this.getScript('/static/admin/js/jquery.validate.min.js', function() {
                win.validate($form);
            });
            return;
        }
        zh_validator();
        $form.each(function(i, form) {
            $form.eq(i).validate({
                errorClass: "help-block",
                errorElement: "span",
                ignore: ".ignore",
                highlight: function(element, errorClass, validClass) {
                    var $element = $(element);
                    $element.parents('.form-group:eq(0)').addClass('has-error');
                    $element.parents('.form-group:eq(0)').removeClass('has-success');
                },
                unhighlight: function(element, errorClass, validClass) {
                    var $element = $(element);
                    if ($element.attr('aria-invalid') != true) {
                        $element.parents('.form-group:eq(0)').removeClass('has-error');
                        $element.parents('.form-group:eq(0)').addClass('has-success');
                    }
                },
                errorPlacement: function($error, $element) {
                    if ($element[0].tagName == 'SELECT' && $error.text() == '必须填写') {
                        $error.html('必须选择');
                    }
                    if (this.errorClass == 'help-block') {
                        $error.insertAfter($element.parent());
                    } else {
                        $error.appendTo($element.parent());
                    }
                },
                submitHandler: function() { 
                    var result = $form.eq(i).triggerHandler('valid');
                    if (result === false) {
                        return false;
                    }
                    if ($form.eq(i).data('submit') == 'ajax') {
                        $form.eq(i).ajaxSubmit();
                        return false;
                    }
                    return true;
                }
            });
        });
    },
    bootstrapTable: function(object) {
        var $table = $(object);
        if ($table.length == 0) {
            return;
        }

        if (typeof $.fn.bootstrapTable != 'function') {
            var $win = this;
            this.getStyle('/static/admin/css/bootstrap-table.css');
            this.getScript('/static/admin/js/bootstrap-table.js', function() {
                $win.bootstrapTable($table);
            });
            return;
        }

        zh_table();
        $table.bootstrapTable();
    },
};

/** */
function newId(length) {
    if (length == undefined) {
        length = 10;
    }
    var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var str = "";
    for (var i = 0; i < length; i++) {
        str += chars.substr(Math.ceil(Math.random() * chars.length), 1);
    }
    return str;
}

//jquery扩展ajax提交表单新方法
$.fn.ajaxSubmit = function() {
    var $form = this;
    var $submit = $form.find(':submit');
    $submit.attr('disabled', true).toggleClass('btn-primary');
    $.ajax({
        url: $form.attr('data-action'),
        type: $form.attr('data-method'),
        data: $form.serialize(),
        dataType: 'json',
        success: function(data, str) {

            $form.data('submited', true);
            var result = $form.triggerHandler('submited', [data, str]);
            if (result == false) {
                return false;
            }

            var form_success = $form.data('success');
            // 表单提交后操作
            if (!win.empty(data.url)) { // 跳转到其他页面
                win.redirect(data.url, 2000);
            } else if (data.continues) { // 继续填写表单
                alertConfirm({
                    okValue: '继续',
                    content: '是否继续填写？',
                    ok: function() {
                        form.reset();
                        $submit.removeAttr('disabled', false).toggleClass('btn-primary');
                        $form.find('.control-group').removeClass('success');
                    },
                    cancel: function() {
                        var $modal = $form.children('.modal');
                        if ($modal.length > 0) {
                            $modal.modal('hide');
                            $submit.removeAttr('disabled', false).toggleClass('btn-primary');
                            $form.find('.control-group').removeClass('success');
                        } else if (form_success == 'back') { // 返回上一页
                            win.back();
                        } else if (form_success == 'refresh') { // 刷新本页
                            window.location.reload();
                        } else {
                            $submit.removeAttr('disabled', false).toggleClass('btn-primary');
                            $form.find('.control-group').removeClass('success');
                        }

                        return false;
                    }
                });
            } else if (form_success == 'back') { // 返回上一页
                win.back(-1);
            } else if (form_success == 'refresh') { // 刷新本页
                window.location.reload();
            } else {
                var $modal = $form.children('.modal');
                if ($modal.length == 0) {
                    if ($form.hasClass('modal')) {
                        $modal = $form;
                    } else {
                        var $parent = $form.parent();

                        if ($parent.hasClass('modal')) {
                            $modal = $parent;
                        }
                    }
                }

                if ($modal.length > 0) {
                    $modal.modal('hide');
                }

                $submit.removeAttr('disabled', false).toggleClass('btn-primary');
                $form.find('.form-group').removeClass('success');

            }
        },
        error: function(data) {
            $submit.removeAttr('disabled', false).toggleClass('btn-primary');
        },
        complete: function(data) {}
    });
    return this;
};

//** 弹出提示信息 **//
function alertMsg(content, time) {
    var option = { title: false, content: '', time: 1.5, status: 'info' };
    if (typeof content == 'object') {
        option = $.extend(option, content);
    } else if (typeof content == "string") {
        option.content = content;
    }

    if (time != undefined && time != '' && !isNaN(time)) {
        option.time = time;
    } else if (typeof time == 'string' && (time == 'info' || time == 'success' || time == 'error' || time == 'warning')) {
        option.status = time;
    }

    var html = '<div id="msg_box_div" style="position:fixed;left:20%;right:20%; top: 65px;z-index:9999;text-align: center;-webkit-transition: opacity .3s linear,top .3s ease-out; -moz-transition: opacity .3s linear,top .3s ease-out;-o-transition: opacity .3s linear,top .3s ease-out;transition: opacity .3s linear,top .3s ease-out;">';
    html += '	<div class="alert alert-' + option.status + '" style="display:inline-block; padding:4px 20px 4px 20px;margin: 0;">';
    if (option.title != undefined && option.title !== false && option.title != '') {
        html += '		<h4>' + option.title + '</h4>';
    }
    html += '		' + option.content;
    html += '	</div>';
    html += '</div>';

    if (option.time > 0) {
        $('#msg_box_div').remove();
    }

    var $msg_box = $(html);
    $msg_box.appendTo('body');

    setTimeout(function() {
        $msg_box.css('top', '60px');
    }, 10);

    if (option.time > 0) {
        var timer = setTimeout(function() {
            $msg_box.remove();
        }, option.time * 1000 + 60);

        $('#msg_box_div').hover(function() {
            window.clearTimeout(timer);
        }, function() {
            timer = setTimeout(function() {
                $msg_box.remove();
            }, option.time * 1000 + 60);
        });
    }

    return $msg_box;
}

/** 弹出确认提示框 */
function alertConfirm(_option, ok) {
    if (typeof _option == 'string') {
        _option = { content: _option };
        if (typeof ok == 'function') {
            _option.ok = ok;
        }
    }

    option = jQuery.extend({
        title: '提示',
        content: '',
        okValue: '确定',
        ok: function() {},
        cancelValue: '取消',
        backdrop: $('body').find('.modal-backdrop').length == 0,
        cancel: function() {}
    }, _option);

    var html = '';
    html += '<div class="modal bs-example-modal-sm  fade" tabindex="-1" role="dialog"  aria-labelledby="mySmallModalLabel" aria-hidden="true">';
    html += '<div class="modal-dialog modal-sm">';
    html += '<div class="modal-content">';
    html += '	<div class="modal-header" style="padding: 5px 15px 5px;">';
    html += '		<button type="button" class="close" data-dismiss="modal">×</button>';
    html += '		<h3>' + option.title + '</h3>';
    html += ' 	</div>';
    html += '  <div class="modal-body" style="text-align:center;">' + option.content + '</div>';
    html += '  <div class="modal-footer">';
    html += '    <button class="btn" data-dismiss="modal">' + option.cancelValue + '</button>';
    html += '    <button class="btn btn-primary">' + option.okValue + '</button>';
    html += '  </div>';
    html += '  </div>';
    html += '  </div>';
    html += '</div>';

 

    var visibled_modal = $('.modal:visible');
    visibled_modal.hide();

    var mydialog = $(html);
    mydialog.appendTo('body');
    mydialog.modal({
        backdrop: option.backdrop
    }).show();

    //取消按钮
    mydialog.find('button[data-dismiss="modal"]').on('click', function() {
        var go = option.cancel();
        if (go != false) {
            visibled_modal.show();
        }
        setTimeout(function() {
            mydialog.remove();
        }, 600);
    });
    //确认按钮
    mydialog.find('.btn-primary').on('click', function() {
        option.ok();
        mydialog.modal('hide');
        visibled_modal.show();

        setTimeout(function() {
            mydialog.remove();
        }, 1000);
    });
}


/**
 * 页面加载完需要执行的程序
 * @param  func 函数体
 */
function addLoadEvent(func){
	var oldonload = window.onload;
	if(typeof window.onload != 'function'){
		window.onload = func;
	}else{
		window.onload = function(){
			oldonload()
			func();
		}
	}
}
