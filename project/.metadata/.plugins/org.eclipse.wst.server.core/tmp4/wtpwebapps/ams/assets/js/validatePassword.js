function validate()
{
	var password=document.getElementById("password").value;
	var rpassword=document.getElementById("rpassword").value;
	if(password!=rpassword)
	alert("Password and Confirm password must same");
}
