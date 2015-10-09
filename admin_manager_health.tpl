<div class="col-md-12 topm10">

    <div class="row">
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_zone}:</strong>
                <br /><a href="http://{$zone.domain}">{$zone.domain}</a></p>
        </div>
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_client}:</strong>
                <br /><a href="clientssummary.php?userid={$clientdetails.id}"><?php echo $this->{if $clientdetails.companyname}{$clientdetails.companyname}{else}{$clientdetails.firstname} {$clientdetails.lastname}{/if}</a></p>
        </div>
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_email}:</strong>
                <br /><a href="mailto:{$clientdetails.email}">{$clientdetails.email}</a></p>
        </div>
        <div class="col-md-3">
            <div class="text-right">
                <div class="btn-group">
                    <form role="form" id="reset_health">
                        <input type="hidden" name="sdns_form" value="reset_health">
                        <input name="sdns_domain" id="sdns_domain" type="hidden" value="{$zone.domain}">
                        <button {if $isSlave}disabled{/if} type="button" class="btn btn-warning btn-sm" onclick="updatesettings('reset_health');"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span> {$LANG.admin_manage_health_recheck}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <h2>{$LANG.admin_manage_title_health}</h2>
    
    <table width="100%" class="datatable" border="0" cellspacing="1" cellpadding="3">
        <tr>
            <th align="center" width="15%"><strong>{$LANG.admin_manage_table_date}</strong></th>
            <th align="center" width="85%"><strong>{$LANG.admin_manage_table_log}</strong></th>
        </tr>
        {if $health_entries} {foreach from=$health_entries item=health}
        <tr>
            <td>{$health.date|date_format:"%Y-%m-%d (%H:%M)"}
            </td>
            <td>
                <div class="col-md-1">{if $health.status eq 'warning'}<span class="label pending">{$LANG.admin_manage_health_warning}</span>{else}<span class="label closed">{$LANG.admin_manage_health_error}</span>{/if}</div>
                <div class="col-md-11">{$health.log}</div>
            </td>
        </tr>
        {/foreach} {else}
        <td colspan="2" class="text-center">{$LANG.admin_manage_health_noissues}</td>
        {/if}
    </table>

</div>