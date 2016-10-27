/**********************************************

         *** SoluteDNS for WHMCS ***

File:					template/js/admin.js
File version:			0.2.4
Date:					21-03-2016

Distribution Package:	16002

Copyright (C) NetDistrict 2016
All Rights Reserved

**********************************************/

function sendData(json) {

    NProgress.start();

    if (typeof time1 !== 'undefined') {
        clearTimeout(time1);
    }
    if (typeof time2 !== 'undefined') {
        clearTimeout(time2);
    }
    $("#dyn_msgbox").hide("slow");
    $("#dyn_msgbox").removeClass();

    $.ajax({
        data: {
            'data': json
        },
        url: location.protocol + '//' + location.host + location.pathname + '?module=solutedns&datahandler',
        method: "POST",
        success: function(data) {
            //alert(data);
            var data = JSON.parse(data);

            if (data['status'] == 'success') {
                var state = 'alert2 alert2-success';
                clearFields();
            }
            if (data['status'] == 'warning') {
                var state = 'alert2 alert2-warning';
            }
            if (data['status'] == 'error') {
                var state = 'alert2 alert2-danger';
            }
            if (data['status'] == 'info') {
                var state = 'alert2 alert2-info';
            }

            var title = '<h4>' + data['title'] + '</h4>'
            var msg = '<p>' + data['msg'] + '</p>'

            $("#dyn_msgbox").addClass(state);
            $("#dyn_title").html(title);
            $("#dyn_msg").html(msg);

            $("#dyn_msgbox").show("slow", function() {
                $('html, body').animate({
                    scrollTop: $("#dyn_msgbox").offset().top - 20
                }, 400);
                time1 = setTimeout(function() {
                    $("#dyn_msgbox").hide("slow");
                }, 8000); // <-- time in milliseconds
                time2 = setTimeout(function() {
                    $("#dyn_msgbox").removeClass();
                }, 8500); // <-- time in milliseconds
            });

            if (data['tablereload'] == true) {
                SDNS_dataTable.fnReloadAjax();
            }

            if (data['recordreload'] == true) {
                SDNS_recordTable.fnReloadAjax();
            }
			
			if (data['recordreset'] == true) {
                resetDNSField();
            }

            if (data['reload'] == true) {
                setTimeout(function() {
                    location.reload()
                }, 2000);
            }

            if (data['syscheck'] == true) {
                syscheck();
            }

            NProgress.done();

            if (typeof data['field'] !== 'undefined') {
                setErrorField(data['field']);
            }

        }
    });
	
}

function autoSend(json, origin) {
	
    $.ajax({
        data: {
            'data': json
        },
        url: location.protocol + '//' + location.host + location.pathname + '?module=solutedns&datahandler',
        method: "POST",
        success: function(data) {
            //alert(data);
            var data = JSON.parse(data);
			
			var status = [];
			
			status['status'] = data['status'];
			
            if (data['status'] == 'success') {
				status['msg'] = '<p class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> ' + data['msg'] + '</p>';
            }
            if (data['status'] == 'warning') {
				status['msg'] = '<p class="text-warning"><span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> ' + data['msg'] + '</p>';
            }
            if (data['status'] == 'error') {
				status['msg'] = '<p class="text-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> ' + data['msg'] + '</p>';
            }
            if (data['status'] == 'info') {
				status['msg'] = '<p class="text-info"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> ' + data['msg'] + '</p>';
            }
			
			autoSelector(status, origin, data.data);

            if (data['reload'] == true) {
                setTimeout(function() {
                    location.reload()
                }, 2000);
            }

            if (typeof data['field'] !== 'undefined') {
                setErrorField(data['field']);
            }
			
        }
	
    });
	
}

function edit(id) {
	
	//Reset previous selected field
	resetDNSField();

	//Enable current fields
    $('#sdns_name_' + id).prop('disabled', false);
	$('#sdns_type_' + id).prop('disabled', false);
	$('#sdns_content_' + id).prop('disabled', false);
	$('#sdns_prio_' + id).prop('disabled', false);
	$('#sdns_ttl_' + id).prop('disabled', false);

	$('#sdns_edit_' + id).hide();
	$('#sdns_save_' + id).show();

    setRecord(id);

}

function resetDNSField() {
	
	var id = $("#sdns_record").val();
	
	if (id > 1)  {
		//Disable previous fields
		$('#sdns_name_' + id).prop('disabled', true);
		$('#sdns_type_' + id).prop('disabled', true);
		$('#sdns_content_' + id).prop('disabled', true);
		$('#sdns_prio_' + id).prop('disabled', true);
		$('#sdns_ttl_' + id).prop('disabled', true);
		
		$('#sdns_save_' + id).hide();
		$('#sdns_edit_' + id).show();
	}	
}

function deleteSelected(serverid) {

    var deleteArray = [];

    $("input:checkbox[name=recordrow]:checked").each(function() {
        deleteArray.push($(this).val());
    });

    var action = 'deleteselectedrecords';
    var zone = $("#sdns_zone").val();
    var records = deleteArray;
	
	if (serverid != null) {
		var data = {
			action: action,
			server: serverid,
			zone: zone,
			records: records
		};
	} else {
		var data = {
			action: action,
			zone: zone,
			records: records
		};
	}

    jsonString = JSON.stringify(data);

    sendData(jsonString);

}

function setErrorField(field) {
    var record_id = $("#sdns_record").val();

    if (field == 'name') {
        $("#sdns_z-name_" + record_id).addClass("has-error");
    }
    if (field == 'content') {
        $("#sdns_z-content_" + record_id).addClass("has-error");
    }
    if (field == 'prio') {
        $("#sdns_z-prio_" + record_id).addClass("has-error");
    }
}

function clearFields() {
    $("#sdns_name_0").val("");
    $("#sdns_content_0").val("");
    $("#sdns_prio_0").val("");
}

function clearErrorField() {

    var record_id = $("#sdns_record").val();

    $("#sdns_z-name_" + record_id).removeClass("has-error");
    $("#sdns_z-content_" + record_id).removeClass("has-error");
    $("#sdns_z-prio_" + record_id).removeClass("has-error");

}

function updatesettings(element) {
    var fields = $("#" + element + " :input").serializeArray();
    var data = JSON.stringify(fields);

    $("#dyn_msgbox").hide("slow");
    $("#dyn_msgbox").removeClass();

    sendData(data)
}

function update_static(action) {
    var item = {
        action: action,
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);
}


function record_add(type, serverid) {

    setRecord(0);
    clearErrorField()

    var action = 'addrecord';
    var zone = $("#sdns_zone").val();
    var var1 = $("#sdns_name_0").val();
    var var2 = $("#sdns_type_0").val();
    var var3 = $("#sdns_content_0").val();
    var var4 = $("#sdns_prio_0").val();
    var var5 = $("#sdns_ttl_0").val();

    if (type == 'template') {
        var item = {
            action: action,
            zone: zone,
            name: var1,
            type: var2,
            content: var3,
            prio: var4,
            ttl: var5,
            template: true
        };
    } else if(serverid != null) {
        var item = {
            action: action,
			server: serverid,
            zone: zone,
            name: var1,
            type: var2,
            content: var3,
            prio: var4,
            ttl: var5
        };
	} else {
        var item = {
            action: action,
            zone: zone,
            name: var1,
            type: var2,
            content: var3,
            prio: var4,
            ttl: var5
        };
    }

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function record_edit(type, serverid) {

    clearErrorField()

    var action = 'editrecord';
    var zone = $("#sdns_zone").val();
    var record_id = $("#sdns_record").val();

    var var1 = $("#sdns_name_" + record_id).val();
    var var2 = $("#sdns_type_" + record_id).val();
    var var3 = $("#sdns_content_" + record_id).val();
    var var4 = $("#sdns_prio_" + record_id).val();
    var var5 = $("#sdns_ttl_" + record_id).val();

    if (type == 'template') {
        var item = {
            action: action,
            zone: zone,
            record_id: record_id,
            name: var1,
            type: var2,
            content: var3,
            prio: var4,
            ttl: var5,
            template: true
        };
    } else if(serverid != null) {
        var item = {
            action: action,
			server: serverid,
            zone: zone,
            record_id: record_id,
            name: var1,
            type: var2,
            content: var3,
            prio: var4,
            ttl: var5
        };
	} else {
        var item = {
            action: action,
            zone: zone,
            record_id: record_id,
            name: var1,
            type: var2,
            content: var3,
            prio: var4,
            ttl: var5
        };
    }

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function record_delete(type, serverid) {

    var action = 'deleterecord';
    var zone = $("#sdns_zone").val();
    var record_id = $("#sdns_record").val();

    if (type == 'template') {
        var item = {
            action: action,
            zone: zone,
            record_id: record_id,
            template: true
        };
    } else if (serverid != null) {
        var item = {
            action: action,
			server: serverid,
            zone: zone,
            record_id: record_id,
        };
    } else {
        var item = {
            action: action,
            zone: zone,
            record_id: record_id
        };
    }

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function ExportZone(zone) {

    var item = {
        action: 'exportzone',
        zone: zone
    };

    jsonString = JSON.stringify(item);

    $.ajax({
        data: {
            'data': jsonString
        },
        url: location.protocol + '//' + location.host + location.pathname + '?module=solutedns&datahandler',
        method: "GET",
        success: function(data) {
            jQuery("textarea#textarea_iex").val(data);
        },
        error: function(data) {
            jQuery("textarea#textarea_iex").val('Error could not load zone.');
        }
    });
}

function zone_delete() {

    var action = 'deletezone';
    var zone = $("#sdns_zone").val();

    var item = {
        action: action,
        zone: zone
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function delete_ns() {
	
    var action = 'delete_nameserver';
    var id = $("#sdns_server_id").val();

    var item = {
        action: action,
        id: id
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function dnssec(action, zone, key) {

    var item = {
        action: 'dnssec_' + action,
        zone: zone,
        key: key
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function dnssec_addkey(zone) {

    var flag = $('#sdns_dnssec_flag').val();
    var bits = $('#sdns_dnssec_bits').val();
    var algorithm = $('#sdns_dnssec_algorithm').val();

    var item = {
        action: 'dnssec_keyadd',
        zone: zone,
        flag: flag,
        bits: bits,
        algorithm: algorithm
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

function reset_cron(type) {

    var item = {
        action: 'reset_cron',
		type: type
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);
}

function dismiss_update() {

    var item = {
        action: 'dismiss_update'
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);
}

function check_update() {

    var item = {
        action: 'check_update'
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);
}

function product_save(id, type, content) {

    var item = {
        action: 'product_handling',
		id: id,
		type: type,
		content: content.value
    };

    jsonString = JSON.stringify(item);
	
	var selector = [];
	
	if (type == 'settings') {
		selector['class'] = '#sdns_product_settings_'+id;
	}
	if (type == 'dnssec') {
		selector['class'] = '#sdns_product_dnssec_'+id;
	}
	if (type == 'record_limit') {
		selector['class'] = '#sdns_product_limit_'+id;
	}	
	if (type == 'server') {
		selector['class'] = '#sdns_product_server_'+id;
	}
	
	selector['id'] = id;

    autoSend(jsonString, selector);
		
}

function autoSelector(msg, selector, data) {
	
	// Set message time
	if (msg['status'] == 'success') {
		var delay = 1000;
	} else {
		var delay = 4000;
	}
		
	// Set values
	if (data) {
		$("#sdns_product_server_"+selector.id).val(data.server_id);
		$("#sdns_product_limit_"+selector.id).val(data.record_limit);
		if (data.dnssec == 'on') {
			$("#sdns_product_dnssec_"+selector.id).prop('checked', true);
		} else {
			$("#sdns_product_dnssec_"+selector.id).prop('checked', false);
		}
	} else {
		$("#sdns_product_server_"+selector.id).val('');
		$("#sdns_product_limit_"+selector.id).val('');
			$("#sdns_product_dnssec_"+selector.id).prop('checked', false);
	}
	
	// Enable/disable fields
	if (msg['status'] == 'success') {
		if (data) {
			$("#sdns_product_server_"+selector.id).prop('disabled', false);
			$("#sdns_product_limit_"+selector.id).prop('disabled', false);
			$("#sdns_product_dnssec_"+selector.id).prop('disabled', false);
			$("#sdns_product_settings_"+selector.id).prop('checked', true);
		} else {
			$("#sdns_product_server_"+selector.id).prop('disabled', true);
			$("#sdns_product_limit_"+selector.id).prop('disabled', true);
			$("#sdns_product_dnssec_"+selector.id).prop('disabled', true);
			$("#sdns_product_settings_"+selector.id).prop('checked', false);
		}
	
	}
	
	// Show status message
	$(selector.class).popover(
		{
			placement: 'top',
			container: 'body',
			delay: {
				show: 500,
				hide: 100
			},
			html:true,
			content:msg['msg']
		}
	).popover('show');
	
	$(selector.class).on('shown.bs.popover', function () {

		setTimeout(function() {
			$('.popover').fadeOut('slow',function() { 
				$(selector.class).popover('destroy');
			}); 
		},delay);
	
	});	
	
}

function setRecord(id) {
    $("#sdns_record").val(id);
}

function setZone(id) {
    $("#sdns_zone").val(id);
}

function setZoneName(name) {
    $('#sdns_zone_name span').text(name);
}

function setOverview(name) {
    document.getElementById("overview_title").innerHTML = name;
}

function setTemplate(id) {
    $("#sdns_template_id").val(id);
}

function updateTemplate(name) {
    var id = $('#sdns_zone').val();
	
    var item = {
        action: 'edit_template_name',
        id: id,
        name: name,
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

    $('#sdns_template_name2').text(name);
}

function syscheck(type, id) {

    if (type == 'ssh') {
		if (id != null) {
        	var source = 'sshcheck&id='+id;
		} else {
			var source = 'sshcheck'	
		}
        NProgress.start();
    } else {
        var source = 'syscheck';
    }

    $.ajax({
        //data: { 'data': json },
        url: location.protocol + '//' + location.host + location.pathname + '?module=solutedns&datasource=' + source,
        method: "GET",
        success: function(data) {
            //alert(data);
            var data = JSON.parse(data);

            if (data['status'] != 'ok') {

                var server = data['server'];
                var error = data['error'];
                for (var key in server) {
                    $("#ns_" + server[key]).addClass('glyphicon glyphicon-remove text-danger');
                    $("#nameserver_sub").addClass('open');

                    $("#ns" + server[key] + "_msgbox").addClass('alert2 alert2-danger');
                    $("#ns" + server[key] + "_msg").html('<p>' + error[key] + '</p>');
                    $("#ns" + server[key] + "_msgbox").show();

                    $("#dyn_msgbox").show("slow");

                }

                var title = '<h4>' + data['title'] + '</h4>';
                var msg = '<p>' + data['msg'] + '</p>';

                if (data['status'] == 'error') {
                    $("#sys_msgbox").addClass('alert2 alert2-danger');
                } else {
                    $("#sys_msgbox").addClass('alert2 alert2-warning');
                }
                $("#sys_title").html(title);
                $("#sys_msg").html(msg);

                $("#sys_msgbox").show("slow", function() {
                    $('html, body').animate({
                        scrollTop: $("#sys_msgbox").offset().top - 20
                    }, 400);
                });

            } else {
                $("#sys_msgbox").hide("slow");
                $("#sys_msgbox").removeClass();
				
				if (type == 'ssh') {
					
					var title = '<h4>' + data['title'] + '</h4>';
               		var msg = '<p>' + data['msg'] + '</p>';
					
					$("#sys_msgbox").addClass('alert2 alert2-success');
					$("#sys_title").html(title);
					$("#sys_msg").html(msg);
	
					$("#sys_msgbox").show("slow", function() {
						$('html, body').animate({
							scrollTop: $("#sys_msgbox").offset().top - 20
						}, 400);
					});
					
				}
				
            }

            if (type == 'ssh') {
                NProgress.done();
            }

        }
    });

}

function countupdate() {

    $.ajax({
        //data: { 'data': json },
        url: location.protocol + '//' + location.host + location.pathname + '?module=solutedns&datasource=countupdate',
        method: "GET",
        success: function(data) {
            //alert(data);
            var data = JSON.parse(data);

            $('#domains-tab span').text('(' + data.count['domains'] + ')');
            $('#products-tab span').text('(' + data.count['products'] + ')');
            $('#standalone-tab span').text('(' + data.count['standalone'] + ')');
            $('#reverse-tab span').text('(' + data.count['reverse'] + ')');

        }
    });

}

function domainResults() {
	
    $('#add_domain .typeahead').typeahead('destroy');

    vars.domainResults = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: 'addonmodules.php?module=solutedns&datasource=search&domain&client=' + $('#sdns_addzone_client').val() + '&type=' + $('#sdns_addzone_type').val() + '&query=%QUERY',

        remote: {
            url: 'addonmodules.php?module=solutedns&datasource=search&domain&client=' + $('#sdns_addzone_client').val() + '&type=' + $('#sdns_addzone_type').val() + '&query=%QUERY',
            wildcard: '%QUERY'
        }
    });

    $('#add_domain .typeahead').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
    }, {
        name: 'domainResults',
        /*display: ''*/
        source: vars.domainResults,
        limit: 8
    })

}

/* DNS Assistant */

function dnsassist(type) {
    var action = 'dnsassist';
    var zone = $("#sdns_zone").val();

    if (type == 'srv') {

        var item = {
            action:		action,
            type:		'srv',
            zone:		zone,
            service:	$("#sdns_srv_service").val(),
            protocol:	$("#sdns_srv_protocol").val(),
            ttl:		$("#sdns_srv_ttl").val(),
            priority:	$("#sdns_srv_priority").val(),
            weight:		$("#sdns_srv_weight").val(),
            target:		$("#sdns_srv_target").val(),
            port:		$("#sdns_srv_port").val()
        };
    }

	if (type == 'tlsa') {

        var item = {
            action:			action,
            type:			'tlsa',
            zone:			zone,
            usage:			$('input[name=sdns_tlsa_usage]:checked').val(),
            selector:		$('input[name=sdns_tlsa_selector]:checked').val(),
            matching_type:	$('input[name=sdns_tlsa_type]:checked').val(),
            cert:			$("#sdns_tlsa_certificate").val(),
            port:			$("#sdns_tlsa_port").val(),
            protocol:		$("#sdns_tlsa_protocol").val(),
            name:			$("#sdns_tlsa_name").val()
        };

    }

    jsonString = JSON.stringify(item);

	sendData(jsonString);
}


/* SoluteDNS Console */

var source = 'runner';

function start_com(e, type) {
    if (!console.isRunning) {

        $('#console-close').prop('disabled', true);
        $('#console-close').html("<i class=\"glyphicon glyphicon-refresh icon-spinner\"></i>");
		$('#console-close').removeClass('btn-success');
		$('#console-close').addClass('btn-default');

        $("#results").append('<br/>Loading script... <br/><br/>');
        var scroller = setInterval(function() {
            var el = document.getElementById('results');
            el.scrollTop = el.scrollHeight;
        }, 120);
		
		if(document.URL.indexOf('#') === -1) {
			var URL = document.URL;
		} else {
			var URL = document.URL.substring(0, document.URL.indexOf('#'));
		}
		
		if (type == 'mutation') {
			
			var data = {
				type: $("#sdns_mut_for").val(), 
				server: $("#sdns_mut_server").val(),
			
				action: $("#sdns_mut_action").val(), 
			
				where_type: $("#sdns_mut_where_type").val(), 
				where_content: $("#sdns_mut_where_content").val(), 
				where_ttl: $("#sdns_mut_where_ttl").val(), 
				where_prio: $("#sdns_mut_where_prio").val(), 
			
				content_type: $("#sdns_mut_content_type").val(), 
				content_content: $("#sdns_mut_content_content").val(), 
				content_ttl: $("#sdns_mut_content_ttl").val(), 
				content_prio: $("#sdns_mut_content_prio").val()
			 };

			source = new EventSource(URL + '&console=' + type + '&data=' + JSON.stringify(data));		
		} else if (type == 'dnssec') {
			
			var data = {
				server: $("#sdns_dnssec_server").val(), 
				mode: $("#sdns_dnssec_action").val(),
			 };

			source = new EventSource(URL + '&console=' + type + '&data=' + JSON.stringify(data));		
		} else {
			source = new EventSource(URL + '&console=' + type);		
		}

        source.addEventListener('message', function(e) {
            var result = JSON.parse(e.data);

            add_log(result.message);
            add_status(result.status);

            $("#progressbar").width(result.progress + '%');

            if (e.data.search('READY') != -1) {
                source.close();
                clearTimeout(scroller)
                var el = document.getElementById('results');
                el.scrollTop = el.scrollHeight;
                $('#console-close').prop('disabled', false);
				$('#console-close').text("Close");
				$('#console-close').addClass('btn-success');
				$('#console-close').removeClass('btn-default');
				delete console.isRunning;
            }
        });

        source.addEventListener('error', function(e) {
            //add_log('Error occured');
            source.close();
            clearTimeout(scroller)
            var el = document.getElementById('results');
            el.scrollTop = el.scrollHeight;
            $('#console-close').prop('disabled', false);
			$('#console-close').text("Close");
			$('#console-close').addClass('btn-success');
			$('#console-close').removeClass('btn-default');
			delete console.isRunning;
        });

        console.isRunning = true;

    }

    function add_log(message) {
    	$("#results").append(message + '<br/>');

        if (message != 'READY') {
           $('#console-job span').html(message);
        }
    }

    function add_status(message) {
        if (message) {
            $('#console-status span').text(message);
        }
    }

    function strip(html) {
        var tmp = document.createElement("DIV");
        tmp.innerHTML = html;
        return tmp.textContent || tmp.innerText;
    }

}

function console(type) {
    if (typeof(EventSource) !== "undefined") {
        start_com(null, type);
    }
}

function console_name(name) {
	$('h4#dialog_console_title').text(name);
}

function reset_addzone() {
	$('#sdns_addzone_type').val('');
	$('#sdns_addzone_client').val('');
	$('#sdns_addzone_domain').val('');
	$('#sdns_addzone_ip').val('');
	
	$('#add_client').hide();
    $('#add_domain').hide();
    $('#add_reverse').hide();
}

$(document).ready(function() {
	
	// Remember opened tab
	var url = document.location.toString();
	if (url.match('#')) {
		$('.nav-tabs a[href=#'+url.split('#')[1]+']').tab('show');
		var atab = url.split('#')[1];
	} 
		
	// Change hash for page-reload
	$('.nav-tabs a').on('shown.bs.tab', function (e) {
		window.location.hash = e.target.hash;
	})
	
	// Activate tooltip
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip({container: 'body', html: true , 
	  
	  template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner large"></div></div>'
	  
	  })
	})

	// Disable Console if EventSource not supported
	if (typeof(EventSource) !== "undefined") {} else {
		$('#console-job span').text("Your browser does not support the console output.");
		$('#console-status span').text("Console not supported");
	}

	// Load table of active tab
	if (atab == 'templates') {
		drawTable('sdns_templates');	
	} else if (atab == 'logs') {
		drawTable('sdns_logs');	
	} else if (document.URL.indexOf("server") != -1 || atab != null && atab != 'overview' && atab != 'records') {
		// No table in active tab
	} else {
		if($("#sdns_domains").length != 0) {
			drawTable('sdns_domains');
		}
		if($("#sdns_records").length != 0) {
			drawRecords('sdns_records');
		}
		if($("#sdns_template_records").length != 0) {
			drawRecords('sdns_template_records');
		}
	}

		//Mutation Tool
		$('.where_input').attr('disabled','disabled');
		$('#where_container').addClass("sdns_text_disabled");
    
		$('select[name="sdns_mut_action"]').on('change',function(){
			var  others = $(this).val();
		
			if(others == "add"){
				$('.where_input').attr('disabled','disabled');
				$('.content_input').removeAttr('disabled');
				$('#where_container').addClass("sdns_text_disabled");
				$('#content_container').removeClass("sdns_text_disabled");
			}
			
			if(others == "edit"){           
				$('.where_input').removeAttr('disabled');
				$('.content_input').removeAttr('disabled');
				$('#content_container').removeClass("sdns_text_disabled");
				$('#where_container').removeClass("sdns_text_disabled");
			}
			
			if(others == "delete"){           
				$('.where_input').removeAttr('disabled');
				$('.content_input').attr('disabled','disabled');
				$('#content_container').addClass("sdns_text_disabled");
				$('#where_container').removeClass("sdns_text_disabled");
			}
			else{
				$('#disabled_input').attr('disabled','disabled'); 
			}  
	
		});
		
});