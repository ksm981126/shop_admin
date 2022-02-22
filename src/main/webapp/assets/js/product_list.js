// product_list.js
$(function(){
    $("#root_cate").change(function(){
        let seq = $(this).val();
        $("#small_cate").html('<option value="0">소분류 선택</option>');
        $("#small_cate").prop("disabled", true);
        // alert(seq);
        $.ajax({
            url:"/category/get/child?parent_seq="+seq,
            type:"get",
            success:function(r) {
                $("#mid_cate").html('<option value="0">중분류 선택</option>')
                if(r.length > 0) {
                    $("#mid_cate").prop("disabled", false);
                    for(let i=0; i<r.length; i++) {
                        let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                        $("#mid_cate").append(tag);
                    }
                }
                else {
                    $("#mid_cate").prop("disabled", true);
                }
            }
        })
    })

    $("#mid_cate").change(function(){
        let seq = $(this).val();
        $.ajax({
            url:"/category/get/child?parent_seq="+seq,
            type:"get",
            success:function(r) {
                $("#small_cate").html('<option value="0">소분류 선택</option>')
                if(r.length > 0) {
                    $("#small_cate").prop("disabled", false);
                    for(let i=0; i<r.length; i++) {
                        let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                        $("#small_cate").append(tag);
                    }
                }
                else {
                    $("#small_cate").prop("disabled", true);
                }
            }
        })
    })
    let delivery_keyword = ""
    let delivery_seq = 0;
    let delivery_name = "";
    $("#pi_delivery").click(function(){
        $.ajax({
            url:"/delivery/list?keyword="+delivery_keyword,
            type:"get",
            success:function(data) {
                console.log(data);
                $(".delivery_list tbody").html("");
                for(let i=0; i<data.length; i++) {
                    let tag = 
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
                    delivery_seq = $(this).attr("data-seq");
                    delivery_name = $(this).attr("data-name");
                    // $("#pi_delivery").attr("di-seq", seq);
                    // $("#pi_delivery").val(name);
                    $(".delivery_list tr").css("background-color", "");
                    $(this).parent().parent().css("background-color", "yellow");
                })
                $(".delivery_popup").css("display", "block");
            }
        })
    });
    $("#delivery_search_btn").click(function(){
        delivery_keyword = $("#delivery_keyword").val();
        $("#pi_delivery").trigger("click");
    });
    $("#delivery_keyword").keydown(function(e) {
        if(e.keyCode == 13) $("#delivery_search_btn").trigger("click");
    });
    $("#delivery_save").click(function(){
        $("#pi_delivery").attr("di-seq", delivery_seq);
        $("#pi_delivery").val(delivery_name);
        $(".delivery_list tr").css("background-color", "");
        $(".delivery_popup").css("display", "");
    });
    $("#delivery_cancel").click(function(){
        delivery_seq = 0;
        delivery_name = "";
        $(".delivery_list tr").css("background-color", "");
        $(".delivery_popup").css("display", "");
    });

    let manufacturer_keyword = ""
    let manufacturer_seq = 0;
    let manufacturer_name = "";
    let manufacturer_offset = 0;
    $("#pi_manufacturer").click(function(){
        $.ajax({
            url:"/manufacturer/list?keyword="+manufacturer_keyword+"&offset="+manufacturer_offset,
            type:"get",
            success:function(r) {
                console.log(r);
                $(".mf_pager_area").html("");
                for(let i=0; i<r.page; i++) {
                    let page = manufacturer_offset / 10;
                    let tag = ""
                    if(i == page) {
                        tag = '<button class="mf_pager active" data-offset="'+(i*10)+'">'+(i+1)+'</button>';
                    }
                    else {
                        tag = '<button class="mf_pager" data-offset="'+(i*10)+'">'+(i+1)+'</button>';
                    }
                    $(".mf_pager_area").append(tag);
                }

                $(".mf_pager").click(function(){
                    if(manufacturer_offset == $(this).attr("data-offset")) return;
                    manufacturer_offset = $(this).attr("data-offset");
                    $("#pi_manufacturer").trigger("click");
                })

                $(".manufacturer_list tbody").html("");
                for(let i=0; i<r.list.length; i++) {
                    let tag = 
                        '<tr>'+
                            '<td>'+r.list[i].mfi_name+'</td>'+
                            '<td>'+r.list[i].mfi_phone+'</td>'+
                            '<td>'+r.list[i].mfi_email+'</td>'+
                            '<td><button class="manufacturer_sel" data-seq="'+r.list[i].mfi_seq+'" data-name="'+r.list[i].mfi_name+'">선택</button></td>'+
                        '</tr>';
                    $(".manufacturer_list tbody").append(tag);
                }
                $(".manufacturer_sel").click(function(){
                    manufacturer_seq = $(this).attr("data-seq");
                    manufacturer_name = $(this).attr("data-name");
                    $(".manufacturer_list tr").css("background-color", "");
                    $(this).parent().parent().css("background-color", "yellow");
                })
                $(".manufacturer_popup").css("display", "block");
            }
        })
    })

    $("#manufacturer_save").click(function(){
        $("#pi_manufacturer").attr("data-seq", manufacturer_seq);
        $("#pi_manufacturer").val(manufacturer_name);
        $(".manufacturer_list tr").css("background-color", "");
        $(".manufacturer_popup").css("display", "");
    });
    $("#manufacturer_cancel").click(function(){
        manufacturer_seq = 0;
        manufacturer_offset = 0;
        manufacturer_name = "";
        $(".manufacturer_list tr").css("background-color", "");
        $(".manufacturer_popup").css("display", "");
    });
    $("#manufacturer_search_btn").click(function(){
        manufacturer_offset = 0;
        manufacturer_keyword = $("#manufacturer_keyword").val();
        $("#pi_manufacturer").trigger("click");
    })
    $("#manufacturer_keyword").keydown(function(e){
        if(e.keyCode == 13) $("#manufacturer_search_btn").trigger("click");
    })

    $("#save").click(function(){
        let cate_seq = 0;
        if($("#small_cate").val() != 0) {
            cate_seq = $("#small_cate").val()
        }
        else if($("#mid_cate").val() != 0) {
            cate_seq = $("#mid_cate").val()
        }
        else if($("#root_cate").val() != 0) {
            cate_seq = $("#root_cate").val()
        }
        else {
            alert("카테고리를 선택해주세요")
            return;
        }

        if($(".img_item").length == 0) {
            alert("제품 이미지를 추가해주세요");
            return;
        }

        let arrImage = new Array();
        for(let i=0; i<$(".img_item").length; i++) {
            let img_data = {
                pii_img_url:$(".img_item").eq(i).attr("data-img"),
                pii_thumb:$(".img_item").eq(i).hasClass("thumbnail")
            }
            arrImage.push(img_data);
        }
        
        let arrDescImage = new Array();
        for(let i=0; i<$(".img_desc_item").length; i++) {
            let img_data = {
                pddi_img_url:$(".img_desc_item").eq(i).attr("data-img"),
                pddi_index:i
            }
            arrDescImage.push(img_data);
        }
        
        let data = {
            p_data:{
                pi_name:$("#pi_name").val(),
                pi_price:$("#pi_price").val(),
                pi_sub_title:$("#pi_sub_title").val(),
                pi_discount_rate:$("#pi_discount_rate").val(),
                pi_point_rate:$("#pi_point_rate").val(),
                pi_stock:$("#pi_stock").val(),
                pi_cate_seq:cate_seq,
                pi_seller_seq:$("#pi_seller").attr("data-seq"),
                pi_delivery_seq:$("#pi_delivery").attr("di-seq"),
                pi_mfi_seq:$("#pi_manufacturer").attr("data-seq"),
                pi_status:$("#pi_status option:selected").val()
            },
            p_img_list:arrImage,
            p_desc:{
                pdd_content:$("#prod_description").val()
            },
            p_desc_img_list:arrDescImage
        }
        
        $.ajax({
            url:"/product/add",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(r) {
                alert(r.message);
                if(r.status)
                    location.reload();
            }
        })
    })

    $("#prod_img_add").click(function(){
        let form = $("#prod_img_form");
        let formData = new FormData(form[0]);
        $.ajax({
            url:"/image/upload/product",
            type:"post",
            data:formData,
            contentType:false,
            processData:false,
            success:function(r) {
                if(r.status) {
                    let tag = 
                        '<div class="img_item" data-img="'+r.image_uri+'" style="background-image: url(/image/product/'+r.image_uri+');">'+
                            '<button class="img_delete" onclick="onClickImageDelete('+$(".img_item").length+', \'.img_item\')">'+
                                '<i class="fas fa-times"></i>'+
                            '</button>'+
                        '</div>';
                    $(".product_imgs").append(tag);
                    if($(".img_item").length == 1) $(".img_item").addClass("thumbnail");
                    $("#prod_img_input").val("")
                }
            }
        })
    })

    $("#prod_desc_img_add").click(function(){
        let form = $("#prod_desc_img_form");
        let formData = new FormData(form[0]);

        $.ajax({
            url:"/image/upload/product",
            type:"post",
            data:formData,
            contentType:false,
            processData:false,
            success:function(r) {
                // alert(r.message);
                if(r.status) {
                    let tag = 
                        '<div class="img_desc_item" data-img="'+r.image_uri+'" style="background-image: url(/image/product/'+r.image_uri+');">'+
                            '<button class="img_desc_delete" onclick="onClickImageDelete('+$(".img_desc_item").length+', \'.img_desc_item\')">'+
                                '<i class="fas fa-times"></i>'+
                            '</button>'+
                        '</div>';
                    $(".product_desc_imgs").append(tag);
                    $("#prod_desc_img_input").val("");
                }
            }
        })
    })

    $(".product_img_add .icon").click(function(){
        $("#prod_img_input").trigger("click");
    })
    $("#prod_img_input").change(function(){
        if($(this).val() == "" || $(this).val() == null || $(this).val() == undefined) return;
        $("#prod_img_add").trigger("click");
    })

    $(".product_desc_img_add .icon").click(function(){
        $("#prod_desc_img_input").trigger("click");
    })
    $("#prod_desc_img_input").change(function(){
        if($(this).val() == "" || $(this).val() == null || $(this).val() == undefined) return;
        $("#prod_desc_img_add").trigger("click");
    })
    $("#add_product").click(function(){
        $(".popup_wrap").css("display","block");
        $(".popup_wrap").attr("mode","add");
        $(".popup h1 span").html("등록");
        $(".popup .btns #save").css("display","inline-block");
        $(".popup .btns #update").css("display","none");
    })

    $(".detail").click(function(){
        let seq = $(this).attr("data-seq");
        $(".popup_wrap").attr("mode", "modify");
        $(".popup_wrap").css("display", "block");
        $(".popup h1 span").html("상세 정보");
        $(".popup .btns #save").css("display", "none");
        $(".popup .btns #update").css("display", "inline-block");
        $("#update").attr("seq", seq);

        $.ajax({
            url:"/product/select_one?seq="+seq,
            type:"get",
            success:function(data) {
                console.log(data);
                $.ajax({
                    url:"/category/select_one?seq="+data.p_data.cate_seq,
                    type:"get",
                    success:function(cate) {
                        console.log(cate);
                        // Data setting
                        // 대, 중, 소
                        if(cate.parents.length == 2) {
                            $("#root_cate").val(cate.parents[1]).prop("selected", true);
                            $.ajax({
                                url:"/category/get/child?parent_seq="+cate.parents[1],
                                type:"get",
                                success:function(r) {
                                    $("#mid_cate").html('<option value="0">중분류 선택</option>')
                                    if(r.length > 0) {
                                        $("#mid_cate").prop("disabled", false);
                                        for(let i=0; i<r.length; i++) {
                                            let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                                            $("#mid_cate").append(tag);
                                        }
                                    }
                                    else {
                                        $("#mid_cate").prop("disabled", true);
                                    }
                                    $("#mid_cate").val(cate.parents[0])

                                    $.ajax({
                                        url:"/category/get/child?parent_seq="+cate.parents[0],
                                        type:"get",
                                        success:function(r) {
                                            $("#small_cate").html('<option value="0">소분류 선택</option>')
                                            if(r.length > 0) {
                                                $("#small_cate").prop("disabled", false);
                                                for(let i=0; i<r.length; i++) {
                                                    let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                                                    $("#small_cate").append(tag);
                                                }
                                            }
                                            else {
                                                $("#small_cate").prop("disabled", true);
                                            }
                                            $("#small_cate").val(cate.data.cate_seq).prop("selected", true);
                                        }
                                    })
                                }
                            })
                        }
                        // 대, 중
                        if(cate.parents.length == 1) {
                            $("#root_cate").val(cate.parents[0]).prop("selected", true);
                            $.ajax({
                                url:"/category/get/child?parent_seq="+cate.parents[0],
                                type:"get",
                                success:function(r) {
                                    $("#mid_cate").html('<option value="0">중분류 선택</option>')
                                    if(r.length > 0) {
                                        $("#mid_cate").prop("disabled", false);
                                        for(let i=0; i<r.length; i++) {
                                            let tag = '<option value="'+r[i].cate_seq+'">'+r[i].cate_name+'</option>';
                                            $("#mid_cate").append(tag);
                                        }
                                    }
                                    else {
                                        $("#mid_cate").prop("disabled", true);
                                    }
                                    $("#mid_cate").val(cate.data.cate_seq)
                                }
                            })
                        }
                        // 대
                        if(cate.parents.length == 0) {
                            $("#root_cate").val(data.p_data.cate_seq).prop("selected", true);
                        }
                    }
                })
                // 여기부터 다른 입력 값 설정
                    for(let i=0; i<data.p_img_list.length; i++){
                        let tag = 
                        '<div class="img_item" data-img="'+data.p_img_list[i]+'" style="background-image: url(/image/product/'+data.p_img_list[i]+');">'+
                            '<button class="img_delete" onclick="onClickImageDelete('+$(".img_item").length+', \'.img_item\')">'+
                                '<i class="fas fa-times"></i>'+
                            '</button>'+
                        '</div>';
                    $(".product_imgs").append(tag);
                    if($(".img_item").length == 1) $(".img_item").addClass("thumbnail");
                    }

                    for(let i=0; i<data.p_desc_img_list.length; i++){
                            let tag = 
                            '<div class="img_desc_item" data-img="'+data.p_desc_img_list[i]+'" style="background-image: url(/image/product/'+data.p_desc_img_list[i]+');">'+
                                '<button class="img_desc_delete" onclick="onClickImageDelete('+$(".img_desc_item").length+', \'.img_desc_item\')">'+
                                    '<i class="fas fa-times"></i>'+
                                '</button>'+
                            '</div>';
                        $(".product_desc_imgs").append(tag);
                    }

                    $("#pi_name").val(data.p_data.pi_name);
                    $("#pi_price").val(data.p_data.pi_price);
                    $("#pi_sub_title").val(data.p_data.pi_sub_title);
                    $("#pi_discount_rate").val(data.p_data.pi_discount_rate);
                    $("#pi_point_rate").val(data.p_data.pi_point_rate);
                    $("#pi_stock").val(data.p_data.pi_stock);
                    $("#pi_delivery").attr("di-seq",data.p_data.di_seq);
                    $("#pi_delivery").val(data.p_data.di_name);
                    $("#pi_manufacturer").attr("data-seq",data.p_data.mfi_seq);
                    $("#pi_manufacturer").val(data.p_data.mfi_name);
                    $("#pi_status").val(data.p_data.pi_status).prop("selected",true);
                    $("#prod_description").val(data.p_desc);
                    $("#pi_seller").val(data.p_data.si_name);
                    $("#pi_seller").attr("data-seq",data.p_data.si_seq);
                    
            }
        })
    })
    $(".popup .btns #cancel").click(function(){
        if(!confirm("취소하시겠습니까?\n입력된 내용은 저장되지 않습니다."))return;
        $(".popup_wrap").css("display","");
        $("#pi_name").val(""),
        $("#pi_price").val(""),
        $("#pi_sub_title").val(""),
        $("#pi_discount_rate").val(""),
        $("#pi_point_rate").val(""),
        $("#pi_stock").val(""),
        $("#pi_delivery").removeAttr("di-seq"),
        $("#pi_delivery").val(""),
        $("#pi_manufacturer").removeAttr("data-seq"),
        $("#pi_manufacturer").val(""),
        $("#pi_status").val(0).prop("selected",true);
        $("#prod_description").val("")
        $("#root_cate").val(0).prop("selected",true);
        $("#mid_cate").html('<option value="0">중분류 선택</option>');
        $("#small_cate").html('<option value="0">소분류 선택</option>');
        $("#mid_cate").prop("disabled",true);
        $("#small_cate").prop("disabled",true);
        
        // console.log($(".img_item, .img_desc_item").length);
        if($(".popup_wrap").attr("mode")=="add"){
            let file_list = new Array();
            for(let i=0; i<(".img_item, .img_desc_item").length; i++){
                let img =$(".img_item, .img_desc_item").eq(i).attr("data-img");
                file_list.push(img);
            }
            
            $.ajax({
                url:"/images/product",
                type:"delete",
                data:JSON.stringify(file_list),
                contentType:"application/json",
                success:function(msg){
                }
            })
        }
        $(".img_item, .img_desc_item").remove();
    })
    $(".delete").click(function(){
        if(!confirm("제품을 삭제하시겠습니까?"))return;
        let seq =$(this).attr("data-seq");
        $.ajax({
            url:"/product/delete?seq="+seq,
            type:"delete",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
    })

    $("#update").click(function(){
        let cate_seq = 0;
        if($("#small_cate").val() != 0) {
            cate_seq = $("#small_cate").val()
        }
        else if($("#mid_cate").val() != 0) {
            cate_seq = $("#mid_cate").val()
        }
        else if($("#root_cate").val() != 0) {
            cate_seq = $("#root_cate").val()
        }
        else {
            alert("카테고리를 선택해주세요")
            return;
        }

        if($(".img_item").length == 0) {
            alert("제품 이미지를 추가해주세요");
            return;
        }

        let arrImage = new Array();
        for(let i=0; i<$(".img_item").length; i++) {
            let img_data = {
                pii_img_url:$(".img_item").eq(i).attr("data-img"),
                pii_thumb:$(".img_item").eq(i).hasClass("thumbnail"),
                pii_pi_seq:$(this).attr("seq")
            }
            arrImage.push(img_data);
        }
        
        let arrDescImage = new Array();
        for(let i=0; i<$(".img_desc_item").length; i++) {
            let img_data = {
                pddi_img_url:$(".img_desc_item").eq(i).attr("data-img"),
                pddi_index:i,
                pddi_pi_seq:$(this).attr("seq")
            }
            arrDescImage.push(img_data);
        }
        
        let data = {
            p_data:{
                pi_seq:$(this).attr("seq"),
                pi_name:$("#pi_name").val(),
                pi_price:$("#pi_price").val(),
                pi_sub_title:$("#pi_sub_title").val(),
                pi_discount_rate:$("#pi_discount_rate").val(),
                pi_point_rate:$("#pi_point_rate").val(),
                pi_stock:$("#pi_stock").val(),
                pi_cate_seq:cate_seq,
                pi_seller_seq:$("#pi_seller").attr("data-seq"),
                pi_delivery_seq:$("#pi_delivery").attr("di-seq"),
                pi_mfi_seq:$("#pi_manufacturer").attr("data-seq"),
                pi_status:$("#pi_status option:selected").val()
            },
            p_img_list:arrImage,
            p_desc:{
                pdd_content:$("#prod_description").val()
            },
            p_desc_img_list:arrDescImage
        }

        $.ajax({
            url:"/product/update",
            type:"patch",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(msg) {
                alert(msg);
                    location.reload();
            }
        })
    })
})

function onClickImageDelete(index, target) {
    $.ajax({
        url:"/image/product/"+$(target).eq(index).attr("data-img"),
        type:"delete",
        success:function(msg){
            console.log(msg);
            $(target).removeClass("thumbnail");
            $(target).eq(index).remove();
            for(let i=0; i<$(target).length; i++) {
                $(target).eq(i).find("button").attr("onclick", 'onClickImageDelete('+i+', \''+target+'\')')
            }
            $(target).eq(0).addClass("thumbnail");
        }
    })
    if($(".popup_wrap").attr("mode") == "modify"){
        // let type = target == ".img_item" ? "basic" : "detail";
        $("#cancel").prop("disabled",true);
        let type="";
        if(target == ".img_item") type ="basic";
        else type = "detail";

        $.ajax({
            url:"/product/delete_img/"+type+"?fileName="+$(target).eq(index).attr("data-img"),
            type:"delete",
            success:function(msg){
                console.log(msg);
            }
        })
    }
    

}




