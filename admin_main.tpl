<div id="sys_msgbox" style="display: none;">
    <div id="sys_title" style="font-weight: bold;"></div>
    <div id="sys_msg"></div>
</div>

<div id="dyn_msgbox" style="display: none;">
    <div id="dyn_title" style="font-weight: bold;"></div>
    <div id="dyn_msg"></div>
</div>

<div role="tabpanel">

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        {if $acl < 5}<li role="presentation" class="active"><a href="#overview" aria-controls="overview" role="tab" data-toggle="tab" onclick="drawTable('sdns_domains');">{$LANG.admin_menu_overview}</a></li>{/if}
        {if $acl < 4}<li role="presentation"><a href="#templates" onclick="drawTable('sdns_templates')" aria-controls="templates" role="tab" data-toggle="tab">{$LANG.admin_menu_templates}</a></li>{/if}
       {if $acl < 3}<li class="dropdown" role="presentation"><a id="settings" class="dropdown-toggle" aria-controls="settings-contents" data-toggle="dropdown" href="#" aria-expanded="true">{$LANG.admin_menu_settings}<span class="caret"></span></a>
            <ul id="settings-contents" class="dropdown-menu" aria-labelledby="settings" role="menu">
                {if $acl < 2}<li ><a id="settings1-tab" aria-controls="records" data-toggle="tab" role="tab" tabindex="-1" href="#records" aria-expanded="false">{$LANG.admin_menu_records}</a></li>{/if}
                {if $acl < 2}<li ><a id="settings2-tab" aria-controls="accessibility" data-toggle="tab" role="tab" tabindex="-1" href="#accessibility" aria-expanded="false">{$LANG.admin_menu_accessibility}</a></li>{/if}
                {if $acl < 2}<li ><a id="settings3-tab" aria-controls="automation" data-toggle="tab" role="tab" tabindex="-1" href="#automation" aria-expanded="false">{$LANG.admin_menu_automation}</a></li>{/if}
                {if $acl < 3}<li ><a id="settings4-tab" aria-controls="assignment" data-toggle="tab" role="tab" tabindex="-1" href="#assignment" aria-expanded="false">{$LANG.admin_menu_handling}</a></li>{/if}
            </ul>
        </li>{/if}
        {if $acl < 2}<li class="dropdown" role="presentation" id="nameserver_sub"><a id="nameservers" class="dropdown-toggle" aria-controls="nameservers-contents" data-toggle="dropdown" href="#" aria-expanded="true">{$LANG.admin_menu_nameservers}<span class="caret"></span></a>
            <ul id="nameservers-contents" class="dropdown-menu" aria-labelledby="nameservers" role="menu">
                {foreach $nameservers as $ns}
                <li ><a id="nameservers-tab" href="addonmodules.php?module=solutedns&server={$ns.id}" aria-expanded="false"><span id="ns_{$ns.id}"  aria-hidden="true"></span> {$ns.nameserver|ucfirst}</a></li>
                {/foreach}
            </ul>
        </li>{/if}
        {if $acl < 4}<li class="dropdown" role="presentation"><a id="system_tab" class="dropdown-toggle" aria-controls="system-contents" data-toggle="dropdown" href="#" aria-expanded="true">{$LANG.admin_menu_system}<span class="caret"></span></a>
            <ul id="system-contents" class="dropdown-menu" aria-labelledby="system_tab" role="menu">
                {if $acl < 3}<li ><a id="system1-tab" aria-controls="system" data-toggle="tab" role="tab" tabindex="-1" href="#system" aria-expanded="false">{$LANG.admin_menu_system}</a></li>{/if}
                {if $acl < 3}<li ><a id="system2-tab" aria-controls="tools" data-toggle="tab" role="tab" tabindex="-1" href="#tools" aria-expanded="false">{$LANG.admin_menu_tools}</a></li>{/if}
                {if $acl < 2}<li ><a id="system3-tab" aria-controls="accesscontrol" data-toggle="tab" role="tab" tabindex="-1" href="#accesscontrol" aria-expanded="false">{$LANG.admin_menu_accesscontrol}</a></li>{/if}
                {if $acl < 4}<li ><a id="system4-tab" aria-controls="logs" onclick="drawTable('sdns_logs')" data-toggle="tab" role="tab" tabindex="-1" href="#logs" aria-expanded="false">{$LANG.admin_menu_logs}</a></li>{/if}
            </ul>
        </li>{/if}
        {if $acl < 2}<li role="presentation"><a href="#license" aria-controls="license" role="tab" data-toggle="tab">License</a></li>{/if}
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        {if $acl < 5}<div role="tabpanel" class="tab-pane active" id="overview">{include file="{$base_path}/template/admin_overview.tpl"}</div>{/if}
        {if $acl < 4}<div role="tabpanel" class="tab-pane" id="templates">{include file="{$base_path}/template/admin_template.tpl"}</div>{/if}
        {if $acl < 2}<div role="tabpanel" class="tab-pane" id="records">{include file="{$base_path}/template/admin_records.tpl"}</div>{/if}
        {if $acl < 2}<div role="tabpanel" class="tab-pane" id="accessibility">{include file="{$base_path}/template/admin_accessibility.tpl"}</div>{/if}
        {if $acl < 2}<div role="tabpanel" class="tab-pane" id="automation">{include file="{$base_path}/template/admin_automation.tpl"}</div>{/if}
        {if $acl < 3}<div role="tabpanel" class="tab-pane" id="assignment">{include file="{$base_path}/template/admin_handling.tpl"}</div>{/if}
        {if $acl < 2}<div role="tabpanel" class="tab-pane" id="nameserver">{include file="{$base_path}/template/admin_nameserver.tpl"}</div>{/if}
        {if $acl < 4}<div role="tabpanel" class="tab-pane" id="system">{include file="{$base_path}/template/admin_system.tpl"}</div>{/if}
        {if $acl < 2}<div role="tabpanel" class="tab-pane" id="accesscontrol">{include file="{$base_path}/template/admin_access.tpl"}</div>{/if}
        {if $acl < 3}<div role="tabpanel" class="tab-pane" id="tools">{include file="{$base_path}/template/admin_tools.tpl"}</div>{/if}
        {if $acl < 4}<div role="tabpanel" class="tab-pane" id="logs">{include file="{$base_path}/template/admin_logs.tpl"}</div>{/if}
        {if $acl < 2}<div role="tabpanel" class="tab-pane" id="license">{include file="{$base_path}/template/admin_license.tpl"}</div>{/if}
    </div>

</div>

<div class="bootstrap">
    <div class="modal fade" id="dialog_console" tabindex="-1" role="dialog" aria-labelledby="dialog_console" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" disabled><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_console_title"></h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12" id="console-status"> Status: <span>Initiating</span></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" id="console-job"><small><span>Loading...</span></small></div>
                                <br />
                            </div>
                            <div class="progressbox">
                                <div id="progressbar" style="background:#006699; width:0%; height:100%;"></div>
                            </div>
                            <div class="text-right"><small><a class="show-details" onclick="$('#results').slideToggle('slow');">Toggle details</a></small></div>
                            <div class="console" id="results"><span id="infobox"></span></div>


                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" id="console-close" class="btn btn-success" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="dialog_update" tabindex="-1" role="dialog" aria-labelledby="dialog_update" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" disabled><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_update">Update Available</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-2 update-warning text-center"><span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> </div>
                                <div class="col-md-10"><h2>Please make sure you have a working back-up of both files and database before proceeding!</h2></div>
                                <br />
                            </div>

                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" id="console-close" class="btn btn-success" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('updater'); console_name('{$LANG.admin_console_title_updater}');">{$LANG.admin_updatenow}</button>
                    <button type="button" id="console-close" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
		
		if (typeof(EventSource) !== "undefined") {} else {
			$('#console-job span').text("Your browser does not support the console output.");
			$('#console-status span').text("Console not supported");
        }

        if (document.URL.indexOf("server") != -1) {
            $("#overview").removeClass('active');
            $("#nameserver").addClass('active');
            $('.nav li:eq(7) a').tab('show');
        } else {
			drawTable('sdns_domains');	
		}
	
		//Mutation Tool
		$('.where_input').attr('disabled','disabled');
		$('#where_container').addClass("sdns_text_disabled");
    
		$('select[name="sdns_mut_action"]').on('change',function(){
			var  others = $(this).val();
		
			if(others == "add"){
				$('.where_input').attr('disabled','disabled');
				$('.content_input').removeAttr('disabled');
				$('#where_container').addClass("sdns_text_disabled");
				$('#content_container').removeClass("sdns_text_disabled");
			}
			
			if(others == "edit"){           
				$('.where_input').removeAttr('disabled');
				$('.content_input').removeAttr('disabled');
				$('#content_container').removeClass("sdns_text_disabled");
				$('#where_container').removeClass("sdns_text_disabled");
			}
			
			if(others == "delete"){           
				$('.where_input').removeAttr('disabled');
				$('.content_input').attr('disabled','disabled');
				$('#content_container').addClass("sdns_text_disabled");
				$('#where_container').removeClass("sdns_text_disabled");
			}
			else{
				$('#disabled_input').attr('disabled','disabled'); 
			}  
	
		});
		
    });
</script>