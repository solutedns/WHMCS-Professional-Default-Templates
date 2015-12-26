/**********************************************

         *** SoluteDNS for WHMCS ***

File:					template/js/admin.js
File version:			0.2.0
Date:					28-08-2015

Distribution Package:	15200

Copyright (C) NetDistrict 2015
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

function edit(id) {

    $('#sdns_name_' + id).removeAttr("disabled");
    $('#sdns_type_' + id).removeAttr("disabled");
    $('#sdns_content_' + id).removeAttr("disabled");
    $('#sdns_prio_' + id).removeAttr("disabled");
    $('#sdns_ttl_' + id).removeAttr("disabled");

    var edit = 'sdns_edit_' + id
    var save = 'sdns_save_' + id

    document.getElementById(edit).style.display = 'none';
    document.getElementById(save).style.display = 'inline-block';

    setRecord(id);

}

function deleteSelected() {

    var deleteArray = [];

    $("input:checkbox[name=recordrow]:checked").each(function() {
        deleteArray.push($(this).val());
    });

    var action = 'deleteselectedrecords';
    var zone = $("#sdns_zone").val();
    var records = deleteArray;

    var data = {
        action: action,
        zone: zone,
        records: records
    };

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


function record_add(type) {

    setRecord(0);
    clearErrorField()

    var action = 'addrecord';
    var zone = $("#sdns_zone").val();
    var var1 = $("#sdns_name_0").val();
    var var2 = $("#sdns_type_0").val();
    var var3 = $("#sdns_content_0").val();
    var var4 = $("#sdns_prio_0").val();
    var var5 = $("#sdns_ttl_0").val();

    var item = {
        action: action,
        zone: zone,
        name: var1,
        type: var2,
        content: var3,
        prio: var4,
        ttl: var5
    };

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

function record_edit(type) {

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

function record_delete(type) {

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

function reset_cron() {

    var item = {
        action: 'reset_cron'
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

    $('#add_domain .typeahead').typeahead('destroy')

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
        name: 'best-pictures2',
        /*display: ''*/
        source: vars.domainResults,
        limit: 8
    })

}

/* DNS Assistant */

function dnsassist(type) {
    var action = 'dnsassist';
    var zone = $("#sdns_zone").val();

    if (type = 'srv') {
        var type = 'srv';
        var service = $("#sdns_srv_service").val();
        var protocol = $("#sdns_srv_protocol").val();
        var ttl = $("#sdns_srv_ttl").val();
        var priority = $("#sdns_srv_priority").val();
        var weight = $("#sdns_srv_weight").val();
        var target = $("#sdns_srv_target").val();
        var port = $("#sdns_srv_port").val();

        var item = {
            action: action,
            type: type,
            zone: zone,
            service: service,
            protocol: protocol,
            ttl: ttl,
            priority: priority,
            weight: weight,
            target: target,
            port: port
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

        $("#results").append('<br/>Loading script... <br/><br/>');
        var scroller = setInterval(function() {
            var el = document.getElementById('results');
            el.scrollTop = el.scrollHeight;
        }, 120);
		
		var URL = document.URL.substring(0, document.URL .indexOf('#'));
		
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

            }
        });

        source.addEventListener('error', function(e) {
            //add_log('Error occured');
            source.close();
            clearTimeout(scroller)
            var el = document.getElementById('results');
            el.scrollTop = el.scrollHeight;
            $('#console-close').prop('disabled', false);
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

// Remember opened tab
$(document).ready(function() {
				
	var url = document.location.toString();
	if (url.match('#')) {
		$('.nav-tabs a[href=#'+url.split('#')[1]+']').tab('show') ;
	} 
		
	// Change hash for page-reload
	$('.nav-tabs a').on('shown.bs.tab', function (e) {
		window.location.hash = e.target.hash;
	})
		
});