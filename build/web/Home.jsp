<%-- 
    Document   : Home.jsp
    Created on : Dec 12, 2021, 6:42:29 PM
    Author     : SuDo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JBlog</title>
        <%@include file="WEB-INF/Style.jsp" %>



    </head>
    <body>
        <header>
            <%@include file="user_navbar.jsp" %>
        </header>

        <div class="container-fluid">
            <main class="tm-main">
                <!-- Search form -->
                <div class="row tm-row">
                    <div class="col-12">
                        <form id="searchForm" class="form-inline tm-mb-80 tm-search-form">                
                            <input class="form-control tm-search-input" name="q" type="text" placeholder="Search..." aria-label="Search">
                            <button class="tm-search-button" type="submit">
                                <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                            </button>                                
                        </form>
                    </div>                
                </div>            

                <div id="searchResult"></div>    
                <!--Post Area-->
                <div class="row tm-row" id="post-cont">
                    <!--End Post-->




                </div><!-- comment -->
            </main>
        </div>
        <%@include file="WEB-INF/Scripts.jsp" %>

        <script>
            function doSearch() {
                $('#searchForm').submit(function (event) {
                    event.preventDefault(); // prevent form submission
                    var query = $('input[name="q"]').val();

                    $.ajax({
                        type: 'GET',
                        url: 'SearchPost.jsp',
                        data: {'q': query},
                        success: function (data) {
                            // display search results in the page 

                            $("#searchResult").html(data);
                        },
                        error: function () {
                            alert('An error occurred while searching for posts');
                        }
                    });
                });

            }

            $(document).ready(function (e) {
                getAllPost();
                doSearch();
            });
        </script>

    </body>

</html>