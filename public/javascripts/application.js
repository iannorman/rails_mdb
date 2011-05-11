// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
        $("#add-comment-button").click(addComment);
})

var addComment = function(){
        var film_id = $("#film_id").val();
        url = "/films/" + film_id + "/comments"
        data = $("#add-comment-form").serialize();
        $.ajax({
                        type: 'POST',
                        url: url,
                        data: data,
                        success: function(result){
                            $("#comments-container").append(result);
                            $("#add_comment_text").val('');
                        },
                        error: function(response){
                                switch(response.status){
                                        case 401 : alert("you must sign in as a user to post comments"); break;
                                        case 422 : alert("cannot add comment"); break;
                                }
                        }
        });
}
