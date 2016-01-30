<div id="dyn_msgbox" style="display: none;">
    <div id="dyn_title" style="font-weight: bold;"></div>
    <div id="dyn_msg"></div>
</div>

<div class="row">
    <div class="col-md-3 sidebar">
        <div class="panel panel-default panel-actions">
            <div class="panel-heading">
                <h3 class="panel-title">{$MLANG.client_manage}</h3>
            </div>
            <div class="list-group">
                <a href="#overview" id="overview-tab" class="list-group-item active" onclick="setOverview('overview');" aria-controls="overview" role="tab" data-toggle="tab">{$MLANG.client_overview}</a>
                {if $lal >= 3}<a href="#template" id="template-tab" class="list-group-item {if $client_template eq false}disabled{/if}" {if $client_template eq true} onclick="setOverview('template'); drawRecords('sdns_template');" {/if} aria-controls="template" role="tab" data-toggle="tab">{$MLANG.client_defaulttemplate}</a>{/if}
                {if $lal >= 3}<a href="#reverse" id="reverse-tab" class="list-group-item {if $reverse_management eq false}disabled{/if}" {if $reverse_management eq true} onclick="setOverview('reverse'); drawReverse('sdns_reverse');" {/if} aria-controls="reverse" role="tab" data-toggle="tab">{$MLANG.client_reversedns}</a>{/if}
            </div>
        </div>
        {if $maintenance eq false} 
        {if $client_zones eq true}
        {if $lal >= 3}
        <div class="input-group input-group">
            <input id="sdns_add_zone" class="form-control" type="text" name="q" placeholder="{$MLANG.client_addnewzone}"></input>
            <div class="input-group-btn">
                <input class="btn btn-success" type="submit" value="{$MLANG.client_add}" onclick="zone_add();"></input>
            </div>
        </div>
        <div class="text-center"><small><label for="add_zone">{$MLANG.client_addupto} {$zone_limit} {$MLANG.client_zones}.</label></small></div>
        {/if}
        {/if}
        {/if}
    </div>
    <div class="col-md-9">
        {if $maintenance eq true} 
        <div class="alert alert-warning text-center" role="alert">
        	<p>{$MLANG.client_desc_maintenance}</p>
		</div>
        {else}
        <div class="tab-content">
        	<!-- Overview Tab -->
            <div role="tabpanel" class="tab-pane active" id="overview">
                <div class="table-container clearfix">
                    <h4>{$MLANG.client_overview}</h4>
                    <table id="sdns_overview" class="table table-list dataTable">
                        <thead>
                            <tr>
                                <th>{$MLANG.client_domain}</th>
                                <th>{$MLANG.client_status}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3" class="dataTables_empty text-center">{$MLANG.client_loading}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            {if $lal >= 3}
            {if $client_template eq true}
            <!-- Template Tab -->
            <div role="tabpanel" class="tab-pane" id="template">
                {if $dnstemplate eq true}
                <div class="row">
                    <div class="col-md-9 text-left">
                        <h4>{$MLANG.client_defaulttemplate}</h4>
                    </div>
                    <div class="col-md-3">
                        <div class="text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#dialog_addRecord" onclick=""><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> {$MLANG.client_addrecord}</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-container clearfix">
                    <table id="sdns_template" class="table table-list dataTable">
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
                	<div class="top5">
                        <div class="col-md-12 text-center">
                            <p>{$MLANG.client_text_templatedesc|escape}</p>
                        </div>
                    </div>
                </div>
                {else}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{$MLANG.client_defaulttemplate}</h3>
                    </div>
                    <div class="panel-body">
                        <p>{$MLANG.client_text_activatedesc}</p>
                        <div class="text-center"><a href="#" onclick="activate_template();" class="btn btn-lg btn-success">{$MLANG.client_activate}</a></div>
                    </div>
                </div>
                {/if}
            </div>
            {/if}
            {/if}
            {if $lal >= 3}
            {if $reverse_management eq true}
            <!-- Reverse Tab -->
            <div role="tabpanel" class="tab-pane" id="reverse">
                <div class="table-container clearfix">
                    <h4>{$MLANG.client_reversedns}</h4>
                    <table id="sdns_reverse" class="table table-list dataTable">
                        <thead>
                            <tr>
                                <th>{$MLANG.client_ip}</th>
                                <th>{$MLANG.client_hostname}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3" class="dataTables_empty text-center">{$MLANG.client_loading}</td>
                            </tr>
                        </tbody>
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
{if $client_zones eq true || $client_template eq true}
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
                            <input type="textbox" class="form-padding form-control" name="sdns_name_0" id="sdns_name_0" placeholder="&lt;domain&gt;">
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
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="record_add('template')">{$MLANG.client_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.client_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

{if $lal >= 3}
<!-- Delete Modal -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_deleteZone" tabindex="-1" role="dialog" aria-labelledby="dialog_deleteZone" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_deleteZone">{$MLANG.client_deletezone}</h4>
                </div>
                <div class="modal-body">
                    <p>{$MLANG.client_text_deletezone}</p>
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="zone_delete()">{$MLANG.client_delete}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.client_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}

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
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="record_delete('template')">{$MLANG.client_delete}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$MLANG.client_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="sdns_zone">
<input type="hidden" id="sdns_record">
{/if}

<script>
    $(document).ready(function() {
        drawTable('sdns_overview');
    });
</script>
{/if}

<noscript>
    <div class="alert alert-danger">
        <h4>{$MLANG.nojavascript_title}</h4>
        <p>{$MLANG.nojavascript_desc}</p>
    </div>
	<style>.sidebar { display:none; } .tab-content { display:none; }</style>
</noscript>