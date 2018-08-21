<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!doctype html>
<html lang="en">
<head>
    <!--  引入要修饰的页面title -->
    <title><sitemesh:title /></title>
    <%@include file="book_top_res.jsp"%>
</head>

<body>

<%@include file="book_top_nva.jsp"%>

<div class="container-fluid">
    <div class="row">

        <%@include file="book_body_nva.jsp"%>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <p class="h4">HELLO BOOTSTRAP!!!</p>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button class="btn btn-sm btn-outline-secondary">Share</button>
                        <button class="btn btn-sm btn-outline-secondary">Export</button>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar"></span>
                        This week
                    </button>
                </div>
            </div>

                <!-- 引入要修饰的网页body内容 -->
                <sitemesh:body></sitemesh:body>

            </div>
        </main>
    </div>
</div>

<%@include file="book_footer.jsp"%>

</body>
</html>
