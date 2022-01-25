$(function(){
    $("#root_cate").change(function(){
        let seq = $(this).val();
        $("#small_cate").html('<option value="0">소분류 선택</option>')
        $("#small_cate").prop("disalbed",true);
        // alert(seq);
        $.ajax({
            url:"/category/get/child?parent_seq="+seq,
            type:"get",
            success:function(r){
                $("#mid_cate").html('<option value="0">중분류 선택</option>')
                console.log(r);
                if(r.length > 0) {
                    $("#mid_cate").prop("disabled",false);
                    for(let i=0; i<r.length; i++){
                        let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                        $("#mid_cate").append(tag);
                    }
                }
                else{
                    $("#mid_cate").prop("disalbed",true);
                }
            }
        })
    })

    $("#mid_cate").change(function(){
        let seq = $(this).val();
        // alert(seq);
        $.ajax({
            url:"/category/get/child?parent_seq="+seq,
            type:"get",
            success:function(r){
                $("#small_cate").html('<option value="0">소분류 선택</option>')
                console.log(r);
                if(r.length > 0) {
                    $("#small_cate").prop("disabled",false);
                    for(let i=0; i<r.length; i++){
                        let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                        $("#small_cate").append(tag);
                    }
                }
                else{
                    $("#small_cate").prop("disalbed",true);
                }
            }
        })
    })
    let delivery_keyword ="";
    let delivery_seq = 0;
    let delivery_name ="";
    $("#pi_delivery").click(function(){
        $.ajax({
            url:"/delivery/list?keyword="+delivery_keyword,
            type:"get",
            success:function(data){
                $(".delivery_list tbody").html();
                for(let i=0; i<data.length; i++){
                    let tag=
                    '<tr>'+
                            '<td>'+data[i].di_name+'</td>'+
                            '<td>'+data[i].di_price+'원</td>'+
                            '<td>'+
                                '<button class="delivery_select" data-seq="'+data[i].di_seq+'" data-name="'+data[i].di_name+'">선택</button>'+
                            '</td>'+
                        '</tr>';
                        $(".delivery_list tbody").append(tag);
                }
                $(".delivery_select").click(function(){
                    delivery_seq= $(this).attr("data-seq");
                    delivery_name= $(this).attr("data-name");
                    // $("#pi_delivery").attr("di_seq",seq);
                    // $("#pi_delivery").val(name);
                    $(".delivery_list tr").css("background-color", "");
                    $(this).parent().parent().css("background-color", "yellow");
                    
                })
            }
        })
    })
    $("#delivery_search_btn").click(function(){
        delivery_keyword =$("#delivery_keyword").val();
        $("#pi_delivery").trigger("click");
    })
    $("#delivery_keyword").keydown(function(e){
        if(e.keyCode == 13) $("#delivery_search_btn").trigger("click");
    })
    $("#delivery_save").click(function(){
        $("#pi_delivery").attr("di-seq", delivery_seq);
        $("#pi_delivery").val(delivery_name);
        $(".delivery_list tr").css("background-color", "");
    })
    $("#delivery_cancel").click(function(){
        delivery_seq = 0;
        delivery_name = "";
        $(".delivery_list tr").css("background-color", "");
    })
})