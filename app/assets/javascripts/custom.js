$(document).ready(function(){
	jQuery('#homeSlider').skdslider({
		delay:5000, 
		animationSpeed: 2000,
		showNextPrev:false,
		showPlayButton:false,
		autoSlide:true,
		animationType:'fading'
	});

	$('.chosen-select').chosen();
	
	check_confirmpwd = function(input){
		if (input.value != document.getElementById('user_password').value) {
			input.setCustomValidity('The two passwords must match.');
		} else {
			input.setCustomValidity('');
		}
	}

	check_names = function(input){
		if (check_inbetween(input, 3, 20)){}
		// else if (/[a-zA-Z]/.test(input.value))
		// 	input.setCustomValidity('Input should be alphabet only.');
		else
			input.setCustomValidity('');
	}

	check_inbetween = function(input, a, b){
		if (input.value.length <= a && input.value.length >= b){
			input.setCustomValidity('Input length should be minimum ' + a + ' and maximum ' + b);
			return true;
		}
		return false;
	}

	var b_c1=false, b_c2=false, b_c3=false, b_c4=false;
	$(".c1").click(function(){
		$("#c1").show();
		$("#c2").hide();
		$("#c3").hide();
		grid('#grid', 230);
	});
	$(".c2").click(function(){
		c2();
	});
	c2 = function(){
		if($(".child:checked").val() != null){
			$("#c1").hide();
			$("#c2").show();
			$("#c3").hide();
			child = $(".child:checked");
			$("address").html('<strong>' + $(child).data('name') + '</strong><br>' + $(child).data('email') + "<br>" + $(child).data('refid'));
		} else {
			alert('Choose child first!');
		}
	}
	$(".c3").click(function(){
		c3();
	});
	c3 = function(){
		valid = true;
		$(".contribution_cups:checked").each(function(){
			td = $($(this).parent().parent().parent().parent().find('td')[2]).find('input');
			if($(td).val() == ''){
				$(td).focus();
				valid = false;
				alert('Selected cup quantity should not be blank!');
				return false;
			}
		});
		if(valid){
			if(parseInt($("#total_contributions").val()) > 0){
				if($(".freq:checked").val() == '' || $(".freq:checked").val() == null){
					alert('Select a valid frequency!');
				} else {
					$("#c1").hide();
					$("#c2").hide();
					$("#c3").show();
				}
			} else if($(".freq:checked").val() == '' || $(".freq:checked").val() == null){
				alert('Total contribution and Frequency are not valid!');
			} else {
				alert('Select a valid cup to contribute!');
			}
		}
	}
	$(".c4").click(function(){
		c4();
	});
	
	c4 = function(){
		$("#c1").hide();
		$("#c2").hide();
		$("#c3").hide();		
	}

	$("#c1").show();
	$("#c2").hide();
	$("#c3").hide();	

	$("#search").keydown(function(e) {
		typewatch(function () {
			if($("#search").val().length >= 3){
	 			$("#searched_children").html("<img src='/assets/load.gif'>");
				$.ajax({
			     	type: "GET",
			     	url: "/api/find_children",
			     	data: {'search' : $("#search").val()},
			     	success: function(data){
			     		if(data.count > 0){
 							$("#searched_children").html("<div id='grid'></div>");
			     			$(data.children).each(function(index, ele){
		     					$("#searched_children").find("#grid").append('<div class="box"><label><input type="radio" data-email="'+ele.email+'" data-refid="'+ele.ref_id+'" data-name="'+ ele.first_nm + ' ' + ele.last_nm +'" class="child hidden" name="child" value="'+ele.id+'" onclick="c2();"><div data-thumbnail="'+ele.profile+'"></div><div class="thumbnail-caption"><h3>' + ele.first_nm + ' ' + ele.last_nm + '</h3><h5>' + ele.ref_id + '</h5></div></label></div>');
    		     				// $("#searched_children").find("#grid").append('<div class="box"><div data-thumbnail="'+ele.profile+'"></div><div data-image="'+ele.profile+'"></div><div class="thumbnail-caption"><h3>' + ele.first_nm + ' ' + ele.last_nm + '</h3><h5>' + ele.ref_id + '</h5></div><div class="lightbox-text">' + ele.first_nm + ' ' + ele.last_nm + ' | ' + ele.email + ' | ' + ele.ref_id + ' | PLEDGE NOW</label></div></div>');
    		     			}).promise().done(function(){ 
    		     				grid('#grid', 230);
    		     			});
			     		} else {
	 						$("#searched_children").html("Oops! No children were found!");
			     		}
			     	}
			    });
			}
		}, 500);
	});

	var typewatch = (function(){
	  	var timer = 0;
	  		return function(callback, ms){
	    	clearTimeout (timer);
	    	timer = setTimeout(callback, ms);
	  	}  
	})();
	
	$(".contribution_cups, .howmanyCups").change(function(){
		totalContribution();
	});

	totalContribution = function(){
		totalContr = 0;
		$(".contribution_cups").each(function(){
			input = $($(this).parent().parent().parent().parent().find('td')[2]).find('input');
			if($(this).is(':checked')){
				if($(this).closest('input[type=text]').val() == ''){
					$(this).closest('input[type=text]').text(0);
				}
				totalContr += $(this).parent().parent().parent().parent().find('.txtOnlyNumber').val() * $(this).data('price');
				$(input).focus();
			} else {
				$(input).val('');				
			}
		});
		$("#total_contributions").val(totalContr.toFixed(2));
		$("#l_total_contributions").html("$ " + totalContr.toFixed(2));
	}

	$(".freq").click(function(){
		if($(this).val() == 'one_time')
			$("#l_freq").html('One Time');
		else if($(this).val() == 'monthly')
			$("#l_freq").html('Monthly');
		else if($(this).val() == 'quarterly')
			$("#l_freq").html('Quarterly');
		else if($(this).val() == 'bi_annual')
			$("#l_freq").html('Bi_Annual');
		else if($(this).val() == 'annually')
			$("#l_freq").html('Annually');
	});

	$(".txtOnlyNumber").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) || 
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
             // let it happen, don't do anything
             return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

    $('.txtOnlyAlpha').keydown(function (e) {
		if (e.shiftKey || e.ctrlKey || e.altKey) {
			e.preventDefault();
		} else {
			var key = e.keyCode;
			if (!((key == 8 || key == 9) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90)))
				e.preventDefault();
		}
	});

    // Grid items
    grid = function(id, width){
	    $(id).grid({
	        columnWidth: width, //The width of each columns, if you set it to 'auto' it will use the columns instead
	        captionType: 'grid-fade', // 'grid', 'grid-fade', 'classic' the type of caption effect
	        lightBox: false
	  	});
    }

    grid('#grid', 250);

    $(document).resize(function(){
    	grid('#grid', 230);
    });

    var ddData = [
	    {
	        text: "Americal Express",
	        value: 'american_express',
	        selected: false,
	        description: ' ',
	        imageSrc: "/assets/cards/american_express.png"
	    },
	    {
	        text: "Discover",
	        value: 2,
	        selected: false,
	        description: ' ',
	        imageSrc: "/assets/cards/discover.png"
	    },
	    {
	        text: "Visa Card",
	        value: 3,
	        selected: true,
	        description: ' ',
	        imageSrc: "/assets/cards/visa_card.png"
	    },
	    {
	        text: "Master Card",
	        value: 4,
	        selected: false,
	        description: ' ',
	        imageSrc: "/assets/cards/mastercard.png"
	    }
	];

	$('#credit_card_type').ddslick({
		data: ddData,
		width: 300,
		imagePosition: "left",
		selectText: "Select your favorite social network",
		onSelected: function (data) {
			console.log(data);
		}
	});

	payment_loader = function(){
		$('.loader').show();		
	}

	$('#updateProfile').modal('show');

	invite_referral = function(){
		$('.invite-referral').html('<div class="loader"><img src="/assets/loader.gif"> Please wait..</div>');
	}

	show_loader = function(dmsg, cls){
		$(dmsg).html('');
		$(cls).show();
	}

	goTop = function(){$('html,body').animate({ scrollTop: 0 }, 'slow');}

	age_calculate = function(){
		if($('#user_dob').val() != ''){
			user_dob = $('#user_dob').datepicker('getDate');
			ageDate = new Date(Date.now() - user_dob.getTime());
			age = Math.abs(ageDate.getUTCFullYear() - 1970);
			if(age < 18){
				$('#user_role').val('child');
				// $(".user_role").hide();
			}else{
				$('#user_role').val('student');
				// $(".user_role").show();
			}
		}
	}

	$(".user_role").click(function(){
		$('#'+$(this).val()).modal('show');
	});

	valid_refid = function(ref_id){
		if($(ref_id).val() != ''){
			$.ajax({
		     	type: "POST",
		     	url: "/valid-refid",
		     	data: {'ref_id' : $(ref_id).val()},
		     	success: function(data){
		     		if(data.status == "error"){
		     			$(ref_id).parent().parent().addClass('has-error');
		     			$(ref_id).focus();
		     			alert(data.message);
		     		} else {
						$(ref_id).parent().parent().removeClass('has-error has-success');
		     			$(ref_id).parent().parent().addClass('has-success');
		     		}
		     	}
		    });
		} else {
			$(ref_id).parent().parent().removeClass('has-error has-success');
		}
	}

	$('.datepicker').datepicker({format: 'dd/mm/yyyy'});

	var onlyAlphaRule = {
	        	required: true,
	        	minlength: 3,
	        	maxlength: 20,
	        	lettersonly: true
	        }

	var onlyAlphaMessage = {
	        	required: "This field is required",
	        	minlength: 'Minimum 3 characters required',
	        	maxlength: 'Maximum 20 characters required',
	        	lettersonly: 'Name should be alphabet'
	        }

	var rules_messages = {
	    rules: {
	        "user[first_nm]": onlyAlphaRule,
	        "user[last_nm]": onlyAlphaRule,
	        "user[email]": "required",
	        "user[dob]": "required",
	        "user[mobile]": "required",
	        "user[profile]": "required",
	        "user[guardians_attributes][0][first_nm]": onlyAlphaRule,
	        "user[guardians_attributes][0][last_nm]": onlyAlphaRule,
	        "user[guardians_attributes][0][dob]": "required",
	        "user[guardians_attributes][0][appt_no]": "required",
	        "user[guardians_attributes][0][st_no]": "required",
	        "user[guardians_attributes][0][city]": "required",
	        "user[guardians_attributes][0][phone]": "required",
	        "user[password_confirmation]": "required",
	        "user[password]": "required"
	    },
	    messages: {
	    	"user[first_nm]": onlyAlphaMessage,
	        "user[last_nm]": onlyAlphaMessage,
	        "user[email]": "Require a valid email.",
	    	"user[dob]": "Date of birth should not be blank",
	        "user[mobile]": "Mobile should not be blank",
	        "user[profile]": "Profile should not be blank",
	        "user[guardians_attributes][0][first_nm]": onlyAlphaMessage,
	        "user[guardians_attributes][0][last_nm]": onlyAlphaMessage,
	        "user[guardians_attributes][0][dob]": "Date of birth should not be blank",
	        "user[guardians_attributes][0][appt_no]": "Appt no should not be blank",
	        "user[guardians_attributes][0][st_no]": "Street No should not be blank",
	        "user[guardians_attributes][0][city]": "City should not be blank",
	        "user[guardians_attributes][0][phone]": "Phone should not be blank",
	        "user[password_confirmation]": "Password confirmation should not be blank",
	        "user[password]": "Old password should not be blank"
	    }
	}

	$(".edit_user").validate(rules_messages);
	$("#new_user").validate(rules_messages);
	$(".new_user").validate(rules_messages);
	
	jQuery.validator.addMethod("lettersonly", function(value, element) {
		return this.optional(element) || /^[a-z]+$/i.test(value);
	}, "Only alphabets are allowed."); 

	// SSN Masking
	// $("#ssn").mask("999-99-9999");

	var retrieveValue = function(ev){
        var $this = $(this),
            val = $this.data('value');

        if (val) {
            $this.val(val);
        }
    },
    hideValue = function(ev){
        var $this = $(this);

        $this.data('value', $this.val());
        $this.val('xxx - xx - '+$(this).val().substr(5,4));
    }

	ssn_unmasking = function() {
		$('#user_ssn').val($('#ssn').data('value'));
		return true;
	}

	$('#ssn').keypress(function(ev) {
		if($(this).val().length > 8) {
			return false;
		}
	});
	$('#ssn').focus(retrieveValue);
	$('#ssn').blur(hideValue);
	
	if($('#user_ssn').val() != null && $('#user_ssn').val() != "") {
		$('#ssn').data('value', $('#user_ssn').val());
		$('#ssn').val('xxx - xx - ' + $('#user_ssn').val().substr(5,4));
	}

	submit_contribution = function(payment_type){
		$("#payment_type").val(payment_type);
		$('#pledgeNowForm').submit();
	}
});