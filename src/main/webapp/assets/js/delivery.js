$(function(){
    $("#search_btn").click(function(e){
        e.preventDefault();
        let keyword = $("#keyword").val();
        location.href="/manage/delivery?keyword="+keyword;
    })
    $("#add_delivery").click(function(){
        $(".delivery_popup_wrap").css("display","block");
        $(".delivery_popup h2 span").html("추가");
        $("#save").css("display", "inline-block");
        $("#update").css("display","none");

    })
    $("#save").click(function(){
        if(!confirm("추가하시겠습니까?")) return;
        let data ={
            di_name :$("#delivery_name").val(),
            di_price :$("#delivery_price").val()
        }
        $.ajax({
            url:"/delivery/add",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
    })
    $("#update").click(function(){
        if(!confirm("수정하시겠습니까?\n이 동작은 취소할 수 없습니다.")) return;
        let data ={
            di_seq:$(this).attr("data-seq"),
            di_name :$("#delivery_name").val(),
            di_price :$("#delivery_price").val()
        }
        $.ajax({
            url:"/delivery/update",
            type:"patch",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })

    })
    $("#cancel").click(function(){
        if(!confirm("취소하시겠습니까?\n입력된 정보는 저장되지 않습니다.")) return;
        $(".delivery_popup_wrap").css("display","none");
        $("#delivery_name").val("");
        $("#delivery_price").val("");
    })
    $(".modify").click(function(){
        $(".delivery_popup_wrap").css("display","block");
        let seq =$(this).attr("data-seq");
        $.ajax({
            url:"/delivery/select_one?seq="+seq,
            type:"get",
            success:function(item){
                $("#delivery_name").val(item.di_name);
                $("#delivery_price").val(item.di_price);
            }
        })
        $("#update").attr("data-seq",seq);
        $(".delivery_popup h2 span").html("수정");
        $("#save").css("display", "none");
        $("#update").css("display","inline-block");
    })
    $(".delete").click(function(){
        if(!confirm("삭제하시겠습니까?\n이 동작은 취소할 수 없습니다..")) return;
        let seq =$(this).attr("data-seq");
        $.ajax({
            url:"/delivery/delete?seq="+seq,
            type:"delete",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
    })
})