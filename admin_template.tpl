<div class="col-md-12">

    <div class="row">
        <div class="col-md-10">
            <h4><span id="overview_title">{$LANG.admin_template_title_templates}</span></h4>
        </div>
        <div class="col-md-2">
            <div class="text-right">
                <h4><button data-toggle="modal" data-target="#dialog_addTemplate" type="button" class="btn btn-success">{$LANG.admin_template_addtemplate}</button></h4>
            </div>
        </div>
    </div>

    <div class="overview_row">
        <table class="dataTable display" id="sdns_templates" width="100%" border="0" cellspacing="1" cellpadding="3">
            <thead>
                <tr>
                    <th>{$LANG.admin_template_table_id}</th>
                    <th>{$LANG.admin_template_table_name}</th>
                    <th>{$LANG.admin_template_table_type}</th>
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

<!-- Delete Modal -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_deleteTemplate" tabindex="-1" role="dialog" aria-labelledby="dialog_deleteTemplate" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{$LANG.admin_template_deletetemplate}</h4>
                </div>
                <div class="modal-body">
                    <p>{$LANG.admin_template_text_deletetemplate}</p>
                    <br />
                    <form role="form" id="delete_template">
                        <input type="hidden" name="sdns_form" value="delete_template">
                        <input type="hidden" id="sdns_template_id" name="sdns_template_id" value="delete_template">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="updatesettings('delete_template');">{$LANG.admin_delete}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Modal -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_addTemplate" tabindex="-1" role="dialog" aria-labelledby="dialog_addTemplate" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{$LANG.admin_template_addnewtemplate}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form role="form" id="add_template">
                                <input type="hidden" name="sdns_form" value="add_template">
                                <input type="text" class="form-padding form-control" name="sdns_templatename" id="sdns_templatename" placeholder="{$LANG.admin_template_templatename}">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="updatesettings('add_template');">{$LANG.admin_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>