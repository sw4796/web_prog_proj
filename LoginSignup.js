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
	const message2=document.getElementById("message2");
	let id=document.getElementById("id").value;
	let name=document.getElementById("name").value;
	let pw1=document.getElementById("pw1").value;
	let pw2=document.getElementById("pw2").value;
	let Qans=document.getElementById("Qans").value;
	let idcheck=document.getElementById("idcheck").class;
	//message2.innerHTML=id+","+name+","+pw1+","+Qans+","+idcheck;
	if((id=="")||(name=="")||(pw1=="")||(pw1!=pw2)||(Qans=="")||(idcheck=="uncheck")===true)
	{
		alert("모든 정보를 입력해야 합니다.");
	}
	else
	{
		document.getElementById("signup").submit();
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