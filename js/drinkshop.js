var xmlDoc;

function loadXMLDoc() {
   var xmlhttp = new XMLHttpRequest();
   xmlhttp.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
         xmlDoc = this.responseXML;
         displayDrinks();
      }
   };
   xmlhttp.open("GET", "../xml/drinkshop.xml", true);
   xmlhttp.send();
}

function clearTable() {
   var table = document.getElementById("drinkTable");
   while (table.rows.length > 1) {
      table.deleteRow(1);
   }
}

function displayDrinks() {
   clearTable();
   var table = document.getElementById("drinkTable");
   var drinks = xmlDoc.getElementsByTagName("drink");
   for (var i = 0; i < drinks.length; i++) {
      var row = table.insertRow(i + 1);
      var idCell = row.insertCell(0);
      var nameCell = row.insertCell(1);
      var priceCell = row.insertCell(2);
      var descriptionCell = row.insertCell(3);
      idCell.innerHTML =
         drinks[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
      nameCell.innerHTML =
         drinks[i].getElementsByTagName("name")[0].childNodes[0].nodeValue;
      priceCell.innerHTML =
         drinks[i].getElementsByTagName("price")[0].childNodes[0].nodeValue;
      descriptionCell.innerHTML =
         drinks[i].getElementsByTagName(
            "description"
         )[0].childNodes[0].nodeValue;
   }
}

function addDrink() {
   var id = document.getElementById("idInput").value;
   var name = document.getElementById("nameInput").value;
   var price = document.getElementById("priceInput").value;
   var description = document.getElementById("descriptionInput").value;

   var drinks = xmlDoc.getElementsByTagName("drinks")[0];
   var newDrink = xmlDoc.createElement("drink");

   var newId = xmlDoc.createElement("id");
   newId.appendChild(xmlDoc.createTextNode(id));
   newDrink.appendChild(newId);

   var newName = xmlDoc.createElement("name");
   newName.appendChild(xmlDoc.createTextNode(name));
   newDrink.appendChild(newName);

   var newPrice = xmlDoc.createElement("price");
   newPrice.appendChild(xmlDoc.createTextNode(price));
   newDrink.appendChild(newPrice);

   var newDescription = xmlDoc.createElement("description");
   newDescription.appendChild(xmlDoc.createTextNode(description));
   newDrink.appendChild(newDescription);

   drinks.appendChild(newDrink);
   displayDrinks();
}

function editDrink() {
   var id = document.getElementById("idInput").value;
   var name = document.getElementById("nameInput").value;
   var price = document.getElementById("priceInput").value;
   var description = document.getElementById("descriptionInput").value;

   var drinks = xmlDoc.getElementsByTagName("drink");
   for (var i = 0; i < drinks.length; i++) {
      if (
         drinks[i].getElementsByTagName("id")[0].childNodes[0].nodeValue == id
      ) {
         drinks[i].getElementsByTagName("name")[0].childNodes[0].nodeValue =
            name;
         drinks[i].getElementsByTagName("price")[0].childNodes[0].nodeValue =
            price;
         drinks[i].getElementsByTagName(
            "description"
         )[0].childNodes[0].nodeValue = description;
         break;
      }
   }
   displayDrinks();
}

function deleteDrink() {
   var id = document.getElementById("idInput").value;
   var drinks = xmlDoc.getElementsByTagName("drink");
   var message = document.getElementById('alert-message');
   for (var i = 0; i < drinks.length; i++) {
      if (
         drinks[i].getElementsByTagName("id")[0].childNodes[0].nodeValue == id
      ) {
         drinks[i].parentNode.removeChild(drinks[i]);
         message.innerHTML = "Đã xóa phần tử có id là " + id;
         break;
      } else {
          message.innerHTML = "Không có phần tử có id là " + id;
      }
   }
   displayDrinks();
}
