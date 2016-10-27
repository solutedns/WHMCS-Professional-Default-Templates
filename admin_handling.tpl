<div class="col-md-12">

	<form role="form" id="handling">
		<fieldset>
			<input type="hidden" name="sdns_form" value="handling">

			<div class="row">
				<div class="col-md-12">
					<h4>{$LANG.admin_handling_title_product}</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-1 text-muted">
					<label>{$LANG.admin_handling_productzone} <span data-content="{$LANG.admin_handling_desc_selectcreated}" data-toggle="popover" class="show-details" style="font-size:14px;"><i class="fa fa-question-circle text-info"></i></span></label>
				</div>
				<div class="col-md-1 text-muted">
					<label>{$LANG.admin_handling_domainzone} <span data-content="{$LANG.admin_handling_desc_selectignoreproduct}" data-toggle="popover" class="show-details" style="font-size:14px;"><i class="fa fa-question-circle text-info"></i></span></label>
				</div>
				<div class="col-md-1">
				</div>
				<div class="col-md-1 text-muted">
					<label>{$LANG.admin_handling_productsettings}</label>
				</div>
				<div class="col-md-1 text-muted">
					<label>{$LANG.admin_handling_dnssec}</label>
				</div>
				<div class="col-md-2 text-muted">
					<label>{$LANG.admin_handling_recordlimit} <span data-content="{$LANG.admin_handling_desc_recordlimit}" data-toggle="popover" class="show-details" style="font-size:14px;"><i class="fa fa-question-circle text-info"></i></span></label>
				</div>
				<div class="col-md-3 text-muted">
					<label>{$LANG.admin_handling_defaultcluster}</label>
				</div>
			</div>

			{if $lal >= 2 AND $settings.auto_dnsprod == ''}
			<div class="row text-center">
				<small><i class="text-danger">{$LANG.admin_handling_dnsforproduct}</i></small>
			</div>
			{/if}
            {foreach from=$handling_products item=product}
			<div class="row ph-row">
				<div class="col-md-2 topm5">
					<label for="sdns_product_{$product.id}">{$product.name|ucfirst}</label>
					<p class="text-muted"><small class="text-muted">{$product.type}</small>
					</p>
				</div>
				<div class="col-md-1 text-center topm5">
					<div class="checkbox">
						<input name="sdns_product_create_{$product.id}" id="sdns_product_create_{$product.id}" type="checkbox" {if $product.create}CHECKED{/if} {if $lal <=1 OR $settings.auto_dnsprod=='' }DISABLED{/if}>
						<label for="sdns_product_create_{$product.id}"></label>
					</div>
				</div>
				<div class="col-md-1 text-center topm5">
					<div class="checkbox">
						<input name="sdns_product_ignore_{$product.id}" id="sdns_product_ignore_{$product.id}" type="checkbox" {if $product.ignore} CHECKED{/if}>
						<label for="sdns_product_ignore_{$product.id}"></label>
					</div>
				</div>
				<div class="col-md-1 topm5">
				</div>
				<div class="col-md-1 text-center topm5">
					<div class="checkbox">
						<input name="sdns_product_settings_{$product.id}" id="sdns_product_settings_{$product.id}" type="checkbox" {if $product.settings} CHECKED{/if} onChange="product_save('{$product.id}', 'settings', this)" {if $lal <=1 OR $settings.auto_dnsprod=='' }DISABLED{/if}>
						<label for="sdns_product_settings_{$product.id}"></label>
					</div>
				</div>
				<div class="col-md-1 text-center topm5">
					<div class="checkbox">
						<input name="sdns_product_dnssec_{$product.id}" id="sdns_product_dnssec_{$product.id}" type="checkbox" {if $product.settings.dnssec} CHECKED{/if} onChange="product_save('{$product.id}', 'dnssec', this)" {if !$product.settings}DISABLED{/if}>
						<label for="sdns_product_dnssec_{$product.id}"></label>
					</div>
				</div>
				<div class="col-md-2 topm5">
					<input type="text" class="form-padding form-control" name="sdns_product_limit_{$product.id}" id="sdns_product_limit_{$product.id}" value="{$product.settings.record_limit}" onChange="product_save('{$product.id}', 'record_limit', this)" {if !$product.settings}DISABLED{/if}>
				</div>
				<div class="col-md-3 topm5">
					<select class="form-padding form-control" name="sdns_product_server_{$product.id}" id="sdns_product_server_{$product.id}" onChange="product_save('{$product.id}', 'server', this)" {if !$product.settings}DISABLED{/if}>
						{if !$product.settings}
						<option selected disabled hidden style="display: none" value=""></option>
						{/if} {foreach $nameservers as $ns}
						<option {if $product.settings.server_id eq $ns.id}SELECTED{/if} value="{$ns.id}">{$ns.nameserver|ucfirst}</option>
						{/foreach}
					</select>
				</div>

			</div>
			{foreachelse}
			<small><i class="text-muted">{$LANG.admin_none_available}</i></small>
            {/foreach}

			<div class="row">
				<div class="col-md-5">
				</div>
				<div class="col-md-7 small">
					<div class="col-md-12 autosave-enabled">
						<p><strong>{$LANG.admin_handling_autosave}</strong>
						</p>
					</div>
				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-md-12">
					<h4>{$LANG.admin_handling_title_registrar}</h4>
					<p>{$LANG.admin_handling_desc_selectignoreregistrar}</p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					{foreach from=$handling_registrars item=registrar}
					<div class="col-md-2">
						<div class="checkbox">
							<input name="sdns_ignoreregistrar_{$registrar.registrar}" id="sdns_ignoreregistrar_{$registrar.registrar}" type="checkbox" {if $registrar.selected} CHECKED{/if}>
							<label for="sdns_ignoreregistrar_{$registrar.registrar}">{$registrar.registrar|ucfirst}</label>
						</div>
					</div>
					{foreachelse}
					<small><i class="text-muted">{$LANG.admin_none_available}</i></small>
                    {/foreach}
				</div>
			</div>

			{if $lal >= 5}
			<hr />

			<div class="row">
				<div class="col-md-12">
					<h4>{$LANG.admin_handling_title_nameserver}</h4>
					<p>{$LANG.admin_handling_desc_nameserver}</p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3 text-right chx_form">
					<label for="sdns_soa_serial">{$LANG.admin_handling_option_default}:</label>
				</div>
				<div class="col-md-3">
					<select class="form-padding form-control" name="sdns_handling_default" id="sdns_handling_default">
						{foreach $nameservers as $ns}
						<option {if $settings.handling_defaultns eq $ns.id}SELECTED{/if} value="{$ns.id}">{$ns.nameserver|ucfirst}</option>
						{/foreach}
					</select>
				</div>
				<div class="col-md-6 chx_form">
					<label class="info_text" for="sdns_soa_serial">{$LANG.admin_handling_desc_default}</label>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3 text-right chx_form">
					<label for="sdns_soa_serial">{$LANG.admin_handling_option_distribution}:</label>
				</div>
				<div class="col-md-3">
					<select class="form-padding form-control" name="sdns_handling_distribution" id="sdns_handling_distribution">
						<option {if $settings.handling_nsdistribution eq 'default'}SELECTED{/if} value="default">{$LANG.admin_handling_option_default}</option>
						<option {if $settings.handling_nsdistribution eq 'equal'}SELECTED{/if} value="equal">{$LANG.admin_handling_option_equal}</option>
					</select>
				</div>
				<div class="col-md-6 chx_form">
					<label class="info_text" for="sdns_soa_serial">{$LANG.admin_handling_desc_distribution}</label>
				</div>
			</div>
			{/if}

			<div class="row">
				<div class="row text-center">
					<br />
					<input class="btn btn-primary" type="button" onclick="updatesettings('handling');" value="{$LANG.admin_savechanges}" />
				</div>
			</div>

		</fieldset>
	</form>

</div>