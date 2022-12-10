window.onload=function(){
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
}

function signupCheck()
{
	let id=document.getElementById("id").value;
	let name=document.getElementById("name").value;
	let pw1=document.getElementById("pw1").value;
	let pw2=document.getElementById("pw2").value;
	let Qans=document.getElementById("Qans").value;
	let idcheck=document.getElementById("idcheck").className;
	
	//message2.innerHTML=id+","+name+","+pw1+","+Qans+","+idcheck;
	if((id!="")&&(name!="")&&(pw1!="")&&(pw1==pw2)&&(Qans!="")&&(idcheck=="check"))
	{
		
		document.getElementById("signup").submit();
	}
	else {
		alert("모든 정보를 입력하세요.");
	}
}

function passCheck()
{   
    const message=document.getElementById("message");
    let pw1=document.getElementById("pw1").value;
	let pw2=document.getElementById("pw2").value;
    if(pw1==pw2)
    {
        message.innerHTML="비밀번호가 일치합니다.";
        
    }
    else
    {
        message.innerHTML="비밀번호가 일치하지 않습니다.";
    }
}

function idCheck()
{
	let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	let idcheck=document.getElementById("idcheck");
	let id=document.getElementById("id").value;

	if(id=="")
	{
		alert("이메일을 입력해주세요.");
		return;
	}
	if(regex.test(id)===false)
	{
		alert("이메일 형식으로 입력하세요");
		return;
	}
	
	$.ajax({
		type:'post',
		url:"ID_Duplicate_Check",
		data:{
			id:id
		},
		dataType:'json',
		success: function(data){
			let exist = data["exist"];
			console.log(exist);
			if(exist){
				alert("이미 사용중인 이메일입니다.");
				idcheck.className="uncheck";
			}else{
				alert("사용 가능한 이메일입니다.");
				idcheck.className="check";
			}
		},
		error: function(e){
			alert("ajax error");
		}
	});
}
/*
function loginCheck() {
		let id_list=[<%=values.toString()%>];
		let pw_list=[<%=pws.toString()%>];
		let id=document.getElementById("login_id").value;
		let pw=document.getElementById("login_pw").value;
		let idIndex=id_list.indexOf(id);
		
		if(!id_list.includes(id))
		{
			alert("입력하신 이메일에 해당하는 회원정보가 존재하지 않습니다.");
		}
		else
		{
			if(pw!=pw_list[idIndex])
			{
				alert("비밀번호가 일치하지 않습니다.");
			}
			else
			{
				document.getElementById("login").submit();
			}
		}
	}
*/


















