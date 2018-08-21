<%@ page import="com.nf147.ldl.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详细信息</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

        <%
            Book book = (Book)request.getAttribute("book");
        %>

<div class="row" style="margin-top:30px;">
            <div class="col-3"></div>
            <div class="col-6" style="margin:20px;">
                    <div class="form-group row">
                        <label for="id" class="col-sm-2 col-form-label">ID</label>
                        <div class="col-sm-5">
                            <input type="number" id="id" placeholder="ID" value="<%=book.getId()%>" disabled autocomplete="off" name="id"  class="form-control">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label">书名</label>
                        <div class="col-sm-5">
                            <input type="text"  autocomplete="off" disabled value="<%=book.getName()%>" class="form-control" name="name" id="name" placeholder="书名">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="price" class="col-sm-2 col-form-label">价格</label>
                        <div class="col-sm-5">
                            <input type="number" autocomplete="off" value="<%=book.getPrice()%>" disabled class="form-control" name="price" id="price" placeholder="价格">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="author" class="col-sm-2 col-form-label">作者</label>
                        <div class="col-sm-5">
                            <input type="text"  autocomplete="off" value="<%=book.getAuthor()%>" disabled class="form-control" name="author" id="author" placeholder="作者">
                        </div>
                    </div>
            </div>
    <div class="col-3"></div>
</div>

</body>
</html>
