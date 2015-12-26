<div class="col-md-12">

    <div id="ns{$ns_details.id}_msgbox" style="display: none;">
        <div id="ns{$ns_details.id}_title" style="font-weight: bold;"><h4>{$LANG.admin_nameservers_error}</h4></div>
        <div id="ns{$ns_details.id}_msg"></div>
    </div>
    
    {if $ns_add}
    <div class="alert2 alert2-info">
        <h4>{$LANG.admin_nameservers_add_title}</h4>
        <p>{$LANG.admin_nameservers_add_desc}</p>
	</div>
    {/if}

    {if $ns_index}
    <div style="" class="alert2 alert2-info">
        <div class="row">
            <div class="col-sm-9">
                <h4>{$LANG.admin_nameservers_index_title}</h4>
                <p>{$LANG.admin_nameservers_index_desc}</p>
            </div>
            <div class="col-sm-3 text-right">
                <input class="btn btn-sm btn-info" type="button" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('index-{$ns_details.id}'); console_name('{$LANG.admin_console_title_index}');"value="{$LANG.admin_index}">
            </div>
        </div>
    </div>
    {/if}

    <form role="form" id="nameserver">
        <fieldset>
            <input type="hidden" name="sdns_form" value="nameservers">
            <input type="hidden" name="sdns_server_id" id="sdns_server_id" value="{$ns_details.id}">
            
            <h4>{$LANG.admin_nameservers_title_primarydb}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_db_host">{$LANG.admin_nameservers_option_host}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_db_host" id="sdns_db_host" value="{$ns_details.db_host}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_db_host">{$LANG.admin_nameservers_desc_host}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_db_port">{$LANG.admin_nameservers_option_port}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_db_port" id="sdns_db_port" placeholder="3306" {if $ns_details.db_port neq '0'}value="{$ns_details.db_port}"{/if}>
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_db_port">{$LANG.admin_nameservers_desc_port}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_db_user">{$LANG.admin_nameservers_option_user}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_db_user" id="sdns_db_user" value="{$ns_details.db_user}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_db_password">{$LANG.admin_nameservers_option_password}:</label>
                </div>
                <div class="col-md-3">
                    <input type="password" class="form-padding form-control" name="sdns_db_password" id="sdns_db_password" placeholder="Password" value="{$ns_details.db_pass}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_db_database">{$LANG.admin_nameservers_option_database}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_db_database" id="sdns_db_database" value="{$ns_details.db_name}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_zone_type">{$LANG.admin_nameservers_option_zonetype}:</label>
                </div>
                <div class="col-md-3">
                    <select class="form-padding form-control" name="sdns_zone_type" id="sdns_zone_type">
                        <option {if $ns_details.zone_type eq 'master'}selected {/if}value="master">Master</option>
                        <option {if $ns_details.zone_type eq 'native'}selected {/if}value="native">Native</option>
                    </select>
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_zone_type">{$LANG.admin_nameservers_desc_zonetype}</label>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_nameservers_title_nameservers}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ns0">{$LANG.admin_nameservers_option_nameserver1}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ns0" id="sdns_ns0" value="{$ns_details.ns0}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_ns0">{$LANG.admin_nameservers_desc_nameserver1}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ns1">{$LANG.admin_nameservers_option_nameserver2}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ns1" id="sdns_ns1" value="{$ns_details.ns1}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ns2">{$LANG.admin_nameservers_option_nameserver3}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ns2" id="sdns_ns2" value="{$ns_details.ns2}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ns3">{$LANG.admin_nameservers_option_nameserver4}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ns3" id="sdns_ns3" value="{$ns_details.ns3}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ns4">{$LANG.admin_nameservers_option_nameserver5}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ns4" id="sdns_ns4" value="{$ns_details.ns4}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ns5">{$LANG.admin_nameservers_option_nameserver6}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ns5" id="sdns_ns5" value="{$ns_details.ns5}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_ns5">{$LANG.admin_nameservers_desc_nameserver6}</label>
                </div>
            </div>
            
            {if $lal >= 2}
            <hr />
            <h4>{$LANG.admin_nameservers_title_ssh2details} <input class="btn btn-sm btn-default" type="button" onClick="syscheck('ssh','{$ns_details.id}');" value="{$LANG.admin_check}" /></h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ssh_host">{$LANG.admin_nameservers_option_host}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ssh_host" id="sdns_ssh_host" value="{$ns_details.ssh_host}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_ssh_host">{$LANG.admin_nameservers_desc_sshhost}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ssh_port">{$LANG.admin_nameservers_option_port}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ssh_port" id="sdns_ssh_port" placeholder="22" {if $ns_details.ssh_port neq '0'}value="{$ns_details.ssh_port}"{/if} >
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_ssh_port">{$LANG.admin_nameservers_desc_sshport}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ssh_user">{$LANG.admin_nameservers_option_user}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_ssh_user" id="sdns_ssh_user" value="{$ns_details.ssh_user}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_ssh_password">{$LANG.admin_nameservers_option_password}:</label>
                </div>
                <div class="col-md-3">
                    <input type="password" class="form-padding form-control" name="sdns_ssh_password" id="sdns_ssh_password" value="{$ns_details.ssh_pass}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_ssh_usekey">{$LANG.admin_nameservers_option_useprivatekey}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $ns_details.ssh_usekey eq 'on'}checked {/if}name="sdns_ssh_usekey" id="sdns_ssh_usekey" type="checkbox">
                        <label class="chx_label" for="sdns_ssh_usekey"> {$LANG.admin_nameservers_desc_useprivatekey}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_ssh_key">{$LANG.admin_nameservers_option_privatekey}:</label>
                </div>
                <div class="col-md-9">
                    <textarea name="sdns_ssh_key" id="sdns_ssh_key" placeholder="## ENCRYPTED DATA ##"></textarea>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_nameservers_title_dnssecoptions}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_dnssec_enable">{$LANG.admin_nameservers_option_enablednssec}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $ns_details.dnssec_enable eq 'on'}checked {/if}name="sdns_dnssec_enable" id="sdns_dnssec_enable" type="checkbox">
                        <label class="chx_label" for="sdns_dnssec_enable"> {$LANG.admin_nameservers_desc_enablednssec}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_dnssec_rectify">{$LANG.admin_nameservers_option_autorectify}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $ns_details.dnssec_rectify eq 'on'}checked {/if}name="sdns_dnssec_rectify" id="sdns_dnssec_rectify" type="checkbox">
                        <label class="chx_label" for="sdns_dnssec_rectify"> {$LANG.admin_nameservers_desc_autorectify}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_dnssec_auto">{$LANG.admin_nameservers_option_autoenablednssec}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $ns_details.dnssec_auto eq 'on'}checked {/if}name="sdns_dnssec_auto" id="sdns_dnssec_auto" type="checkbox">
                        <label class="chx_label" for="sdns_dnssec_auto"> {$LANG.admin_nameservers_desc_autoenablednssec}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_dnssec_nsec3">{$LANG.admin_nameservers_option_setnsec3}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $ns_details.dnssec_nsec3 eq 'on'}checked {/if}name="sdns_dnssec_nsec3" id="sdns_dnssec_nsec3" type="checkbox">
                        <label class="chx_label" for="sdns_dnssec_nsec3"> {$LANG.admin_nameservers_desc_setnsec3}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_dnssec_client">{$LANG.admin_nameservers_option_showtoclient}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $ns_details.dnssec_client eq 'on'}checked {/if}name="sdns_dnssec_client" id="sdns_dnssec_client" type="checkbox">
                        <label class="chx_label" for="sdns_dnssec_client"> {$LANG.admin_nameservers_desc_showtoclient}</label>
                    </div>
                </div>
            </div>
            {/if}
            
            <div class="row text-center">
                <br />
                {if $ns_add}
                <input class="btn btn-success" type="button" onClick="updatesettings('nameserver');" value="{$LANG.admin_add}" />
                {else}
                <input class="btn btn-primary" type="button" onClick="updatesettings('nameserver');" value="{$LANG.admin_savechanges}" />
                {if $ns_delete}
                <input class="btn btn-danger" type="button" onClick="delete_ns();" value="{$LANG.admin_delete}" />
                {/if}
                {/if}
            </div>
        </fieldset>
    </form>
    
</div>