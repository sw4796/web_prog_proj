
const today = new Date(); //오늘 date(고정)
const date = new Date(); //달력 만드는데 

function set_main_size(){
  const main = document.querySelector("main");
  const calendar_size = document.querySelector(".rap").offsetHeight;
  main.style.height = `calc(${calendar_size}px + 110px + 60px + 200px`;
}

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
        let location = data_array[i]["location"];
        let color = data_array[i]["color"];
        put_mark_calender(date,location,color);
      }
    },
    error: function(e){
      alert("get_calender_mark: ajax_error");
    }
  });
}

function put_mark_calender(date, location,color){
  //date에서 한자리 수 한자리로 만들기
  let date_cut = date.slice(-2);
  if(date_cut[0] === "0"){ // 첫자리가 0이면 자르기
    date_cut = date_cut.slice(-1);
  }

  //날짜에 맞는 date 선택 
  let mark_date = document.querySelector(`#date_${date_cut}`);
  
  //4개이면 더보기 버튼 추가
  if(mark_date.childElementCount == 1+3){
    let more_icon = document.createElement("img");
    more_icon.src = "image/more.png";
    more_icon.classList.add("more_icon");
    mark_date.appendChild(more_icon);
    return;
  //mark가 다 찼으면 끝내기(최대 3개)
  }else if(mark_date.childElementCount > 1+3)
    return;

  //mark 만들기
  let mark = document.createElement("div");
  mark.classList.add("calender_mark");
  mark.innerText = location;
  mark.style.backgroundColor = color;

  mark_date.appendChild(mark);
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
        htmlDummy += `<div id="date_${i}" class="today date" onclick="fn_selectDate(${i});"><p>${i}</p></div>`;
      }else{
        htmlDummy += `<div id="date_${i}" class="date" onclick="fn_selectDate(${i});">
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
  set_main_size();
  mk_calender_mark();
}

makeCalendar(today);

//html 지정해놓기
const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".modal_overlay");
const clostBtn = modal.querySelector("button");
const modal_register = modal.querySelector(".modal_register");
const modal_list = modal.querySelector(".modal_list");
const back_list_button = modal.querySelector("#back");
const modal_list_header = modal.querySelector(".modal_list_header");
const calender = document.querySelector(".rap");

// 이전달 이동
document.querySelector(`.prevDay`).onclick = () => {
makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
calender.classList.add("left");
setTimeout(function(){
  calender.classList.remove("left");
},500);
}

// 다음달 이동
document.querySelector(`.nextDay`).onclick = () => {
makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
calender.classList.add("right");
setTimeout(function(){
  calender.classList.remove("right");
},500);
}

//modal 열기
function openModal(){
  modal_list.classList.add("on");
  modal.classList.remove("hidden");
  setTimeout(function(){
    modal_list.classList.remove("on");
  },500);
}

//modal 닫기
function closeModal(){
  modal_list.classList.remove("on");
  modal_list.classList.add("off");
  modal_register.classList.add("off");
  setTimeout(function(){
    modal_list.classList.remove("off");
    modal_register.classList.remove("off");
    modal.classList.add("hidden");
    modal_list.classList.remove("hidden");
    modal_register.classList.add("hidden");
  },300);
}

//등록 modal 닫고 list modal 열기
function back_Modal_list(){
  modal_register.classList.add("hidden");
  modal_list.classList.add("left");
  modal_list.classList.remove("hidden");
  setTimeout(function(){
    modal_list.classList.remove("left");
  },500)
}

//등록하기 버튼 눌렀을 때
function openModal_register(){
  modal_register.classList.remove("hidden");
  modal_list.classList.add("hidden");
  document.querySelector("form").reset();
}

//배경 누르면 modal 닫기
overlay.addEventListener("click",closeModal);
//X표시 누르면 modal 닫기
clostBtn.addEventListener("click",closeModal);
//뒤로 가기 버튼 눌렀을 때
back_list_button.addEventListener("click",back_Modal_list);

//날짜 클릭했을 때 함수
function fn_selectDate(click_date){
  //날짜 가져오기
  var year = date.getFullYear();
  var month = date.getMonth() + 1;
  var date_txt = "";
  if(date.getMonth() + 1 < 10){
    month = "0" + (date.getMonth() + 1);
  }
  date_txt = year+"-"+month+"-";

  if(click_date < 10){
    date_txt += "0" + click_date;
  }else{
    date_txt += "" + click_date;
  }
  
  //등록 modal 날짜 input value 설정
  modal_register_date = document.querySelector("#date");
  modal_register_date.setAttribute('value', date_txt);
  //list modal header에 날짜 입력
  modal_list_header.querySelector("h3").innerText = date_txt.substring(5).replace("-","/") + " 활동 List";
  //오늘 날짜 텍스트로 변환
  today_date_txt = `${today.getFullYear()}-${today.getMonth()+1}-${today.getDate()}`;
  let register_button = document.querySelector("#register_button");

  $.ajax({
    type: 'post',
    url: "getlist_activity.jsp",
    data: {
      date: date_txt
    },
    dataType: 'html',
    success: function(data){
      $("#activity_list").html(data);
      //login이 되어있는 경우에만 고려
      if(register_button != null){
        //활동 시간이 이미 지난 경우
        if(new Date(date_txt) < new Date(today_date_txt)){
          register_button.classList.add("hidden");
        }else{
          register_button.classList.remove("hidden");
        }
      }
      openModal();
    },
    error: function(e){
      alert("ajax_error");
    }
  });

}

//클릭하면 활동정보 드롭다운 함수
let slideToggle=true;
function open_activity_info(activity){
  info = activity.nextSibling.nextSibling;
  if(slideToggle){
    $(info).stop().slideDown(500);
  }else{
    $(info).stop().slideUp(500);
  }
  slideToggle=!slideToggle;
};

function participate_activity(user_id,act_id,name){
  $.ajax({
    type: 'post',
    url: "put_participation.do",
    data: {
      user_id: user_id,
      act_id: act_id,
      name: name
    },
    dataType: 'boolean',
    success: function(status){
      if(status === "success"){
        alert("활동 참가 신청완료!");
      }else if(status === "fail"){
        alert("활동 참가에 실패했습니다.");
      }else if(status === "exist"){
        alert("이미 신청이 완료되었습니다.");
      }else if(status === "full"){
        alert("신청이 마감되었습니다.");
      }else{
        alert("error");
      }
    },
    error: function(e){
      alert("get_calender_mark: ajax_error");
    }
  });
}