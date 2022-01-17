// assets/js/category.js
$(function(){
    resetPopup();
    function resetPopup() {
        $.ajax({
            type:"get",
            url:"/category/get/root",
            success:function(list) {
                $("#root_category").html("");
                $("#root_category").append('<option value="0">카테고리 선택</option>');
                for(let i=0; i<list.length; i++) {
                    let tag = '<option value="'+list[i].cate_seq+'">'+list[i].cate_name+'</option>';
                    $("#root_category").append(tag);
                }
            }
        })
    }
    $("#root_category").change(function(){
        let seq = $("#root_category option:selected").val();
        $("#child_category_1").html('<option value="0">카테고리 선택</option>');
        $.ajax({
            url:"/category/get/child?parent_seq="+seq,
            type:"get",
            success:function(list) {
                if(list.length == 0) return;
                for(let i=0; i<list.length; i++) {
                    let tag = '<option value="'+list[i].cate_seq+'">'+list[i].cate_name+'</option>';
                    $("#child_category_1").append(tag);
                }
            }
        })
    })

    $("#is_root").click(function(){
        let checked = $(this).prop("checked");
        $("#root_category").prop("disabled", checked);
        $("#child_category_1").prop("disabled", checked);
    })

    $("#save").click(function(){
        let parent_seq = null;
        if($("#is_root").prop("checked")) {
            // 체크박스가 체크되어있을 경우에는 상위 카테고리가 없음
            parent_seq = null;
        }
        else if($("#child_category_1").length != 0 && $("#child_category_1 option:selected").val() != 0) {
        // else if($("#child_category_1 option:selected").val() != undefined && $("#child_category_1 option:selected").val() != 0) {
            // 중분류 select 태그가 있고, option이 카테고리 선택이 아닌경우,
            // 상위 카테고리 번호는 중분류에서 선택한 카테고리의 번호로 세팅
            parent_seq = $("#child_category_1 option:selected").val();
        }
        else if($("#root_category option:selected").val() != 0) {
            // 중분류 select태그가 없거나, option이 카테고리 선택이고, 대분류 카테고리의 option이 카테고리 선택이 아닌 경우,
            // 상위 카테고리 번호는 대분류에서 선택한 카테고리의 번호로 세팅
            parent_seq = $("#root_category option:selected").val()
        }
        else {
            // 위의 경우 모두 해당하지 않으면, 상위 카테고리가 없는 상태로 세팅
            parent_seq = null;
        }
        let name = $("#category_name").val();
        let data = {
            "cate_name":name,
            "cate_parent":parent_seq
        };
        console.log(data);
        console.log(JSON.stringify(data));

        $.ajax({
            url:"/category/add",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(msg) {
                alert(msg);
                location.reload();
            }
        })
    })

    $(".category_delete").click(function(){
        let seq = $(this).attr("data-seq");
        if(!confirm("삭제하시겠습니까?")) return;
        $.ajax({
            url:"/category/delete?seq="+seq,
            type:"delete",
            success:function(msg) {
                alert(msg);
                location.reload();
            }
        })
    });

    $(".category_modify").click(function(){
        $(".add_category_wrap").css("display","block");
        $(".popup_titel span").html("수정");
        let seq = $(this).attr("data-seq");
        $("#save").css("display","none");
        $("#modify").css("display","inline-block");
        $("#modify").attr("data-seq",seq);
        $.ajax({
            url:"/category/select_one?seq="+seq,
            type:"get",
            success:function(r) {
                console.log(r);
                $("#category_name").val(r.data.cate_name);
                if(r.parents.length == 0){
                    $("#is_root").prop("checked", true);
                    $("#root_category").prop("disabled", true);
                    $("#child_category_1").prop("disabled", true);
                    $("#root_category").val(0).prop("selected",true);
                    $("#root_category_1").val(0).prop("selected",true);
                    return;
                }
                
                $("#is_root").prop("checked", false);
                $("#root_category").prop("disabled", false);
                $("#child_category_1").prop("disabled", false);

                if(r.parents.length == 1) {
                    $("#root_category").val(r.parents[0]).prop("selected", true);
                    $("#root_category").trigger("change");
                }
                if(r.parents.length == 2) {
                    $("#root_category").val(r.parents[1]).prop("selected", true);

                    let seq = $("#root_category option:selected").val();
                    $("#child_category_1").html('<option value="0">카테고리 선택</option>');
                    $.ajax({
                        url:"/category/get/child?parent_seq="+seq,
                        type:"get",
                        success:function(list) {
                            if(list.length == 0) return;
                            for(let i=0; i<list.length; i++) {
                                let tag = '<option value="'+list[i].cate_seq+'">'+list[i].cate_name+'</option>';
                                $("#child_category_1").append(tag);
                            }
                            $("#child_category_1").val(r.parents[0]).prop("selected",true);
                        }
                    })
                }
            }
        })
    })
    $("#modify").click(function(){
        if(!confirm("수정하시겠습니까?"))return;
        
        let seq = $(this).attr("data-seq");
        let parent_seq = null;
        if($("#is_root").prop("checked")) {
            // 체크박스가 체크되어있을 경우에는 상위 카테고리가 없음
            parent_seq = null;
        }
        else if($("#child_category_1").length != 0 && $("#child_category_1 option:selected").val() != 0) {
        // else if($("#child_category_1 option:selected").val() != undefined && $("#child_category_1 option:selected").val() != 0) {
            // 중분류 select 태그가 있고, option이 카테고리 선택이 아닌경우,
            // 상위 카테고리 번호는 중분류에서 선택한 카테고리의 번호로 세팅
            parent_seq = $("#child_category_1 option:selected").val();
        }
        else if($("#root_category option:selected").val() != 0) {
            // 중분류 select태그가 없거나, option이 카테고리 선택이고, 대분류 카테고리의 option이 카테고리 선택이 아닌 경우,
            // 상위 카테고리 번호는 대분류에서 선택한 카테고리의 번호로 세팅
            parent_seq = $("#root_category option:selected").val()
        }
        else {
            // 위의 경우 모두 해당하지 않으면, 상위 카테고리가 없는 상태로 세팅
            parent_seq = null;
        }
        let name = $("#category_name").val();
        let data = {
            "cate_seq":seq,
            "cate_name":name,
            "cate_parent":parent_seq
        };
        console.log(data);
        $.ajax({
            url:"/category/update",
            type:"patch",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
    })
    $("#add_category").click(function(){
        $(".add_category_wrap").css("display","block");
        $("#save").css("display","inline-block");
        $("#modify").css("display","none");
        $(".popup_titel span").html("추가");
    })

    $("#cancel").click(function(){
        if(!confirm("취소하시겠습니까?\n편집된 내용은 저장되지 않습니다.")) return;
        $(".add_category_wrap").css("display","");
    })
})