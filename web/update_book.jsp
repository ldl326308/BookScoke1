<%@ page import="com.nf147.ldl.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息更新</title>
</head>
<link rel="stylesheet" href="/js_css/css/bootstrap.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<body>


    <%
            Book book = (Book)request.getAttribute("book");
    %>

    <input type="button" onclick="funClick()" value="点击" />

    <div class="modal fade" style="display:none;"  id="exampleModalCenter" tabindex="-1" role=".modal-dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

                <form method="post"  action="/bookUpdate">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">书籍信息更新</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-12">

                            <div class="modal-body">
                                <input type="hidden" value="<%=book.getId()%>" name="id">
                                <div class="form-group row">
                                    <label for="id" class="col-sm-2 col-form-label">ID</label>
                                    <div class="col-sm-5">
                                        <input type="number" value="<%=book.getId()%>" class="form-control" id="id" disabled>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="name" class="col-sm-2 col-form-label">书名</label>
                                    <div class="col-sm-5">
                                        <input type="text" value="<%=book.getName()%>" autocomplete="off"  class="form-control" name="name" id="name" placeholder="书名">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="price" class="col-sm-2 col-form-label">价格</label>
                                    <div class="col-sm-5">
                                        <input type="number" value="<%=book.getPrice()%>" autocomplete="off" class="form-control" name="price" id="price" placeholder="价格">
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="author" class="col-sm-2 col-form-label">作者</label>
                                    <div class="col-sm-5">
                                        <input type="text" value="<%=book.getAuthor()%>" autocomplete="off" class="form-control" name="author" id="author" placeholder="作者">
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" onclick="closeClick();" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" style="float:right;margin-right:290px;" class="btn btn-secondary"  value="保存更新" />
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <script>
        function funClick() {
            document.getElementById("exampleModalCenter").setAttribute("role",".modal-dialog-centered");
            document.getElementById("exampleModalCenter").setAttribute("class","modal fade show");
            document.getElementById("exampleModalCenter").setAttribute("style","display:block;");
        }


        function closeClick() {
            document.getElementById("exampleModalCenter").setAttribute("role",".modal-dialog");
            document.getElementById("exampleModalCenter").setAttribute("class","modal fade");
            document.getElementById("exampleModalCenter").setAttribute("style","display:none;");
        }

    </script>

</body>
</html>
