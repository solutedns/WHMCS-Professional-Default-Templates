<div class="col-md-12">

    <h4>{$LANG.admin_system_title_system}</h4>
    
    <form role="form" id="system">
    	{if $lal >= 2}
        <div class="row">
            <div class="col-md-3 text-right">
                <label>{$LANG.admin_system_option_rectifyqueue}:</label>
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">{if $cron.rectify_start}<span class="label label-success">{$LANG.admin_system_active}</span> {$LANG.admin_system_inqueue}: {$cron.rectify_queue} | {$LANG.admin_system_lastrun}: {$cron.rectify_start|date_format:"%Y-%m-%d (%H:%M)"}{else}<span class="label label-default">{$LANG.admin_system_inactive}</span>{/if}</label>
            </div>
        </div>
        {if $cron.rectify_start}
        <div class="row">
            <div class="col-md-3 text-right">
                <label>{$LANG.admin_system_option_rectifycron}:</label>
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">{if $cron.rectify_end}<span class="label label-default">{$LANG.admin_system_idle}</span>{elseif $cron.rectify_escalate}<span class="label label-warning">{$LANG.admin_system_running}</span> {$LANG.admin_system_text_runningtoolong}{else}<span class="label label-success">{$LANG.admin_system_running}</span>{/if} {$cron.rectify_status}</label>
            </div>
        </div>
        {if $cron.rectify_escalate}
        <div class="row">
            <div class="col-md-3 text-right">
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">
                    <button type="button" class="btn btn-default btn-xs" onclick="reset_cron();">{$LANG.admin_system_reset}</button>
                </label>
            </div>
        </div>
        {/if} {/if}
        {/if}
        <div class="row">
            <div class="col-md-3 text-right">
                <label>{$LANG.admin_system_option_index}:</label>
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">{$system.zones} {$LANG.admin_system_inindex}</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 text-right">
                <label>{$LANG.admin_system_option_idn}:</label>
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">{if $idnsupport eq 'enabled'}<span class="label label-success">enabled</span>{else}<span class="label label-default">disabled</span>{/if}</label>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-3 text-right">
                <label>{$LANG.admin_system_option_version}:</label>
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">{$system.version} - {$system.distribution} ({$system.type})</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 text-right">
            </div>
            <div class="col-md-9 data_text">
                <label class="info_text">
                    <button type="button" class="btn btn-default btn-xs" onclick="check_update();">{$LANG.admin_system_checkupdates}</button>
                </label>
            </div>
        </div>

        <hr />

        <fieldset>
            <input type="hidden" name="sdns_form" value="system">
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_maintenance_mode">{$LANG.admin_system_option_maintenance}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.system_maintenance} CHECKED{/if} name="sdns_maintenance_mode" id="sdns_maintenance_mode" type="checkbox">
                        <label class="chx_label" for="sdns_maintenance_mode">{$LANG.admin_system_desc_maintenance}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_system_logging">{$LANG.admin_system_option_logging}:</label>
                </div>
                <div class="col-md-9">
                    <div class="checkbox chx_label">
                        <input {if $settings.system_logging} CHECKED{/if} name="sdns_system_logging" id="sdns_system_logging" type="checkbox">
                        <label class="chx_label" for="sdns_system_logging">{$LANG.admin_system_desc_logging}</label>
                    </div>
                </div>
            </div>

            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onclick="updatesettings('system');" value="{$LANG.admin_savechanges}" />
            </div>

        </fieldset>
    </form>
    
</div>