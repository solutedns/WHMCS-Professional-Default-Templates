<?php

/**
 *               *** SoluteDNS Professional Edition for WHMCS ***
 *
 * @file        templates/includes/admin_tables.php
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

/**
 * Overview Table Columns
 */
$tColumns->zones = [
			[
				'db' => 'id', 'dt' => 0,
				'formatter' => function( $d, $row ) {
					return '<div class="text-center">' . $d . '</div>';
				}
			],
			[
				'db' => 'domain', 'dt' => 1,
				'formatter' => function( $d, $row ) {

					if (extension_loaded('intl')) {
						$d = defined('INTL_IDNA_VARIANT_UTS46') ? idn_to_utf8($d, 0, INTL_IDNA_VARIANT_UTS46) : idn_to_utf8($d);
					}
					return self::domainStatus($row['id']) . $d . ' <a href="http://' . $d . '" target="_blank" style="color:#cc0000"><small>www</small></a> ';
				}
			],
			[
				'db' => 'date', 'dt' => 2,
				'formatter' => function( $d, $row ) {
					return self::formatDate($d);
				}
			],
			[
				'db' => 'local_id', 'dt' => 3,
				'formatter' => function( $d, $row ) {
					return self::whmcsStatus($row['local_id'], $row['type']);
				}
			],
			[
				'db' => 'type', 'dt' => 4,
				'formatter' => function( $d, $row ) {
					return '<div class="text-right">
					<!-- Split button -->
					<div class="btn-group">
					  <button type="button" class="btn btn-default btn-sm" onClick="location.href=\'addonmodules.php?module=solutedns&action=manage&id=' . $row['id'] . '\'">' . $this->lang['global_btn_manage'] . '</button>
					  <button type="button" class="btn btn-danger btn-sm" onClick="setZone(\'' . $row['id'] . '\'), setZoneName(\'' . $row['domain'] . '\')" data-toggle="modal" data-target="#dialog_deleteZone"><span class="glyphicon glyphicon-remove"></span></button>
					</div>';
				}
			]
];

/**
 * Records Columns
 */
$tColumns->records = [
			[
				'db' => 'id', 'dt' => 0,
				'formatter' => function( $d, $row ) {
					return '<div class="checkbox tablecheckbox"><input type="checkbox" name="sdns_select" id="sdns_select_' . $row['id'] . '" value="' . $row['id'] . '" style="display: hidden;" ' . $this->maintenance . '/><label for="sdns_select_' . $row['id'] . '" /></div>';
				}
			],
			[
				'db' => 'id', 'dt' => 1,
				'formatter' => function( $d, $row ) {
					$option = ($row['disabled'] == 1) ? "sdns_row_disabled" : "sdns_row_id";

					return '<input type="hidden" name="' . $option . '" id="' . $d . '" value="' . $d . '"><div class="text-center">' . $d . '</div>';
				}
			],
			[
				'db' => 'name', 'dt' => 2,
				'formatter' => function( $d, $row ) {

					$option = ($row['disabled'] == 1) ? " DISABLED" : NULL;

					$record_disabled = ($row['disabled'] == '1') ? NULL : 'checked';
					return '<div id="sdns_z-name_' . $row['id'] . '" class="dnsfield form-group has-feedback has-switch">
								<input ' . $option . ' type="textbox" class="form-padding form-control dnsfield" name="sdns_name_' . $row['id'] . '" id="sdns_name_' . $row['id'] . '" value="' . $row['name'] . '" row="' . $row['id'] . '">
									<label class="cl-switch cl-switch-primary form-control-feedback">
										<input type="checkbox" ' . $record_disabled . ' onclick="record_disable(\'' . $row['id'] . '\');">
										<span class="switcher"></span>
									</label>
							</div>';
				}
			],
			[
				'db' => 'type', 'dt' => 3,
				'formatter' => function( $d, $row ) {

					$option = ($row['disabled'] == 1) ? " DISABLED" : NULL;
					$record_types = $this->inConfig('record_types');

					foreach ($record_types as $record_type) {
						$selected = ($row['type'] == $record_type) ? 'SELECTED ' : NULL;
						$allowed_types[] = '<option ' . $selected . 'value="' . $record_type . '">' . $record_type . '</option>';
					}

					if (!in_array($row['type'], $record_types)) {
						$allowed_types[] = '<option SELECTED value="' . $row['type'] . '">' . $row['type'] . '</option>';
					}

					$allowed_types = implode("\r\n", $allowed_types);

					return '<select ' . $option . ' class="form-padding form-control dnsfield" name="sdns_type_' . $row['id'] . '" id="sdns_type_' . $row['id'] . '" row="' . $row['id'] . '">
							' . $allowed_types . '
						</select>';
				}
			],
			[
				'db' => 'content', 'dt' => 4,
				'formatter' => function( $d, $row ) {

					$option = ($row['disabled'] == 1) ? " DISABLED" : NULL;

					$prio_types = ['MX', 'SRV'];

					if (in_array($row['type'], $prio_types)) {
						return '<div class="input-group">
									<span id="sdns_z-prio_' . $row['id'] . '"><input type="textbox" class="form-padding form-control btn-group-first text-center" style="width:20%;" name="sdns_prio_' . $row['id'] . '" id="sdns_prio_' . $row['id'] . '" row="' . $row['id'] . '" value="' . $row['prio'] . '"' . $option . '></span>
									<div class="input-group-btn" style="width:0px; display: inline;"></div>
									<span id="sdns_z-content_' . $row['id'] . '"><input type="textbox" class="form-padding form-control btn-group-last" style="width:80%;" name="sdns_content_' . $row['id'] . '" id="sdns_content_' . $row['id'] . '" row="' . $row['id'] . '" value="' . htmlentities($row['content']) . '"' . $option . '></span>
								</div>';
					} else {
						return '<div id="sdns_z-content_' . $row['id'] . '"><input type="textbox" class="form-padding form-control dnsfield" name="sdns_content_' . $row['id'] . '" id="sdns_content_' . $row['id'] . '" row="' . $row['id'] . '" value="' . htmlentities($row['content']) . '"' . $option . '></div>';
					}
				}
			],
			[
				'db' => 'ttl', 'dt' => 5,
				'formatter' => function( $d, $row ) {

					$option = ($row['disabled'] == 1) ? " DISABLED" : NULL;
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

						return '<select ' . $option . ' class="form-padding form-control dnsfield" name="sdns_ttl_' . $row['id'] . '" id="sdns_ttl_' . $row['id'] . '" row="' . $row['id'] . '">
						<option ' . $selected['60'] . ' value="60">1 ' . $this->lang['global_dns_minute'] . '</option>
						<option ' . $selected['300'] . ' value="300">5 ' . $this->lang['global_dns_minutes'] . '</option>
						<option ' . $selected['3600'] . ' value="3600">1 ' . $this->lang['global_dns_hour'] . '</option>
						<option ' . $selected['86400'] . ' value="86400">1 ' . $this->lang['global_dns_day'] . '</option>
						' . $custom_ttl . '
					</select>';
					} else {
						return '<input ' . $option . ' type="textbox" class="form-padding form-control dnsfield" name="sdns_ttl_' . $row['id'] . '" id="sdns_ttl_' . $row['id'] . '" value="' . $row['ttl'] . '">';
					}
				}
			],
			[
				'db' => 'prio', 'dt' => 6,
				'formatter' => function( $d, $row ) {
					return '<div class="text-center text-nowrap"><button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#dialog_deleteRecord" onclick="setRecord(\'' . $row['id'] . '\')" ' . $this->maintenance . '><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></div>';
				}
			]
];

/**
 * Template Records Columns
 */
$tColumns->template = [
			[
				'db' => 'id', 'dt' => 0,
				'formatter' => function( $d, $row ) {
					return '<div class="checkbox tablecheckbox"><input type="checkbox" name="sdns_select" id="sdns_select_' . $row['id'] . '" value="' . $row['id'] . '" style="display: hidden;" ' . $this->maintenance . '/><label for="sdns_select_' . $row['id'] . '" /></div>';
				}
			],
			[
				'db' => 'id', 'dt' => 1,
				'formatter' => function( $d, $row ) {
					return '<div class="text-center">' . $d . '</div>';
				}
			],
			[
				'db' => 'name', 'dt' => 2,
				'formatter' => function( $d, $row ) {
					return '<div id="sdns_z-name_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_name_' . $row['id'] . '" id="sdns_name_' . $row['id'] . '" value="' . $row['name'] . '"></div>';
				}
			],
			[
				'db' => 'type', 'dt' => 3,
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

					return '<select DISABLED class="form-padding form-control dnsfield" name="sdns_type_' . $row['id'] . '" id="sdns_type_' . $row['id'] . '">' . $allowed_types . '</select>';
				}
			],
			[
				'db' => 'content', 'dt' => 4,
				'formatter' => function( $d, $row ) {
					return '<div id="sdns_z-content_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_content_' . $row['id'] . '" id="sdns_content_' . $row['id'] . '" value="' . htmlentities($row['content']) . '"></div>';
				}
			],
			[
				'db' => 'prio', 'dt' => 5,
				'formatter' => function( $d, $row ) {
					return '<div id="sdns_z-prio_' . $row['id'] . '"><input DISABLED type="textbox" class="form-padding form-control dnsfield" name="sdns_prio_' . $row['id'] . '" id="sdns_prio_' . $row['id'] . '" value="' . $row['prio'] . '"></div>';
				}
			],
			[
				'db' => 'ttl', 'dt' => 6,
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
				'db' => 'id', 'dt' => 7,
				'formatter' => function( $d, $row ) {
					return '<div class="text-center text-nowrap"><button type="button" class="btn btn-sm btn-success" style="display: none;" id="sdns_save_' . $row['id'] . '" onclick="record_edit(\'template\', ' . $row['id'] . ')"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button> <button type="button" class="btn btn-sm btn-warning" id="sdns_edit_' . $row['id'] . '" onclick="edit(\'' . $row['id'] . '\')"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button> <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#dialog_deleteRecord" onclick="setRecord(\'' . $row['id'] . '\')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></div>';
				}
			]
];
?>