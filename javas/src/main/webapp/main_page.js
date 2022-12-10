const today = new Date(); //오늘 date(고정)
const date = new Date(); //달력 만드는데 

function mk_calender_mark(){
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let date_txt = year + "-" + month;
    $.ajax({
        type: 'post',
        url: "getinfo_calender",
        data: {
        date: date_txt
        },
        dataType: 'json',
        success: function(data){
        //json 배열 가져오기
        let data_array = data["data"];
        //배열 돌면서 date, location값 추출하기
        for (let i = 0; i < data_array.length; i++){
            let date = data_array[i]["date"];
            let color = data_array[i]["color"];
            put_mark_calender(date,color);
        }
        },
        error: function(e){
          alert("get_calender_mark: ajax_error");
          location.href="main.jsp";
        }
    });
}

function put_mark_calender(date, color){
    //date에서 한자리 수 한자리로 만들기
    let date_cut = date.slice(-2);
    if(date_cut[0] === "0"){ // 첫자리가 0이면 자르기
        date_cut = date_cut.slice(-1);
    }

    //날짜에 맞는 date 선택 
    let mark_date = document.querySelector(`#date_${date_cut}`);

    //mark 3개차면 끝내기
    if(mark_date.childElementCount >= 1+3)
        return;

    //mark 만들기
    let mark = document.createElement("div");
    mark.classList.add("calender_mark");
    mark.style.backgroundColor = color;

    mark_date.appendChild(mark);
}

function move_calender(){
    location.href = "calender.jsp";
}

// 달력 생성
const makeCalendar = (date) => {
    // 현재의 년도와 월 받아오기
    const currentYear = new Date(date).getFullYear();
    const currentMonth = new Date(date).getMonth() + 1;
  
    // 한달전의 마지막 요일
    const firstDay = new Date(currentYear, currentMonth - 1, 1).getDay();
    // 현재 월의 마지막 날 구하기
    const lastDay = new Date(currentYear, currentMonth, 0).getDate();
  
    // 남은 박스만큼 다음달 날짜 표시
    const limitDay = firstDay + lastDay;
    const nextDay = Math.ceil(limitDay / 7) * 7;
  
    let htmlDummy = '';
  
    // 한달전 날짜 표시하기
    for (let i = 0; i < firstDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }
  
    // 이번달 날짜 표시하기
    for (let i = 1; i <= lastDay; i++) {
      //오늘인 경우
      if(date.getDate()==i && date.getFullYear() == today.getFullYear() 
        && date.getMonth()==today.getMonth()){
          htmlDummy += `<div id="date_${i}" class="today date" onclick="move_calender();"><p>${i}</p></div>`;
        }else{
          htmlDummy += `<div id="date_${i}" class="date" onclick="move_calender();">
          <p>${i}</p>
          </div>`;
        }
    }
  
    // 다음달 날짜 표시하기
    for (let i = limitDay; i < nextDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }
    
    document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
    document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
    mk_calender_mark();
  }
  
  makeCalendar(today);


  //사진첩 js부분
  //current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
  
  
  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
  
    //next slide  
  $('#next').click(function(){
    slideRight();
  });
  
  //previous slide
  $('#previous').click(function(){
    slideLeft();
  });
  
  
  
  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 5000);
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 5000); }
  );
  
  

});//DOCUMENT READY
  


/***********
 SLIDE LEFT
************/
function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
  
  //*> optional
  countSlides();
  pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}



  
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}