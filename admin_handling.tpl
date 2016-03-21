<div class="col-md-12">

    <form role="form" id="handling">
        <fieldset>
            <input type="hidden" name="sdns_form" value="handling">
            
            <div class="row">
                <div class="col-md-12">
                    <h4>{$LANG.admin_handling_title_product}</h4>
                    <p>{$LANG.admin_handling_desc_selectcreated}</p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                	{if $lal >= 2}
                    {if $settings.auto_dnsprod} 
                    {foreach from=$handling_products item=product}
                    <div class="col-md-2">
                        <div class="checkbox">
                            <input name="sdns_product_{$product.id}" id="sdns_product_{$product.id}" type="checkbox" {if $product.selected} CHECKED{/if}>
                            <label for="sdns_product_{$product.id}">{$product.name|ucfirst}</label>
                        </div>
                    </div>
                    {foreachelse}
                    <small><i class="text-muted">{$LANG.admin_none_available}</i></small>
                    {/foreach}
                    {else}
                    <small><i class="text-danger">{$LANG.admin_handling_dnsforproduct}</i></small>
                    {/if}
                    {else}
                    <small><i class="text-muted">{$LANG.admin_none_available}</i></small>
                    {/if}
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <p><br />{$LANG.admin_handling_desc_selectignoreproduct}</p>
                    {foreach from=$handling_ignoreproducts item=ignoreproduct}
                    <div class="col-md-2">
                        <div class="checkbox">
                            <input name="sdns_ignoreproduct_{$ignoreproduct.id}" id="sdns_ignoreproduct_{$ignoreproduct.id}" type="checkbox" {if $ignoreproduct.selected} CHECKED{/if}>
                            <label for="sdns_ignoreproduct_{$ignoreproduct.id}">{$ignoreproduct.name|ucfirst}</label>
                        </div>
                    </div>
                    {foreachelse}
                    <small><i class="text-muted">{$LANG.admin_none_available}</i></small>
                    {/foreach}
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