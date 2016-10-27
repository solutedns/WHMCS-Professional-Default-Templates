<div class="col-md-12 topm10">

    <div class="row">
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_zone}:</strong>
                <br />
                {if $zone.type eq 'd'}
                <a href="clientsdomains.php?userid={$zone.client_id}&id={$zone.local_id}">{$zone.domain}</a></p>
                {else if $zone.type eq 'p'}
                <a href="clientsservices.php?userid={$zone.client_id}&id={$zone.local_id}">{$zone.domain}</a></p>
                {else}
                <a href="http://{$zone.domain}">{$zone.domain}</a></p>
                {/if}
        </div>
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_client}:</strong>
                <br /><a href="clientssummary.php?userid={$clientdetails.id}">{if $clientdetails.companyname}{$clientdetails.companyname}{else}{$clientdetails.firstname} {$clientdetails.lastname}{/if}</a></p>
        </div>
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_email}:</strong>
                <br /><a href="mailto:{$clientdetails.email}">{$clientdetails.email}</a></p>
        </div>
        <div class="col-md-3">
            <div class="text-right">
                <!-- Split button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#dialog_addRecord" onclick=""><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> {$LANG.admin_manage_records_addrecord}</button>
                    <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li><a href="#" data-toggle="modal" data-target="#dialog_srvAssist">{$LANG.admin_manage_records_srvassist}</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#dialog_tlsaAssist">{$LANG.admin_manage_records_tlsaassist}</a></li>
                    </ul>
                </div>
                <!-- Single button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        {$LANG.admin_manage_records_manage} <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li><a href="#" data-toggle="modal" data-target="#dialog_applyTemplate"><span class="glyphicon glyphicon-random" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_manage_records_applytemplate}</span></a></li>
                        {if $lal >= 3}
                        <li><a href="#" data-toggle="modal" data-target="#dialog_importZone"><span class="glyphicon glyphicon-import" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_manage_records_importzone}</span></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#dialog_exportZone" onclick="ExportZone('{$zone.id}')"><span class="glyphicon glyphicon-export" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_manage_records_exportzone}</span></a></li>
                        {/if}
                        <li class="divider"></li>
                        <li><a href="#" onclick="deleteSelected();"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_manage_records_deleteselected}</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <h2>{$LANG.admin_manage_title_records}</h2>

    <table class="dataTable display" id="sdns_records" width="100%" border="0" cellspacing="1" cellpadding="3">
        <thead>
            <tr>
                <th></th>
                <th>{$LANG.admin_manage_table_id}</th>
                <th>{$LANG.admin_manage_name}</th>
                <th>{$LANG.admin_manage_type}</th>
                <th>{$LANG.admin_manage_content}</th>
                <th>{$LANG.admin_manage_prio}</th>
                <th>{$LANG.admin_manage_ttl}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="8" class="dataTables_empty">{$LANG.admin_loading_data}</td>
            </tr>
        </tbody>
    </table>

</div>

<!-- Add Modal -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_addRecord" tabindex="-1" role="dialog" aria-labelledby="dialog_addRecord" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{$LANG.admin_manage_records_addrecord}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="sdns_z-name_0" class="col-md-3">
                            <label for="sdns_name_0">{$LANG.admin_manage_name}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_name_0" id="sdns_name_0" placeholder="{$zone.domain}">
                        </div>
                        <div class="col-md-2">
                            <label for="sdns_type_0">{$LANG.admin_manage_type}:</label>
                            <select class="form-padding form-control" name="sdns_type_0" id="sdns_type_0">
                                <option value="A">A</option>
                                <option value="AAAA">AAAA</option>
                                <option value="CNAME">CNAME</option>
                                <option value="MX">MX</option>
                                <option value="NAPTR">NAPTR</option>
                                <option value="NS">NS</option>
                                <option value="PTR">PTR</option>
                                <option value="RP">RP</option>
                                <option value="SOA">SOA</option>
                                <option value="SPF">SPF</option>
                                <option value="SRV">SRV</option>
                                <option value="SSHFP">SSHFP</option>
                                <option value="TLSA">TLSA</option>
                                <option value="TXT">TXT</option>
                            </select>
                        </div>
                        <div id="sdns_z-content_0" class="col-md-4">
                            <label for="sdns_content_0">{$LANG.admin_manage_content}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_content_0" id="sdns_content_0">
                        </div>
                        <div id="sdns_z-prio_0" class="col-md-1">
                            <label for="sdns_prio_0">{$LANG.admin_manage_prio}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_prio_0" id="sdns_prio_0">
                        </div>
                        <div class="col-md-2">
                            <label for="sdns_ttl_0">{$LANG.admin_manage_ttl}:</label>
                        	{if $ttl.preset}
                            <select class="form-padding form-control" name="sdns_ttl_0" id="sdns_ttl_0">
                                <option {if $ttl.default eq "60"}SELECTED{/if} value="60">1 {$LANG.admin_manage_minute}</option>
                                <option {if $ttl.default eq "300"}SELECTED{/if} value="300">5 {$LANG.admin_manage_minutes}</option>
                                <option {if $ttl.default eq "3600"}SELECTED{/if} value="3600">1 {$LANG.admin_manage_hour}</option>
                                <option {if $ttl.default eq "86400"}SELECTED{/if} value="86400">1 {$LANG.admin_manage_day}</option>
                                {if $ttl.default neq "60" && $ttl.default neq "300" && $ttl.default neq "3600" && $ttl.default neq "86400"}
                                <option SELECTED value="{$ttl.default}">{$ttl.default}</option>
                                {/if}
                            </select>
                            {else}
                            <input type="text" class="form-padding form-control" name="sdns_ttl_0" id="sdns_ttl_0">
                            {/if}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="record_add()">{$LANG.admin_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
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
                    <h4 class="modal-title">{$LANG.admin_manage_records_deleterecord}</h4>
                </div>
                <div class="modal-body">
                    <p>{$LANG.admin_manage_text_deleterecord}</p>
                    <br />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="record_delete()">{$LANG.admin_delete}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Apply Template -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_applyTemplate" tabindex="-1" role="dialog" aria-labelledby="dialog_applyTemplate" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{$LANG.admin_manage_records_applytemplate}</h4>
                </div>
                <form role="form" id="applytemplate">
                    <input type="hidden" name="sdns_form" value="applytemplate">
                    <input type="hidden" name="sdns_domain" value="{$zone.domain}">
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-12">
                                <label for="sdns_apply_template">{$LANG.admin_manage_records_selecttemplate}:</label>
                                <select class="form-padding form-control" name="sdns_apply_template" id="sdns_apply_template">
                                    {foreach from=$template_list item=item}
                                    <option value="{$item.id}">{$item.name} ({$item.id})</option>
                                    {/foreach}
                                </select>

                            </div>

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="updatesettings('applytemplate');">{$LANG.admin_apply}</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                    </div>
                </form>
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
                    <h4 class="modal-title">{$LANG.admin_manage_records_srvassist}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="sdns_name_0">{$LANG.admin_manage_service}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_srv_service" id="sdns_srv_service" placeholder="ldap">
                        </div>
                        <div class="col-md-3">
                            <label for="sdns_type_0">{$LANG.admin_manage_protocol}:</label>
                            <select class="form-padding form-control" name="sdns_srv_protocol" id="sdns_srv_protocol">
                                <option value="TCP">TCP</option>
                                <option value="UDP">UDP</option>
                                <option value="TLS">TLS</option>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <label>{$LANG.admin_manage_name}:</label>
                            <p class="form-control-static">.{$zone.domain}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label for="sdns_name_0">{$LANG.admin_manage_ttl}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_srv_ttl" id="sdns_srv_ttl" value="{$ttl.default}">
                        </div>
                        <div class="col-md-2">
                            <label for="sdns_name_0">{$LANG.admin_manage_priority}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_srv_priority" id="sdns_srv_priority">
                        </div>
                        <div class="col-md-2">
                            <label for="sdns_name_0">{$LANG.admin_manage_weight}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_srv_weight" id="sdns_srv_weight">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <label for="sdns_name_0">{$LANG.admin_manage_target}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_srv_target" id="sdns_srv_target">
                        </div>
                        <div class="col-md-4">
                            <label for="sdns_name_0">{$LANG.admin_manage_port}:</label>
                            <input type="text" class="form-padding form-control" name="sdns_srv_port" id="sdns_srv_port">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="dnsassist('srv');">{$LANG.admin_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
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
                    <h4 class="modal-title">{$LANG.admin_manage_records_tlsaassist}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                        	<div class="row">
                                <div class="col-md-12">
                                    <label>{$LANG.admin_manage_usage}:</label>

                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_0" value="0" checked>
                                        <label for="sdns_tlsa_usage_0">{$LANG.global_tlsa_pkixta} <span data-content="{$LANG.global_tlsa_pkixta_info}" data-toggle="popover" class="show-details"><i class="fa fa-question-circle text-info"></i></span></label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_1" value="1">
                                        <label for="sdns_tlsa_usage_1">{$LANG.global_tlsa_pkixee} <span data-content="{$LANG.global_tlsa_pkixee_info}" data-toggle="popover" class="show-details"><i class="fa fa-question-circle text-info"></i></span></label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_2" value="2">
                                        <label for="sdns_tlsa_usage_2">{$LANG.global_tlsa_daneta} <span data-content="{$LANG.global_tlsa_daneta_info}" data-toggle="popover" class="show-details"><i class="fa fa-question-circle  text-info"></i></span></label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_usage" id="sdns_tlsa_usage_3" value="3">
                                       <label for="sdns_tlsa_usage_3">{$LANG.global_tlsa_daneee} <span data-content="{$LANG.global_tlsa_daneee_info}" data-toggle="popover" class="show-details"><i class="fa fa-question-circle  text-info"></i></span></label>
                                    </div>
                                
                                </div>
                                <div class="col-md-12">
                                    <label>{$LANG.admin_manage_selector}:</label>

                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_selector" id="sdns_tlsa_selector_0" value="0" checked>
                                        <label for="sdns_tlsa_selector_0">{$LANG.global_tlsa_fullcert}</label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_selector" id="sdns_tlsa_selector_1" value="1">
                                        <label for="sdns_tlsa_selector_1">{$LANG.global_tlsa_subjectpublickey}</label>
                                    </div>
                                    
								</div>
                                <div class="col-md-12">
                                    <label>{$LANG.admin_manage_matchingtype}:</label>

                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_type" id="sdns_tlsa_type_1" value="1" checked>
                                        <label for="sdns_tlsa_type_1">{$LANG.global_tlsa_256hash}</label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" name="sdns_tlsa_type" id="sdns_tlsa_type_2" value="2">
                                        <label for="sdns_tlsa_type_2">{$LANG.global_tlsa_512hash}</label>
                                    </div>
                                    
								</div>
                        	</div>
						</div>                    
                        <div class="col-md-6">
                        	<div class="row">
                            	<div class="col-md-12">
                                    <label for="sdns_tlsa_certificate">{$LANG.admin_manage_certificate}:</label>
                                    <span data-content="{$LANG.global_tlsa_certificate_info}" data-toggle="popover" class="show-details"><i class="fa fa-question-circle text-info"></i></span>
                                    <textarea rows="7" cols="50" class="form-padding form-control" name="sdns_tlsa_certificate" id="sdns_tlsa_certificate"></textarea>
								</div>
                                
                                <div class="col-md-12">
                                    <label for="sdns_tlsa_port">{$LANG.admin_manage_port}:</label>
                                    <input type="text" class="form-padding form-control" name="sdns_tlsa_port" id="sdns_tlsa_port" placeholder="443">
                                </div>
                                <div class="col-md-12">
                                    <label for="sdns_tlsa_protocol">{$LANG.admin_manage_protocol}:</label>
                                    <select class="form-padding form-control" name="sdns_tlsa_protocol" id="sdns_tlsa_protocol">
                                        <option value="TCP">TCP</option>
                                        <option value="UDP">UDP</option>
                                        <option value="SCTP">SCTP</option>
                                        <option value="DCCP">DCCP</option>
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <label for="sdns_tlsa_name">{$LANG.admin_manage_name}:</label>
                                    <input type="text" class="form-padding form-control" name="sdns_tlsa_name" id="sdns_tlsa_name" placeholder="{$zone.domain}">
                                </div>
                            </div>
						</div>                    
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="dnsassist('tlsa');">{$LANG.admin_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

{if $lal >= 3}
<!-- Import Zone -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_importZone" tabindex="-1" role="dialog" aria-labelledby="dialog_importZone" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{$LANG.admin_manage_records_importzone}</h4>
                </div>
                <form role="form" id="importzone">
                    <input type="hidden" name="sdns_form" value="importzone">
                    <input type="hidden" name="sdns_domain" value="{$zone.domain}">
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-12">
                                <p>{$LANG.admin_manage_text_importzone}</p>
                                <textarea id="textarea_iin" name="sdns_importzone" class="form-padding form-control"></textarea>
                                <div class="checkbox chx_desc">
                                    <input id="overwrite" type="checkbox" name="sdns_overwrite"></input>
                                    <label for="overwrite">{$LANG.admin_manage_text_importzoneoverwrite}</label>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="updatesettings('importzone');">{$LANG.admin_import}</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Export Zone -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_exportZone" tabindex="-1" role="dialog" aria-labelledby="dialog_exportZone" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{$LANG.admin_manage_records_exportzone}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <textarea id="textarea_iex" name="sdns_exportzone" class="form-padding form-control">{$LANG.admin_loading_zone}</textarea>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_close}</button>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}

<input type="hidden" id="sdns_zone" value="{$zone.id}">
<input type="hidden" id="sdns_record">