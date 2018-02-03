/**
 * GridView
 * @author aierui github  https://github.com/Aierui
 * @version 1.0
 */
$(function() {
    var GridView = function(el, option) {
        this.$table = $(el);
        if (this.$table.length == 0) {
            return;
        }
        this.$toolbar = $(this.$table.data('toolbar'));
        this.$form = this.$toolbar.find('.edit-form, .search-form');
        this.bootstrapTable = null;
        this.queryParams = null;
        this.currentRow = null;
        this.uniqueId = 'id';
        this.module = this.$toolbar.data('module');
        this.pagination = this.$table.data('pagination') == false ? false : true;
        this.sidePagination = this.$table.data('sidePagination') == 'server' ? 'server' : 'client';
        this.clientSort = this.$table.data('clientSort') == false ? false : true;
        this.pageSize = this.$table.data('pageSize') || 50;
        this.clickToSelect = this.$table.data('clickToSelect') == false ? false : true; //选中checkbox
        this.showRefresh = this.$table.data('showRefresh') == false ? false : true;
        this.$table.data('gridview', this);
        this.init();
    };

    GridView.prototype.init = function() {
        this.initTable();
        this.initForm();
        this.initToolbar();
    };

    GridView.prototype.initTable = function() {
        zh_table();
        var $this = this;
        $this.$table.bootstrapTable({
            striped: false, // 隔行换色
            uniqueId: 'id',
            showRefresh: $this.showRefresh,
            clientSort: $this.clientSort,
            pagination: $this.pagination,
            classes: 'table table-hover table-no-bordered',
            sidePagination: $this.sidePagination,
            pageSize: $this.pageSize,
            clickToSelect: $this.clickToSelect,
            columns: [],
            data: [],
            queryParams: function(params) {
                params = $.extend(params, $this.queryParams);

                if ($this.clientSort) {
                    delete params.sort;
                    delete params.order;
                }

                if ($this.pagination == 'client') {

                }
                return params;
            },
            onAll: function(name, args) {
                // $table.trigger('all', [name, args]);
                return false;
            },
            onClickCell: function(field, value, row, $element) {
                //$table.trigger('clickCell', [field, value, row, $element]);
                return false;
            },
            onDblClickCell: function(field, value, row, $element) {
                //$table.trigger('dblClickCell', [field, value, row, $element]);
                return false;
            },
            onClickRow: function(row, $element) {
                $element.addClass('info').siblings().removeClass('info');

                // var btnGroup = $element.parents('.bootstrap-table:eq(0)').find('#toolbar').find('.btn-group')
                $this.toggleCheckedClass()

                $this.currentRow = row;
            },
            onDblClickRow: function(item, $element) { //双击
                //$table.trigger('dblClickRow', [item, $element]);
                return false;
            },
            onSort: function(name, order) {
                //$table.triggerHandler('sort', [name, order]);
            },
            onCheck: function(row, $element) {

                var data = {
                    attr: ''
                }
                $this.toggleCheckedClass(data)
                // $this.$table.trigger('check', [row, $this]);
                return false;
            },
            onUncheck: function(row, $element) {

                var checked =  $this.getSelections()

                if (checked.length > 0) {
                    return
                }
               
                var data = {
                    attr: 'disabled'
                }
                $this.toggleCheckedClass(data)

                // $this.$table.trigger('uncheck', [row, $this]);
                return false;
            },
            onCheckAll: function(rows) {
                var data = {
                    attr: ''
                }
                $this.toggleCheckedClass(data)
                    //$table.trigger('checkAll', [rows]);
                return false;
            },
            onUncheckAll: function(rows) {
                var data = {
                    attr: 'disabled'
                }
                $this.toggleCheckedClass(data)

                //$table.trigger('uncheckAll', [rows]);
                return false;
            },
            onCheckSome: function(rows) {
                //$table.trigger('checkSome', [rows]);
                return false;
            },
            onUncheckSome: function(rows) {
                //$table.trigger('uncheckSome', [rows]);
                return false;
            },
            onLoadSuccess: function(data) {
                $this.resetView();
            },
            onLoadError: function(status) {
                //$table.trigger('loadError', [status]);
                return false;
            },
            onColumnSwitch: function(field, checked) {
                //$table.trigger('columnSwitch', [field, checked]);
                return false;
            },
            onPageChange: function(number, size) {
                //$table.trigger('pageChange', [number, size]);
                return false;
            },
            onSearch: function(text) {
                //$table.trigger('search', [text]);
                return false;
            },
            onToggle: function(cardView) {
                //$table.trigger('toggle', [cardView]);
                return false;
            },
            onPreBody: function(data) {
                //$table.trigger('preBody', [data]);
                return false;
            },
            onPostBody: function() {
                //$table.trigger('postBody');
                return false;
            },
            onPostHeader: function() {
                //$table.trigger('postHeader');
                return false;
            },
            onExpandRow: function(index, row, $detail) {
                //$table.trigger('expandRow', [index, row, $detail]);
                return false;
            },
            onCollapseRow: function(index, row) {
                //$table.trigger('collapseRow', [index, row]);
                return false;
            },
            onRefreshOptions: function() {}
        });

        $this.bootstrapTable = $this.$table.data('bootstrap.table');
        $this.resetView();

        //改变窗口大小时调用该函数
        $(window).resize(function() {
            $this.resetView();
        });

        $this.uniqueId = $this.bootstrapTable.options.uniqueId;
    };

    GridView.prototype.initForm = function() {
        var $this = this;
        if ($this.$form.length == 0) {
            return;
        }
        if (typeof $.fn.validate == 'undefined') {
            win.getScript('/js/admin/jquery.validate.min.js', function() {
                $this.initForm();
            });
            return;
        }
        zh_validator();
        $this.$form.validate({
            errorClass: "help-block",
            errorElement: "span",
            ignore: ".ignore",
            onfocusout: false,
            onkeyup: false,
            onclick: false,
            focusInvalid: false,
            focusCleanup: true,
            highlight: function(element, errorClass, validClass) { //未通过验证的元素
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
            errorPlacement: function($error, element) {
                if (this.errorClass == 'help-block') {
                    $error.insertAfter($element.parent());
                } else {
                    $error.appendTo($element.parent());
                }
            },
            submitHandler: function() {
                return false;
            }
        });
    };

    GridView.prototype.initToolbar = function() {
        var $this = this;
        this.$form.on('submit', function() {
            var row = $this.getFormValue();
            $this.queryParams = row;
            $this.bootstrapTable.options.pageNumber = 1;
            $this.$table.bootstrapTable('refresh');
            return false;
        });

        this.$toolbar.find('>.btn-group>button[data-name]').on('click', function() {
            // 要执行的事件名称
            var $btn = $(this);
            var eventName = $btn.data('name');
            var params = {
                url: $btn.data('eventValue') == '' ? ($this.module + '/' + eventName) : $btn.data('eventValue'),
                event_type: $btn.data('eventType'),
                event_value: $btn.data('eventValue'),
                target: $btn.data('target'),
                text: this.innerText
            };

            //事件类型 1. 自定义 2.视图(modal、self、_blank)3.默认(alertConfirm函数)4.脚本
            if (params.event_type == 'custom') { // 自定义事件
                return $this.$table.triggerHandler(eventName, [$this, params]);
            } else if (params.event_type == 'view') { //视图
                
                params.data = {};
                if (eventName.substr(0, 4) == 'edit' || eventName.substr(0, 6) == 'update') {
                    if ($this.currentRow == null) {
                        return alertMsg('请先选择要编辑的数据！', 'warning');
                    }
                    params.data[$this.uniqueId] = $this.currentRow[$this.uniqueId];
                }

                var result = $this.$table.triggerHandler(eventName, [$this, params]);
                if (result === false) {
                    return;
                }
                //打开方式 1.模态框 2.本页打开 3.在新窗口打开
                if (params.target == 'modal') {
                    $this.loadModal(params.url, params.data);
                } else if (params.target == 'self' || params.target == '') {
                    window.location.href = params.url;
                } else if (params.target == '_blank') {
                    window.open(params.url);
                } else {
                    var $container = $(params.target);
                    $container.load(params.url, function() {
                        win.init($container);
                        var aaa = $container.find('table[data-toggle="gridview"]').gridView();;
                    });
                }
                return;
            } else if (params.event_type == 'javascript') { //脚本
                return $('html').append('<script type="text/javascript">' + params.event_value + '</script>');
            } else if (params.event_type == 'default') { //默认

                //toolbar中默认事件类型的按钮 如删除、搜索等
                if (eventName.substr(0, 6) == 'delete') {
                    $this.deleteModal(eventName)
                } else {
                    $this.$table.triggerHandler(eventName, [$this, params]);
                }
            }else{
                $this.$table.triggerHandler(eventName, [$this, params]);
            }
        });
    };

    GridView.prototype.getSelections = function () {
        return this.$table.bootstrapTable('getSelections');
    }

    GridView.prototype.toggleCheckedClass = function (data) {
        $this = this
        var btnGroup = $this.toolbar.find('.btn-group')
        if (data.attr == 'disabled') {
            btnGroup.each(function(items, index) {
                $(index).find('button').each(function(item, ele) {
                    if ($(ele).data('name') == 'delete') {
                        $(ele).attr('disabled', true).addClass('btn-default').removeClass('btn-primary')
                    }
                })
            })
        }else if (data.attr == '') {
            btnGroup.each(function(items, index) {
                $(index).find('button').each(function(item, ele) {
                    if ($(ele).data('name') == 'delete') {
                        $(ele).removeAttr('disabled').removeClass('btn-default').addClass('btn-primary')
                    }
                })
            })
        }else{
            btnGroup.each(function(items, index) {
                $(index).find('button').each(function(item, ele) {
                    if ($(ele).data('name') != 'delete') { //默认delete需选中checkbox
                        $(ele).removeAttr('disabled').removeClass('btn-default').addClass('btn-primary')
                    }
                })
            })
        }
    }

    GridView.prototype.deleteModal = function(eventName, row) {
        $this = this
        var rows = [];

        if (row) {//一条
            rows[0] = row
            rows['length'] =1
        }else{
            rows = $this.getSelections() // 当前页被选中项(getAllSelections 所有分页被选中项)
        }
        if (rows.length == 0) {
            alertMsg('请勾选要删除的数据', 'warning');
            return;
        }
        var params = {
            rows: rows,
            length: rows.length,
            url: $this.module + '/' + eventName,
            backdrop: true,
            title: '提示',
            message: '确定要删除选中的' + rows.length + '项吗？',
            okValue: '确定',
            cancelValue: '取消',
            ajaxMsg: '正在删除中...',
            data: null,
            ok: function() {
                var post_data = {};
                var uniqueId = [];
                var needRestForm = false;
                var editUniqueId = $this.$form.find('input[name="' + $this.uniqueId + '"]').val();
                if (params.length > 1) {
                    for (var i in params.rows) {
                        uniqueId.push(params.rows[i][$this.uniqueId]);
                        // 判断当前编辑的数据是否在删除数组中
                        if (editUniqueId == params.rows[i][$this.uniqueId]) {
                            needRestForm = true;
                        }
                    }
                    if (params.data == null) {
                        post_data[$this.uniqueId] = uniqueId.join(',');
                    }
                }else{
                    post_data[$this.uniqueId] = params.rows[0][$this.uniqueId]
                }
                
                // 请求服务器删除数据
                $.ajax({
                    url: params.url,
                    dataType: 'json',
                    data: post_data,
                    waitting: params.ajaxMsg,
                    type: 'post',
                    success: function(ajaxData) {
                        $this.refresh()
                    },
                    error: function(ajaxData) {
                        $this.refresh()
                    }
                });
            },
            cancel: function() {}
        };

        // 通知我要删除
        var result = $this.$table.triggerHandler('delete', [$this, params]);
        if (result === false) {
            return;
        }
        // 弹出删除提示
        alertConfirm({
            title: params.title,
            content: params.message,
            okValue: params.okValue,
            cancelValue: params.cancelValue,
            ok: params.ok,
            cancel: params.cancel,
            backdrop: params.backdrop
        }); //删除 ok
    }

    GridView.prototype.resetForm = function() {
        if (this.$form.length == 0) {
            return;
        }
        this.$form[0].reset();
    };

    GridView.prototype.resetView = function(height) {

        if (this.$table.data('height') != undefined) {
            this.$table.bootstrapTable('resetView');
        }

        if (this.currentRow != null) {
            this.$table.bootstrapTable('scrollTo', this.scrollPosition);
            this.$table.find('tr[data-uniqueid="' + this.currentRow[this.uniqueId] + '"]').addClass('info').siblings().removeClass('info');
        }
    };

    GridView.prototype.refresh = function() {
        this.$table.bootstrapTable('refresh');
    };

    GridView.prototype.loadModal = function(url, data) {
        var $this = this;
        $.ajax({
            url: url,
            waitting: true,
            dataType: 'html',
            data: data,
            waitting: '正在加载，请稍后...',
            success: function(html) {
                var $html = $('<div class="dialogModal">' + html + '</div>');
                var $form = $html.find('form');
                if ($form.length == 0) {
                    var $modal = $html.find('.modal:eq(0)');
                } else {
                    var $modal = $form.find('.modal:eq(0)');
                }
                if ($modal.length == 0) {
                    alertMsg(html, 'warning');
                    return;
                }

                $html.appendTo('body');
                //调用数据效验
                win.init($html);
                $modal.modal().show()
                    //隐藏模态框 刷新表单 移除模态框等元素
                $modal.on('hide.bs.modal', function() {
                    if ($form.length > 0 && $form.data('submited') == true) {
                        $this.$table.bootstrapTable('refresh')
                    }
                    $html.remove();
                })

            }
        });
    };

    GridView.prototype.getFormValue = function(selector) {
        var $form = selector == undefined ? this.$form : $(selector);
        if ($form.length == 0) {
            return;
        }

        var row = {};
        var serializeArray = $form.serializeArray(),
            name;

        // 仅支持到一维数组
        $.each(serializeArray, function(i, item) {
            name = item.name.substr(5, item.name.indexOf(']') - 5);
            if (name == '') {
                row[item.name] = item.value;
            } else {
                if (row[name] !== undefined) {

                    // 保存数组形式
                    if (!row[name].push) {
                        row[name] = [row[name]];
                    }
                    row[name].push(item.value || '');
                } else {
                    row[name] = item.value || '';
                }
            }
        });

        for (var i in row) {
            if (row[i] instanceof Array) {
                row[i] = row[i].join(',');
            }
        }
        return row;
    };

    

    GridView.prototype.current = function() {
        return this.currentRow;
    }

    new GridView('table[data-toggle="gridview"]');

    // 将gridView插件对外暴露，方便外部调用
    $.fn.gridView = function(option, arg1, arg2) {
        var $gridview = this.data('gridview');
        if (typeof option == 'string') {
            if ($gridview == undefined) {
                return;
            }

            return $gridview[option](arg1, arg2);
        }

        if ($gridview != undefined) {
            return;
        }

        if (this.length > 0) {
            new GridView(this, option);
        }
        return this;
    };
});
