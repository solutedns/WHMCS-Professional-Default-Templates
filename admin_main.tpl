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
        <li role="presentation" class="active"><a href="#overview" aria-controls="overview" role="tab" data-toggle="tab" onclick="drawTable('sdns_domains');">{$LANG.admin_menu_overview}</a></li>
        <li role="presentation"><a href="#templates" onclick="drawTable('sdns_templates')" aria-controls="templates" role="tab" data-toggle="tab">{$LANG.admin_menu_templates}</a></li>
        <li class="dropdown" role="presentation"><a id="settings" class="dropdown-toggle" aria-controls="settings-contents" data-toggle="dropdown" href="#" aria-expanded="true">{$LANG.admin_menu_settings}<span class="caret"></span></a>
            <ul id="settings-contents" class="dropdown-menu" aria-labelledby="settings" role="menu">
                <li class=""><a id="settings1-tab" aria-controls="records" data-toggle="tab" role="tab" tabindex="-1" href="#records" aria-expanded="false">{$LANG.admin_menu_records}</a></li>
                <li class=""><a id="settings2-tab" aria-controls="accessibility" data-toggle="tab" role="tab" tabindex="-1" href="#accessibility" aria-expanded="false">{$LANG.admin_menu_accessibility}</a></li>
                <li class=""><a id="settings3-tab" aria-controls="automation" data-toggle="tab" role="tab" tabindex="-1" href="#automation" aria-expanded="false">{$LANG.admin_menu_automation}</a></li>
                <li class=""><a id="settings4-tab" aria-controls="assignment" data-toggle="tab" role="tab" tabindex="-1" href="#assignment" aria-expanded="false">{$LANG.admin_menu_handling}</a></li>
            </ul>
        </li>
        <li class="dropdown" role="presentation" id="nameserver_sub"><a id="nameservers" class="dropdown-toggle" aria-controls="nameservers-contents" data-toggle="dropdown" href="#" aria-expanded="true">{$LANG.admin_menu_nameservers}<span class="caret"></span></a>
            <ul id="nameservers-contents" class="dropdown-menu" aria-labelledby="nameservers" role="menu">
                {foreach $nameservers as $ns}
                <li class=""><a id="nameservers-tab" href="addonmodules.php?module=solutedns&server={$ns.id}" aria-expanded="false"><span id="ns_{$ns.id}" class="" aria-hidden="true"></span> {$ns.nameserver|ucfirst}</a></li>
                {/foreach}
            </ul>
        </li>
        <li class="dropdown" role="presentation"><a id="system_tab" class="dropdown-toggle" aria-controls="system-contents" data-toggle="dropdown" href="#" aria-expanded="true">{$LANG.admin_menu_system}<span class="caret"></span></a>
            <ul id="system-contents" class="dropdown-menu" aria-labelledby="system_tab" role="menu">
                <li class=""><a id="system1-tab" aria-controls="system" data-toggle="tab" role="tab" tabindex="-1" href="#system" aria-expanded="false">{$LANG.admin_menu_system}</a></li>
                <li class=""><a id="system2-tab" aria-controls="tools" data-toggle="tab" role="tab" tabindex="-1" href="#tools" aria-expanded="false">{$LANG.admin_menu_tools}</a></li>
                <li class=""><a id="system3-tab" aria-controls="logs" onclick="drawTable('sdns_logs')" data-toggle="tab" role="tab" tabindex="-1" href="#logs" aria-expanded="false">{$LANG.admin_menu_logs}</a></li>
            </ul>
        </li>
        <li role="presentation"><a href="#license" aria-controls="license" role="tab" data-toggle="tab">License</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="overview">{include file="{$base_path}/template/admin_overview.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="templates">{include file="{$base_path}/template/admin_template.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="records">{include file="{$base_path}/template/admin_records.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="accessibility">{include file="{$base_path}/template/admin_accessibility.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="automation">{include file="{$base_path}/template/admin_automation.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="assignment">{include file="{$base_path}/template/admin_handling.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="nameserver">{include file="{$base_path}/template/admin_nameserver.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="system">{include file="{$base_path}/template/admin_system.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="tools"><p>TBD</p></div>
        <div role="tabpanel" class="tab-pane" id="logs">{include file="{$base_path}/template/admin_logs.tpl"}</div>
        <div role="tabpanel" class="tab-pane" id="license">{include file="{$base_path}/template/admin_license.tpl"}</div>
    </div>

</div>

<div class="bootstrap">
    <div class="modal fade" id="dialog_updater" tabindex="-1" role="dialog" aria-labelledby="dialog_updater" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" disabled><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_updater">Updater</h4>
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
                            <div class="text-right"><small><a class="show-details" onclick="$('#results').show();">Show details</a></small></div>
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
                    <button type="button" id="console-close" class="btn btn-success" data-dismiss="modal" data-toggle="modal" data-target="#dialog_updater" data-backdrop="static" data-keyboard="false" onclick="console('updater')">{$LANG.admin_updatenow}</button>
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
    });
</script>