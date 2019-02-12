<div id="msgConsole"></div>

<div role="tabpanel"> 

	<!-- Nav Tabs -->
	<ul class="nav nav-tabs">
		<li class="pull-right"><a target="_blank" href="https://docs.solutedns.com/whmcs/professional-edition/getting-started/"><span class="glyphicon glyphicon-question-sign text-primary" aria-hidden="true"></span></a></li>
		<li class="active"><a data-toggle="tab" href="#overview" onclick="drawTable('sdns_overview_zones')">{$LANG.admin_menu_overview}</a></li>
			{if $admin}
			<li><a data-toggle="tab" href="#templates" onclick="drawRecords('sdns_template_records')">{$LANG.admin_menu_templates}</a></li>
			<li><a data-toggle="tab" href="#settings">{$LANG.admin_menu_settings}</a></li>
			<li><a data-toggle="tab" href="#nameserver">{$LANG.admin_menu_nameserver}</a></li>
			<li><a data-toggle="tab" href="#tools" {if Controller::config(auto_health)}onclick="getStats('health')"{/if}>{$LANG.admin_menu_tools}</a></li>
			<li><a data-toggle="tab" href="#system">{$LANG.admin_menu_system}{if $update} <span class="label label-danger badge_danger"><span class="glyphicon glyphicon glyphicon-refresh" aria-hidden="true"></span></span>{/if}</a></li>
					{/if}
	</ul>

	<!-- Tab Panes -->
	<div class="tab-content">
		<div id="overview" class="tab-pane fade in active">
			<div class= "col-md-12"> {include file="{$base_path}{DIRECTORY_SEPARATOR}templates{DIRECTORY_SEPARATOR}{$moduletemplate}{DIRECTORY_SEPARATOR}admin_overview.tpl"}</div>
		</div>
		{if $admin}
			<div id="templates" class="tab-pane fade">
				<div class= "col-md-12"> {include file="{$base_path}{DIRECTORY_SEPARATOR}templates{DIRECTORY_SEPARATOR}{$moduletemplate}{DIRECTORY_SEPARATOR}admin_template.tpl"}</div>
			</div>
			<div id="settings" class="tab-pane fade">
				<div class= "col-md-12"> {include file="{$base_path}{DIRECTORY_SEPARATOR}templates{DIRECTORY_SEPARATOR}{$moduletemplate}{DIRECTORY_SEPARATOR}admin_settings.tpl"}</div>
			</div>
			<div id="nameserver" class="tab-pane fade">
				<div class= "col-md-12"> {include file="{$base_path}{DIRECTORY_SEPARATOR}templates{DIRECTORY_SEPARATOR}{$moduletemplate}{DIRECTORY_SEPARATOR}admin_nameserver.tpl"}</div>
			</div>
			<div id="tools" class="tab-pane fade">
				<div class= "col-md-12"> {include file="{$base_path}{DIRECTORY_SEPARATOR}templates{DIRECTORY_SEPARATOR}{$moduletemplate}{DIRECTORY_SEPARATOR}admin_tools.tpl"}</div>
			</div>
			<div id="system" class="tab-pane fade">
				<div class= "col-md-12"> {include file="{$base_path}{DIRECTORY_SEPARATOR}templates{DIRECTORY_SEPARATOR}{$moduletemplate}{DIRECTORY_SEPARATOR}admin_system.tpl"}</div>
			</div>
		{/if}
	</div>
</div>

<!-- Console Modal -->
<div class="bootstrap">
	<div class="modal fade" id="dialog_console" tabindex="-1" role="dialog" aria-labelledby="dialog_console" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" disabled><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="dialog_console_title"></h4>
				</div>
				<div class="iprogress-line">
					<div id="progressbar" style="background:#337ab7; width:0%; height:100%;"></div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12" id="console-status"> Status: <span>Initiating</span></div>
							</div>
							<div class="row">
								<div class="col-md-12 console-details" id="console-job"><small><span>Loading...</span></small></div>
								<br />
							</div>
							<div class="text-right"><small><a class="show-details" onclick="$('#results').slideToggle('slow');">Toggle details</a></small></div>
							<div class="console" id="results"><span id="infobox"></span></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="console-close" class="btn btn-success" data-dismiss="modal">{$LANG.admin_close}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Update Modal -->
<div class="bootstrap">
	<div class="modal fade" id="dialog_update" tabindex="-1" role="dialog" aria-labelledby="dialog_update" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" disabled><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Update Available</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2 update-warning text-center text2-warning"><span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span></div>
								<div class="col-md-10">
									<h2>Please make sure you have a working back-up of both files and database before proceeding!</h2>
								</div>
								<br />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="console-close" class="btn btn-success" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('updater');
							console_name('{$LANG.admin_console_title_updater}');">{$LANG.admin_btn_update_now}</button>
					<button type="button" id="console-close" class="btn btn-default" data-dismiss="modal">{$LANG.global_btn_cancel}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	getState();
</script>

<noscript>
<div class="alert2 alert2-danger">
	<h4>{$LANG.nojavascript_title}</h4>
	<p>{$LANG.nojavascript_desc}</p>
</div>
<style>
	.tab-content { display:none; }
	.nav { display:none; }
</style>
</noscript>
