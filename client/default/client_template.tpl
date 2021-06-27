<span data-toggle="modal" data-target="#dialog_addRecord" class="pull-right">
	<button type="button" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="bottom" title="{$MLANG.admin_manage_records_addrecord}" {if $maintenance}DISABLED{/if}><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
</span>
<h3 class="h-top">{$MLANG.client_menu_template}</h3>
<table id="sdns_template" class="table table-list dataTable no-footer dtr-inline th-border">
	<thead>
		<tr>
			<th></th>
			<th>{$MLANG.global_dns_name}</th>
			<th>{$MLANG.global_dns_type}</th>
			<th>{$MLANG.global_dns_content}</th>
			<th>{$MLANG.global_dns_prio}</th>
			<th>{$MLANG.global_dns_ttl}</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="6" class="dataTables_empty text-center">{$MLANG.global_general_loading}</td>
		</tr>
	</tbody>
</table>
<input type="hidden" id="sdns_record">

<!-- Add Modal -->
<div class="bootstrap">
	<div class="modal fade" id="dialog_addRecord" tabindex="-1" role="dialog" aria-labelledby="dialog_addRecord" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">{$MLANG.global_head_add_record}</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div id="sdns_z-name_0" class="col-md-3">
							<label for="sdns_name_0">{$MLANG.global_dns_name}:</label>
							<input type="text" class="form-padding form-control" name="sdns_name_0" id="sdns_name_0" placeholder="&#123;domain&#125;">
						</div>
						<div id="sdns_z-type_0" class="col-md-2">
							<label for="sdns_type_0">{$MLANG.global_dns_type}:</label>
							<select class="form-padding form-control" name="sdns_type_0" id="sdns_type_0">
								{foreach from=$records item=type}
									<option value="{$type}">{$type}</option>
								{/foreach}
							</select>
						</div>
						<div id="sdns_z-content_0" class="col-md-4">
							<label for="sdns_content_0">{$MLANG.global_dns_content}:</label>
							<input type="text" class="form-padding form-control" name="sdns_content_0" id="sdns_content_0">
						</div>
						<div id="sdns_z-prio_0" class="col-md-1">
							<label for="sdns_prio_0">{$MLANG.global_dns_prio}:</label>
							<input type="text" class="form-padding form-control" name="sdns_prio_0" id="sdns_prio_0">
						</div>
						<div id="sdns_z-ttl_0" class="col-md-2">
							<label for="sdns_ttl_0">{$MLANG.global_dns_ttl}:</label>
							{if $preset_ttl}
								<select class="form-padding form-control" name="sdns_ttl_0" id="sdns_ttl_0">
									<option value="60">1 {$MLANG.global_dns_minute}</option>
									<option value="300">5 {$MLANG.global_dns_minutes}</option>
									<option SELECTED value="3600">1 {$MLANG.global_dns_hour}</option>
									<option value="86400">1 {$MLANG.global_dns_day}</option>
								</select>
							{else}
								<input type="text" class="form-padding form-control" name="sdns_ttl_0" id="sdns_ttl_0">
							{/if}
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal" onclick="record_add('template')">{$MLANG.global_btn_add}</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Delete Modal -->
<div class="bootstrap">
	<div class="modal fade" id="dialog_deleteRecord" tabindex="-1" role="dialog" aria-labelledby="dialog_deleteRecord" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">{$MLANG.global_head_delete_record}</h4>
				</div>
				<div class="modal-body">
					<p>{$MLANG.global_text_delete_record}</p>
					<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="record_delete('template')">{$MLANG.global_btn_delete}</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
				</div>
			</div>
		</div>
	</div>
</div>
