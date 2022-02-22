$(function(){
    $(".delivery_confirm").click(function(){
        let seq =$(this).attr("data-seq")
        $(".popup").css("display","block");
        $(".popup #save").attr("data-seq",seq);
    })
    $("#save").click(function(){
        if(!confirm("송장번호를 등록하시겠습니까?"))return;
        let number =$("#delivery_number").val();
        console.log(number);
        $.ajax({
            url:"/api/order/delivery?seq="+$(this).attr("data-seq")+"&delivery_no="+number,
            type:"patch",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
        $("#delivery_number").val("");
    })
    $("#cancel").click(function(){
        if(!confirm("송장번호 등록을 취소하시겠습니까?"))return;
        $(".popup").css("dispaly","none");
        $("#delivery_number").val("");
    })
})