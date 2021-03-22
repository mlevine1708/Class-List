console.log("testing...");
const BACKEND_URL = "http://localhost:3000";
fetch(`${BACKEND_URL}/test`)
  .then((response) => response.json())
  .then((parsedResponse) => renderList(parsedResponse));

class Student {
  constructor(studentName, grade, parentName, phoneNumber, emailAddress) {
    this.studentName = studentName;
    this.grade = grade;
    this.parentName = parentName;
    this.phoneNumber = phoneNumber;
    this.emailAddress = emailAddress;
  }
}

function renderList(response) {
  const element = document.querySelector(".student-list");
  //element.appendChild()="<ul>"
  for (let i = 0; i < response["students"].length; i++) {
    const row = document.createElement("tr");
    const studentName = document.createElement("td");
    const grade = document.createElement("td");
    const parentName = document.createElement("td");
    const phoneNumber = document.createElement("td");
    const emailAddress = document.createElement("td");
    const deleteButton = document.createElement("td");
    const updateButton = document.createElement("td");
    const saveButton = document.createElement("td");
    // console.log(response["students"][i]);
    const newStudent = new Student(
      response["students"][i].name,
      response["students"][i].grade,
      response["students"][i].parent,
      response["students"][i].phone_number,
      response["students"][i].email
    );
    studentName.textContent = newStudent.studentName;
    grade.textContent = newStudent.grade;
    parentName.textContent = newStudent.parentName;
    phoneNumber.textContent = newStudent.phoneNumber;
    emailAddress.textContent = newStudent.emailAddress;
    deleteButton.innerHTML =
      "<button class='deleteStudent' data-id='" +
      response["students"][i].id +
      "'>Delete</button>";
    updateButton.innerHTML =
      "<button class='updateStudent' data-id='" +
      response["students"][i].id +
      "'>Edit</button>";
    saveButton.innerHTML =
      "<button class='saveStudent' data-id='" +
      response["students"][i].id +
      "'>Save</button>";
    row.append(studentName);
    row.append(grade);
    row.append(parentName);
    row.append(phoneNumber);
    row.append(emailAddress);
    row.append(deleteButton);
    row.append(updateButton);
    row.append(saveButton);
    element.append(row);
  }
  const deleteStudentButtons = document.getElementsByClassName("deleteStudent");
  for (var i = 0; i < deleteStudentButtons.length; i++) {
    deleteStudentButtons[i].addEventListener("click", function (event) {
      event.preventDefault();
      fetch(`${BACKEND_URL}/students/${this.getAttribute("data-id")}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
      });
      this.closest("tr").remove();
    });
  }

  const updateStudentButtons = document.getElementsByClassName("updateStudent");
  for (var i = 0; i < updateStudentButtons.length; i++) {
    updateStudentButtons[i].addEventListener("click", function (event) {
      event.preventDefault();
      var row = this.closest("tr").children;
      for (var j = 0; j < row.length; j++) {
        if (row[j].getElementsByTagName("button").length > 0) {
          continue;
        }
        row[j].innerHTML =
          "<input type='text' class='form-field' value='" +
          row[j].textContent +
          "'>";
      }
    });
  }

  const saveStudentButtons = document.getElementsByClassName("saveStudent");
  for (var i = 0; i < saveStudentButtons.length; i++) {
    saveStudentButtons[i].addEventListener("click", function (event) {
      event.preventDefault();

      //Get the values of the student form
      const studentNameValue = this.closest("tr").children[0].children[0].value;
      const gradeValue = this.closest("tr").children[1].children[0].value;
      const parentNameValue = this.closest("tr").children[2].children[0].value;
      const phoneNumberValue = this.closest("tr").children[3].children[0].value;
      const emailAddressValue = this.closest("tr").children[4].children[0]
        .value;
      const studentInfo = {
        student: {
          name: studentNameValue,
          grade: gradeValue,
          parent: parentNameValue,
          phone_number: phoneNumberValue,
          email: emailAddressValue,
        },
      };
      fetch(`${BACKEND_URL}/students/${this.getAttribute("data-id")}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(studentInfo),
      });
      var row = this.closest("tr").children;
      for (var j = 0; j < row.length; j++) {
        if (row[j].getElementsByTagName("button").length > 0) {
          continue;
        }
        row[j].innerHTML = "<td>" + row[j].children[0].value;
        +"</td>";
      }
    });
  }
}

const submitButton = document.getElementById("submitStudentForm");

submitButton.addEventListener("click", function (event) {
  //Prevent refreshing the screen
  event.preventDefault();

  //get the input elements for the student form
  const studentNameInput = document.getElementById("studentName");
  const gradeInput = document.getElementById("grade");
  const parentNameInput = document.getElementById("parentName");
  const phoneNumberInput = document.getElementById("phoneNumber");
  const emailAddressInput = document.getElementById("emailAddress");

  //Get the values of the student form
  const studentNameValue = studentNameInput.value;
  const gradeValue = gradeInput.value;
  const parentNameValue = parentNameInput.value;
  const phoneNumberValue = phoneNumberInput.value;
  const emailAddressValue = emailAddressInput.value;

  //JS Collections Objects {} and Arrays []
  // const objectVariableName = {key1: value1, key2: value2}
  const studentInfo = {
    student: {
      name: studentNameValue,
      grade: gradeValue,
      parent: parentNameValue,
      phone_number: phoneNumberValue,
      email: emailAddressValue,
    },
  };

  //Send the data
  fetch(`${BACKEND_URL}/students`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(studentInfo), //Maybe don't stringify, but probably need to
  })
    .then((response) => {
      location.reload();
    })

    .catch((error) => {
      console.error("Error:", error);
    });
});

let teacherCommentsForm = document.querySelector("#teacher-comments-form");

teacherCommentsForm.addEventListener("submit", function (event) {
  event.preventDefault();
  const teacherCommentsInput = document.querySelector("#teacher-input").value;
  const teacherCommentsDiv = document.querySelector("#teacher-comments");
  teacherCommentsDiv.innerHTML = teacherCommentsInput;
});
