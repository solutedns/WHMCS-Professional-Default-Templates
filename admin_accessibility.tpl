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
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc chx_form">
                    <label for="sdns_dns_pagination">{$LANG.admin_accessibility_option_dnspagination}:</label>
                </div>
                <div class="col-md-1 chx_desc">
                    <input type="text" class="form-padding form-control" name="sdns_dns_pagination" id="sdns_dns_pagination" value="{$settings.dns_pagination}">
                </div>
                <div class="col-md-8 chx_desc chx_form">
                    <label class="info_text" for="sdns_dns_pagination">{$LANG.admin_accessibility_desc_dnspagination}</label>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_accessibility_title_clientzones}</h4>

			{if $lal >= 3}
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
                    <label for="sdns_client_zones_subdomains">{$LANG.admin_accessibility_option_client_zones_subdomains}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.client_zones_subdomains} CHECKED{/if} name="sdns_client_zones_subdomains" id="sdns_client_zones_subdomains" type="checkbox">
                        <label class="chx_label" for="sdns_client_zones_subdomains">{$LANG.admin_accessibility_desc_client_zones_subdomains}</label>
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
            {/if}
            
            {if $lal >= 3}
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
            {/if}
            
            {if $lal >= 3}
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
            {/if}

            <div class="row">
                <div class="col-md-3 text-right chx_desc chx_form">
                    <label for="sdns_zone_limit">{$LANG.admin_accessibility_option_zonelimit}:</label>
                </div>
                <div class="col-md-1 chx_desc">
                    <input type="text" class="form-padding form-control" name="sdns_zone_limit" id="sdns_zone_limit" value="{$settings.zone_limit}">
                </div>
                <div class="col-md-8 chx_desc chx_form">
                    <label class="info_text" for="sdns_zone_limit">{$LANG.admin_accessibility_desc_zonelimit}</label>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_accessibility_title_menu}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_disable_primarymenu">{$LANG.admin_accessibility_option_disableprimarymenu}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.disable_primarymenu} CHECKED{/if} name="sdns_disable_primarymenu" id="sdns_disable_primarymenu" type="checkbox">
                        <label class="chx_label" for="sdns_disable_primarymenu">{$LANG.admin_accessibility_desc_disableprimarymenu}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_disable_secondarymenu">{$LANG.admin_accessibility_option_disablesecondarymenu}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.disable_secondarymenu} CHECKED{/if} name="sdns_disable_secondarymenu" id="sdns_disable_secondarymenu" type="checkbox">
                        <label class="chx_label" for="sdns_disable_secondarymenu">{$LANG.admin_accessibility_desc_disablesecondarymenu}</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc chx_form">
                    <label for="sdns_client_urlrewrite">{$LANG.admin_accessibility_option_urlrewrite}:</label>
                </div>
                <div class="col-md-2 chx_desc">
                    <input type="text" class="form-padding form-control" name="sdns_client_urlrewrite" id="sdns_client_urlrewrite" value="{$settings.client_urlrewrite}">
                </div>
                <div class="col-md-7 chx_desc chx_form">
                    <label class="info_text" for="sdns_client_urlrewrite">{$LANG.admin_accessibility_desc_urlrewrite}</label>
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
            
            {if $lal >= 3}
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
            {/if}

            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onclick="updatesettings('accessibility');" value="{$LANG.admin_savechanges}" />
            </div>

        </fieldset>
    </form>

</div>