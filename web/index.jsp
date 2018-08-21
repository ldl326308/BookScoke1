<%@ page import="com.nf147.ldl.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nf147.ldl.dao.BookDAO" %>
<%@ page import="com.nf147.ldl.dao.BookInMemoryDAO" %>
<%@ page import="com.nf147.ldl.util.WebUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>所有图书信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>

      a{
        text-decoration: none;
        list-style-type: none;
        color:black;
        color:white;
      }
      a:hover{
        color:red;
      }

    </style>
  </head>
  <body>



<div class="row">
  <div class="col-3"></div>
  <div class="col-6">
     <%=
          WebUtil.showMessage(request)
     %>
  </div>
  <div class="col-3"></div>
</div>

  <div class="row" style="margin-top:30px;">
        <table class="table table-dark" id="tab" >
          <tr>
            <th>全选<input id="bigCbo" type="checkbox" /></th>
            <th>ID</th>
            <th>书名</th>
            <th>作者</th>
            <th>价格</th>
            <th>出版社</th>
            <th>其他</th>
          </tr>
                  <%
                    List<Book> books = (List<Book>) request.getAttribute("books");
                    for (Book book : books) {
                  %>
          <tr>
            <td><input type="checkbox" class="cbo" name="cboX" value="<%=book.getId()%>" /></td>
            <td><%=book.getId()%></td>
            <td>
              <a href="bookDetail?id=<%=book.getId()%>"><%=book.getName()%></a>
            </td>
            <td><%=book.getAuthor()%></td>
            <td><%=book.getPrice()%></td>
            <td><%=book.getPress()%></td>
            <td>
                <input type="button" onclick="updAss(this);"   class="btn btn-secondary" data-toggle="modal" data-target="#exampleModalCenterupd" value="更新" />
                <input type="button" class="btn btn-danger" onclick="delClick(<%=book.getId()%>);" value="删除"/>

            </td>          </tr>
          <%
            }
          %>
        </table>
        <input type="button"  data-toggle="modal" class="btn btn-secondary" data-target="#exampleModalCenteradd" value="添加新书籍" />
        <input type="button"  style="margin-left:15px;" class="btn btn-secondary"  value="批量删除" />
    </div>

<!--  修改的消息弹框  -->
<div class="modal fade" id="exampleModalCenterupd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitleupd" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

        <!-- 修改的表单 -->
        <form action="/bookUpdate" method="post">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitleupd">更新信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                    <div class="form-group row">
                        <label for="idUpd" class="col-sm-2 col-form-label">ID</label>
                        <div class="col-sm-10">
                            <input type="number" setp="0.01" name="id" placeholder="请输入ID" autocomplete="off" class="form-control"  id="idUpd">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nameUpd" class="col-sm-2 col-form-label">书名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" value="dsfdsfsdf" autocomplete="off" id="nameUpd" placeholder="请输入书名">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="authorUpd" class="col-sm-2 col-form-label">作者</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" class="form-control" autocomplete="off" id="authorUpd" placeholder="请输入作者">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="priceUpd" class="col-sm-2 col-form-label">价格</label>
                        <div class="col-sm-10">
                            <input type="number" name="price" class="form-control" autocomplete="off" id="priceUpd" placeholder="请输入价格">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="pressUpd" class="col-sm-2 col-form-label">出版社</label>
                        <div class="col-sm-10">
                            <input type="text" name="press" class="form-control" autocomplete="off" id="pressUpd" placeholder="请输入出版社">
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">更新</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


<!-- 添加的弹框 -->
<div class="modal fade" id="exampleModalCenteradd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <!-- 添加表单 -->
            <form action="/bookAdd">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">添加书籍</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="idAdd" class="col-sm-2 col-form-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" autocomplete="off" class="form-control" id="idAdd" placeholder="请输入ID" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nameAdd" class="col-sm-2 col-form-label">书名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" autocomplete="off"  class="form-control" id="nameAdd" placeholder="请输入书名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="authorAdd" class="col-sm-2 col-form-label">作者</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" autocomplete="off"  class="form-control" id="authorAdd" placeholder="请输入作者">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="priceAdd" class="col-sm-2 col-form-label">价格</label>
                        <div class="col-sm-10">
                            <input type="number" name="price" autocomplete="off"  class="form-control" id="priceAdd" placeholder="请输入价格">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="pressAdd" class="col-sm-2 col-form-label">出版社</label>
                        <div class="col-sm-10">
                            <input type="text" name="press" autocomplete="off"  class="form-control" id="pressAdd" placeholder="请输入出版社">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">添加</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>

            </form>
        </div>
    </div>
</div>



<script src="js_css/js/jquery-3.3.1.js" ></script>
<script src="js_css/js/bootstrap.min.js"></script>

<script>

    //点击更新赋值事件
    function updAss(x){
        var tds = x.parentNode.parentNode.getElementsByTagName("td");
        var id = tds[1].childNodes[0].nodeValue;
        var name = tds[2].getElementsByTagName("a")[0].childNodes[0].nodeValue;
        var author = tds[3].childNodes[0].nodeValue;
        var price = tds[4].childNodes[0].nodeValue;
        var press = tds[5].childNodes[0].nodeValue;


        $("#idUpd").val(id);
        $("#nameUpd").val(name);
        $("#authorUpd").val(author);
        $("#priceUpd").val(price);
        $("#pressUpd").val(press);

        console.log($("#idUpd"));
        console.log($("#idUpd").val());
        console.log($("#nameUpd"));
        console.log($("#nameUpd").val());


    }


    $('#exampleModalCenterupd').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) ;
            var recipient = button.data('whatever') ;
            var modal = $(this);
            //modal.find('.modal-title').text('New message to ' + recipient);
            modal.find('.modal-body input').val(recipient);
    });

    //添加js
    $('#exampleModalCenteradd').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) ;
        var recipient = button.data('whatever') ;
        var modal = $(this);
        //modal.find('.modal-title').text('New message to ' + recipient);
        modal.find('.modal-body input').val(recipient);
    });

      function delClick(x) {

          if(!window.confirm("确认删除吗？")){
              return false;
          }

          window.location.href="/bookDel?id="+x;
      }


      //全选点击事件
    document.getElementById("bigCbo").onclick = function () {
        console.log(document.getElementById("bigCbo").checked);
        var cbos = document.getElementsByClassName("cbo");
            for (var i = 0; i < cbos.length; i++) {
                cbos[i].checked = document.getElementById("bigCbo").checked;
            }
    }


    </script>
  </body>
</html>
