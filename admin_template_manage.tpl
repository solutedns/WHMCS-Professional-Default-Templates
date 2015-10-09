<div id="dyn_msgbox" style="display: none;">
	<div id="dyn_title" style="font-weight: bold;"></div>
	<div id="dyn_msg"></div>
</div>  

<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active"><a href="#records" aria-controls="records" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_records}</a></li>
	<li role="presentation"><a href="#settings" aria-controls="dnssec" role="tab" data-toggle="tab">{$LANG.admin_manage_tab_settings}</a></li>
</ul>
    
<div role="tabpanel">
	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="records">{include file="{$base_path}/template/admin_template_records.tpl"}</div>
		<div role="tabpanel" class="tab-pane" id="settings">{include file="{$base_path}/template/admin_template_settings.tpl"}</div>
	</div>
</div>