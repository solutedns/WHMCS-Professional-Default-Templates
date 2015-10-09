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
	<li role="presentation" class="active"><a href="#records" aria-controls="records" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_records}</a></li>
	{if $sac.dnssec}<li role="presentation"><a href="#dnssec" aria-controls="dnssec" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_dnssec}</a></li>{/if}
	{if $sac.health}<li role="presentation"><a href="#health" aria-controls="health" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_health}{if $health_count} <span class="label label-danger badge_danger">{$health_count}</span>{/if}</a></li>{/if}
</ul>
  
{if $server_avb eq true}
<!-- Tab panes -->
<div role="tabpanel">
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="records">{include file="{$base_path}/template/admin_manager_records.tpl"}</div>
		{if $sac.dnssec}<div role="tabpanel" class="tab-pane" id="dnssec">{include file="{$base_path}/template/admin_manager_dnssec.tpl"}</div>{/if}
		{if $sac.health}<div role="tabpanel" class="tab-pane" id="health">{include file="{$base_path}/template/admin_manager_health.tpl"}</div>{/if}
	</div>
</div>
{else}
<div id="slave_msg" class="alert2 alert2-danger top15">
	<div id="dyn_title" style="font-weight: bold;"><h4>{$LANG.admin_msg_rde_title}</h4></div>
	<div id="dyn_msg">{$LANG.admin_msg_rde_desc}</div>
</div>
{/if}