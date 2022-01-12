<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xtra Blog</title>
        <link rel="stylesheet" href="assets/fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">

    </head>
    <body>
        <header>
            <%@include file="navbar_basic.jsp" %>
        </header>
        <div class="container-fluid">
            <main class="tm-main">
                <div class="col-12">
                    <h2 class="tm-color-primary tm-post-title tm-mb-60" style="margin-left: 200px;">Register</h2>
                </div>
                <div class="col-lg-7 ">
                    <form  id="register" class="mb-5 ml-auto mr-0 tm-form"> 
                        <div class="form-group row mb-4">
                            <label for="name" class="col-sm-3 col-form-label text-right tm-color-primary">Name</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto" name="name"  type="text" required>                            
                            </div>
                        </div>

                        <div class="form-group row mb-4">
                            <label for="email" class="col-sm-3 col-form-label text-right tm-color-primary">Email</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto" name="email" id="email" type="email" required>                            
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label for="password" class="col-sm-3 col-form-label text-right tm-color-primary">Password</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto" name="password"  type="password" required>
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label for="about" class="col-sm-3 col-form-label text-right tm-color-primary">About</label>
                            <div class="col-sm-9">
                                <textarea id="about" class="form-control mr-0 ml-auto" name="about" rows="3" cols="30" placeholder="enter something about yourself."></textarea>                       
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label for="image" class="col-sm-3 col-form-label text-right tm-color-primary">Profile Image</label>
                            <div class="col-sm-9">
                                <input type="file" class="form-control mr-0 ml-autol" name="image" id="proimage" required>                      
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-12 text-center">
                                <button id="reg_btn" class="tm-btn tm-btn-primary tm-btn-small align-self-center">Register</button>  
                            </div>  
                        </div>
                    </form>
                </div>   

            </main>
        </div>



        <%@include file="footer.jsp" %>
        <script src="assets/jquery.min1.js"></script>
        <script src="assets/js/propper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/templatemo-script.js"></script>


        <script>
            $(document).ready(function () {
                $('#register').on('submit', function () {

                    event.preventDefault();
                    $('#reg_btn').hide();
                    var form_data = new FormData(this);
                    $.ajax({
                        url: "Register",
                        data: form_data,
                        method: "POST",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.trim() === "done") {
                                alert("Registration success we redirect to login page.");
                                window.location = "login.jsp";
                            } else {
                                $("#email_ver").html(data);
                                $('#reg_btn').show();
                                //alert(data);
                            }
                        },
                        error: function () {
                            alert("error");
                            $('#reg_btn').show();
                        }
                    })
                })
            });

        </script>
    </body>

</html>
</body>
