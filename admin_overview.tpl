<div class="col-md-12">
    <div class="row">
        <div class="col-md-10">

            <h4><span id="overview_title">{$LANG.admin_overview_title_domains}</span></h4>

            <div class="links_row">
                <ul id="overview-tabs">
                    <li class="first active" id="domains-tab"><a onclick="setOverview('{$LANG.admin_overview_title_domains}'); drawTable('sdns_domains')" href="#domains" class="ajax" aria-controls="domains" role="tab" data-toggle="tab">{$LANG.admin_overview_title_domains} <span>(?)</span></a></li>
                    {if $lal >= 2}
                    <li class="" id="products-tab"><a onclick="setOverview('{$LANG.admin_overview_title_products}'); drawTable('sdns_products')" href="#products" class="ajax" aria-controls="products" role="tab" data-toggle="tab">{$LANG.admin_overview_title_products} <span>(?)</span></a></li>
                    {/if}
                    {if $lal >= 3}
                    <li class="" id="standalone-tab"><a onclick="setOverview('{$LANG.admin_overview_title_standalone}'); drawTable('sdns_standalone')" href="#standalone" class="ajax" aria-controls="standalone" role="tab" data-toggle="tab">{$LANG.admin_overview_title_standalone} <span>(?)</span></a></li>
                    {/if}
                    <li class="" id="reverse-tab"><a onclick="setOverview('{$LANG.admin_overview_title_reverse}'); drawTable('sdns_reverse')" href="#reverse" class="ajax" aria-controls="reverse" role="tab" data-toggle="tab">{$LANG.admin_overview_title_reverse} <span>(?)</span></a></li>
                    <li class="" id="unassigned-tab"><a onclick="setOverview('{$LANG.admin_overview_title_unassigned}'); drawTable('sdns_unassigned')" href="#unassigned" class="ajax" aria-controls="unassigned" role="tab" data-toggle="tab">{$LANG.admin_overview_title_unassigned} <span>(~)</span></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-2">
            <div class="text-right">
                <h4>
        <button type="button" data-toggle="modal" data-target="#dialog_addZone" class="btn btn-success">{$LANG.admin_overview_addzone}</button></h4>
            </div>
        </div>
    </div>
    
    <div class="overview_row">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="domains">
                <table class="dataTable display" id="sdns_domains" width="100%" border="0" cellspacing="1" cellpadding="3">
                    <thead>
                        <tr>
                            <th>{$LANG.admin_overview_table_id}</th>
                            <th>{$LANG.admin_overview_table_domain}</th>
                            <th>{$LANG.admin_overview_table_status}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" class="dataTables_empty">{$LANG.admin_loading_data}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            {if $lal >= 2}
            <div role="tabpanel" class="tab-pane" id="products">
                <table class="dataTable display" id="sdns_products" width="100%" border="0" cellspacing="1" cellpadding="3">
                    <thead>
                        <tr>
                            <th>{$LANG.admin_overview_table_id}</th>
                            <th>{$LANG.admin_overview_table_domain}</th>
                            <th>{$LANG.admin_overview_table_status}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" class="dataTables_empty">{$LANG.admin_loading_data}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            {/if}
            {if $lal >= 3}
            <div role="tabpanel" class="tab-pane" id="standalone">
                <table class="dataTable display" id="sdns_standalone" width="100%" border="0" cellspacing="1" cellpadding="3">
                    <thead>
                        <tr>
                            <th>{$LANG.admin_overview_table_id}</th>
                            <th>{$LANG.admin_overview_table_domain}</th>
                            <th>{$LANG.admin_overview_table_date}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" class="dataTables_empty">{$LANG.admin_loading_data}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            {/if}
            <div role="tabpanel" class="tab-pane" id="reverse">
                <table class="dataTable display" id="sdns_reverse" width="100%" border="0" cellspacing="1" cellpadding="3">
                    <thead>
                        <tr>
                            <th>{$LANG.admin_overview_table_id}</th>
                            <th>{$LANG.admin_overview_table_domain}</th>
                            <th>{$LANG.admin_overview_table_date}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" class="dataTables_empty">{$LANG.admin_loading_data}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="unassigned">
                <table class="dataTable display" id="sdns_unassigned" width="100%" border="0" cellspacing="1" cellpadding="3">
                    <thead>
                        <tr>
                            <th>{$LANG.admin_overview_table_id}</th>
                            <th>{$LANG.admin_overview_table_domain}</th>
                            <th>{$LANG.admin_overview_table_status}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" class="dataTables_empty">{$LANG.admin_loading_data}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<!-- Add Zone -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_addZone" tabindex="-1" role="dialog" aria-labelledby="dialog_addZone" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_addZone">{$LANG.admin_overview_addzone}</h4>
                </div>
                <div class="modal-body">
                    <form role="form" id="add_zone">
                        <input type="hidden" name="sdns_form" value="add_zone">
                        <div class="row">
                            <div class="col-md-4">
                                <label for "sdns_addzone_type">{$LANG.admin_overview_zonetype}:</label>
                                <select name="sdns_addzone_type" id="sdns_addzone_type" class="form-padding form-control">
                                    <option value="" disabled selected>{$LANG.admin_overview_selecttype}</option>
                                    <option value="d">{$LANG.admin_overview_domain}</option>
                                    {if $lal >= 2}<option value="p">{$LANG.admin_overview_product}</option>{/if}
                                    {if $lal >= 3}<option value="s">{$LANG.admin_overview_standalone}</option>{/if}
                                    <option value="r">{$LANG.admin_overview_reverse}</option>
                                </select>
                            </div>
                            <div class="col-md-8" id="add_reverse" style="display: none">
                                <label for "sdns_addzone_ip">{$LANG.admin_overview_ipaddresszone}:</label>
                                <input type="textbox" name="sdns_addzone_ip" id="sdns_addzone_ip" class="form-padding form-control">
                            </div>
                            <div class="col-md-8" id="add_client" style="display: none">
                                <label for "sdns_addzone_client">{$LANG.admin_overview_client}:</label>
                                <input type="text" name="sdns_addzone_client" id="sdns_addzone_client" class="typeahead form-padding form-control" autocomplete="off" spellcheck="false">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" id="add_domain" style="display: none">
                                <label for "sdns_addzone_domain">{$LANG.admin_overview_domain}:</label>
                                <input type="textbox" name="sdns_addzone_domain" id="sdns_addzone_domain" class="typeahead form-padding form-control" autocomplete="off" spellcheck="false">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="updatesettings('add_zone');">{$LANG.admin_add}</button>
                    <button type="button" class="btn btn-default" onclick="reset_addzone()" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Delete Zone -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_deleteZone" tabindex="-1" role="dialog" aria-labelledby="dialog_deleteZone" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_deleteZone"><div id="sdns_zone_name">{$LANG.admin_overview_delete} <span>{$LANG.admin_overview_zone}</span></div></h4>
                </div>
                <div class="modal-body">
                    <p>{$LANG.admin_overview_text_deletezone}</p>
                    <br />
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="sdns_zone">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="zone_delete()">{$LANG.admin_delete}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Export Zone -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_exportZone" tabindex="-1" role="dialog" aria-labelledby="dialog_exportZone" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_exportZone">{$LANG.admin_manage_records_exportzone}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <textarea id="textarea_iex" name="sdns_exportzone" class="form-padding form-control">{$LANG.admin_loading_zone}</textarea>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_close}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var vars = {};

    $("#sdns_addzone_ip").focus(function() {
        $(this).select();
    });
    $("#sdns_addzone_client").focus(function() {
        $(this).select();
    });
    $("#sdns_addzone_domain").focus(function() {
        $(this).select();
    });

    $(document).ready(function() {

        $('[data-toggle="popover"]').popover({
            trigger: 'hover',
            'placement': 'top'
        });

        countupdate();
        syscheck();

        var i = 0;

        $('#sdns_addzone_type').change(
            function() {
                $('#add_client').hide();
                $('#add_domain').hide();
                $('#add_reverse').hide();

                var val = $('#sdns_addzone_type option:selected').val();
                if (val == 'r') {
                    $('#add_reverse').show();
                    $('#sdns_addzone_ip').focus();
                    setOverview('Reverse');
                    $('#overview-tabs a[href="#reverse"]').tab('show');
                    drawTable('sdns_reverse');
                } else {
                    $('#add_client').show();
                    $('#add_domain').show();
                    $('#sdns_addzone_client').focus();
                    if (val == 'd') {
                        setOverview('Domains');
                        $('#overview-tabs a[href="#domains"]').tab('show');
                        drawTable('sdns_domains');
                    } else if (val == 'p') {
                        setOverview('Products');
                        $('#overview-tabs a[href="#products"]').tab('show');
                        drawTable('sdns_products');
                    } else if (val == 's') {
                        setOverview('Standalone');
                        $('#overview-tabs a[href="#standalone"]').tab('show');
                        drawTable('sdns_standalone');
                    }
                }

                i++;

                if (val == 'd' || val == 'p') {
                    if (i > 1) {
                        domainResults();
                    }
                }
            }
        );
        $('#sdns_addzone_client').change(
            function() {
                domainResults();
            }
        )
        $('#add_client').bind('typeahead:selected', function(obj, datum, name) {
            $('#sdns_addzone_domain').focus();
        });
    });

    var clientResults = new Bloodhound({

        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: 'addonmodules.php?module=solutedns&datasource=search&client&query=%QUERY',
        remote: {
            url: 'addonmodules.php?module=solutedns&datasource=search&client&query=%QUERY',
            wildcard: '%QUERY'
        }
    });

    $('#add_client .typeahead').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
    }, {
        name: 'best-pictures',
        /*display: ''*/
        source: clientResults,
        limit: 8
    });
</script>