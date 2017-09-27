$(function() {
	// show if passwords match
	$("#confirm").keyup(function() {
		if ($("#matching").css("display") == "none") {
			$("#matching").show();
		}
	
		if ($("#password").val() == $("#confirm").val()) {
			$("#pwmatch").removeClass("glyphicon-remove");
			$("#pwmatch").addClass("glyphicon-ok");
			$("#pwmatch").css("color", "#00A41E");
			$("#passMatch").html("Passwords Match");
	
			// enables form only if other fields are valid
			if (!$("#pwmatch01").hasClass("glyphicon-remove")
					&& !$("#pwmatch02").hasClass("glyphicon-remove")) {
				$('input[name=submit]').attr('disabled', false);
			}
		} else {
			$('input[name=submit]').attr('disabled', true);
			$("#pwmatch").removeClass("glyphicon-ok");
			$("#pwmatch").addClass("glyphicon-remove");
			$("#pwmatch").css("color", "#FF0004");
			$("#passMatch").html("Passwords Do Not Match");
		}
	
		if ($("#password").val() == "" && $("#confirm").val() == "") {
			$('input[name=submit]').attr('disabled', false);
			$("#matching").hide();
		}
	})

	// check if student exists
	$("input[name = 'username']").keyup(function(e) {
		var user = $(this).val();

		if (user.length == 0) {
			$('input[name=submit]').attr('disabled', false);
		}

		if ($("#userValidation").css("display") == "none") {
			$("#userValidation").show();
		}

		if (user == "") {
			$("#userValidation").hide();
		}

		$.ajax({
			url : "ValidateUser",
			data : {
				"user" : user
			},
			success : function(data) {
				if (data == 1) {
					$('input[name=submit]').attr('disabled', true);
					$("#availableUser").html("Username Not Available");
					$("#pwmatch01").removeClass("glyphicon-ok");
					$("#pwmatch01").addClass("glyphicon-remove");
					$("#pwmatch01").css("color", "#FF0004");
				} else {
					// enables form only if other fields are valid
					if (!$("#pwmatch").hasClass("glyphicon-remove")
							&& !$("#pwmatch02").hasClass("glyphicon-remove")) {
						$('input[name=submit]').attr('disabled', false);
					}
					$("#availableUser").html("Username Available");
					$("#pwmatch01").removeClass("glyphicon-remove");
					$("#pwmatch01").addClass("glyphicon-ok");
					$("#pwmatch01").css("color", "#00A41E");
				}

			}
		});
	});

	// check if cin exists
	$("input[name = 'cin']").keyup(function(e) {
		var cin = $(this).val();

		if (cin.length == 9 && cin > 99999999 && cin < 1000000000) {
			$("#cinValidation").show();
			$.ajax({
				url : "ValidateCIN",
				data : {
					"cin" : cin
				},
				success : function(data) {
					if (data == 1) {
						// enables form only if other fields are valid
						if (!$("#pwmatch01").hasClass("glyphicon-remove")
								&& !$("#pwmatch").hasClass("glyphicon-remove")) {
							$('input[name=submit]').attr('disabled', false);
						}

						$("#availableCIN").html("CIN exists");
						$("#pwmatch02").removeClass("glyphicon-remove");
						$("#pwmatch02").addClass("glyphicon-ok");
						$("#pwmatch02").css("color", "#00A41E");
						
					} else {
						$('input[name=submit]').attr('disabled', true);
						$("#availableCIN").html("CIN does not exist");
						$("#pwmatch02").removeClass("glyphicon-ok");
						$("#pwmatch02").addClass("glyphicon-remove");
						$("#pwmatch02").css("color", "#FF0004");
					}

				}
			});
		} else if (cin.length != 9 && cin.length != 0) {
			$('input[name=submit]').attr('disabled', true);
			$("#cinValidation").show();
			$("#availableCIN").html("The CIN must be 9 digits");
			$("#pwmatch02").removeClass("glyphicon-ok");
			$("#pwmatch02").addClass("glyphicon-remove");
			$("#pwmatch02").css("color", "#FF0004");
		} else {
			$("#cinValidation").hide();
			$('input[name=submit]').attr('disabled', false);
		}
	});
});