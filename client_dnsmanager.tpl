{if $has_access neq true}
<div class="alert alert-danger text-center" role="alert">
	<p>{$MLANG.client_desc_permission}</p>
</div>
{else}
<div id="dyn_msgbox" style="display: none;">
    <div id="dyn_title" style="font-weight: bold;"></div>
    <div id="dyn_msg"></div>
</div>

<div class="row">
    <div class="col-md-3 sidebar">
        <div class="panel panel-default panel-actions">
            <div class="panel-heading">
                <h3 class="panel-title">{$zone.domain|ucfirst}</h3>
            </div>
            <div class="list-group">
                <a href="#overview" id="overview-tab" class="list-group-item active" onclick="setOverview('overview');" aria-controls="overview" role="tab" data-toggle="tab">{$MLANG.client_overview}</a>
                {if $lal >= 2}<a href="#dnssec" id="dnssec-tab" class="list-group-item {if $dnssec eq false}disabled{/if}" {if $dnssec eq true}onclick="setOverview('dnssec');" {/if} aria-controls="template" role="tab" data-toggle="tab">{$MLANG.client_dnssec}</a>{/if}
            </div>
        </div>
        <div class="text-right">
            <input class="btn btn-default" type="submit" value="{$MLANG.client_back}" onclick="window.location.href='index.php?m=solutedns';"></input>
        </div>
    </div>
    <div class="col-md-9">
    	{if $maintenance eq true} 
        <div class="alert alert-warning text-center" role="alert">
        	<p>{$MLANG.client_desc_maintenance}</p>
		</div>
        {elseif $server_avb eq false}
        <div class="alert alert-danger text-center" role="alert">
        	<p>{$MLANG.client_desc_pdnserror}</p>
		</div>
        {else}
        <div class="tab-content">
            <!-- Records Tab -->
            <div role="tabpanel" class="tab-pane active" id="overview">
                <div class="row">
                    <div class="col-md-9 text-left">
                        <h4>{$MLANG.client_records}</h4>
                    </div>
                    <div class="col-md-3">
                        <div class="text-right">
                            <!-- Split button -->
                            <div class="btn-group btn-group-sm">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#dialog_addRecord" onclick=""><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> {$MLANG.client_addrecord}</button>
                                {if $dnsassist eq true}
                                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <span class="caret dropdown-toggle"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    <li><a href="#" data-toggle="modal" data-target="#dialog_srvAssist">{$MLANG.client_srvassistant}</a></li>
                                </ul>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-container clearfix">
                    <table id="sdns_records" class="table table-list dataTable">
                        <thead>
                            <tr>
                                <th>{$MLANG.client_name}</th>
                                <th>{$MLANG.client_type}</th>
                                <th>{$MLANG.client_content}</th>
                                <th>{$MLANG.client_prio}</th>
                                <th>{$MLANG.client_ttl}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6" class="dataTables_empty text-center">{$MLANG.client_loading}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            {if $lal >= 2}
            {if $dnssec eq true}
            <!-- DNSsec Tab -->
            <div role="tabpanel" class="tab-pane" id="dnssec">
                <div class="table-container clearfix">
                    <h4>{$MLANG.client_dnsseckeys}</h4>
                    <table width="100%" class="table table-list" border="0" cellspacing="1" cellpadding="3">
                        <tr>
                            <th align="center" width="10%"><strong>{$MLANG.client_keytag}</strong></th>
                            <th align="center" width="20%"><strong>{$MLANG.client_flag}</strong></th>
                            <th align="center" width="20%"><strong>{$MLANG.client_algorithm}</strong></th>
                            <th align="center" width="50%"><strong>{$MLANG.client_publickey}</strong></th>
                        </tr>
                        {if $dnssec_keys}
                        {foreach from=$dnssec_keys item=key}
                        <tr>
                            <td align="center">
                                {$key.key_tag}
                            </td>
                            <td align="center">
                                {$key.flag}
                            </td>
                            <td align="center">
                                {if $key.algorithm eq 'RSASHA1'}
                                RSA/SHA-1 (5)
                                {elseif $key.algorithm eq 'RSANSEC3SHA1'}
                                RSASHA1-NSEC3-SHA1 (7)
                                {elseif $key.algorithm eq 'RSASHA256'}
                                RSA/SHA-256 (8)
                                {elseif $key.algorithm eq 'RSASHA512'}
                                RSA/SHA-512 (10)
                                {elseif $key.algorithm eq 'ECC-GOST'}
                                GOST R 34.10-2001 (12)
                                {elseif $key.algorithm eq 'ECDSA256'}
                                ECDSA Curve P-256 with SHA-256 (13)
                                {elseif $key.algorithm eq 'ECDSA384'}
                                ECDSA Curve P-384 with SHA-384 (14
                                {else}
                                {$key.algorithm}
                                {/if}
                            </td>
                            <td align="center" style="padding-right: 8px;">
                                <textarea class="textarea">{$key.public_key}</textarea>
                            </td>
                        </tr>
                        {/foreach}
                        {else}
                        <tr>
                            <td colspan="4" class="dataTables_empty text-center">{$MLANG.client_none_available}</td>
                        </tr>
                        {/if}
                    </table>
                    <br />
                    <h4>{$MLANG.client_dsrecords}</h4>
                    <table width="100%" class="table table-list" border="0" cellspacing="1" cellpadding="3">
                        <tr>
                            <th align="center" width="10%"><strong>{$MLANG.client_keytag}</strong></th>
                            <th align="center" width="20%"><strong>{$MLANG.client_algorithm}</strong></th>
                            <th align="center" width="20%"><strong>{$MLANG.client_digesttype}</strong></th>
                            <th align="center" width="50%"><strong>{$MLANG.client_digest}</strong></th>
                        </tr>
                        {if $dnssec_keys}
                        {foreach from=$dnssec_ds item=ds}
                        <tr>
                            <td align="center">
                                {$ds.key_tag}
                            </td>
                            <td align="center">
                                {if $ds.algorithm eq '1'}
                                RSA/MD5 (1)
                                {elseif $ds.algorithm eq '2'}
                                Diffie-Hellman (2)
                                {elseif $ds.algorithm eq '3'}
                                DSA/SHA1 (3)
                                {elseif $ds.algorithm eq '5'}
                                RSA/SHA-1 (5)
                                {elseif $ds.algorithm eq '6'}
                                DSA-NSEC3-SHA1 (6)
                                {elseif $ds.algorithm eq '7'}
                                RSASHA1-NSEC3-SHA1 (7)
                                {elseif $ds.algorithm eq '8'}
                                RSA/SHA-256 (8)
                                {elseif $ds.algorithm eq '10'}
                                RSA/SHA-512 (10)
                                {elseif $ds.algorithm eq '12'}
                                GOST R 34.10-2001 (12)
                                {elseif $ds.algorithm eq '13'}
                                ECDSA Curve P-256 with SHA-256 (13)
                                {elseif $ds.algorithm eq '14'}
                                ECDSA Curve P-384 with SHA-384 (14)
                                {else}
                                {$LANG.admin_manage_unknown}
                                {/if}
                            </td>
                            <td align="center">
                                {if $ds.digest_type eq '1'}
                                SHA-1 (1)
                                {elseif $ds.digest_type  eq '2'}
                                SHA-256 (2)
                                {elseif $ds.digest_type  eq '3'}
                                GOST R 34.11-94 (3)
                                {elseif $ds.digest_type  eq '4'}
                                SHA-384 (4)
                                {else}
                                {$LANG.admin_manage_unknown}
                                {/if}
                            </td>
                            <td align="center" style="padding-right: 8px;">
                                <textarea class="textarea">{$ds.digest}</textarea>
                            </td>
                        </tr>
                        {/foreach}
                        {else}
                        <tr>
                            <td colspan="4" class="dataTables_empty text-center">{$MLANG.client_none_available}</td>
                        </tr>
                        {/if}
                    </table>
                </div>
            </div>
            {/if}
            {/if}
        </div>
        {/if}
    </div>
</div>
{if $maintenance eq false} 
{if $server_avb eq true}
<!-- Add Modal -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_addRecord" tabindex="-1" role="dialog" aria-labelledby="dialog_addRecord" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_addRecord">{$MLANG.client_addrecord}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="sdns_z-name_0" class="col-md-3">
                            <label for "sdns_name_0">{$MLANG.client_name}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_name_0" id="sdns_name_0" placeholder="{$zone.domain}">
                        </div>
                        <div class="col-md-2">
                            <label for "sdns_type_0">{$MLANG.client_type}:</label>
                            <select class="form-padding form-control" name="sdns_type_0" id="sdns_type_0">
                                {foreach from=$recordtypes item=type}
                                <option value="{$type}">{$type}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div id="sdns_z-content_0" class="col-md-4">
                            <label for "sdns_content_0">{$MLANG.client_content}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_content_0" id="sdns_content_0">
                        </div>
                        <div id="sdns_z-prio_0" class="col-md-1">
                            <label for "sdns_prio_0">{$MLANG.client_prio}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_prio_0" id="sdns_prio_0">
                        </div>
                        <div class="col-md-2">
                            <label for "sdns_ttl_0">{$MLANG.client_ttl}:</label>
                            <select class="form-padding form-control" name="sdns_ttl_0" id="sdns_ttl_0">
                                <option value="60">1 {$MLANG.client_minute}</option>
                                <option value="300">5 {$MLANG.client_minutes}</option>
                                <option SELECTED value="3600">1 {$MLANG.client_hour}</option>
                                <option value="86400">1 {$MLANG.client_day}</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="record_add()">{$MLANG.client_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.client_cancel}</button>
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
                    <h4 class="modal-title" id="dialog_deleteRecord">{$MLANG.client_deleterecord}</h4>
                </div>
                <div class="modal-body">
                    <p>{$MLANG.client_text_deleterecord}</p>
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="record_delete()">{$MLANG.client_delete}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.client_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

{if $dnsassist eq true}
<!-- SRV Assist -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_srvAssist" tabindex="-1" role="dialog" aria-labelledby="dialog_srvAssist" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_srvAssist">{$MLANG.client_srvassistant}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <label for "sdns_srv_service">{$MLANG.client_service}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_srv_service" id="sdns_srv_service" placeholder="ldap">
                        </div>
                        <div class="col-md-3">
                            <label for "sdns_srv_protocol">{$MLANG.client_protocol}:</label>
                            <select class="form-padding form-control" name="sdns_srv_protocol" id="sdns_srv_protocol">
                                <option value="TCP">TCP</option>
                                <option value="UDP">UDP</option>
                                <option value="TLS">TLS</option>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <label>{$MLANG.client_name}:</label>
                            <p class="form-control-static">.{$zone.domain}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label for "sdns_srv_ttl">{$MLANG.client_ttl}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_srv_ttl" id="sdns_srv_ttl" value="3600">
                        </div>
                        <div class="col-md-2">
                            <label for "sdns_srv_priority">{$MLANG.client_priority}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_srv_priority" id="sdns_srv_priority">
                        </div>
                        <div class="col-md-2">
                            <label for "sdns_srv_weight">{$MLANG.client_weight}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_srv_weight" id="sdns_srv_weight">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <label for "sdns_srv_target">{$MLANG.client_target}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_srv_target" id="sdns_srv_target">
                        </div>
                        <div class="col-md-4">
                            <label for "sdns_srv_port">{$MLANG.client_port}:</label>
                            <input type="textbox" class="form-padding form-control" name="sdns_srv_port" id="sdns_srv_port">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="dnsassist('srv')">{$MLANG.client_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.client_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}

<input type="hidden" id="sdns_zone" value="{$zone.id}">
<input type="hidden" id="sdns_record">

<script>
    $(document).ready(function() {
        drawRecords('sdns_records');
    });
</script>
{/if}
{/if}
{/if}

<noscript>
    <div class="alert alert-danger">
        <h4>{$MLANG.nojavascript_title}</h4>
        <p>{$MLANG.nojavascript_desc}</p>
    </div>
	<style>.sidebar { display:none; } .tab-content { display:none; }</style>
</noscript>