// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$( document ).ready(function() {//function saying wait for the DOM to load
    var customersFound = ""
	$('#searchKeywords').on('keyup', function(e) {//function selecting input field and adding key up event listener
        var searchWords = e.target.value;//assigning keywords to the value of whats typed in input field above
        console.log(searchWords)
    
		$.ajax({
			url:"http://localhost:3000/api/customers?address=" + searchWords //making an ajax GET request to this address
		}).done(function(customers){//function giving me my response
			console.log(customers)
      for (var i = 0; i < customers.length; i++) {
          customersFound += "<li>" + "<h4>" + customers[i].address
          customersFound += customers[i].address_two + "</h4>"
          customersFound += "<h4>" + customers[i].city + ", " + customers[i].state + " "
          customersFound += customers[i].zipcode + "</h4>"
          $('.hideOnAppend').remove();
          $('.navList').append(customersFound);
          $('.navList > li').addClass("list-group-item");
          $('.navList > li').addClass("hideOnAppend");
            } //end for
		}); // end done
    }); // end keyup
}); // end ready