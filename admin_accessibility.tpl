<div class="col-md-12">

    <form role="form" id="accessibility">
        <fieldset>
            <input type="hidden" name="sdns_form" value="accessibility">

            <h4>{$LANG.admin_accessibility_title_accessibility}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_hide_soa">{$LANG.admin_accessibility_option_hidesoa}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.hide_soa} CHECKED{/if} name="sdns_hide_soa" id="sdns_hide_soa" type="checkbox">
                        <label class="chx_label" for="sdns_hide_soa">{$LANG.admin_accessibility_desc_hidesoa}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_disable_ns">{$LANG.admin_accessibility_option_disablens}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.disable_ns} CHECKED{/if} name="sdns_disable_ns" id="sdns_disable_ns" type="checkbox">
                        <label class="chx_label" for="sdns_disable_ns">{$LANG.admin_accessibility_desc_disablens}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_preset_ttl">{$LANG.admin_accessibility_option_presetttl}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.preset_ttl} CHECKED{/if} name="sdns_preset_ttl" id="sdns_preset_ttl" type="checkbox">
                        <label class="chx_label" for="sdns_preset_ttl">{$LANG.admin_accessibility_desc_presetttl}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_hide_wizard">{$LANG.admin_accessibility_option_hideassist}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.hide_wizard} CHECKED{/if} name="sdns_hide_wizard" id="sdns_hide_wizard" type="checkbox">
                        <label class="chx_label" for="sdns_hide_wizard">{$LANG.admin_accessibility_desc_hideassist}</label>
                    </div>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_accessibility_title_clientzones}</h4>

            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_client_zones">{$LANG.admin_accessibility_option_clientzones}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.client_zones} CHECKED{/if} name="sdns_client_zones" id="sdns_client_zones" type="checkbox">
                        <label class="chx_label" for="sdns_client_zones">{$LANG.admin_accessibility_desc_clientzones}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_client_template">{$LANG.admin_accessibility_option_clienttemplate}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.client_template} CHECKED{/if} name="sdns_client_template" id="sdns_client_template" type="checkbox">
                        <label class="chx_label" for="sdns_client_template">{$LANG.admin_accessibility_desc_clienttemplate}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_client_health">{$LANG.admin_accessibility_option_clienthealth}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.client_health} CHECKED{/if} name="sdns_client_health" id="sdns_client_health" type="checkbox">
                        <label class="chx_label" for="sdns_client_health">{$LANG.admin_accessibility_desc_clienthealth}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_client_reverse">{$LANG.admin_accessibility_option_clientreverse}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.client_reverse} CHECKED{/if} name="sdns_client_reverse" id="sdns_client_reverse" type="checkbox">
                        <label class="chx_label" for="sdns_client_reverse">{$LANG.admin_accessibility_desc_clientreverse}</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_zone_limit">{$LANG.admin_accessibility_option_zonelimit}:</label>
                </div>
                <div class="col-md-1 chx_desc">
                    <input type="textbox" class="form-padding form-control" name="sdns_zone_limit" id="sdns_zone_limit" value="{$settings.zone_limit}">
                </div>
                <div class="col-md-8 chx_desc">
                    <label class="info_text" for="sdns_zone_limit">Limit the maximum zones allowed for clients. (0 = unlimited, -1 = none)</label>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_accessibility_title_admin}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_reverse_enable">{$LANG.admin_accessibility_option_adminreverse}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.reverse_dns} CHECKED{/if} name="sdns_reverse_enable" id="sdns_reverse_enable" type="checkbox">
                        <label class="chx_label" for="sdns_reverse_enable">{$LANG.admin_accessibility_desc_adminreverse}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_admin_health">{$LANG.admin_accessibility_option_adminhealth}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.admin_health} CHECKED{/if} name="sdns_admin_health" id="sdns_admin_health" type="checkbox">
                        <label class="chx_label" for="sdns_admin_health">{$LANG.admin_accessibility_desc_adminhealth}</label>
                    </div>
                </div>
            </div>

            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onclick="updatesettings('accessibility');" value="{$LANG.admin_savechanges}" />
            </div>

        </fieldset>
    </form>

</div>