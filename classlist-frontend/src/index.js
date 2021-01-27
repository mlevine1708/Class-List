console.log("testing...")
const BACKEND_URL = 'http://localhost:3000';
fetch(`${BACKEND_URL}/test`)
  .then(response => response.json())
  .then(parsedResponse => renderList(parsedResponse));

function renderList(response) {
    var element = document.querySelector(".student-list")
    element.innerHTML="<ul>"
    for (var i=0; i<response["students"].length;i++){
        console.log(response["students"][i])
        element.innerHTML+="<li>"+response["students"][i].name+"</li>"
    }
    element.innerHTML+="<ul>"
   
}
document.addEventListener("click",function(e){
    fetch(`${BACKEND_URL}/students/new`)
  .then(response => response.json())
  .then(parsedResponse => renderList(parsedResponse))
})