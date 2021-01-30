console.log("testing...")
const BACKEND_URL = 'http://localhost:3000';
fetch(`${BACKEND_URL}/test`)
  .then(response => response.json())
  .then(parsedResponse => renderList(parsedResponse));

function renderList(response) {
    var element = document.querySelector(".student-list")
    //element.appendChild()="<ul>"
    for (var i=0; i<response["students"].length;i++){
        var row = document.createElement("tr")
        var studentName = document.createElement("td")
        var grade = document.createElement("td")
        var parentName = document.createElement("td")
        var phoneNumber = document.createElement("td")
        var emailAddress = document.createElement("td")
        console.log(response["students"][i])
        studentName.textContent = response["students"][i].name
        grade.textContent = response["students"][i].grade
        parentName.textContent = response["students"][i].parent
        phoneNumber.textContent = response["students"][i].phone_number
        emailAddress.textContent = response["students"][i].email
        row.append(studentName)
        row.append(grade)
        row.append(parentName)
        row.append(phoneNumber)
        row.append(emailAddress)
        element.append(row)
    }
    
   
}
document.addEventListener("click",function(e){
    fetch(`${BACKEND_URL}/students/new`)
  .then(response => response.json())
  .then(parsedResponse => renderList(parsedResponse))
})