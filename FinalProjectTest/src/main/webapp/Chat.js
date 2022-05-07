/**
 * 
 */
 
function addText()
{
	console.log("Test"); // Testing that the button calls function
	// var username = document.getElementById('username').value; // We need to add a username into the chat.jsp
	var msg = document.getElementById('message').value;
	getchatlistdiv = document.getElementById('i');
	newrow = document.createElement('p');
	newrow.innerHTML = "John " + "- <g>" + msg + "</g>"; // John should be changed for username once implemented
	contentdiv = document.getElementById('chatroom');
	contentdiv.appendChild(newrow);
	getchatlistdiv.scrollTop = getchatlistdiv.scrollHeight;
	
	
}