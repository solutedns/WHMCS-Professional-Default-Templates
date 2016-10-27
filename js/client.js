/**********************************************

         *** SoluteDNS for WHMCS ***

File:					template/js/client.js
File version:			0.2.0
Date:					28-08-2015

Distribution Package:	15200

Copyright (C) NetDistrict 2015
All Rights Reserved

**********************************************/

/* Com function */
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
        url: setDataURL() + 'index.php?m=solutedns&datahandler',
        method: "POST",
        success: function(data) {
            //alert(data);
            var data = JSON.parse(data);

            if (data['status'] == 'success') {
                var state = 'alert alert-success';
                clearFields();
            }
            if (data['status'] == 'warning') {
                var state = 'alert alert-warning';
            }
            if (data['status'] == 'error') {
                var state = 'alert alert-danger';
            }
            if (data['status'] == 'info') {
                var state = 'alert alert-info';
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

            if (data['reversereload'] == true) {
                SDNS_reverseTable.fnReloadAjax();
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

function setDataURL() {
	
	var lastChar = location.pathname.substr(location.pathname.length - 1);
	
	if (lastChar.search (/^\s*\d+\s*$/) != -1) {
		
		var pathName = location.pathname.substr(0, location.pathname.lastIndexOf("\/"));
		pathName = pathName.substr(0, pathName.lastIndexOf("\/"));

	} else {
		var pathName = location.pathname.substr(0, location.pathname.lastIndexOf("\/"));
	
	}

	return location.protocol + '//' + location.host + pathName + '/';
		
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

/* Activate Template */

function activate_template() {

    var action = 'activatetemplate';

    var item = {
        action: action
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

/* Add Record */
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

/* Edit Record */
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

/* Delete Record */
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

/* Add Zone */
function zone_add() {

    var action = 'addzone';
    var zone = $("#sdns_add_zone").val();

    var item = {
        action: action,
        zone: zone
    };

    jsonString = JSON.stringify(item);

    sendData(jsonString);

}

/* Delete Zone */
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

/* Update Reverse */
function update_reverse(id) {
    var action = 'updatereverse';
    var name = $("#sdns_hostname_" + id).val();

    var item = {
        action: action,
        name: name,
        id: id
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

function setOverview(name) {

    if (name == 'overview') {
        $("#overview-tab").addClass("active");
        $("#template-tab").removeClass("active");
        $("#reverse-tab").removeClass("active");
        $("#dnssec-tab").removeClass("active");
    } else if (name == 'template') {
        $("#overview-tab").removeClass("active");
        $("#template-tab").addClass("active");
        $("#reverse-tab").removeClass("active");
        $("#dnssec-tab").removeClass("active");
    } else if (name == 'reverse') {
        $("#overview-tab").removeClass("active");
        $("#template-tab").removeClass("active");
        $("#reverse-tab").addClass("active");
        $("#dnssec-tab").removeClass("active");
    } else if (name == 'dnssec') {
        $("#overview-tab").removeClass("active");
        $("#template-tab").removeClass("active");
        $("#reverse-tab").removeClass("active");
        $("#dnssec-tab").addClass("active");
    }

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

/* Enable edit fields */
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

/* Disable previous selected edit fields */
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