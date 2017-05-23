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
	$('#filterCustomer').on('keyup', function(e) {//function selecting input field and adding key up event listener
		let searchKeywords = e.target.value;//assigning keywords to the value of whats typed in input field above

		$.ajax({
			url:"http://127.0.0.1:3000/api/customers"//making an ajax GET request to this address
		}).done(function(customers){//function giving me my response
			console.log(customers)
		});
	});
});