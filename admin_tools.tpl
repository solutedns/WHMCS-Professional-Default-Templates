<div class="col-md-12">

    <div class="row">
        <div class="col-md-12">
            <h4>{$LANG.admin_tools_title_tools}</h4>
        </div>
    </div>

    <b>{$LANG.admin_tools_title_mutationtool}</b>

    <div class="row">
        <div class="col-md-3">

            <div class="clientssummarybox">
                <div class="title">For</div>
                <table class="clientssummarystats" cellpadding="2" cellspacing="0">
                    <tbody>
                        <tr>
                            <td width="80">
                                <label>Zones</label>
                            </td>
                            <td>
                                <select name="sdns_mut_for" id="sdns_mut_for" class="form-padding form-control">
                                    <option value="all">All zones</option>
                                    <option value="domains">Domains</option>
                                    <option value="products">Products</option>
                                    <option value="standalone">Standalone</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="altrow">
                            <td>
                                <label>Server</label>
                            </td>
                            <td>
                                <select name="sdns_mut_server" id="sdns_mut_server" class="form-padding form-control">
                                    <option value="1">1</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-3">
            <div class="clientssummarybox">
                <div class="title">Action</div>
                <table class="clientssummarystats" cellpadding="2" cellspacing="0">
                    <tbody>
                        <tr>
                            <td>
                                <select name="sdns_mut_action" id="sdns_mut_action" class="form-padding form-control">
                                    <option value="add">Add</option>
                                    <option value="edit">Edit</option>
                                    <option value="delete">Delete</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-3">
            <div class="clientssummarybox">
                <div id="where_container" class="title">Where</div>
                <table class="clientssummarystats" cellpadding="2" cellspacing="0">
                    <tbody>
                        <tr>
                            <td width="80">
                                <label>Type</label>
                            </td>
                            <td>
                                <select id="sdns_mut_where_type" class="where_input form-padding form-control" name="sdns_mut_where_type">
                                    <option value="A">A</option>
                                    <option value="AAAA">AAAA</option>
                                    <option value="CNAME">CNAME</option>
                                    <option value="HINFO">HINFO</option>
                                    <option value="MX">MX</option>
                                    <option value="NAPTR">NAPTR</option>
                                    <option value="NS">NS</option>
                                    <option value="PTR">PTR</option>
                                    <option value="SPF">SPF</option>
                                    <option value="SRV">SRV</option>
                                    <option value="SSHFP">SSHFP</option>
                                    <option value="TXT">TXT</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="altrow">
                            <td>
                                <label>Content</label>
                            </td>
                            <td>
                                <input id="sdns_mut_where_content" class="where_input form-padding form-control" type="textbox" name="sdns_mut_where_content" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>TTL</label>
                            </td>
                            <td>
                                <input id="sdns_mut_where_ttl" class="where_input form-padding form-control" type="textbox" name="sdns_mut_where_ttl" value="" />
                            </td>
                        </tr>
                        <tr class="altrow">
                            <td>
                                <label>Prio</label>
                            </td>
                            <td>
                                <input id="sdns_mut_where_prio" class="where_input form-padding form-control" type="textbox" name="sdns_mut_where_prio" value="" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-3">
            <div class="clientssummarybox">
                <div id="content_container" class="title">Content</div>
                <table class="clientssummarystats" cellpadding="2" cellspacing="0">
                    <tbody>
                        <tr>
                            <td width="80">
                                <label>Type</label>
                            </td>
                            <td>
                                <select id="sdns_mut_content_type" class="content_input form-padding form-control" name="sdns_mut_content_type">
                                    <option value="A">A</option>
                                    <option value="AAAA">AAAA</option>
                                    <option value="CNAME">CNAME</option>
                                    <option value="HINFO">HINFO</option>
                                    <option value="MX">MX</option>
                                    <option value="NAPTR">NAPTR</option>
                                    <option value="NS">NS</option>
                                    <option value="PTR">PTR</option>
                                    <option value="SPF">SPF</option>
                                    <option value="SRV">SRV</option>
                                    <option value="SSHFP">SSHFP</option>
                                    <option value="TXT">TXT</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="altrow">
                            <td>
                                <label>Content</label>
                            </td>
                            <td>
                                <input id="sdns_mut_content_content" class="content_input form-padding form-control" type="textbox" name="sdns_mut_content_content" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>TTL</label>
                            </td>
                            <td>
                                <input id="sdns_mut_content_ttl" class="content_input form-padding form-control" type="textbox" name="sdns_mut_content_ttl" value="" />
                            </td>
                        </tr>
                        <tr class="altrow">
                            <td>
                                <label>Prio</label>
                            </td>
                            <td>
                                <input id="sdns_mut_content_prio" class="content_input form-padding form-control" type="textbox" name="sdns_mut_content_prio" value="" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-12">
            <div class="text-center">
                <input id="manage" class="btn btn-primary" type="button" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('mutation'); console_name('{$LANG.admin_console_title_mutation}');"value="Start Mutation">
                <div class="tools-warning"><small>Make sure you have a working back-up before making mutations to the database!</small></div>
            </div>
        </div>
    </div>
    <hr />
</div>