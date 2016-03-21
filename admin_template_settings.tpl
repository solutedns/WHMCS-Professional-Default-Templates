<div class="col-md-12 topm10">
    <div class="row">
        <div class="col-md-12">
            <p><strong>{$LANG.admin_template_title_template}:</strong>
                <br /><span id="sdns_template_name2">{if $template.name}{$template.name}{else}{$LANG.admin_template_unnamed}{/if}</span></p>
        </div>
    </div>
    
    <h2>{$LANG.admin_template_title_settings}</h2>
    
    <form role="form" id="template_settings">
        <fieldset>
            <input type="hidden" name="sdns_form" value="template_settings">
            <input type="hidden" name="sdns_template_id" value="{$template.id}">
            
            <h3>{$LANG.admin_template_title_defaultip}</h3>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_template_ipv4">{$LANG.admin_template_option_defaultipv4}:</label>
                </div>
                <div class="col-md-3">
                    <input name="sdns_template_ipv4" id="sdns_template_ipv4" type="textbox" class="form-padding form-control" value="{$template.default_ipv4}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_template_ipv4">{$LANG.admin_template_desc_defaultipv4}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_template_ipv6">{$LANG.admin_template_option_defaultipv6}:</label>
                </div>
                <div class="col-md-3">
                    <input name="sdns_template_ipv6" id="sdns_template_ipv6" type="textbox" class="form-padding form-control" value="{$template.default_ipv6}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_template_ipv6">{$LANG.admin_template_desc_defaultipv6}</label>
                </div>
            </div>
            
            <hr />
            <h3>{$LANG.admin_template_title_ttl}</h3>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_template_default_ttl">{$LANG.admin_template_option_defaultttl}:</label>
                </div>
                <div class="col-md-3">
                	{if $ttl.preset}
					<select class="form-padding form-control" name="sdns_template_default_ttl" id="sdns_template_default_ttl">
						<option {if $template.default_ttl eq "60"}SELECTED{/if} value="60">1 {$LANG.admin_manage_minute}</option>
						<option {if $template.default_ttl eq "300"}SELECTED{/if} value="300">5 {$LANG.admin_manage_minutes}</option>
						<option {if $template.default_ttl eq "3600"}SELECTED{/if} value="3600">1 {$LANG.admin_manage_hour}</option>
						<option {if $template.default_ttl eq "86400"}SELECTED{/if} value="86400">1 {$LANG.admin_manage_day}</option>
                        {if $template.default_ttl neq "60" && $template.default_ttl neq "300" && $template.default_ttl neq "3600" && $template.default_ttl neq "86400"}
						<option SELECTED value="{$template.default_ttl}">{$template.default_ttl}</option>
                        {/if}
					</select>
					{else}
                    <input name="sdns_template_default_ttl" id="sdns_template_default_ttl" type="textbox" class="form-padding form-control" placeholder="3600" value="{$template.default_ttl}">
                    {/if}
                </div>
                <div class="col-md-6">
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_template_soa_ttl">{$LANG.admin_template_option_soattl}:</label>
                </div>
                <div class="col-md-3">
                    <input name="sdns_template_soa_ttl" id="sdns_template_soa_ttl" type="textbox" class="form-padding form-control" placeholder="default" value="{$template.soa_ttl}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_template_soa_ttl">{$LANG.admin_template_desc_ttl}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_template_ns_ttl">{$LANG.admin_template_option_nsttl}:</label>
                </div>
                <div class="col-md-3">
                    <input name="sdns_template_ns_ttl" id="sdns_template_ns_ttl" type="textbox" class="form-padding form-control" placeholder="default" value="{$template.ns_ttl}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_template_ns_ttl">{$LANG.admin_template_desc_ttl}</label>
                </div>
            </div>
            
            <hr />
            <h3>{$LANG.admin_template_title_assignment}</h3>
            
            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_template_products">{$LANG.admin_template_option_assignedproducts}:</label>
                </div>
                <div class="col-md-3">
                    <select name="sdns_template_products" class="form-padding form-control" multiple {if $template.type eq 'default'}disabled{/if}>
                        {foreach from=$tempproducts item=product}
                        <option {if $product.disabled}DISABLED{/if} {if $product.selected}SELECTED{/if} value="{$product.value}">{$product.name}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="info_text" for="sdns_template_products">{$LANG.admin_template_desc_assignedproducts}</label>
                    {if $template.type eq 'default'}
                    <label class="info_tex text-danger" for="sdns_template_products">{$LANG.admin_template_desc_cannotassign}</label>{/if}
                </div>
            </div>

            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onclick="updatesettings('template_settings');" value="{$LANG.admin_savechanges}" />
            </div>
        </fieldset>
    </form>
    
</div>