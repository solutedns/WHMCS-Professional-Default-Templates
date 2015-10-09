<div class="col-md-12">

    <h4>{$LANG.admin_access_title_accesscontrol}</h4>
    
    <div class="col-md-5">
        <h5><strong>{$LANG.admin_access_title_groupassignment}:</strong></h5>
        <form role="form" id="acl_settings">
            <fieldset>
                <input type="hidden" name="sdns_form" value="acl_settings">
                
                {foreach from=$acl_settings item=setting}

                <div class="row">
                    <div class="col-md-4 text-right">
                        <label class="small">{$setting.name}:</label>
                    </div>
                    <div class="col-md-6">
                        <select class="form-padding form-control" name="sdns_acl_settings_{$setting.id}" id="sdns_acl_settings_{$setting.id}">
                            <option {if $setting.al eq '1'}SELECTED{/if} value="1">{$LANG.admin_access_level} 1</option>
                            <option {if $setting.al eq '2'}SELECTED{/if} value="2">{$LANG.admin_access_level} 2</option>
                            <option {if $setting.al eq '3'}SELECTED{/if} value="3">{$LANG.admin_access_level} 3</option>
                            <option {if $setting.al eq '4'}SELECTED{/if} value="4">{$LANG.admin_access_level} 4</option>
                            <option {if $setting.al eq ''}SELECTED{else}class="hide"{/if} disabled value="">{$LANG.admin_access_notassigned}</option>
                        </select>
                    </div>
                </div>

                {/foreach}

                <div class="row text-center">
                    <div class="col-md-12">
                        <br />
                        <input class="btn btn-primary" type="button" onclick="updatesettings('acl_settings');" value="{$LANG.admin_savechanges}" />
                    </div>
                </div>

            </fieldset>
        </form>

    </div>
    <div class="col-md-7">
        <h5><strong>{$LANG.admin_access_title_accesslevels}:</strong></h5>
        <div class="col-md-3 small">
            <strong>{$LANG.admin_access_level} 1:</strong>
            <ul class="list-unstyled">
                <li>- {$LANG.admin_access_fullaccess}</li>
            </ul>
        </div>
        <div class="col-md-3 small">
            <strong>{$LANG.admin_access_level} 2:</strong>
            <ul class="list-unstyled">
                <li>- {$LANG.admin_access_zonemanagement}</li>
                <li>- {$LANG.admin_menu_templates}</li>
                <li>- {$LANG.admin_menu_settings} -> {$LANG.admin_menu_handling}</li>
                <li>- {$LANG.admin_menu_system} -> {$LANG.admin_menu_system}</li>
                <li>- {$LANG.admin_menu_system} -> {$LANG.admin_menu_tools}</li>
                <li>- {$LANG.admin_menu_system} -> {$LANG.admin_menu_logs}</li>
            </ul>
        </div>
        <div class="col-md-3 small">
            <strong>{$LANG.admin_access_level} 3:</strong>
            <ul class="list-unstyled">
                <li>- {$LANG.admin_access_zonemanagement}</li>
                <li>- {$LANG.admin_menu_templates}</li>
                <li>- {$LANG.admin_menu_system} -> {$LANG.admin_menu_logs}</li>
            </ul>
        </div>
        <div class="col-md-3 small">
            <strong>{$LANG.admin_access_level} 4:</strong>
            <ul class="list-unstyled">
                <li>- {$LANG.admin_access_zonemanagement}</li>
            </ul>
        </div>
    </div>
    <div class="text-center text-info small">{$LANG.admin_access_warning}</div>
    
</div>