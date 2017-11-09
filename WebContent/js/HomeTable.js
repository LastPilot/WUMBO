$(function() {
	// switch to First table
	$("#1yearTable").click(function() {
		$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
		$("#2yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#3yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#4yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#5yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#y1").show();
		$("#y2").hide();
		$("#y3").hide();
		$("#y4").hide();
		$("#y5").hide();
	});
	
	// switch to Second table
	$("#2yearTable").click(function() {
		$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
		$("#1yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#3yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#4yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#5yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
		$("#y2").show();
		$("#y1").hide();
		$("#y3").hide();
		$("#y4").hide();
		$("#y5").hide();
	});

		// switch to Third table
		$("#3yearTable").click(function() {
			$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
			$("#1yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#2yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#4yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#5yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#y3").show();
			$("#y1").hide();
			$("#y2").hide();
			$("#y4").hide();
			$("#y5").hide();
		});
		
		// switch to Fourth table
		$("#4yearTable").click(function() {
			$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
			$("#1yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#2yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#3yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#5yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#y4").show();
			$("#y1").hide();
			$("#y2").hide();
			$("#y3").hide();
			$("#y5").hide();
		});
		
		// switch to Fifth table
		$("#5yearTable").click(function() {
			$(this).removeClass("btn-secondary btn-primary").addClass("btn-primary");
			$("#1yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#2yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#3yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#4yearTable").removeClass("btn-secondary btn-primary").addClass("btn-secondary");
			$("#y5").show();
			$("#y1").hide();
			$("#y2").hide();
			$("#y3").hide();
			$("#y4").hide();
		});
});