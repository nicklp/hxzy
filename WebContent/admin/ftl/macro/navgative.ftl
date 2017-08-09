<#macro navigation  url  >
     
     <#local  middle = 5>
     
     <#if  (paging.page > middle) >
           <#local  middle =paging.page >
      </#if>
      
      
     <#local  prev=(middle-5)  >       
     <#if (prev<=0) >
            <#local  prev=1  >
     </#if>
      

      <#local  next=prev+9   >   

      <#if (next>paging.totalPages)  >
            <#local  next=paging.totalPages  >
            <#local  prev=(next-9)  >

             <#if (prev<=0) >
                  <#local  prev=1  >
             </#if> 
       </#if>


      <#-- 拼接查询的参数 -->
      <#local str="" >
      <#local keys=RequestParameters?default({})?keys >
      
      <#list  keys as x>          
            <#if  !(x=="page")  >
                    <#if !(RequestParameters[x] =="")>
                            <#local str=str+"&"+x+"="+RequestParameters[x] >
                    </#if> 
            </#if>
       </#list>
          
        <#--定义第一页的地址-->
       <#local  first=ctx+"/"+url+"?page=1"+str >
       <#local  other=ctx+"/"+url+"?page=(number)"+str >      
       
       <div class="row">
               <#if  (paging.totalPages==0)>
                    <div class="col-sm-5">
                          <div class="dataTables_info"> 
                            
                                                                                 查询不到满足条件的数据!
                          
                           </div>
                     </div>

              <#else>


                     <#--有数据 -->
                     <div class="col-sm-5">
                             <div class="dataTables_info"> 
                                                                                共${paging.totalPages}页/当前${paging.page}页  共${paging.totalRecords}笔/每页${paging.size}笔
                            </div>
                      </div>

                     <div class="col-sm-7">
                          <div class="dataTables_paginate paging_simple_numbers">
                                <ul class="pagination">
                                    
                                  <#if  (paging.page==1) >
                                               <li class="paginate_button previous disabled">
                                                      <a >首页</a>
                                                </li>
                                                <li class="paginate_button previous disabled">
                                                     <a >上一页</a>
                                               </li>
                                  <#else>
                                          
                                                 <li   class="paginate_button previous ">
                                                      <a href="${first}">首页</a>
                                                </li>
                                                <li   class="paginate_button previous ">
                                                     <a href="${other?replace("(number)", paging.prev)}" >上一页</a>
                                               </li>
                                  </#if>
                   
                                      
                                   <#--循环遍历中间页码 -->
                                   <#list prev..next as i>
                                            <#if  (i==paging.page) > 
                                                  <li class="paginate_button active">
                                                    <a>${i}</a>
                                                  </li>
                                           <#else>
                                                   <li class="paginate_button">
                                                         <a href="${other?replace("(number)", i)}">${i}</a>
                                                   </li>
                                           </#if> 


                                   </#list>

                                   <#--下一页和尾页-->
                                     <#if  (paging.page>=paging.totalPages) >
                                               <li class="paginate_button next disabled">
                                                      <a >下一页</a>
                                                </li>
                                                <li class="paginate_button next disabled">
                                                     <a >尾页</a>
                                               </li>
                                  <#else>
                                          
                                                 <li   class="paginate_button next ">
                                                      <a href="${other?replace("(number)", paging.next)}">下一页</a>
                                                </li>
                                                <li    class="paginate_button next ">
                                                     <a  href="${other?replace("(number)", paging.totalPages)}">尾页</a>
                                               </li>
                                  </#if> 

 
                    </ul> 
                 </div>
            </div>
 

             
             </#if>

 

           
      </div>



</#macro>
 

 

