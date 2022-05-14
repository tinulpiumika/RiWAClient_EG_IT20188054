$(document).ready(function () {
  if ($("#alertSuccess").text().trim() == "") {
    $("#alertSuccess").hide();
  }

  $("#alertError").hide();
});

// SAVE
$(document).on("click", "#btnSave", function (event) {
  // Clear alerts
  $("#alertSuccess").text("");
  $("#alertSuccess").hide();
  $("#alertError").text("");
  $("#alertError").hide();

  // Form validation
  var status = validateItemForm();
  if (status != true) {
    $("#alertError").text(status);
    $("#alertError").show();
    return;
  }

  // if hidItemIDSave value is null set as POST else set as PUT
  var type = $("#hidItemIDSave").val() == "" ? "POST" : "PUT";

  // ajax communication
  $.ajax({
    url: "PowerAPI",
    type: type,
    data: $("#formItem").serialize(),
    dataType: "text",
    complete: function (response, status) {
      onItemSaveComplete(response.responseText, status);
    },
  });
});

// after completing save request
function onItemSaveComplete(response, status) {
  if (status == "success") {
    //if the response status is success
    var resultSet = JSON.parse(response);

    if (resultSet.status.trim() === "success") {
      //if the json status is success
      //display success alert
      $("#alertSuccess").text("Successfully saved");
      $("#alertSuccess").show();

      //load data in json to html
      $("#divItemsGrid").html(resultSet.data);
    } else if (resultSet.status.trim() === "error") {
      //if the json status is error
      //display error alert
      $("#alertError").text(resultSet.data);
      $("#alertError").show();
    }
  } else if (status == "error") {
    //if the response status is error
    $("#alertError").text("Error while saving");
    $("#alertError").show();
  } else {
    //if an unknown error occurred
    $("#alertError").text("Unknown error occurred while saving");
    $("#alertError").show();
  }

  //resetting the form
  $("#hidItemIDSave").val("");
  $("#formItem")[0].reset();
}

// UPDATE
//to identify the update button we didn't use an id we used a class
$(document).on("click", ".btnUpdate", function (event) {
  //get item id from the data-itemid attribute in update button

  $("#hidItemIDSave").val($(this).closest("tr").find("#hidItemIDUpdate").val());
  //get data from <td> element
  $("#currentReading").val($(this).closest("tr").find("td:eq(2)").text());
  $("#date").val($(this).closest("tr").find("td:eq(4)").text());
  $("#type").val($(this).closest("tr").find("td:eq(6)").text());
  $("#readerID").val($(this).closest("tr").find("td:eq(7)").text());
  $("#userID").val($(this).closest("tr").find("td:eq(8)").text());
});

// DELETE
$(document).on("click", ".btnRemove", function (event) {
  // ajax communication
  $.ajax({
    url: "PowerAPI",
    type: "DELETE",
    data: "itemID=" + $(this).data("itemid"),
    dataType: "text",
    complete: function (response, status) {
      onItemDeleteComplete(response.responseText, status);
    },
  });
});

// after completing delete request
function onItemDeleteComplete(response, status) {
  if (status == "success") {
    //if the response status is success
    var resultSet = JSON.parse(response);

    if (resultSet.status.trim() === "success") {
      //if the json status is success
      //display success alert
      $("#alertSuccess").text("Successfully deleted");
      $("#alertSuccess").show();

      //load data in json to html
      $("#divItemsGrid").html(resultSet.data);
    } else if (resultSet.status.trim() === "error") {
      //if the json status is error
      //display error alert
      $("#alertError").text(resultSet.data);
      $("#alertError").show();
    }
  } else if (status == "error") {
    //if the response status is error
    $("#alertError").text("Error while deleting");
    $("#alertError").show();
  } else {
    //if an unknown error occurred
    $("#alertError").text("Unknown error occurred while deleting");
    $("#alertError").show();
  }
}

// VALIDATION
function validateItemForm() {
  // currentReading
  if ($("#currentReading").val().trim() == "") {
    return "Insert Current Reading.";
  }

  // date
  if ($("#date").val().trim() == "") {
    return "Insert date.";
  }

  // readerID
  if ($("#readerID").val().trim() == "") {
    return "Insert reader ID.";
  }

  // currentReading is numerical value
  var tmpPrice = $("#currentReading").val().trim();
  if (!$.isNumeric(tmpPrice)) {
    return "Insert a numerical value for Current reading.";
  }

  // userID
  if ($("#userID").val().trim() == "") {
    return "Insert User ID.";
  }

  return true;
}
