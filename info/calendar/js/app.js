(function($) {

	"use strict";

	var currentDate = new Date();
	var twoDigitMonth=((currentDate.getMonth()+1)>=10)? (currentDate.getMonth()+1) : '0' + (currentDate.getMonth()+1);
	var twoDigitDate=((currentDate.getDate())>=10)? (currentDate.getDate()) : '0' + (currentDate.getDate());
	var createdDateTo = currentDate.getFullYear() + "-" + twoDigitMonth + "-" + twoDigitDate;

	//var targetDate = '2020-03-12';
	var dataSel = $('#dataSel').val();
	var options = {
		//events_source: 'get-event-json.jsp',
		//events_source: 'get-event-champ.jsp',
		events_source: 'get-event-all.jsp?dataSel='+dataSel,
		view: 'month',
		views: {
			year:  {
			  enable: 0
			},
			month:  {
			  enable: 1
			},
			week:  {
			  enable: 0
			},
			day:   {
			  enable: 0 //disabled
			}
		  },		
		tmpl_path: 'tmpls/',
		tmpl_cache: false,
		day: createdDateTo,
		//day: targetDate,
		first_day: "1", // sunday 2, monday 1
		language: "ko-KR",
		display_week_numbers : false,
		weekbox: false,
		
		modal : "#events-modal", 
		modal_type : "template", //ajax, iframe, template (tmpl/modal.html)
		modal_title : function (e) { 
			return e.title 
		},
		onAfterEventsLoad: function(events) {
			if(!events) {
				return;
			}
			var list = $('#eventlist');
			list.html('');

			$.each(events, function(key, val) {
				var title = '';
				/*
				if(val.title.length >= 38){
					title = val.title.substr(0,38)+"...";
				} else {
					title = val.title;
				}
				*/
				title = val.title;
				var date = new Date(parseInt(val.start)); 
				var sm = setDateZero(date.getMonth()+1); // 01
				var sd = setDateZero(date.getDate()); // 01
				var sy = date.getFullYear(); // 01
				var date = new Date(parseInt(val.end)); 
				var em = setDateZero(date.getMonth()+1); // 01
				var ed = setDateZero(date.getDate()); // 01
				var ey = date.getFullYear(); // 01

				$(document.createElement('li'))
					.html('<span><a href="javascript:void(0)" class="pull-left event '+val.class+'" ></a>'
					+'<a class=aClass href="javascript:void(0)" title="'+val.title+'" href="' + val.url + '">'+'('+sd + ' ~ ' + ed +') '+ val.title+ '</a></span>')
					.appendTo(list);
			});
		},
		onAfterViewLoad: function(view) {
			$('.page-header h3').text(this.getTitle());
			$('.btn-group button').removeClass('active');
			$('button[data-calendar-view="' + view + '"]').addClass('active');
		},
		classes: {
			months: {
				general: 'label'
			}
		}
	};

	function setDateZero(date){
		return date < 10 ? '0' + date : date;
	}


	var calendar = $('#calendar').calendar(options);

	$('.btn-group button[data-calendar-nav]').each(function() {
		var $this = $(this);
		$this.click(function() {
			calendar.navigate($this.data('calendar-nav'));
		});
	});

	$('.btn-group button[data-calendar-view]').each(function() {
		var $this = $(this);
		$this.click(function() {
			calendar.view($this.data('calendar-view'));
		});
	});

	$('#first_day').change(function(){
		var value = $(this).val();
		value = value.length ? parseInt(value) : null;
		calendar.setOptions({first_day: value});
		calendar.view();
	});

	$('#language').change(function(){
		calendar.setLanguage($(this).val());
		calendar.view();
	});

	$('#events-in-modal').change(function(){
		var val = $(this).is(':checked') ? $(this).val() : null;
		calendar.setOptions({modal: val});
	});
	$('#events-modal .modal-header, #events-modal .modal-footer').click(function(e){
		//e.preventDefault();
		//e.stopPropagation();
	});

	/*
	calendar.setLanguage('ko-KR');
	calendar.view();
	*/

}(jQuery));