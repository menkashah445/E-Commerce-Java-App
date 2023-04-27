
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.Dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entity.Category"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page  import = "com.mycompany.mycart.entity.User"%>


<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!!Login First");
        response.sendRedirect("login.jsp");
        return;

    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin!! do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
       
        <%@include file = "component/common_css_js.jsp"%>
    </head>
    <body>

       
        <%@include file="component/navbar.jsp"%>
        <div class="container admin">
            <div class="container-fluid">
                <%@include file="component/message.jsp"%>
            </div>
            <div class="row mt-1">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img  style="width: 100px;" class= "img-fluid rounded-circle" src="image/teamwork.png" alt="user_icon"/>
                            <h1>1234</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img  style="width: 100px;" class= "img-fluid rounded-circle" src="image/categories.png" alt="user_icon"/>
                            <h1>1234</h1>
                            <h1 class="text-uppercase text-muted">Category</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img  style="width: 100px;" class= "img-fluid rounded-circle" src="image/delivery-box.png" alt="user_icon"/>
                            <h1>1234</h1>
                            <h1 class="text-uppercase text-muted">Product</h1>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <img  style="width: 100px;" class= "img-fluid rounded-circle" src="image/apps.png" alt="user_icon"/>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <img  style="width: 100px;" class= "img-fluid rounded-circle" src="image/add.png" alt="user_icon"/>
                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>

                        </div>
                    </div>
                </div>

            </div>
        </div>

       

       

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title">
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height: 160px;" placeholder="Enter Category Description" name="catDescription" class="form-control"></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success"> Add Category</button>
                            </div>
                                 
                        </form>
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div>
       
        <!-- Modal -->

<div class="modal fade" id= "add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
                <input type="hidden" name="operation" value="addPoduct">
                
              <!--<input type="hidden" name="operation" value="addproduct"/>-->
              
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter Product Name"  name="proName" required/>
               </div>  
               <div class="form-group">
                    <textarea  style="height: 100px;" class="form-control" name="proDec" placeholder="Enter Product Description"></textarea>
                  
               </div> 
              
               <div class="form-group">
                  <input type="text" class="form-control" name="proprice" placeholder="Enter Product Price"/>
               </div> 
               <div class="form-group">
                  <input type="text" class="form-control" name="prodiscount" placeholder="Enter Product Discount"/>
               </div> 
               <div class="form-group">
                  <input type="text" class="form-control" name="proqqoantity" placeholder="Enter Product Quantity"/>
               </div> 
               
              
              <%
                 CategoryDao cdao=  new CategoryDao(FactoryProvider.getFactory());
                 List<Category> list = cdao.getCategories();
                 
               %>
               
              <div class="form-group">
                  <select name="catId" class="form-control">
                       <%                                      for(Category c :list){
                       %>
                        <option value="<%= c.getId()%>"> <%= c.getTitle()%></option>
                     
                      <%}%>
                      
                  </select>
              </div>
              <div class="form-control">
                  <label for="Ppic">Select Picture of Product</label>
                  <br>
                  <input type = "file"  id="Ppic" name="pPic" required/>
              </div>
                      
                   <div class="container text-center mt-3">
                                <button class="btn btn-outline-success"> Add Product</button>
                            </div>        
              
          </form>
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>
       
    </body>
</html>










