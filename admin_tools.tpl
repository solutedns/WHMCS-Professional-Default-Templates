{assign var=records value=$Controller->inConfig(record_types)}

<div class="row">
	<div class="col-md-12">
		<h4>{$LANG.admin_menu_tools}</h4>
	</div>
</div>
	
<b>{$LANG.admin_tools_title_mutation}</b>
<div class="row">
	<div class="col-md-3">
		<div class="clientssummarybox">
			<div class="title">For</div>
			<table class="clientssummarystats" cellpadding="2" cellspacing="0">
				<tbody>
					<tr>
						<td width="80"><label>{$LANG.global_general_zones}</label></td>
						<td><select name="sdns_mut_for" id="sdns_mut_for" class="form-padding form-control">
								<option value="all">All zones</option>
								<option value="domains">Domains</option>
								<option value="products">Products</option>
								<option value="standalone">Standalone</option>
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
						<td><select name="sdns_mut_action" id="sdns_mut_action" class="form-padding form-control">
								<option value="add">{$LANG.global_btn_add}</option>
								<option value="edit">{$LANG.global_btn_edit}</option>
								<option value="delete">{$LANG.global_btn_delete}</option>
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
						<td width="80"><label>{$LANG.global_dns_type}</label></td>
						<td><select id="sdns_mut_where_type" class="where_input form-padding form-control" name="sdns_mut_where_type">
								{foreach from=$records item=type}
									<option value="{$type}">{$type}</option>
                                {/foreach}
							</select>
						</td>
					</tr>
					<tr class="altrow">
						<td><label>{$LANG.global_dns_content}</label></td>
						<td><input id="sdns_mut_where_content" class="where_input form-padding form-control" type="text" name="sdns_mut_where_content" value="" /></td>
					</tr>
					<tr>
						<td><label>{$LANG.global_dns_ttl}</label></td>
						<td><input id="sdns_mut_where_ttl" class="where_input form-padding form-control" type="text" name="sdns_mut_where_ttl" value="" /></td>
					</tr>
					<tr class="altrow">
						<td><label>{$LANG.global_dns_prio}</label></td>
						<td><input id="sdns_mut_where_prio" class="where_input form-padding form-control" type="text" name="sdns_mut_where_prio" value="" /></td>
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
						<td width="80"><label>{$LANG.global_dns_type}</label></td>
						<td><select id="sdns_mut_content_type" class="content_input form-padding form-control" name="sdns_mut_content_type">
                                {foreach from=$records item=type}
									<option value="{$type}">{$type}</option>
                                {/foreach}
							</select>
						</td>
					</tr>
					<tr class="altrow">
						<td><label>{$LANG.global_dns_content}</label></td>
						<td><input id="sdns_mut_content_content" class="content_input form-padding form-control" type="text" name="sdns_mut_content_content" value="" /></td>
					</tr>
					<tr>
						<td><label>{$LANG.global_dns_ttl}</label></td>
						<td><input id="sdns_mut_content_ttl" class="content_input form-padding form-control" type="text" name="sdns_mut_content_ttl" value="" /></td>
					</tr>
					<tr class="altrow">
						<td><label>{$LANG.global_dns_prio}</label></td>
						<td><input id="sdns_mut_content_prio" class="content_input form-padding form-control" type="text" name="sdns_mut_content_prio" value="" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-12">
		<div class="text-center">
			<input id="manage" class="btn btn-primary" type="button" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('mutation'); console_name('{$LANG.admin_console_title_mutation}');" value="{$LANG.global_btn_start}">
			<div class="tools-warning"><small>Make sure you have a working back-up before making mutations to the database!</small></div>
		</div>
	</div>
</div>
<hr />

{if $Controller->config(auto_health)}
<b>{$LANG.admin_tools_title_health}</b>
	<span class="pull-right">
		<button type="button" class="btn btn-default btn-sm" onclick="getStats('health');"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>
	</span>
<div class="row">

	<div id="canvas-holder" class="col-md-6 text-center">
		<h5>{$LANG.admin_tools_health_stats_zones}:</h5>
		<canvas id="chart-area-overview"></canvas>
	</div>
	
	<div id="canvas-holder" class="col-md-6 text-center">
		<h5>{$LANG.admin_tools_health_stats_types}:</h5>
		<canvas id="chart-area-issues"></canvas>
	</div>
</div>

<div class="row">
	<div class="col-lg-2 center-block">
		<div class="input-group">
			<select class="form-padding form-control" name="sdns_health_tool_option" id="sdns_health_tool_option">
				<option value="open">{$LANG.admin_tools_health_option_open}</option>
				<option value="all">{$LANG.admin_tools_health_option_all}</option>
				<option value="report">{$LANG.admin_tools_health_option_report}</option>
			</select>
			<span class="input-group-btn">
				<button class="btn btn-primary" type="button" data-dismiss="modal" data-toggle="modal" data-target="#dialog_console" data-backdrop="static" data-keyboard="false" onclick="console('health'); console_name('{$LANG.admin_console_title_health}');">{$LANG.admin_btn_check}</button>
			</span>
		</div>
	</div>
</div>

<script>
	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		ared: 'rgba(255, 99, 132, 0.2)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
</script>

<hr />
{/if}