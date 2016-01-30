<div class="col-md-12">

    <div class="row">
        <div class="col-md-12">
            <h4>{$LANG.admin_tools_title_tools}</h4>
        </div>
    </div>

	{if $lal >= 3}
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
                                <label>{$LANG.admin_tools_server}</label>
                            </td>
                            <td>
                                <select name="sdns_mut_server" id="sdns_mut_server" class="form-padding form-control">
                                    {foreach $nameservers as $ns}
                                    <option value="{$ns.id}">{$ns.nameserver|ucfirst}</option>
									{/foreach}
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-3">
            <div class="clientssummarybox">
                <div class="title">{$LANG.admin_tools_action}</div>
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
                                    <option value="TLSA">TLSA</option>
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
                                    <option value="TLSA">TLSA</option>
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
                <input id="manage" class="btn btn-primary" type="button" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('mutation'); console_name('{$LANG.admin_console_title_mutation}');"value="{$LANG.admin_tools_startmutation}">
                <div class="tools-warning"><small>Make sure you have a working back-up before making mutations to the database!</small></div>
            </div>
        </div>
    </div>
    <hr />
    {/if}
    
    
    
    
	{if $lal >= 2}
    <b>{$LANG.admin_tools_title_dnssectool}</b>

    <div class="row">
        <div class="col-md-3">

            <div class="clientssummarybox">
                <div class="title">{$LANG.admin_tools_server}</div>
                <table class="clientssummarystats" cellpadding="2" cellspacing="0">
                    <tbody>
                        <tr>
                            <td>
                                <select name="sdns_dnssec_server" id="sdns_dnssec_server" class="form-padding form-control">
                                    {foreach $nameservers as $ns}
                                    <option value="{$ns.id}">{$ns.nameserver|ucfirst}</option>
									{/foreach}
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-3">
            <div class="clientssummarybox">
                <div class="title">{$LANG.admin_tools_action}</div>
                <table class="clientssummarystats" cellpadding="2" cellspacing="0">
                    <tbody>
                        <tr>
                            <td>
                                <select name="sdns_dnssec_action" id="sdns_dnssec_action" class="form-padding form-control">
                                    <option value="discover">Discover</option>
                                    <option value="secure">Discover &amp; Secure</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="col-md-6">
			<table class="clientssummarystats" cellpadding="2" cellspacing="0">
				<tr>
					<td><strong>Discover:</strong> Only import DNSsec keys for secured zones.</td>
				</tr>
				<tr>
					<td><strong>Discover &amp; Secure:</strong> Secure unsecured zones and import all keys.</td>
				</tr>
                <tr>
					<td><br /><strong>Hook:</strong> Check out the <a href="http://www.solutedns.com/documentation/hook-points/" target="_blank">DNSsec Key Update Hook</a> for additional processing.</td>
				</tr>
			</table>
        </div>
  
        <div class="col-md-12">
            <div class="text-center">
                <input id="manage" class="btn btn-primary" type="button" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('dnssec'); console_name('{$LANG.admin_console_title_dnssec}');"value="{$LANG.admin_tools_starttool}">
            </div>
        </div>
    </div>
    <hr />
    {/if}

</div>