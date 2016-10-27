<div id="dyn_msgbox" style="display: none;">
	<div id="dyn_title" style="font-weight: bold;"></div>
	<div id="dyn_msg"></div>
</div>
  
{If $isSlave}
<div id="slave_msg" class="alert2 alert2-danger">
	<div id="dyn_title" style="font-weight: bold;"><h4>{$LANG.admin_isslave_title}</h4></div>
    <div id="dyn_msg">{$LANG.admin_isslave_desc}</div>
</div>
{/If}

<!-- Navigation Tabs -->
<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active"><a href="#records" onclick="drawRecords('sdns_records');" aria-controls="records" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_records}</a></li>
	{if $lal >= 2}{if $sac.dnssec}<li role="presentation"><a href="#dnssec" aria-controls="dnssec" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_dnssec}</a></li>{/if}{/if}
	{if $lal >= 3}{if $sac.health}<li role="presentation"><a href="#health" aria-controls="health" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_health}{if $health_count} <span class="label label-danger badge_danger">{$health_count}</span>{/if}</a></li>{/if}{/if}
</ul>
  
{if $server_avb eq true}
<!-- Tab panes -->
<div role="tabpanel">
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="records">{include file="{$base_path}/template/admin_manager_records.tpl"}</div>
		{if $lal >= 2}{if $sac.dnssec}<div role="tabpanel" class="tab-pane" id="dnssec">{include file="{$base_path}/template/admin_manager_dnssec.tpl"}</div>{/if}{/if}
		{if $lal >= 3}{if $sac.health}<div role="tabpanel" class="tab-pane" id="health">{include file="{$base_path}/template/admin_manager_health.tpl"}</div>{/if}{/if}
	</div>
</div>
{else if $nozone}
<div id="slave_msg" class="alert2 alert2-info top15">
	<div id="dyn_title" style="font-weight: bold;"><h4>{$LANG.admin_msg_nozone_title}</h4></div>
	<div id="dyn_msg">{$LANG.admin_msg_nozone_desc}</div>
</div>{else}
<div id="slave_msg" class="alert2 alert2-danger top15">
	<div id="dyn_title" style="font-weight: bold;"><h4>{$LANG.admin_msg_rde_title}</h4></div>
	<div id="dyn_msg">{$LANG.admin_msg_rde_desc}</div>
</div>
{/if}

<noscript>
    <div class="alert2 alert2-danger">
        <h4>{$LANG.nojavascript_title}</h4>
        <p>{$LANG.nojavascript_desc}</p>
    </div>
	<style>.tab-content { display:none; } .nav { display:none; }</style>
</noscript>

<script type="text/javascript">

    $(document).ready(function() {		
        $('[data-toggle="popover"]').popover({
            trigger: 'hover',
            placement: 'right',
			container: 'body'
        });
		
	});
		
</script>