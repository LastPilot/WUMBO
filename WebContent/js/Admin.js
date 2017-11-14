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
	
	$(".alink").click(function() {
		$(".center").show();
		var code = $(this).html();
		var coord = $("." + code).html();
		$("input[name='coordinator']").val(coord);
		$("#hidden").val(code);
		
	});
	
	$("#cancel").click(function() {
		$(".center").hide();
	});
});