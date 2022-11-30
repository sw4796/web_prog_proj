
const today = new Date(); //오늘 date(고정)
const date = new Date(); //달력 만드는데 

// pad method
Number.prototype.pad = function() {
  return this > 9 ? this : '0' + this;
}

function set_main_size(){
  const main = document.querySelector("main");
  const calendar_size = document.querySelector(".rap").offsetHeight;
  main.style.height = `calc(${calendar_size}px + 110px + 60px + 200px`;
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
        htmlDummy += `<div id="date_${i}" class="today date" onclick="fn_selectDate(${i});">${i}</div>`;
      }else{
        htmlDummy += `<div id="date_${i}" class="date" onclick="fn_selectDate(${i});">${i}</div>`;
      }
  }

  // 다음달 날짜 표시하기
  for (let i = limitDay; i < nextDay; i++) {
    htmlDummy += `<div class="noColor"></div>`;
  }
  
  document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
  document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
  set_main_size();
}

makeCalendar(today);

// 이전달 이동
document.querySelector(`.prevDay`).onclick = () => {
makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
}

// 다음달 이동
document.querySelector(`.nextDay`).onclick = () => {
makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
}

const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".modal_overlay");
const clostBtn = modal.querySelector("button");
const modal_register = modal.querySelector(".modal_register");
const modal_list = modal.querySelector(".modal_list");
const back_list_button = modal.querySelector("#back");
const modal_list_header = modal.querySelector(".modal_list_header");


function openModal(){
  modal.classList.remove("hidden");
} 

function closeModal(){
  modal.classList.add("hidden");
  modal_list.classList.remove("hidden");
  modal_register.classList.add("hidden");
} 

function back_Modal_list(){
  modal_list.classList.remove("hidden");
  modal_register.classList.add("hidden");
}

function openModal_register(){
  modal_register.classList.remove("hidden");
  modal_list.classList.add("hidden");
  document.querySelector("form").reset();
}

overlay.addEventListener("click",closeModal);
clostBtn.addEventListener("click",closeModal);
back_list_button.addEventListener("click",back_Modal_list);

function fn_selectDate(click_date){
  var year = date.getFullYear();
  var month = date.getMonth() + 1;
  var date_txt = "";
  if(date.getMonth + 1 < 10){
    month = "0" + (date.getMonth() + 1);
  }
  date_txt = year+"-"+month+"-";

  if(click_date < 10){
    date_txt += "0" + click_date;
  }else{
    date_txt += "" + click_date;
  }
  
  modal_register_date = document.querySelector("#date");
  modal_register_date.setAttribute('value', date_txt);
  modal_register_date.setAttribute('class', 'input_form');
  modal_list_header.querySelector("h3").innerText = date_txt.substring(5,).replace("-","/") + " 활동 List";

  openModal();

}

function open_activity_info(activity){
  console.log(activity.lastChild.previousSibling);
  activity.lastChild.previousSibling.classList.toggle("hidden");
}

$.ajax({
  type: 'post',
  url: "get_calender",
  data: {
    month: date.getMonth() + 1 + "",
    year: date.getFullYear() + ""
  },
  dataType: 'json',
  success: function(data){
    console.log(data);
  },
  error: function(){
    console.log("ajax_error");
  }
});
