$(function() {

	var jqGrid = $("#jqGridList");
	jqGrid.jqGrid({
		caption: "书籍管理",
		url: "booksearch",
		mtype: "GET",
		styleUI: 'Bootstrap', //设置jqgrid的全局样式为bootstrap样式
		datatype: "json",
		colModel: [{
			label: '书籍ID',
			name: 'bookid',
			width: 60,
			key: true
		}, {
			label: '书籍名称',
			name: 'bookname',
			width: 100
		},{
           	label: '书籍类型',
           	name: 'classification',
           	width: 100
           	},{
            label: '书籍借阅数量',
            name: 'number',
            width: 100
            },{
            name: 'id', width : 50,
            index : 'id',
            sortable : true,
            align: 'center',
            editable:true,editoptions:{size:10},formatter:cLink}
            ],
		viewrecords: true,
		height: 385,
		rowNum: 10, //每页显示记录数
		rowList: [10, 30, 50], //用于改变显示行数的下拉列表框的元素数组
		rownumbers: true, //添加左侧行号
		rownumWidth: 25,
		autowidth: true,
		multiselect: true,
		pager: "#jqGridPager",
		/*设置分页显示的导航条信息*/
		jsonReader: {
			root: "page.list",
			page: "page.pageNum",
			total: "page.pages",
			records: "page.pageSize"
		},
		/*像后台请求的参数信息*/
		prmNames: {
			page: "page",
			rows: "limit",
			order: "order"
		},
		gridComplete: function() {
			//隐藏grid底部滚动条
			$("#jqGridList").closest(".ui-jqgrid-bdiv").css({
				"overflow-x": "hidden"
			});
		}
	});

});

function cLink(cellvalue, options, rowObject){

    var id=rowObject.id;

    return '<a style="text-decoration: none;" href="javascript:void(0)" target="_bank" id="'+id+'"  onclick="Editor('+id+')">[编辑]</a>';

}