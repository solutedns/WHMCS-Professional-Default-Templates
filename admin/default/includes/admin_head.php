<?php
/**
 *               *** SoluteDNS Professional Edition for WHMCS ***
 *
 * @file        templates/includes/admin_head.php
 * @package     solutedns-pro-whmcs
 *
 * Copyright (c) 2020 NetDistrict
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
	<link href="{$system_url}/modules/addons/solutedns/templates/admin/{$smarty_template}/css/admin.css" rel="stylesheet" type="text/css" />
	
	<!-- SoluteDNS Scripts -->
	<script type="text/javascript" src="{$system_url}/modules/addons/solutedns/templates/common/js/nprogress.min.js"></script>
	<script type="text/javascript" src="{$system_url}/modules/addons/solutedns/templates/admin/{$smarty_template}/js/admin.js"></script>
	<script type="text/javascript" src="{$system_url}/assets/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="{$system_url}/assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="{$system_url}/assets/js/dataTables.responsive.min.js"></script>
	<script type="text/javascript" src="{$system_url}/modules/addons/solutedns/templates/common/js/dataTables.fnReloadAjax.js"></script>
	<script type="text/javascript" src="{$system_url}/modules/addons/solutedns/templates/common/js/typeahead.js"></script>
	<script type="text/javascript" src="{$system_url}/modules/addons/solutedns/templates/common/js/chart.min.js"></script>

	<script>
		function drawTable(nTable, nData) {
			
			if ( isDataTable ( nTable ) == false ) {
				SDNS_zoneTable = $('#'+nTable).dataTable( {	
					"columns": [
						{ "width": "5%", "type": "num-html" },
						{ "width": "60%" },
						{ "width": "15%" },
						{ "width": "10%", "orderable": false },
						{ "width": "10%", "orderable": false }
					],
					"processing": true,
					"serverSide": true,
					"responsive": true,
					"ajax": location.protocol + '//' + location.host + location.pathname + '?module=solutedns&action=table&table=' + nTable + '&data=' + nData,
					"stateSave": true,
					"sorting": [[0,"asc"]],
					"language": {
                            "processing": '<div class="data_spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div',
					},
					"fnStateSaveParams": function (oSettings, oData) {
					},
					"fnPreDrawCallback": function( oSettings ) {
						NProgress.start();
					},
					"fnDrawCallback": function( oSettings ) {
						//this.api().state.clear();
						NProgress.done();
					}
				});
				
			}
		}
		function drawRecords(nTable, nData) {
			
			if ( isDataTable ( nTable ) == false ) {
				
				if (nTable == 'sdns_template_records') {
					var columns =  [
						{ "width": "3.5%", "orderable": false },
						{ "width": "5.5%", "type": "num-html" },
						{ "width": "23%" },
						{ "width": "10%" },
						{ "width": "29%" },
						{ "width": "8%", "orderable": false },
						{ "width": "11%", "orderable": false },
						{ "width": "11%", "orderable": false }
					];
				} else {
					var columns =  [
						{ "width": "4%", "orderable": false },
						{ "width": "6%", "type": "num-html" },						
						{ "width": "29%" },
						{ "width": "10%" },
						{ "width": "36%" },
						{ "width": "12%", "orderable": false },
						{ "width": "4%", "orderable": false }
						
					];
				}
				
				SDNS_recordTable = $('#'+nTable).dataTable( {	
					"columns": columns,
					"processing": true,
					"serverSide": true,
					"responsive": true,
					"ajax": location.protocol + '//' + location.host + location.pathname + '?module=solutedns&action=table&table=' + nTable + '&data=' + nData,
					"stateSave": true,
					"sorting": [[1,"asc"]],
					"paging": {$paging},
					"searching": false,
					"language": {
                            "processing": '<div class="data_spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>',
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