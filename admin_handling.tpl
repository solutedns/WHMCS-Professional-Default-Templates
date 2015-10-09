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
                    {foreach from=$handling_products item=product}
                    <div class="col-md-2">
                        <div class="checkbox">
                            <input name="sdns_product_{$product.id}" id="sdns_product_{$product.id}" type="checkbox" {if $product.selected} CHECKED{/if}>
                            <label for="sdns_product_{$product.id}">{$product.name|ucfirst}</label>
                        </div>
                    </div>
                    {/foreach}
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
                    {/foreach}
                </div>
                <div class="row text-center">
                    <br />
                    <input class="btn btn-primary" type="button" onclick="updatesettings('handling');" value="{$LANG.admin_savechanges}" />
                </div>
            </div>
            
        </fieldset>
    </form>

</div>