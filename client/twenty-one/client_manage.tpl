{if $domain->domain eq false}
	<div class="alert alert-danger text-center" role="alert">
		<p>{$MLANG.client_msg_access_denied_desc}</p>
	</div>
{else}
	<div id="msgConsole"></div>

	<h4 class="h-top"><a href="clientarea.php?action=domaindetails&id={$domain->id}">{$domain->idn}</a> {if isset($dnssec.nsec)}<span class="badge badge-primary"><span class="fas fa-unlock" aria-hidden="true"></span> {$dnssec.nsec}</span>{/if}</h4>

	<div class="tab-content margin-bottom">
		<div class="tab-pane fade active show" id="tabRecords"> 
			<!-- Records Tab --> 
			{include file=".{DIRECTORY_SEPARATOR}client_manage_records.tpl"}
		</div>
		{if $dnssec}
			<div class="tab-pane fade" id="tabDnssec"> 
				<!-- Dnssec Tab --> 
				{include file=".{DIRECTORY_SEPARATOR}client_manage_dnssec.tpl"}
			</div>
		{/if}
	</div>

	<script type="text/javascript">
		getState();
	</script>

	<noscript>
	<div class="alert2 alert2-danger">
		<h4>{$MLANG.nojavascript_title}</h4>
		<p>{$MLANG.nojavascript_desc}</p>
	</div>
	<style>
		.tab-content { display:none; }
		.nav { display:none; }
	</style>
	</noscript>
{/if}