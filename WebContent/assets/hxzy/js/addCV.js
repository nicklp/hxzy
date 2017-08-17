
$(function(){
	validate($('#cvForm'));
	//$('#myModal').modal({backdrop: 'static', keyboard: false});
	$("#myModal").ajaxStart(function(){
		$('#myModal').modal("show");
	});


	$("#myModal").ajaxStop(function(){
		$('#myModal').modal("hide");
	});
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
				var flag = validate($("#cvForm"));
				if(flag){
					$("#details").val($('#editor').html());
					var str = $("#cvForm").serialize();
					var json_cvForm = $("#cvForm").serializeJson();
					console.log(json_cvForm);
					$.ajax({
	                       type: "POST",  
	                       dataType: "json",  
	                       contentType: "application/json; charset=utf-8",
	                       url: "http://localhost:8080/hxzy/add.action",  
	                       data: json_cvForm ,  
	                       success: function (data) {
	                       		console.log(data);
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
	
			$("#cvname").blur(function(){
				if($(this).val() == "" || $(this).val() == null){
					return;
				}
				$.ajax({
                       type: "POST",  
                       dataType: "json",  
                       url: "http://localhost:8080/hxzy/queryNameAndPhone.action",  
                       data: "cvName=" + $(this).val() + "&phone=" ,  
                       success: function (data) {
                       		if(data != null && data.length > 0){
                       			readJsontotab(data);
                       		}
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
			$(".name_validate").html("");
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