<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="/bookList">
                    <span data-feather="home"></span>
                    书籍列表 <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a onclick="funClick();" class="nav-link" href="#">
                    <span data-feather="file"></span>
                    新增书籍
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="shopping-cart"></span>
                    作者管理
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="users"></span>
                    导出数据
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="bar-chart-2"></span>
                    订单管理
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="layers"></span>
                    库存管理
                </a>
            </li>
        </ul>

        <%--<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">--%>
            <%--<span>另一级</span>--%>
            <%--<a class="d-flex align-items-center text-muted" href="#">--%>
                <%--<span data-feather="plus-circle"></span>--%>
            <%--</a>--%>
        <%--</h6>--%>
        <ul class="nav flex-column mb-2">
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    用户管理
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    系统设置
                </a>
            </li>
        </ul>
    </div>
</nav>



<%--<script>--%>
    <%----%>
     <%--var lis =  document.getElementsByClassName("nav-item");--%>
    <%--for(var i=0;i<lis.length;i++){--%>
        <%--lis[i].setAttribute("style","color:black;");--%>
    <%--}--%>

<%--</script>--%>