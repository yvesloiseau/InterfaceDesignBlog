function clearForm(oForm) {

  var elements = oForm.elements;
  // Lesson 2.6 reset of the form the way it was at the start
 //   console.log("clear the form");
  // $('.input_YourComm').show();
  // $('#visible-comment').hide();
  // $('#char-count').hide();
  // $(".input_YourComm").css("border", "none");
 //     $("#email").css("border", "none");
 //   console.log("new paragraph should be hidden");
  window.location.reload();
  // End of lesson 2.6 instructions

  oForm.reset();


  for(i=0; i<elements.length; i++) {

  field_type = elements[i].type.toLowerCase();

  switch(field_type) {

    case "text":
    case "password":
    case "textarea":
          case "hidden":

      elements[i].value = "";
      break;

    case "radio":
    case "checkbox":
        if (elements[i].checked) {
          elements[i].checked = true;
      }
      // if (i == 1) {
    //          elements[i].checked = true;
    //      }
      break;

    case "select-one":
    case "select-multi":
                elements[i].selectedIndex = -1;
      break;

    default:
      break;
  }
    }
}

