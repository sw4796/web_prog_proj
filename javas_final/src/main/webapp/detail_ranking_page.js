$(document).ready(function(){
    pieAct();
})

function pieAct(){
    //그래프 viewBox 설정
    $(document).ready(function() {
        var pieWidth = $('.pie').width();
        $('.pie')[0].setAttribute('viewBox', '0 0 '+pieWidth +' '+pieWidth+'');
    })

    var color = ["white", "#FFCD0D", "#FFA40D", "green", "#217af4", "#FF1F0D", "#B117F4", "gray", "#804000", "black"]; //그래프 색상
    var angel = -90; //그래프 시작 지점
    var pieWidth = $('.pie').width();

    $('.pie circle').each(function(){
		var s = $(this).attr("idx");
        var percentData = $(this).data('percent'); //그래프 비율
        var perimeter = (pieWidth/2) * 3.14; //원의 둘레
        var percent =  percentData*(perimeter/100); //그래프 비율만큼 원의 둘레 계산

        //그래프 비율, 색상 설정
        $(this).css({
            'stroke-dasharray':percent+' '+perimeter, 
            'stroke':color[s],
            'transform':'rotate('+angel+'deg)'
        });
        $('.pie_info > li').eq(s).find('.color').css({'background':color[s]});
        
        //그래프 시작 지점 갱신
        angel += (percentData * 3.6);
    })
}