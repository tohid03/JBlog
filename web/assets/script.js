//Get All Post

function getAllPost() {
    $.ajax({
        url: "getPost.jsp"

        , success: function (data, textStatus, jqXHR) {
            //console.log(data)
            $("#post-cont").html(data);
        }
    })
}
function getPostByUserId(userId) {
    $.ajax({
        url: "getPost.jsp",
        data: {userId: userId}
        , success: function (data, textStatus, jqXHR) {
            //console.log(data)
            $("#post-cont").html(data);
        }
    })
}
function getPostByCategoryId(catId) {
    $.ajax({
        url: "getPost.jsp",
        data: {cid: catId}
        , success: function (data, textStatus, jqXHR) {
            //console.log(data)
            $("#post-cont").html(data);
        }
    })
}



