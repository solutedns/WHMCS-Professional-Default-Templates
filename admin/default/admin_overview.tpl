<div class="row">
	<div class="col-md-9">
		<h2>{$LANG.admin_menu_overview}</h2>
	</div>
	<div class="col-md-3">
		<div class="text-right"> 
			<!-- Split button -->
			<div class="btn-group">
				<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#dialog_addZone" onclick=""><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
			</div>
		</div>
	</div>
</div>

<div class="pull-right">
	<div class="input-group">
		<select class="form-padding form-control" name="sdns_overview" id="sdns_overview" onchange="selectOverview(value);">
			<option value="0">{$LANG.admin_overview_all}</option>
			<option value="d">{$LANG.admin_overview_domains}</option>
			<option value="p">{$LANG.admin_overview_products}</option>
			<option value="s">{$LANG.admin_overview_standalone}</option>
			<option value="r">{$LANG.admin_overview_reverse}</option>
		</select>
		<span class="input-group-btn">
			<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="{$LANG.admin_overview_reset_table}" onclick="resetDataTable('sdns_overview_zones'); $(this).blur();"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>
		</span>
	</div>
</div>

<h3>{$LANG.global_general_zones}</h3>
<table class="dataTable display" id="sdns_overview_zones" width="100%" border="0" cellspacing="1" cellpadding="3">
	<thead>
		<tr>
			<th>{$LANG.admin_overview_id}</th>
			<th>{$LANG.admin_overview_domain}</th>
			<th>{$LANG.admin_overview_date}</th>
			<th>{$LANG.admin_overview_status}</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="8" class="dataTables_empty">{$LANG.global_general_loading}</td>
		</tr>
	</tbody>
</table>

<!-- Add Zone -->
<div class="bootstrap">
	<div class="modal fade" id="dialog_addZone" tabindex="-1" role="dialog" aria-labelledby="dialog_addZone" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">{$LANG.global_head_add_zone}</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="addzone">
						<input type="hidden" name="action" value="addzone">
						<div class="row">
							<div class="col-md-4">
								<label for="sdns_addzone_type">{$LANG.admin_overview_zone_type}:</label>
								<select name="sdns_addzone_type" id="sdns_addzone_type" class="form-padding form-control">
									<option value="" disabled selected>{$LANG.admin_overview_select_type}</option>
									<option value="d">{$LANG.admin_overview_domain}</option>
									<option value="p">{$LANG.admin_overview_product}</option>
									<option value="s">{$LANG.admin_overview_standalone}</option>
									<option value="r">{$LANG.admin_overview_reverse}</option>
								</select>
							</div>
							<div class="col-md-8" id="add_reverse" style="display: none">
								<label for="sdns_addzone_ip">{$LANG.admin_overview_ip_zone}:</label>
								<input type="text" name="sdns_addzone_ip" id="sdns_addzone_ip" class="form-padding form-control">
							</div>
							<div class="col-md-8" id="add_client" style="display: none">
								<label for="sdns_addzone_client">{$LANG.admin_overview_client}:</label>
								<input type="text" name="sdns_addzone_client" id="sdns_addzone_client" class="typeahead form-padding form-control" autocomplete="off" spellcheck="false">
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" id="add_domain" style="display: none">
								<label for="sdns_addzone_domain">{$LANG.admin_overview_domain}:</label>
								<input type="text" name="sdns_addzone_domain" id="sdns_addzone_domain" class="typeahead form-padding form-control" autocomplete="off" spellcheck="false">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal" onclick="window.updateSettings('addzone');">{$LANG.global_btn_add}</button>
					<button type="button" class="btn btn-default" onclick="resetAddzone()" data-dismiss="modal">{$LANG.global_btn_cancel}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Delete Zone -->
<div class="bootstrap">
	<div class="modal fade" id="dialog_deleteZone" tabindex="-1" role="dialog" aria-labelledby="dialog_deleteZone" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">
						<div id="sdns_zone_name">{$LANG.global_head_delete_zone}: <span id="deleteName"></span></div>
					</h4>
				</div>
				<div class="modal-body">
					<p>{$LANG.global_text_delete_zone}</p>
					<br />
				</div>
				<div class="modal-footer">
					<input type="hidden" id="sdns_zone">
					<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteZone()">{$LANG.global_btn_delete}</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.global_btn_cancel}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var vars = {};

	$("#sdns_addzone_ip").focus(function () {
		$(this).select();
	});
	$("#sdns_addzone_client").focus(function () {
		$(this).select();
	});
	$("#sdns_addzone_domain").focus(function () {
		$(this).select();
	});

	$(document).ready(function () {

		$('[data-toggle="popover"]').popover({
			trigger: 'hover',
			placement: 'top',
			container: 'body'
		});

		var i = 0;
		var val;

		$('#sdns_addzone_type').change(
				function () {

					$('#add_client').hide();
					$('#add_domain').hide();
					$('#add_reverse').hide();

					var val = $('#sdns_addzone_type option:selected').val();
					if (val == 'r') {
						$('#add_reverse').show();
						$('#sdns_addzone_ip').focus();
					} else {
						$('#add_client').show();
						$('#add_domain').show();
						$('#sdns_addzone_client').focus();
					}

					selectOverview(val);
					$("#sdns_overview").val(val);

					i++;

				}
		);

		// Continue on select
		$('#add_client').bind('typeahead:selected', function (obj, datum, name) {

			var val = $('#sdns_addzone_type option:selected').val();
			if (val == 'd' || val == 'p') {
				domainResults();
			}

			$('#sdns_addzone_domain').focus();

		});

		// Continue on tab
		$('#add_client').bind('keydown', function (e) {

			var keyCode = e.keyCode || e.which;

			if (keyCode == 9) {  //If it's the tab key

				var val = $('#sdns_addzone_type option:selected').val();
				if (val == 'd' || val == 'p') {
					domainResults();
				}

				$('#sdns_addzone_domain').focus();
			}

		});
	});

	var clientResults = new Bloodhound({

		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: {
			url: 'addonmodules.php?module=solutedns&action=search&client&query=%QUERY',
			wildcard: '%QUERY'
		}

	});

	$('#add_client .typeahead').typeahead({
		hint: true,
		highlight: true,
		minLength: 1
	}, {
		name: 'clientResults',
		displayKey: 'value',
		source: clientResults.ttAdapter(),
		limit: 8
	});
</script>