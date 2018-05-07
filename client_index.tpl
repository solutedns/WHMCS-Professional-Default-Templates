<div id="msgConsole"></div>

<div class="tab-content margin-bottom">
	<div class="tab-pane fade in active" id="tabOverview"> 
		<!-- Overview Tab --> 
		{include file=".{DIRECTORY_SEPARATOR}client_overview.tpl"}
	</div>
	{if $client_template}
		<div class="tab-pane fade" id="tabTemplate"> 
			<!-- Template Tab --> 
			{include file=".{DIRECTORY_SEPARATOR}client_template.tpl"}
		</div>
	{/if}
	{if $client_reverse}
		<div class="tab-pane fade" id="tabReverse"> 
			<!-- Reverse Tab --> 
			{include file=".{DIRECTORY_SEPARATOR}client_reverse.tpl"}
		</div>
	{/if}
</div>

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
