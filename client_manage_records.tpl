<h4 class="h-top"><a href="clientarea.php?action=domaindetails&id={$domain->id}">{$domain->idn}</a> {if $dnssec.nsec}<span class="label label-primary"><span class="glyphicons glyphicons-unlock" aria-hidden="true"></span> {$dnssec.nsec}</span>{/if}</h4> 

<!-- Split button -->
<div class="btn-group pull-right">
	<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#dialog_addRecord" title="{$MLANG.admin_manage_records_addrecord}" {if $maintenance}DISABLED{/if}><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
	<button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span> </button>
	<ul class="dropdown-menu dropdown-menu-right" role="menu">
		<li><a href="#" data-toggle="modal" data-target="#dialog_srvAssist">{$MLANG.admin_manage_records_addsrv}</a></li>
		<li><a href="#" data-toggle="modal" data-target="#dialog_tlsaAssist">{$MLANG.admin_manage_records_addtlsa}</a></li>
	</ul>
</div>
	
<h3 class="h-top">{$MLANG.client_menu_records}</h3>
<div class="table-container clearfix">
	<table id="sdns_records" class="table table-list dataTable no-footer dtr-inline th-border">
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
				<td colspan="7" class="dataTables_empty text-center"></td>
			</tr>
		</tbody>
	</table>
	<div class="pull-right"><a class="btn btn-sm btn-default {if $maintenance}disabled{/if}" href="#" onclick="deleteSelected();"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span><span class="dropmenu_desc">{$MLANG.client_manage_records_deleteselected}</span></a></div>
</div>

<input type="hidden" id="sdns_zone" value="{$domain->id}">
<input type="hidden" id="sdns_domain" value="{$domain->domain}">
<input type="hidden" id="sdns_record">

{if $maintenance eq false} 
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
								<input type="text" class="form-padding form-control" name="sdns_name_0" id="sdns_name_0" placeholder="{$domain->domain}">
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
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="record_add()">{$MLANG.global_btn_add}</button>
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
						<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="record_delete()">{$MLANG.global_btn_delete}</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- SRV Assist -->
	<div class="bootstrap">
		<div class="modal fade" id="dialog_srvAssist" tabindex="-1" role="dialog" aria-labelledby="dialog_srvAssist" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">{$MLANG.admin_manage_records_addsrv}</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-4">
								<label for="sdns_name_0">{$MLANG.global_dns_service}:</label>
								<input type="text" class="form-padding form-control" name="sdns_srv_service" id="sdns_srv_service" placeholder="ldap">
							</div>
							<div class="col-md-3">
								<label for="sdns_type_0">{$MLANG.global_dns_protocol}:</label>
								<select class="form-padding form-control" name="sdns_srv_protocol" id="sdns_srv_protocol">
									<option value="TCP">TCP</option>
									<option value="UDP">UDP</option>
									<option value="TLS">TLS</option>
								</select>
							</div>
							<div class="col-md-5">
								<label>{$MLANG.global_dns_name}:</label>
								<p class="form-control-static">.{$domain->domain}</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label for="sdns_name_0">{$MLANG.global_dns_ttl}:</label>
								<input type="text" class="form-padding form-control" name="sdns_srv_ttl" id="sdns_srv_ttl" value="3600">
							</div>
							<div class="col-md-2">
								<label for="sdns_name_0">{$MLANG.global_dns_priority}:</label>
								<input type="text" class="form-padding form-control" name="sdns_srv_priority" id="sdns_srv_priority">
							</div>
							<div class="col-md-2">
								<label for="sdns_name_0">{$MLANG.global_dns_weight}:</label>
								<input type="text" class="form-padding form-control" name="sdns_srv_weight" id="sdns_srv_weight">
							</div>
						</div>
						<div class="row">
							<div class="col-md-8">
								<label for="sdns_name_0">{$MLANG.global_dns_target}:</label>
								<input type="text" class="form-padding form-control" name="sdns_srv_target" id="sdns_srv_target">
							</div>
							<div class="col-md-4">
								<label for="sdns_name_0">{$MLANG.global_dns_port}:</label>
								<input type="text" class="form-padding form-control" name="sdns_srv_port" id="sdns_srv_port">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="dnsassist('srv');">{$MLANG.global_btn_add}</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- TLSA Assist -->
	<div class="bootstrap">
		<div class="modal fade" id="dialog_tlsaAssist" tabindex="-1" role="dialog" aria-labelledby="dialog_tlsaAssist" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">{$MLANG.admin_manage_records_addtlsa}</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<label>{$MLANG.global_dns_usage}:</label>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_0" value="0" checked>
											<label for="sdns_tlsa_usage_0">{$MLANG.global_assistant_tlsa_pkixta} <span title="{$MLANG.global_assistant_tlsa_pkixta_info}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-question-circle text-info"></i></span></label>
										</div>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_1" value="1">
											<label for="sdns_tlsa_usage_1">{$MLANG.global_assistant_tlsa_pkixee} <span title="{$MLANG.global_assistant_tlsa_pkixee_info}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-question-circle text-info"></i></span></label>
										</div>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_2" value="2">
											<label for="sdns_tlsa_usage_2">{$MLANG.global_assistant_tlsa_daneta} <span title="{$MLANG.global_assistant_tlsa_daneta_info}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-question-circle  text-info"></i></span></label>
										</div>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_3" value="3">
											<label for="sdns_tlsa_usage_3">{$MLANG.global_assistant_tlsa_daneee} <span title="{$MLANG.global_assistant_tlsa_daneee_info}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-question-circle  text-info"></i></span></label>
										</div>
									</div>
									<div class="col-md-12">
										<label>{$MLANG.global_dns_selector}:</label>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_selector" id="sdns_tlsa_selector_0" value="0" checked>
											<label for="sdns_tlsa_selector_0">{$MLANG.global_assistant_tlsa_fullcert}</label>
										</div>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_selector" id="sdns_tlsa_selector_1" value="1">
											<label for="sdns_tlsa_selector_1">{$MLANG.global_assistant_tlsa_subjectpublickey}</label>
										</div>
									</div>
									<div class="col-md-12">
										<label>{$MLANG.global_dns_matchingtype}:</label>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_type" id="sdns_tlsa_type_1" value="1" checked>
											<label for="sdns_tlsa_type_1">{$MLANG.global_assistant_tlsa_256hash}</label>
										</div>
										<div class="radio">
											<input type="radio" name="sdns_tlsa_type" id="sdns_tlsa_type_2" value="2">
											<label for="sdns_tlsa_type_2">{$MLANG.global_assistant_tlsa_512hash}</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<label for="sdns_tlsa_certificate">{$MLANG.global_dns_certificate}:</label>
										<span title="{$MLANG.global_assistant_tlsa_certificate_info}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-question-circle text-info"></i></span>
										<textarea rows="7" cols="50" class="form-padding form-control" name="sdns_tlsa_certificate" id="sdns_tlsa_certificate"></textarea>
									</div>
									<div class="col-md-12">
										<label for="sdns_tlsa_port">{$MLANG.global_dns_port}:</label>
										<input type="text" class="form-padding form-control" name="sdns_tlsa_port" id="sdns_tlsa_port" placeholder="443">
									</div>
									<div class="col-md-12">
										<label for="sdns_tlsa_protocol">{$MLANG.global_dns_protocol}:</label>
										<select class="form-padding form-control" name="sdns_tlsa_protocol" id="sdns_tlsa_protocol">
											<option value="TCP">TCP</option>
											<option value="UDP">UDP</option>
											<option value="SCTP">SCTP</option>
											<option value="DCCP">DCCP</option>
										</select>
									</div>
									<div class="col-md-12">
										<label for="sdns_tlsa_name">{$MLANG.global_dns_name}:</label>
										<input type="text" class="form-padding form-control" name="sdns_tlsa_name" id="sdns_tlsa_name" placeholder="{$domain->domain}">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="dnsassist('tlsa');">{$MLANG.global_btn_add}</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.global_btn_cancel}</button>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}