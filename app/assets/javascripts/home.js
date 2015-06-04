$( document ).ready(function() {

  $("#filterForm").click(function(e) {
    console.log(e)
    e.preventDefault();
    var $form = $(this).parents("form");
    $.ajax({
      type: "POST",
      url: "/results",
      data: $form.serialize(),
      dataType: "json",
      success: function(data) {
        console.log(data);
        $("#jobs").hide();
        $("#results").empty();
        // build element, h1
        // add shit to the inner html of that emement
        // then add that to my empty div
        $.each(data, function(string, object){
          // var element = $("<h1></h1>");
          // element.data("location", object.location);
          var start_date = object.start_date.toString()
          $("#results").append($("<h3>Title "+ object.title +"</h3>"));
          $("#results").append($("<h4>Location "+ object.location +"</h4>"));
          $("#results").append($("<h4>Start Date "+ ($.format.date(object.start_date.toString(), "dd/MM/yyyy")) +"</h4>"));
          $("#results").append($("<h4>Company "+ object.company +"</h4>"));
          $("#results").append($("<h4>Pay "+ object.salary +"</h4>"));
          $("#results").append($("<h4>Description "+ object.description +"</h4>"));
          $("#results").append($("<h4> Posted " + jQuery.format.prettyDate(object.created_at) +"</h4>"));

        });
      }
    });
  });

  $("#createJobButton").click(function() {
    $.ajax({
      type: "POST",
      url:  "/"
    });
  });

});



// <% @results.each do |job| %>
//     <h3><%= job.title %></h3>
//     <h4>Location: <%= job.location %></h4>
//     <h4>Start Date: <%= convert_to_pst(job.start_date) %> </h4>
//     <h4>Company: <%= job.company %> </h4>
//     <h4>Pay: <%= job.salary %> </h4>
//     <h4>About: <%= job.description[0,100] %> ...link</h4>
//     <h4>Posted <%= time_elasped(job.created_at) %> </h4></br>
// <%end %>
// <%end %
