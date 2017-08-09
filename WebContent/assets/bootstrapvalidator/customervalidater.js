

function validate(form) {

    var validateObj = {
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }, fields: {}
    };
   
    //    (数组,  方法(下标，对象){});
    $.each(form.find("input"), function (i, item) {

    	
        var obj = {}; //存放验证规则
        obj.message = $(item).attr("name") + "必须填写";
        
        var validators = { };
        if (typeof ($(item).attr("wisezone")) == "undefined") { 
        } else {
        	
        	//非空验证
            if ($(item).attr("wisezone").indexOf("notEmpty") != -1) {
            	validators.notEmpty = { message: $(item).parent().prev().html()+"不能为空" };
            	 
            }
             
            //数字
            if ($(item).attr("wisezone").indexOf("numeric") != -1) {
            	validators.numeric = { message: $(item).parent().prev().html()+"必须是数字" };
            }
 
            /*  长度
            stringLength: {
                min: 6,
                max: 18,
                message: '用户名长度必须在6到18位之间'
            }
            */
            if ($(item).attr("wisezone").indexOf("stringLength") != -1) {
                var str = $(item).attr("wisezone");
                //2,10
                var val = str.substring(str.indexOf("(", str.indexOf("stringLength")) + 1, str.indexOf(")", str.indexOf("stringLength")));

                var stringLen = {};
                stringLen["min"] = val.split(",")[0];
                stringLen["max"] = val.split(",")[1];

                stringLen.message = $(item).parent().prev().html() + "长度必须为" + val.split(",")[0] + "到" + val.split(",")[1] + "之间";

                validators.stringLength = stringLen;
            }

            
            if ($(item).attr("wisezone").indexOf("size") != -1) {
                var str = $(item).attr("wisezone");
                //2,10
                var val = str.substring(str.indexOf("(", str.indexOf("size")) + 1, str.indexOf(")", str.indexOf("size")));

               
                stringLen["min"] = val;
                stringLen["max"] = val;

                stringLen.message = $(item).parent().prev().html() + "长度必须为" + val+"位";

                validators.stringLength = stringLen;
            }

             
            /*
            regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
             */
            if ($(item).attr("wisezone").indexOf("nameregexp") != -1) {
                var reg = {};
                reg.regexp = /^[a-zA-Z0-9_\.]+$/;
                reg.message = $(item).parent().prev().html()+"必须为数字或者下划线，不能为特殊字符";
                
                validators.regexp = reg;
            }

            /* 邮箱 
             *  emailAddress: {
                            message: '邮箱地址格式有误'
                        }
             */
            if ($(item).attr("wisezone").indexOf("email") != -1) {
            	validators.emailAddress = { message: "电子邮箱地址不正确" };
            }
            //网址
            if ($(item).attr("wisezone").indexOf("uri") != -1) {
            	validators.uri = { allowLocal: "true", message: "Uri地址格式不正确" };
            }
          
           //两次输入的密码不一致
            /*
              identical: {
                         field: 'password', //需要进行比较的input name值
                         message: '两次密码不一致'
                     }
             */
            if ($(item).attr("wisezone").indexOf("identical") != -1) {

                var str = $(item).attr("wisezone");
                var val = str.substring(str.indexOf("(", str.indexOf("identical")) + 1, str.indexOf(")", str.indexOf("identical")));
                validators.identical = {
                    field: val,
                    message: '密码和重复密码不一致'
                };
            }
            
            /*
             * 年龄
             */
            if ($(item).attr("wisezone").indexOf("ages") != -1) {
				
				var val = str.substring(str.indexOf("(", str.indexOf("ages")) + 1, str.indexOf(")", str.indexOf("ages")));

                var stringLen = {};
                stringLen["min"] = val.split(",")[0];
                stringLen["max"] = val.split(",")[1];
				
                var age = {
                    lessThan: {
                        value: stringLen[1],
                        inclusive: true,
                        message: '年龄最高'+stringLen[1]
                    },
                    greaterThan: {
                        value: stringLen[0],
                        inclusive: false,
                        message: '年龄最小'+stringLen[0]
                    }
                };
                validators.ages = age; 
            }
            
            //remote ajax验证，验证是否存在
            /*
             remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                     url: 'exist2.do',//验证地址
                     message: '用户已存在',//提示消息
                      
                     type: 'POST'//请求方式
                     /**自定义提交数据，默认值提交当前input value
                      *  data: function(validator) {
                           return {
                               password: $('[name="passwordNameAttributeInYourForm"]').val(),
                               whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                           };
                        }
            */            
            // remote(地址.action, input=id=主键的值)   新增：员工登录名.action?empNo=0&empName=姓名
            if($(item).attr("wisezone").indexOf("myajax")!=-1){
            	var str = $(item).attr("wisezone");
            	var val = str.substring(str.indexOf("(", str.indexOf("myajax"))+1,str.indexOf(")", str.indexOf("myajax"))  );
            	 var arr=val.split(",");
            	//向远程服务器发送的值,json对象
             	var cust_data={};
             	//主键如果有就取值，如果没有就为0
             	                  
             	cust_data[arr[1]]=$("#"+arr[1]).val() || 0;
             	//name="empName"
             	cust_data[$(item).attr("name")]=$(item).val();
                 
               
                 validators.remote = {
                 	type:'POST',
                 	url: arr[0],
                 	data:cust_data,
                 	message: "验证码错误"
                 };
            	 
            }
            if ($(item).attr("wisezone").indexOf("remote") != -1) {

             
            	
                var str = $(item).attr("wisezone");
                var val = str.substring(str.indexOf("(", str.indexOf("remote")) + 1, str.indexOf(")", str.indexOf("remote")));
                var arr=val.split(",");
                
            	//向远程服务器发送的值
            	var cust_data={};
            	//主键如果有就取值，如果没有就为0
            	                  
            	cust_data[arr[1]]=$("#"+arr[1]).val() || 0;
            	//name="empName"
            	cust_data[$(item).attr("name")]=$(item).val();
                
              
                validators.remote = {
                	type:'POST',
                	url: arr[0],
                	data:cust_data,
                	message: $(item).parent().prev().html()+'已经存在!'
                };
            }
            
            
            
            obj.validators = validators;
            validateObj.fields[$(item).attr("name")] = obj;
        }
    })
    form.bootstrapValidator(validateObj);
}

 