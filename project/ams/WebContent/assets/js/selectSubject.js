//<script>
				function fillOption()
				{
					var sem="<optgroup>";
					var i=1;
				    var course=document.getElementById("course").value;
				    var lim=0;
				    var branch;
				    if(course=="mca")
				    {
				    	lim=6;branch="<option value=\"mca\">NOT APPLICABLE</option>";
				    }
				    else if(course=="btech")
				    {
				    	branch="<option value=\"cs\">Computer Science</option>"+"<option value=\"it\">Information Technology</option>";
				    	branch+="<option value=\"civil\">Civil Eng.</option>"+"<option value=\"me\">Mechanical Eng.</option>";
				    	lim=8;
				    }
				    else if(course=="mtech")
				    {
				    	branch="<option value=\"cs\">Computer Science</option>"+"<option value=\"it\">Information Technology</option>";
				    	branch+="<option value=\"civil\">Civil Eng.</option>"+"<option value=\"me\">Mechanical Eng.</option>";
				    	lim=4;
				    }
				    for(i=1;i<=lim;i++)
				    {
				    	sem+="<option value='"+i+"'>"+i+"</option>";
				    }
				    sem+="</optgroup>";
				    document.getElementById("semester").innerHTML=sem;
				    document.getElementById("branch").innerHTML=branch;
				}
//				</script>
