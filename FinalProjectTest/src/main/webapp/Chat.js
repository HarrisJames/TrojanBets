/**
 * 
 */
 
function addText()
{
	console.log("Test"); // Testing that the button calls function
	var usern = document.getElementById('user').value; // We need to add a username into the chat.jsp
	var msg = document.getElementById('message').value;
	getchatlistdiv = document.getElementById('i');
	newrow = document.createElement('p');
	newrow.innerHTML = usern + " - <g>" + msg + "</g>"; // John should be changed for username once implemented
	contentdiv = document.getElementById('chatroom');
	contentdiv.appendChild(newrow);
	getchatlistdiv.scrollTop = getchatlistdiv.scrollHeight;
	var httpreq = new XMLHttpRequest();
	httpreq.open("POST","ChatDispatcher?username=" + usern + "&msg=" + msg,true);
	httpreq.onreadystatechange = function(){
		if(httpreq.readyState == 4 && httpreq.status == 200){
			document.getElementById("result").innerHTML = 'sent';
			document.getElementById("result").innerHTML = "";
		}
	}
	httpreq.send(null);
}

function reloadChat()
{
	
	var httpreq = new XMLHttpRequest();
	httpreq.open("POST","reloadChat",true);
	
	httpreq.onreadystatechange = function(){
		if (httpreq.readyState == 4 && httpreq.status == 200){
			document.getElemenyById("chatroom").innerHTML = httpreq.responseText;
			olist = document.getElementById('chat-content');
			olist.scrollTop = olist.scrollHeight;
		}
	}
	
}