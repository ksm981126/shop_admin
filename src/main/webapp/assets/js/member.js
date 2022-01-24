$(function(){
    $("#search_btn").click(function(e){
        e.preventDefault();
        let type = $("#search_type option:selected").val();
        let keyword = $("#keyword").val();
        location.href="/account/member?type="+type+"&keyword="+keyword;
    
        $("#keyword").keydown(function(e){
            if(e.keyCode == 13) $("#search_btn").trigger("click");
        })
    })

    $("#add_member").click(function(){
        $(".popup_wrap").css("display","block");
        $(".popup_wrap h2 span").html("추가");
        $("#save").css("display","inline-block");
        $("#update").css("display","none");
    })

    $("#cancel").click(function(){
        if(!confirm("취소하시겠습니까?\n입력된 정보는 저장되지 않습니다.")) return;
        $(".popup_wrap").css("display","none");
        $("#mi_email").val("");
        $("#mi_name").val("");
        $("#mi_pwd").val("");
        $("#mi_pwd_confirm").val("");
        $("#mi_phone").val("");
        $("#mi_birth").val("");
        $("#mi_gen").val(0).prop("selected",true);
        $("#mi_address").val("");
        $("#mi_grade").val(0).prop("selected",true);
        $("#mi_status").val(1).prop("selected",true);

        $("#mi_email").prop("disabled",false);
        $("#mi_pwd").prop("disabled",false);
        $("#mi_pwd_confirm").prop("disabled",false);
    })
    $(".modify").click(function(){
        let seq = $(this).attr("data-seq");

        $("#update").attr("data-seq", seq);
        $(".popup_wrap").css("display","block");
        $(".popup_wrap h2 span").html("수정");
        $("#save").css("display","none");
        $("#update").css("display","inline-block");
        
        $.ajax({
            url:"/member/select_one?seq="+seq,
            type:"get",
            success:function(data){
                $("#mi_email").val(data.mi_email).prop("disabled", true);
                $("#mi_pwd").val("*************").prop("disabled",true);
                $("#mi_pwd_confirm").val("*************").prop("disabled",true);
                
                $("#mi_name").val(data.mi_name);
                $("#mi_phone").val(data.mi_phone);
                $("#mi_birth").val(data.mi_birth);
                $("#mi_address").val(data.mi_address);
                $("#mi_gen").val(data.mi_gen).prop("selected",true);
                $("#mi_grade").val(data.mi_grade).prop("selected",true);
                $("#mi_status").val(data.mi_status).prop("selected",true);
                }
            })
        })

        $(".delete").click(function(){
            if(!confirm("삭제하시겠습니까?\n이 동작은 되돌릴 수 없습니다."))return;
            let seq = $(this).attr("data-seq");
            $.ajax({
                url:"/member/delete?seq="+seq,
                type:"delete",
                success:function(msg){
                    alert(msg);
                    location.reload();
                }
            })
        })
        $("#save").click(function(){
            if(!confirm("등록하시겠습니까?"))return;
            let data = {
                mi_email : $("#mi_email").val(),
                mi_name : $("#mi_name").val(),
                mi_pwd : $("#mi_pwd").val(),
                mi_phone : $("#mi_phone").val(),
                mi_birth : $("#mi_birth").val(),
                mi_gen : $("#mi_gen option:selected").val(),
                mi_address : $("#mi_address").val(),
                mi_grade : $("#mi_grade option:selected").val(),
                mi_status : $("#mi_status option:selected").val()
        }
        $.ajax({
            url:"/member/add",
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
        $("#update").click(function(){
            if(!confirm("수정하시겠습니까?"))return;
            let data = {
                mi_seq:$(this).attr("data-seq"),
                mi_email : $("#mi_email").val(),
                mi_name : $("#mi_name").val(),
                mi_pwd : $("#mi_pwd").val(),
                mi_phone : $("#mi_phone").val(),
                mi_birth : $("#mi_birth").val(),
                mi_gen : $("#mi_gen option:selected").val(),
                mi_address : $("#mi_address").val(),
                mi_grade : $("#mi_grade option:selected").val(),
                mi_status : $("#mi_status option:selected").val()
            }
            $.ajax({
                url:"/member/update",
                type:"patch",
                data:JSON.stringify(data),
                contentType:"application/json",
                success:function(msg){
                    alert(msg);
                    location.reload();
                }
            })
        })
})
