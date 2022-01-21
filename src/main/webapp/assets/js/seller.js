$(function(){
    let uploaded_img ="";
    $("#img_upload").click(function(){
        if(uploaded_img != ""){   
            $.ajax({
                url:"/image/seller/"+uploaded_img,
                type:"delete",
                success: function(msg){
                    console.log(msg);
                    uploaded_img ="";
                }
            })
        }
            let form = $("#profile_img_form");
            let formData = new FormData(form[0]);
            $.ajax({
                url:"/image/upload/seller",
                type:"post",
                data:formData,
            contentType:false,
            processData:false,
            success:function(r){
                $("#profile_img").attr("src", "/image/seller/"+r.image_uri);
                uploaded_img =r.image_uri;
            }
        })
    })
    $("#img_delete").click(function(){
        if(uploaded_img =="" || uploaded_img == undefined || uploaded_img == null) return;
        $("#profile_img").attr("src", "/image/seller/default.jpg");
        $("#img_file").val("");
        $.ajax({
            url:"/image/seller/"+uploaded_img,
            type:"delete",
            success: function(msg){
                console.log(msg);
                uploaded_img ="";
            }
        })
    })
    $("#search_btn").click(function(e){
        e.preventDefault();
        let keyword = $("#keyword").val();
        location.href="/account/seller?keyword="+keyword;

        $("#keyword").keydown(function(e){
            $("#search_btn").trigger("click");
        })
    })
    $("#save").click(function(){
        if(!confirm("등록하시겠습니까")) return;

        if($("#si_pwd").val() != $("#si_pwd_confirm").val()){
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }
        if(uploaded_img =="" || uploaded_img == undefined || uploaded_img == null)
            uploaded_img = "default.jpg";
        let data= {
            si_id: $("#si_id").val(),
            si_pwd: $("#si_pwd").val(),
            si_name: $("#si_name").val(),
            si_email: $("#si_email").val(),
            si_phone: $("#si_phone").val(),
            si_address: $("#si_address").val(),
            si_status: $("#si_status option:selected").val(),
            si_img_url:uploaded_img
        }
        console.log(JSON.stringify(data));
        $.ajax({
            url:"/seller/add",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(r){
                alert(r.message);
                if(r.status)
                location.reload();
            }
        })
    })
    $(".modify").click(function(){
        let seq = $(this).attr("data-seq");
        $(".popup_wrap").css("display","block");
        $("#save").css("display","none");
        $("#update").css("display","inline-block");

        $.ajax({
            url:"/seller/select_one?seq="+seq,
            type:"get",
            success:function(data){
                console.log(data);
                $("#si_id").val(data.si_id).prop("disabld", true);
                $("#si_pwd").val("*************").prop("disabled",true);
                $("#si_pwd_confirm").val("*************").prop("disabled",true);

                
                $("#si_name").val(data.si_name);
                $("#si_email").val(data.si_email);
                $("#si_phone").val(data.si_phone);
                $("#si_address").val(data.si_address);
                $("#si_status").val(data.si_status).prop("selected",true);
                $("#profile_img").attr("src","/image/seller/"+data.si_img_url);
                uploaded_img = data.si_img_url
            }
        })
    })

    $("#update").click(function(){
        if(!confirm("수정하시겠습니까")) return;
        if(uploaded_img =="" || uploaded_img == undefined || uploaded_img == null)
            uploaded_img = "default.jpg";
        let data= {
            si_id: $("#si_id").val(),
            si_name: $("#si_name").val(),
            si_email: $("#si_email").val(),
            si_phone: $("#si_phone").val(),
            si_address: $("#si_address").val(),
            si_status: $("#si_status option:selected").val(),
            si_img_url:uploaded_img
        }
        $.ajax({
            url:"/seller/update",
            type:"patch",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(r){
                alert(r.message);
                if(r.status)
                    location.reload();
            }
        })
    })
    $(".delete").click(function(){
        if(!confirm("삭제하시겠습니까")) return;
        let seq =$(this).attr("data-seq");
        $.ajax({
            url:"/seller/delete?seq="+seq,
            type:"delete",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
    })
    $("#add_seller").click(function(){
        $(".popup_wrap").css("display","block");
        $("#save").css("display","inline-block");
        $("#update").css("display","none");
    });

    $("#cancel").click(function(){
        if(!confirm("취소하시겠습니까?\n입력한 정보는 저장되지 않습니다.")) return;
        $(".popup_wrap").css("display","none");
        $("#si_id").val("").prop("disabled",false);
        $("#si_name").val("");
        $("#si_pwd").val("").prop("disabled",false);
        $("#si_pwd_confirm").val("").prop("disabled",false);
        $("#si_email").val("");
        $("#si_phone").val("");
        $("#si_address").val("");
        $("#si_status").val(0).prop("selected",true);
        uploaded_img ="";
        $("#profile_img").attr("src", "/image/seller/default.jpg");
    })
    $(".profile_img_area .cover").click(function(){
        $("#img_file").trigger("click");
    })
    $("#img_file").change(function(){
        if($(this).val() == "" || $(this).val() == null) return ;
        $("#img_upload").trigger("click");
    })
    
    
})