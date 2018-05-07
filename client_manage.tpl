{if $domain->domain eq false}
	<div class="alert alert-danger text-center" role="alert">
		<p>{$MLANG.client_msg_access_denied_desc}</p>
	</div>
{else}
	<div id="msgConsole"></div>

	<div class="tab-content margin-bottom">
		<div class="tab-pane fade in active" id="tabRecords"> 
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