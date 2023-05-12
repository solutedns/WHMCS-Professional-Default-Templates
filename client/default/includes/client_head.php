<?php
/**
 *               *** SoluteDNS Professional Edition for WHMCS ***
 *
 * @file        templates/includes/client_head.php
 * @package     solutedns-pro-whmcs
 *
 * Copyright (c) 2018 NetDistrict
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * @license     SoluteDNS - End User License Agreement, http://www.solutedns.com/eula/
 * @author      NetDistrict <info@netdistrict.net>
 * @copyright   NetDistrict
 * @link        https://www.solutedns.com
 * */
if (!defined("WHMCS")) {
	die("This file cannot be accessed directly");
}

$return = 
<<<HTML
<!-- SoluteDNS CSS -->
	<link href="{$system_url}modules/addons/solutedns/templates/client/{$smarty_template}/css/client.css" rel="stylesheet" type="text/css" />
	
	<!-- SoluteDNS Scripts -->
	<script type="text/javascript" src="{$system_url}modules/addons/solutedns/templates/common/js/nprogress.min.js"></script>
	<script type="text/javascript" src="{$system_url}modules/addons/solutedns/templates/client/{$smarty_template}/js/client.js"></script>
	<script type="text/javascript" src="{$system_url}assets/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="{$system_url}assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="{$system_url}assets/js/dataTables.responsive.min.js"></script>
	<script type="text/javascript" src="{$system_url}modules/addons/solutedns/templates/common/js/dataTables.fnReloadAjax.js"></script>

	<script>
		function drawOverview(nTable, nData) {
			if ( isDataTable ( nTable ) == false ) {
				SDNS_dataTable = $('#'+nTable).dataTable( {
					"dom": '<"listtable"fit>prl', 	
					"columns": [
						{ "width": "85%" },
						{ "width": "15%", "orderable": false }
					],
					"processing": true,
					"serverSide": true,
					"responsive": true,
					"ajax": '{$system_url}index.php?m=solutedns&action=table&table=' + nTable + '&data=' + nData,
					"stateSave": true,
					"sorting": [[0,"asc"]],
					"paging": true,
					"searching": true,
					"language": {
							"info":			'{$_lang['client_table_overview_info']}',
							"infoEmpty":	'{$_lang['client_table_overview_infoEmpty']}',
							"infoFiltered":	'{$_lang['client_table_overview_infoFiltered']}',
							"lengthMenu":	'{$_lang['client_table_overview_lengthMenu']}',
							"sSearch":		'',
							"zeroRecords":	'{$_lang['client_table_zeroRecords']}',
                            "processing":	'<div class="data_spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>',
							"First":		'{$_lang['client_table_First']}',
							"Last":			'{$_lang['client_table_Last']}',
							"Next":			'{$_lang['client_table_Next']}',
							"Previous":		'{$_lang['client_table_Previous']}',
					},
					"fnStateSaveParams": function (oSettings, oData) {
					},
					"fnPreDrawCallback": function( oSettings ) {
						NProgress.start();
					},
					"fnDrawCallback": function( oSettings ) {
					  NProgress.done();
					}
				});

			}
		}
		function drawRecords(nTable, nData) {
			if ( isDataTable ( nTable ) == false ) {
				SDNS_dataTable = $('#'+nTable).dataTable( {
					"dom": '<"listtable"ft>prl', 	
					"columns": [
						{ "width": "5%", "orderable": false },
						{ "width": "23%" },
						{ "width": "12%" },
						{ "width": "27%" },
						{ "width": "8%", "orderable": false },
						{ "width": "14%", "orderable": false },
						{ "width": "11%", "orderable": false }
					],
					"processing": true,
					"serverSide": true,
					"responsive": true,
					"ajax": '{$system_url}index.php?m=solutedns&action=table&table=' + nTable + '&data=' + nData,
					"stateSave": true,
					"sorting": [[0,"asc"]],
					"paging": {$paging},
					"searching": false,
					"language": {
							"emptyTable": '{$_lang['client_table_records_emptytable']}',
							"zeroRecords": '{$_lang['client_table_records_emptytable']}',
                            "processing": '<div class="data_spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div',
					},
					"fnStateSaveParams": function (oSettings, oData) {
					},
					"fnPreDrawCallback": function( oSettings ) {
						NProgress.start();
					},
					"fnDrawCallback": function( oSettings ) {
					  NProgress.done();
					}
				});

			}
		}
		function drawReverse(nTable, nData) {
			if ( isDataTable ( nTable ) == false ) {
				SDNS_dataTable = $('#'+nTable).dataTable( {
					"dom": '<"listtable"ft>prl', 	
					"columns": [
						{ "width": "40%" },
						{ "width": "60%" }
					],
					"processing": true,
					"serverSide": true,
					"responsive": true,
					"ajax": '{$system_url}index.php?m=solutedns&action=table&table=' + nTable + '&data=' + nData,
					"stateSave": true,
					"sorting": [[0,"asc"]],
					"paging": true,
					"searching": false,
					"language": {
						"emptyTable": '{$_lang['client_table_reverse_emptytable']}',
						"zeroRecords": '{$_lang['client_table_reverse_emptytable']}',
                        "processing": '<div class="data_spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div',
					},
					"fnStateSaveParams": function (oSettings, oData) {
					},
					"fnPreDrawCallback": function( oSettings ) {
						NProgress.start();
					},
					"fnDrawCallback": function( oSettings ) {
					  NProgress.done();
					}
				});

			}
		}
	</script>
HTML;
?>