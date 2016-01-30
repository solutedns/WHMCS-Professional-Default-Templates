<div class="col-md-12 topm10">

    <div class="row">
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_zone}:</strong>
                <br /><a href="http://{$zone.domain}">{$zone.domain}</a></p>
        </div>
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_client}:</strong>
                <br /><a href="clientssummary.php?userid={$clientdetails.id}">{if $clientdetails.companyname}{$clientdetails.companyname}{else}{$clientdetails.firstname} {$clientdetails.lastname}{/if}</a></p>
        </div>
        <div class="col-md-3">
            <p><strong>{$LANG.admin_manage_title_email}:</strong>
                <br /><a href="mailto:{$clientdetails.email}">{$clientdetails.email}</a></p>
        </div>
        <div class="col-md-3">
            <div class="text-right">
                <!-- Split button -->
                <div class="btn-group">
                    <button {if $isSlave}disabled{/if} type="button" class="btn btn-warning btn-sm" onclick="dnssec('rectify','{$zone.id}');"><span class="glyphicon glyphicon-flash" aria-hidden="true"></span> {$LANG.admin_dnssec_rectify}</button>
                </div>

                <!-- Single button -->
                <div class="btn-group">
                    <button {if $isSlave}disabled{/if} type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        {$LANG.admin_manage_manage} <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#dialog_addDNSsec" onclick=""><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_dnssec_add}</span></a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" onclick="dnssec('check','{$zone.id}');"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_dnssec_check}</span></a></li>
                        <li><a href="javascript:void(0);" onclick="dnssec('nsec3','{$zone.id}');"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_dnssec_nsec3}</span></a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" onclick="dnssec('reload','{$zone.id}');"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_dnssec_reload}</span></a></li>
                        <li><a href="javascript:void(0);" onclick="dnssec('reset','{$zone.id}');"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_dnssec_reset}</span></a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" onclick="dnssec('unset','{$zone.id}');"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span><span class="dropmenu_desc">{$LANG.admin_dnssec_unset}</span></a></li>
                    </ul>
                </div>


            </div>
        </div>
    </div>

    <h2>{$LANG.admin_manage_title_dnsseckeys}</h2>

    <table width="100%" class="datatable" border="0" cellspacing="1" cellpadding="3">
        <tr>
            <th align="center" width="5%"><strong>{$LANG.admin_manage_table_id}</strong></th>
            <th align="center" width="10%"><strong>{$LANG.admin_manage_table_keytag}</strong></th>
            <th align="center" width="5%"><strong>{$LANG.admin_manage_table_flag}</strong></th>
            <th align="center" width="15%"><strong>{$LANG.admin_manage_table_algorithm}</strong></th>
            <th align="center" width="40%"><strong>{$LANG.admin_manage_table_publickey}</strong></th>
            <th align="center" width="10%"><strong>{$LANG.admin_manage_table_status}</strong></th>
            <th align="center" width="15%"><strong></strong></th>
        </tr>
        {if $dnssec_keys}
        {foreach from=$dnssec_keys item=key}
        <tr>
			<td align="center">
                {$key.id}
            </td>
            <td align="center">
                {$key.key_tag}
            </td>
            <td align="center">
                {$key.flag}
            </td>
            <td align="center">
                {if $key.algorithm eq 'RSASHA1'}
                RSA/SHA-1 (5)
                {elseif $key.algorithm eq 'RSANSEC3SHA1'}
                RSASHA1-NSEC3-SHA1 (7)
                {elseif $key.algorithm eq 'RSASHA256'}
                RSA/SHA-256 (8)
                {elseif $key.algorithm eq 'RSASHA512'}
                RSA/SHA-512 (10)
                {elseif $key.algorithm eq 'ECC-GOST'}
                GOST R 34.10-2001 (12)
                {elseif $key.algorithm eq 'ECDSA256'}
                ECDSA Curve P-256 with SHA-256 (13)
                {elseif $key.algorithm eq 'ECDSA384'}
                ECDSA Curve P-384 with SHA-384 (14
                {else}
                {$key.algorithm}
                {/if}
            </td>
            <td align="center" style="padding-right: 8px;">
                <small><textarea style="width: 100%;">{$key.public_key}</textarea></small>
            </td>
            <td align="center">
            	{if $key.active eq '1'}
                <span class="label active">active</span>
                {else}
                <span class="label label-default">inactive</span>
                {/if}                
            </td>
            <td align="center">
				{if $key.active eq '0'}
                <button {if $isSlave}disabled{/if} type="button" onclick="dnssec('keyactivate','{$zone.id}','{$key.key_tag}');" value='Activate' class="btn btn-success"><span class="glyphicon glyphicon-fire" aria-hidden="true"></span></button>
                <button {if $isSlave}disabled{/if} type="button" onclick="dnssec('keydelete','{$zone.id}','{$key.key_tag}');" value="Delete" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
				{else}
                <button {if $isSlave}disabled{/if} type="button" onclick="dnssec('keydeactivate','{$zone.id}','{$key.key_tag}');" value='Deactivate' class="btn btn-default"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
                {/if}
            </td>
      
         
        </tr>
        {/foreach}
        {else}
		<tr>
			<td colspan="7" class="dataTables_empty text-center">{$LANG.admin_none_available}</td>
		</tr>
        {/if}
    </table>

    <br />
    <h2>{$LANG.admin_manage_title_dsrecords}</h2>

    <table width="100%" class="datatable" border="0" cellspacing="1" cellpadding="3">
        <tr>
            <th align="center" width="5%"><strong>{$LANG.admin_manage_table_id}</strong></th>
            <th align="center" width="10%"><strong>{$LANG.admin_manage_table_keytag}</strong></th>
            <th align="center" width="17%"><strong>{$LANG.admin_manage_table_algorithm}</strong></th>
            <th align="center" width="17%"><strong>{$LANG.admin_manage_table_digesttype}</strong></th>
            <th align="center" width="50%"><strong>{$LANG.admin_manage_table_digest}</strong></th>
        </tr>
        {if $dnssec_keys}
        {foreach from=$dnssec_ds item=ds}
        <tr>
			<td align="center">
				{$ds.id}
			</td>
			<td align="center">
				{$ds.key_tag}
			</td>
            <td align="center">
				{if $ds.algorithm eq '1'}
                RSA/MD5 (1)
                {elseif $ds.algorithm eq '2'}
                Diffie-Hellman (2)
                {elseif $ds.algorithm eq '3'}
                DSA/SHA1 (3)
                {elseif $ds.algorithm eq '5'}
                RSA/SHA-1 (5)
                {elseif $ds.algorithm eq '6'}
                DSA-NSEC3-SHA1 (6)
                {elseif $ds.algorithm eq '7'}
                RSASHA1-NSEC3-SHA1 (7)
                {elseif $ds.algorithm eq '8'}
                RSA/SHA-256 (8)
                {elseif $ds.algorithm eq '10'}
                RSA/SHA-512 (10)
                {elseif $ds.algorithm eq '12'}
                GOST R 34.10-2001 (12)
                {elseif $ds.algorithm eq '13'}
                ECDSA Curve P-256 with SHA-256 (13)
                {elseif $ds.algorithm eq '14'}
                ECDSA Curve P-384 with SHA-384 (14)
                {else}
                {$LANG.admin_manage_unknown}
                {/if}
			</td>
            <td align="center">
				{if $ds.digest_type eq '1'}
                SHA-1 (1)
                {elseif $ds.digest_type  eq '2'}
                SHA-256 (2)
                {elseif $ds.digest_type  eq '3'}
                GOST R 34.11-94 (3)
                {elseif $ds.digest_type  eq '4'}
                SHA-384 (4)
                {else}
                {$LANG.admin_manage_unknown}
                {/if}
			</td>
            <td align="center" style="padding-right: 8px;">
				<small><textarea style="width: 100%;">{$ds.digest}</textarea></small>
            </td>
        </tr>
        {/foreach}
        {else}
		<tr>
			<td colspan="5" class="dataTables_empty text-center">{$LANG.admin_none_available}</td>
		</tr>
        {/if}
    </table>
</div>

<!-- Add Modal -->
<div class="bootstrap">
    <div class="modal fade" id="dialog_addDNSsec" tabindex="-1" role="dialog" aria-labelledby="dialog_addDNSsec" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="dialog_addRecord">{$LANG.admin_manage_dnssec_addnewkey}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="sdns_z-name_0" class="col-md-3">
                            <label for "sdns_dnssec_flag">{$LANG.admin_manage_dnssec_flag}:</label>
                            <select name="sdns_dnssec_flag" id="sdns_dnssec_flag" class="form-padding form-control">
                                <option value="ksk">KSK</option>
                                <option value="zsk">ZSK</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for "sdns_dnssec_bits">{$LANG.admin_manage_dnssec_bits}:</label>
                            <select name="sdns_dnssec_bits" id="sdns_dnssec_bits" class="form-padding form-control">
                                <option value="1024">1024</option>
                                <option selected value="2048">2048</option>
                            </select>
                        </div>
                        <div id="sdns_z-content_0" class="col-md-6">
                            <label for "sdns_dnssec_algorithm">{$LANG.admin_manage_dnssec_algorithm}:</label>
                            <select name="sdns_dnssec_algorithm" id="sdns_dnssec_algorithm" class="form-padding form-control">
                                <option value="5">RSA-SHA1 (5)</option>
                                <option value="8">RSA-SHA256 (8)</option>
                                <option selected value="10">RSA-SHA512 (10)</option>
                                <option value="12">GOST R 34.10-2001 (12)</option>
                                <option value="13">EC-DSA-256 (13)</option>
                                <option value="14">EC-DSA-384 (14)</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" onclick="dnssec_addkey('{$zone.id}');">{$LANG.admin_add}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.admin_cancel}</button>
                </div>
            </div>
        </div>
    </div>
</div>