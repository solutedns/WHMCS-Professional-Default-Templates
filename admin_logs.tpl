<div class="col-md-12">

	<div class="row">
		<div class="col-md-10">
			<h4>{$LANG.admin_logs_title_logs}</h4>
		</div>
        <div class="col-md-2">
            <div class="text-right">
                <h4><button onclick="update_static('clearlogs')" type="button" class="btn btn-sm btn-primary">{$LANG.admin_logs_clearlogs}</button></h4>
            </div>
        </div>
	</div>
  
	<div class="overview_row">
		<table class="dataTable display" id="sdns_logs" width="100%" border="0" cellspacing="1" cellpadding="3">
			<thead>
				<tr>
					<th>{$LANG.admin_logs_table_id}</th>
					<th>{$LANG.admin_logs_table_log}</th>
					<th>{$LANG.admin_logs_table_type}</th>
					<th>{$LANG.admin_logs_table_date}</th>
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