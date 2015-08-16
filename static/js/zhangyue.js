$(document).ready(function(){
  $("#setting_btn2").click(function(){
        if($("#Log_Name").val()=="" || $("#Log_Host").val()=="" || $("#Log_Path").val()=="" || $("#Log_Purpose").val()=="" || $("#Log_Key").val()=="" || $("#Log_roate").val()=="" || $("#Log_Backup").val()==""){
                alert("请不要输入空元素");
            }else{
                $.post("/add_newlog/",
                {
                        Log_Name:   	$("#Log_Name").val(),
                        Log_Host:   	$("#Log_Host").val(),
                        Log_Path:   	$("#Log_Path").val(),
                        Log_Purpose:   	$("#Log_Purpose").val(),
                        Log_Key:   	$("#Log_Key").val(),
                        Log_roate:  	$("#Log_roate").val(),
                        Log_Backup:   	$("#Log_Backup").val(),
                },
                        function(data){
				if( data == "") {
                                	alert("日志用途重复");
              			} else if( data == "update"){
					alert("日志更新成功");
				} else{ 
					alert("保存成功");}
                });
                                location.href='/log_display/';
        };
  });

///////////////////////////////////////////////////////////////
//
  $("#tab_span td span:last-child").click(function(){
	var  $log_id = $(this).text();
	     del($log_id);
             
          });

	function del($log_id){
                var msg = "确定要删除吗?";
                if (confirm(msg)==true){
                     $.post("/clear_log/",
                     {
                        log_id: $log_id,
                     },
                        function(status){
                                alert("删除成功");
                     });
                        location.href='/log_display/';
                }else{
                        return false;
                     }

		}
/////////////////////////////////////
  $("#tab_span td span:first-child").click(function(){
	//alert($(this).text());
	$.post("/change_log/",
                {
                        id:$(this).text(),
		},
			function(data){
     				//alert(decodeURI(data));
     				//alert(data);
				$('#myModal').modal('show');

			$.each(data,function(key, value){ 
				//调试打印console.log,需要Firebug
				console.info("Name:" + key + ",Value:" + value); 
				    if( key == "name") {   
					$("#Log_Name").val(value);
      					}
				    if( key == "key_args") {   
					$("#Log_Key").val(value);
      					}
				    if( key == "logrotate") {   
					$("#Log_roate").val(value);
      					}
				    if( key == "host") {   
					$("#Log_Host").val(value);
      					}
				    if( key == "backup_info") {   
					$("#Log_Backup").val(value);
      					}
				    if( key == "action") {   
					$("#Log_Purpose").val(value);
      					}
				    if( key == "path") {   
					$("#Log_Path").val(value);
      					}
				});

                     });
	
	 });




});
