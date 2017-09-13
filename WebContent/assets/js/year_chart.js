var myBarChart;
$(function() {
	console.log("%c当前URL"+document.url,"color:red;")
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
        url: baseUrl + "/queryyjofYear.action",  
        data: "year="+$("#dateYear").val() ,  
        beforeSend:function(XMLHttpRequest){
        },
        success: function (data) {
     	   if(data != undefined && data != null){
     		  var $labels = [];
     		  var $lr = [];
     		  var $sm = [];
     		  var $yb = [];
     		  var $ff = [];
     		   for(var item in data){
     			  var obj = data[item];
     			  $labels.push(obj.mon);
     			  $lr.push(obj.lr);
     			  $sm.push(obj.sm);
     			  $yb.push(obj.yb);
     			  $ff.push(obj.ff);
     			
     		   }
     		   var datas = {labels:$labels,lr:$lr,sm:$sm,yb:$yb,ff:$ff};
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
	    barValueSpacing: 20,
	    barDatasetSpacing: 3,
	    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
	  };
	  data = {
	    labels: datas.labels,
	    datasets: [
	      {
	        label: "录入",
	        fillColor: "#003366",
	        strokeColor: "#003366",
	        pointColor: "#003366",
	        pointStrokeColor: "#fff",
	        pointHighlightFill: "#fff",
	        pointHighlightStroke: "#003366",
	        data: datas.lr,
	      }, {
	        label: "上门",
	        fillColor: "#33ff99",
	        strokeColor: "#33ff99",
	        pointColor: "#33ff99",
	        pointStrokeColor: "#fff",
	        pointHighlightFill: "#fff",
	        pointHighlightStroke: "#33ff99",
	        data: datas.sm
	      }, {
	        label: "预报",
	        fillColor: "#4cabce",
	        strokeColor: "#4cabce",
	        pointColor: "#4cabce",
	        pointStrokeColor: "#fff",
	        pointHighlightFill: "#fff",
	        pointHighlightStroke: "#4cabce",
	        data: datas.yb
	      }, {
		        label: "付费",
		        fillColor: "#cc0000",
		        strokeColor: "#cc0000",
		        pointColor: "#cc0000",
		        pointStrokeColor: "#fff",
		        pointHighlightFill: "#fff",
		        pointHighlightStroke: "#cc0000",
		        data: datas.ff
		      }
	    ]
	  };
	  myBarChart = new Chart(ctx).Bar(data, option_bars);
}
