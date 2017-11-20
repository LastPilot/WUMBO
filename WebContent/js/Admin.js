$(function() {
	// switch to student table
	$("#studentTable").click(function() {
		$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
		$("#courseTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#studentInfoDisplay").show()
		$("#courseInfoDisplay").hide();
	});
	
	// switch to courses table
	$("#courseTable").click(function() {
		$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
		$("#studentTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#studentInfoDisplay").hide();
		$("#courseInfoDisplay").show();
	});
	
	// display hidden form and show values from row
	$(".alink").click(function() {
		$(".center").show();
		var code = $(this).html();
		var coord = $("." + code).html();
		var radio = $("." + code).parent().find("td:eq(4)").html();
		console.log(radio == "Spring, Fall");
		$("input[name='coordinator']").val(coord);
		$("#hidden").val(code);
		if (radio == "Spring, Fall") {
			$("input[value='Spring, Fall']").prop("checked", true);
		} else if (radio == "Spring") {
			$("input[value='Spring']").prop("checked", true);
		} else {
			$("input[value='Fall']").prop("checked", true);
		}
	});
	
	// hide form
	$("#cancel").click(function() {
		$(".center").hide();
	});
});