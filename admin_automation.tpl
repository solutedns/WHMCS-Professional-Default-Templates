<div class="col-md-12">

    <form role="form" id="automation">
        <fieldset>
            <input type="hidden" name="sdns_form" value="automation">
            
            <h4>{$LANG.admin_automation_title_zones}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_create">{$LANG.admin_automation_option_create}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_create} CHECKED{/if} name="sdns_auto_create" id="sdns_auto_create" type="checkbox">
                        <label class="chx_label" for="sdns_auto_create">{$LANG.admin_automation_desc_create}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_maintenance">{$LANG.admin_automation_option_maintenance}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_maintenance} CHECKED{/if} name="sdns_auto_maintenance" id="sdns_auto_maintenance" type="checkbox">
                        <label class="chx_label" for="sdns_auto_maintenance">{$LANG.admin_automation_desc_maintenance}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_delete">{$LANG.admin_automation_option_delete}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_delete} CHECKED{/if} name="sdns_auto_delete" id="sdns_auto_delete" type="checkbox">
                        <label class="chx_label" for="sdns_auto_delete">{$LANG.admin_automation_desc_delete}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc"></div>
                <div class="col-md-9">
                    <div class="col-md-2">
                        <div class="checkbox checkbox-danger chx_label">
                            <input {if $settings.auto_delete_status.cancelled} CHECKED{/if} name="sdns_deletestate_cancelled" id="sdns_deletestate_cancelled" type="checkbox">
                            <label class="chx_label" for="sdns_deletestate_cancelled">{$LANG.admin_cancelled}</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="checkbox checkbox-danger chx_label">
                            <input {if $settings.auto_delete_status.terminated} CHECKED{/if} name="sdns_deletestate_terminated" id="sdns_deletestate_terminated" type="checkbox">
                            <label class="chx_label" for="sdns_deletestate_terminated">{$LANG.admin_terminated}</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="checkbox checkbox-danger chx_label">
                            <input {if $settings.auto_delete_status.expired} CHECKED{/if} name="sdns_deletestate_expired" id="sdns_deletestate_expired" type="checkbox">
                            <label class="chx_label" for="sdns_deletestate_expired">{$LANG.admin_expired}</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="checkbox checkbox-danger chx_label">
                            <input {if $settings.auto_delete_status.suspended} CHECKED{/if} name="sdns_deletestate_suspended" id="sdns_deletestate_suspended" type="checkbox">
                            <label class="chx_label" for="sdns_deletestate_suspended">{$LANG.admin_suspended}</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="checkbox checkbox-danger chx_label">
                            <input {if $settings.auto_delete_status.fraud} CHECKED{/if} name="sdns_deletestate_fraud" id="sdns_deletestate_fraud" type="checkbox">
                            <label class="chx_label" for="sdns_deletestate_fraud">{$LANG.admin_fraud}</label>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc"></div>
                <div class="col-md-9">
                    <div class="col-md-4">
                        <div class="checkbox checkbox-danger chx_label">
                            <input {if $settings.auto_delete_whmcs eq 'on'} CHECKED{/if} name="sdns_auto_delete_whmcs" id="sdns_auto_delete_whmcs" type="checkbox">
                            <label class="chx_label" for="sdns_auto_delete_whmcs">{$LANG.admin_automation_desc_deletewhmcs}</label>
                        </div>
                    </div>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_automation_title_dnsmanagement}</h4>

            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_enable">{$LANG.admin_automation_option_enabledns}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_enabled} CHECKED{/if} name="sdns_auto_enable" id="sdns_auto_enable" type="checkbox">
                        <label class="chx_label" for="sdns_auto_enable">{$LANG.admin_automation_desc_enabledns}</label>
                    </div>
                </div>
            </div>
            
            {if $lal >= 3}
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_health">{$LANG.admin_automation_option_health}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_health} CHECKED{/if} name="sdns_auto_health" id="sdns_auto_health" type="checkbox">
                        <label class="chx_label" for="sdns_auto_health">{$LANG.admin_automation_desc_health}</label>
                    </div>
                </div>
            </div>
            {/if}
            
            {if $lal >= 2}
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_product">{$LANG.admin_automation_option_products}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_dnsprod} CHECKED{/if} name="sdns_auto_product" id="sdns_auto_product" type="checkbox">
                        <label class="chx_label" for="sdns_auto_product">{$LANG.admin_automation_desc_products}</label>
                    </div>
                </div>
            </div>
            {/if}
            
            <hr />
            <h4>{$LANG.admin_automation_title_admin}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_auto_todo">{$LANG.admin_automation_option_todo}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.auto_todo} CHECKED{/if} name="sdns_auto_todo" id="sdns_auto_todo" type="checkbox">
                        <label class="chx_label" for="sdns_auto_todo">{$LANG.admin_automation_desc_todo}</label>
                    </div>
                </div>
            </div>

            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onclick="updatesettings('automation');" value="{$LANG.admin_savechanges}" />
            </div>

        </fieldset>
    </form>

</div>