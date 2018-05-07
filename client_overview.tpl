{if $client_zones}
	<span data-toggle="modal" data-target="#dialog_addZone" class="pull-right">
		<button type="button" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="bottom" title="{$MLANG.global_head_add_zone}" {if $maintenance}DISABLED{/if}><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
	</span>
{/if}

<h3 class="h-top">{$MLANG.client_menu_overview}</h3>
<table id="sdns_overview" class="table table-list dataTable no-footer dtr-inline">
	<thead>
		<tr>
			<th>{$MLANG.global_general_domains}</th>
			<th> </th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="3" class="dataTables_empty text-center">{$MLANG.global_general_loading}</td>
		</tr>
	</tbody>
</table>
			
{if $client_zones} 
	<!-- Add Zone -->
	<div class="bootstrap">
		<div class="modal fade" id="dialog_addZone" tabindex="-1" role="dialog" aria-labelledby="dialog_addZone" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">{$MLANG.global_head_add_zone}</h4>
					</div>
					<form role="form" id="addzone">
						<input type="hidden" name="sdns_form" value="addzone">
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<label for="sdns_apply_template">{$MLANG.global_general_domain}:</label>
									<input type="text" class="form-padding form-control" name="sdns_addzone_domain" id="sdns_addzone_domain">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12"> <small>{$MLANG.client_overview_addzonelimit|sprintf:$zone_limit} </small> </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" data-dismiss="modal" onclick="zone_add();">{$MLANG.global_btn_add}</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
						</div>
					</form>
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
							<div id="sdns_zone_name">{$MLANG.global_head_delete_zone}: <span>{$domain->domain}</span></div>
						</h4>
					</div>
					<div class="modal-body">
						<p>{$MLANG.global_text_delete_zone}</p>
						<br />
					</div>
					<div class="modal-footer">
						<input type="hidden" id="sdns_zone">
						<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="zone_delete()">{$MLANG.global_btn_delete}</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if} 