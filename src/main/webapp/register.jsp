<%-- 
    Document   : register
    Created on : 06-Apr-2023, 11:43:01 PM
    Author     : aavip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
         <%@include file = "component/common_css_js.jsp"%>
         <link rel="stylesheet" href="style.css">
    </head>
    <body>
         <%@include file="component/navbar.jsp"%>
        
         
         <div class="container">
              <div class="row mt-5">

            <div class="col-md-4 offset-md-4">
                <div  style="height: 600px; width: 500px; "class="card ">
                     <%@include file="component/message.jsp"%>
                         <div class = "card-body px-5">
                              
                             <h3  class="text-center ">Sign Up here !!</h3>
                             <form action="RegisterServlet" method="POST">
                              <div class="form-group">
                                   <label for="exampleInputEmail1">User Name</label>
                                          <input name ="user_name" type="text" class="form-control" id="name" placeholder="Enter here">
    
                              </div>
                              <div class="form-group">
                                   <label for="exampleInputEmail1">User Email</label>
                                          <input  name ="user_email" type="text" class="form-control" id="Email1" placeholder="Enter here">
    
                              </div>
                              <div class="form-group">
                                   <label for="exampleInputEmail1">User Phone</label>
                                          <input  name ="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here">
    
                              </div>
                                   <div class="form-group">
                                   <label for="exampleInputEmail1">User Password</label>
                                          <input  name ="user_password" type="number" class="form-control" id="password" placeholder="Enter here">
    
                              </div>
                                   <div class="form-group">
                                   <label for="address">User Address</label>
                                   <textarea  name ="user_address" style="height: 80px;" class="form-control" placeholder="Enter Your Address"></textarea>
                              </div>
                                  
                               <div class ="container text-center">
                                 <button  class="btn btn-outline-success">Register</button>
                                 <button  class="btn btn-outline-warning">Reset</button>
                             </div>
                             
                             
                         </form>
                             
                         </div>
                     </div>
                
                             
            </div> 
        </div>
         </div>
    </body>
</html>
