<div class="row spacer_5">
	<div class="col-md-3">
		<p><strong>{$LANG.admin_manage_title_zone}:</strong> <br />
			<a href="{if $domain->type eq 'd'}clientsdomains.php?userid={$domain->client_id}&id={$domain->local_id}{elseif $domain->type eq 'p'}clientsservices.php?userid={$domain->client_id}&productselect={$domain->local_id}{else}#{/if}">{$domain->idn}</a> {if isset($dnssec.nsec)}<span class="label inactive"><span class="glyphicons glyphicons-unlock" aria-hidden="true"></span> {$dnssec.nsec}</span>{/if}</p>
	</div>
	<div class="col-md-3">
		<p><strong>{$LANG.admin_manage_title_client}:</strong> <br />
			{if $clientdetails}<a href="clientssummary.php?userid={$domain->client_id}">{if $clientdetails->companyname}{$clientdetails->companyname}{else}{$clientdetails->firstname} {$clientdetails->lastname}{/if}</a>{else}N/A{/if}</p>
	</div>
	<div class="col-md-3">
		<p><strong>{$LANG.admin_manage_title_email}:</strong> <br />
			{if $clientdetails->email}<a href="supporttickets.php?action=open&userid={$domain->client_id}">{$clientdetails->email}</a>{else}N/A{/if}</p>
	</div>
	<div class="col-md-3">
		<div class="text-right"> 
			<!-- Split button -->
			<div class="btn-group">
				<button type="button" class="btn btn-primary btn-sm" onclick="health('reload', '{$domain->id}');" data-toggle="tooltip" data-placement="bottom" title="{$LANG.admin_manage_health_recheck}" {if $Controller->config(maintenance)}DISABLED{/if}><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>
			</div>
		</div>
	</div>
</div>

<h2>{$LANG.global_general_health_issues}
	{if $health}<br /><small class="text-right"><strong>{$LANG.admin_manage_report_date}:</strong> {$health.date}</small>{/if}
</h2>
<table width="100%" class="datatable" border="0" cellspacing="3" cellpadding="3">
	<tr>
		<th align="left" width="5%"></th>
		<th align="left" width="95%"><strong>{$LANG.admin_overview_log}</strong></th>
	</tr>
	{if $health}
		{foreach from=$health.content key=code item=array}
			<tr>
				<td class="text-center"> {if $code eq '7001' or $code eq '7002' or $code eq '7004'} <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> {else} <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> {/if} </td>
				<td><div class="col-md-12 font_size">
						<div class="row"> {$error_code="global_error_`$code`"}
							{$LANG.$error_code}
						</div>
						{foreach from=$array item=item}
						<div class="row col-md-12">
							<code>{$item}</code>
						</div>
						{/foreach}
					</div>
				</td>
			</tr>
		{/foreach}
	{else}
		<td colspan="2" class="text-center">{$LANG.global_status_noneregistered}</td>
	{/if}
</table>
