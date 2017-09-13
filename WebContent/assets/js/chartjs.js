var myBarChart;
$(function() {
	
	init();
	
  $("#btn_search").click(function(){
	  myBarChart.destroy();
	  init();
  });
});

function init(){
	$.ajax({
        type: "POST",  
        dataType: "json",  
        url: baseUrl + "/queryyjpm.action",  
        data: "dateMonth="+$("#dateMonth").val() ,  
        beforeSend:function(XMLHttpRequest){
        },
        success: function (data) {
     	   if(data != undefined && data != null){
     		  var $labels = [];
     		  var $zx = [];
     		  var $pay = [];
     		  var $prePay = [];
     		   for(var item in data){
     			  var obj = data[item];
     			  $labels.push(obj.userName);
     			  $zx.push(obj.zx);
     			  $pay.push(obj.pay);
     			  $prePay.push(obj.prePay);
     		   }
     		   var datas = {labels:$labels,zx:$zx,pay:$pay,prePay:$prePay};
     		  initChart(datas);
     	   }
     	   
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){
        }
	});
}

function initChart(datas){
	var ctx, data, option_bars;
	  Chart.defaults.global.responsive = true;
	  ctx = $('#bar-chart').get(0).getContext('2d');
	  option_bars = {
	    scaleBeginAtZero: false,
	    scaleShowGridLines: true,
	    scaleGridLineColor: "rgba(0,0,0,.05)",	//格子颜色
	    scaleGridLineWidth: 1,	
	    scaleShowHorizontalLines: true,
	    scaleShowVerticalLines: false,
	    barShowStroke: true,	//柱状图边框
	    barStrokeWidth: 1,		//柱状图边框宽度
	    barValueSpacing: 10,
	    barDatasetSpacing: 3,
	    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
	  };
	  data = {
	    labels: datas.labels,
	    datasets: [
	      {
	        label: "咨询量",
	        fillColor: "#003366",
	        strokeColor: "#003366",
	        pointColor: "#003366",
	        pointStrokeColor: "#fff",
	        pointHighlightFill: "#fff",
	        pointHighlightStroke: "#003366",
	        data: datas.zx,
	      }, {
	        label: "付费",
	        fillColor: "#33ff99",
	        strokeColor: "#33ff99",
	        pointColor: "#33ff99",
	        pointStrokeColor: "#fff",
	        pointHighlightFill: "#fff",
	        pointHighlightStroke: "#33ff99",
	        data: datas.pay
	      }, {
	        label: "预付费",
	        fillColor: "#4cabce",
	        strokeColor: "#4cabce",
	        pointColor: "#4cabce",
	        pointStrokeColor: "#fff",
	        pointHighlightFill: "#fff",
	        pointHighlightStroke: "#4cabce",
	        data: datas.prePay
	      }
	    ]
	  };
	  myBarChart = new Chart(ctx).Bar(data, option_bars);
}
