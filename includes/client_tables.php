<?php

/**
 *               *** SoluteDNS Professional Edition for WHMCS ***
 *
 * @file        templates/includes/client_tables.php
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


/**
 * Overview Table Columns
 */
$columns_overview =
[
	[
		'db' => 'domain', 'dt' => 0,
		'formatter' => function( $d, $row ) {

			if (extension_loaded('intl')) {
				$d = defined('INTL_IDNA_VARIANT_UTS46') ? idn_to_utf8($d, 0, INTL_IDNA_VARIANT_UTS46) : idn_to_utf8($d);
			}
			return self::domainStatus($row['id']) . $d . ' <a href="http://' . $d . '" target="_blank" style="color:#cc0000"><small>www</small></a> ';
		}
	],
	[
		'db' => 'id', 'dt' => 1,
		'formatter' => function( $d, $row ) {

			if ($row['type'] == 's') {
				$button = '<button type="button" class="btn btn-danger btn-sm" onClick="setZone(\'' . $row['id'] . '\'), setZoneName(\'' . $row['domain'] . '\')" data-toggle="modal" data-target="#dialog_deleteZone"><span class="glyphicon glyphicon-remove"></span></button>';
			} else {
				$button = '<button type="button" class="btn btn-default btn-sm disabled" disabled><span class="glyphicon glyphicon-remove"></span></button>';
			}

			$url = !is_null($this->custom_url) ? $this->system_url . $this->custom_url . '/' : 'index.php?m=solutedns&action=manage&id=';

			return '<div class="text-right">
					<!-- Split button -->
					<div class="btn-group">
					  <button type="button" class="btn btn-default btn-sm" onClick="location.href=\'' . $url . $row['id'] . '\'">' . $this->lang['global_btn_manage'] . '</button>
					  ' . $button . '
					</div>';
		}
	],
	[
		'db' => 'type', 'dt' => 2
	]
];

/**
 * Reverse Table Columns
 */
$columns_reverse =
[
	[
		'db' => 'hostname', 'dt' => 0,
		'formatter' => function( $d, $row ) {
			return '<div id="sdns_z-ip_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_ip_' . $row['id'] . '" id="sdns_ip_' . $row['id'] . '" value="' . $row['ip'] . '"></div>';
		}
	],
	[
		'db' => 'ip', 'dt' => 1,
		'formatter' => function( $d, $row ) {
			return '
							<div id="sdns_z-hostname_' . $row['id'] . '" class="input-group dnsfield">
   	  <input type="textbox" class="form-padding form-control dnsfield" name="sdns_hostname_' . $row['id'] . '" id="sdns_hostname_' . $row['id'] . '" value="' . htmlentities($row['hostname']) . '">
   <span class="input-group-btn dnsmergefield">
        	  <button type="button" class="btn btn-warning" onclick="update_reverse(\'' . $row['id'] . '\')"><span class="glyphicon glyphicon glyphicon-floppy-disk" aria-hidden="true"></span></button>
   </span>
</div>';
		}
	],
	[
		'db' => 'id', 'dt' => 2,
	],
];

/**
 * Records Table Columns
 */
$columns_records =
[
	[
		'db' => 'id', 'dt' => 0,
		'formatter' => function( $d, $row ) {
			$option = ($row['type'] == 'NS') ? empty($this->config('disable_ns')) ? NULL : " DISABLED" : NULL;
			$option = ($row['type'] == 'SOA') ? " DISABLED" : $option;
			$option = ($row['disabled'] == 1) ? " DISABLED" : $option;
			return '<div class="checkbox tablecheckbox"><input type="checkbox" name="sdns_select" id="sdns_select_' . $row['id'] . '" value="' . $row['id'] . '" style="display: hidden;" ' . $this->maintenance . $option . '/><label for="sdns_select_' . $row['id'] . '" /></div>';
		}
	],
	[
		'db' => 'name', 'dt' => 1,
		'formatter' => function( $d, $row ) {
			return '<div id="sdns_z-name_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_name_' . $row['id'] . '" id="sdns_name_' . $row['id'] . '" value="' . $row['name'] . '"></div>';
		}
	],
	[
		'db' => 'type', 'dt' => 2,
		'formatter' => function( $d, $row ) {

			$record_types = $this->inConfig('record_types');

			foreach ($record_types as $record_type) {

				$selected = ($row['type'] == $record_type) ? 'SELECTED ' : NULL;
				$allowed_types[] = '<option ' . $selected . 'value="' . $record_type . '">' . $record_type . '</option>';
			}

			if (!in_array($row['type'], $record_types)) {
				$allowed_types[] = '<option SELECTED value="' . $row['type'] . '">' . $row['type'] . '</option>';
			}

			$allowed_types = implode("\r\n", $allowed_types);

			return '<select DISABLED class="form-padding form-control dnsfield" name="sdns_type_' . $row['id'] . '" id="sdns_type_' . $row['id'] . '">
							' . $allowed_types . '
						</select>';
		}
	],
	[
		'db' => 'content', 'dt' => 3,
		'formatter' => function( $d, $row ) {
			return '<div id="sdns_z-content_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_content_' . $row['id'] . '" id="sdns_content_' . $row['id'] . '" value="' . htmlentities($row['content']) . '"></div>';
		}
	],
	[
		'db' => 'prio', 'dt' => 4,
		'formatter' => function( $d, $row ) {
			return '<div id="sdns_z-prio_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_prio_' . $row['id'] . '" id="sdns_prio_' . $row['id'] . '" value="' . $row['prio'] . '"></div>';
		}
	],
	[
		'db' => 'ttl', 'dt' => 5,
		'formatter' => function( $d, $row ) {

			$preset_ttl = $this->config('preset_ttl');
			if ($preset_ttl == 'on' || $preset_ttl == '1') {

				$selected = [
					'60' => NULL,
					'300' => NULL,
					'3600' => NULL,
					'86400' => NULL
				];

				$selected[$row['ttl']] = 'SELECTED';

				if ($row['ttl'] == '60' || $row['ttl'] == '300' || $row['ttl'] == '3600' || $row['ttl'] == '86400') {
					$custom_ttl = NULL;
				} else {
					$custom_ttl = '<option SELECTED value="' . $row['ttl'] . '">' . $row['ttl'] . '</option>';
				}

				return '<select DISABLED class="form-padding form-control dnsfield" name="sdns_ttl_' . $row['id'] . '" id="sdns_ttl_' . $row['id'] . '">
						<option ' . $selected['60'] . ' value="60">1 ' . $this->lang['global_dns_minute'] . '</option>
						<option ' . $selected['300'] . ' value="300">5 ' . $this->lang['global_dns_minutes'] . '</option>
						<option ' . $selected['3600'] . ' value="3600">1 ' . $this->lang['global_dns_hour'] . '</option>
						<option ' . $selected['86400'] . ' value="86400">1 ' . $this->lang['global_dns_day'] . '</option>
						' . $custom_ttl . '
					</select>';
			} else {
				return '<input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_ttl_' . $row['id'] . '" id="sdns_ttl_' . $row['id'] . '" value="' . $row['ttl'] . '">';
			}
		}
	],
	[
		'db' => 'id', 'dt' => 6,
		'formatter' => function( $d, $row ) {
			if ($_GET['table'] == 'sdns_template') {
				return '<div class="text-center text-nowrap"><button type="button" class="btn btn-sm btn-success" style="display: none;" id="sdns_save_' . $row['id'] . '" onclick="record_edit(\'template\', ' . $row['id'] . ')"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button> <button type="button" class="btn btn-sm btn-warning" id="sdns_edit_' . $row['id'] . '" onclick="edit(\'' . $row['id'] . '\')"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button> <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dialog_deleteRecord" onclick="setRecord(\'' . $row['id'] . '\')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></div>';
			} else {
				$option = ($row['type'] == 'NS') ? empty($this->config('disable_ns')) ? NULL : " DISABLED" : NULL;
				$option = ($row['type'] == 'SOA') ? " DISABLED" : $option;
				$option = ($row['disabled'] == 1) ? " DISABLED" : $option;
				return '<div class="text-center text-nowrap"><button type="button" class="btn btn-sm btn-success" style="display: none;" id="sdns_save_' . $row['id'] . '" onclick="record_edit(\'zone\', ' . $row['id'] . ')" ' . $this->maintenance . '><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button> <button type="button" class="btn btn-sm btn-warning" id="sdns_edit_' . $row['id'] . '" onclick="edit(\'' . $row['id'] . '\')" ' . $this->maintenance . $option . '><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button> <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dialog_deleteRecord" onclick="setRecord(\'' . $row['id'] . '\')" ' . $this->maintenance . $option . '><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></div>';
			}
		}
	]
];
?>