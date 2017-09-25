
$(function(){
	validate($('#cvForm'));
	$('#myModal').modal({backdrop: 'static', keyboard: false,show:false});
});

/*将表单序列化成为json*/
(function($){  
    $.fn.serializeJson=function(){  
        var serializeObj={};  
        $(this.serializeArray()).each(function(){  
            serializeObj[this.name]=this.value;  
        });  
        return serializeObj;  
    };  
})(jQuery); 

$(function(){
			
			var validator = $('#cvForm').data('bootstrapValidator');
			
			/* 加载时间选择插件 */  
			$('#createDate').datetimepicker().on('changeDate', function(ev){
				validator  
		                .updateStatus('createDate', 'NOT_VALIDATED',null)  
		                .validateField('createDate');  
			});
		          
			$("#cvForm").submit(function(ev){
				 ev.preventDefault();
			});
			
			$(".btn-success").click(function(){
				$("#cvForm").find("input[wisezone]").each(function(){
					var attrName = $(this).prop("name");
					validator  
	                .updateStatus(attrName, 'NOT_VALIDATED',null)  
	                .validateField(attrName);  
				});
				var flag = validate($("#cvForm"));
				if(flag){
					$("[name='details']").val(editor.html());
					var str = $("#cvForm").serialize();
					var json_cvForm = $("#cvForm").serializeJson();
					$.ajax({
	                       type: "POST",  
	                       dataType: "json",  
	                       contentType: "application/json; charset=utf-8",
	                       url: baseUrl + "/add.action",  
	                       data: JSON.stringify(json_cvForm) ,
	                       beforeSend:function(XMLHttpRequest){
	                    	   $('#myModal').modal("show");
	                       },
	                       success: function (data) {
	                    	   $('#myModal').modal("hide");
	                    	   if(data && data.state == true){
	                    		   swal("修改成功!", "", "success"); 
	                    		   $("#stuName,#phone").parents(".form-group").find("div:last").hide();
	                    	   }else{
	                    		   swal("修改失败!", "", "error"); 
	                    	   }
	                    	   
	                       },
	                       error:function(XMLHttpRequest,textStatus,errorThrown){
	                    	   $('#myModal').modal("hide");
	                       }
					});
				}
			}); 
			
			$("#school_select,#msgFrom_select,#tdType_select").change(function(){
				$(this).parents(".form-group").find("input").val($(this).find("option:selected").text());
				var fieldName = $(this).parents(".form-group").find("input").attr("name");
				if(fieldName != 'school'){
					if(validator){
						validator 
		                .updateStatus(fieldName, 'NOT_VALIDATED',null)  
		                .validateField(fieldName);
					} 
				}
			});
			$("#stuName,#phone").focus(function(){
				$(this).parents(".form-group").find("div:last").hide();
			});
			$("#stuName").blur(function(){
				if($(this).val() == "" || $(this).val() == null){
					return;
				}
				$.ajax({
                       type: "POST",  
                       dataType: "json",  
                       url: baseUrl + "/queryNameAndPhone.action",  
                       data: "stuName=" + $(this).val() + "&phone=" ,  
                       beforeSend:function(XMLHttpRequest){
                       },
                       success: function (data) {
                    	   $(".name_validate").html("");
                       		if(data != null && data.length > 0){
                       			readJsontotab(data);
                       			$("#stuName").parents(".form-group").find("div:last").show();
                       		}
                       },
                       error:function(XMLHttpRequest,textStatus,errorThrown){
                       }
				});
			});
			$("#phone").blur(function(){
				if($(this).val() == "" || $(this).val() == null){
					return;
				}
				$.ajax({
                       type: "POST",  
                       dataType: "json",  
                       url: baseUrl + "/queryNameAndPhone.action",  
                       data: "stuName=&phone=" + $(this).val() ,  
                       beforeSend:function(XMLHttpRequest){
                       },
                       success: function (data) {
                    	   $(".name_validate").html("");
                       		if(data != null && data.length > 0){
                       			readJsontotab(data);
                       			$("#phone").parents(".form-group").find("div:last").show();
                       		}
                       },
                       error:function(XMLHttpRequest,textStatus,errorThrown){
                       }
				});
			});
			
			$("#cvForm").find("input[wisezone]").on("blur",function(){
				var attrName = $(this).prop("name");
				validator  
                .updateStatus(attrName, 'NOT_VALIDATED',null)  
                .validateField(attrName);  
			});
				
		});
		 
		function readJsontotab(jsonobj){
			for(var item in jsonobj){
				var tr_str = "\<tr>" + 
				 "\<td>"+ jsonobj[item].stuName + 
				 "\</td>"+
				 "\<td>"+ jsonobj[item].phone +
				 "\</td>"+
				 "\<td>"+ jsonobj[item].school +
				 "\</td>"+
				 "\<td>"+ jsonobj[item].major +
				 "\</td>"+
				 "\<td>"+ jsonobj[item].msgFrom +
				 "\</td>"+
				 "\<td>"+ jsonobj[item].createDate +
				 "\</td>"+
				 "\</tr>";
				 $(".name_validate").append($(tr_str));
			}
		}