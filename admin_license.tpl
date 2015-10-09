<div class="col-md-12">

    <form role="form" id="license">
        <fieldset>
            <input type="hidden" name="sdns_form" value="license">
            
            <h4>{$LANG.admin_title_licenseinfo}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_product}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance"><strong>{$license.productname}</strong></label>
                </div>
            </div>
            
            <div class="row">

                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_edition}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">{$license.edition}</label>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_status}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance"> {if $license.status eq 'Active'} <span class="label active">{$license.status}</span> {elseif $license.status eq 'Pending'} <span class="label pending">{$license.status}</span> {else} <span class="label closed">{$license.status}</span> {/if} </label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_expires}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance"> {if $license.nextduedate eq 'false'} {$LANG.admin_never} {else} {$license.nextduedate} {/if}
                    </label>
                </div>
            </div>

            <div class="row topm5">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_licensedto}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">{$license.companyname}
                        <br />
                        <i>{$license.registeredname}</i></label>
                </div>
            </div>
            
            <div class="row topm5">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_brandremoval}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance"> {if $license.brandremoval eq 'Yes'} <span class="label active">{$LANG.admin_yes}</span> {else} <span class="label">{$LANG.admin_no}</span> {/if} </label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_zonelimit}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">
                        {if {$license.zonelimit} eq '0'}{$LANG.admin_license_unlimited}{else}{$license.zonelimit} {$LANG.admin_license_zones}{/if}</label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_addons}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">
                        {if $license_addons} {foreach from=$license_addons item=addon}
                        <p>- {$addon.name} {if $addon.status eq 'Active'} <span class="label active">{$addon.status}</span> {elseif $license_addons.status eq 'Active'} <span class="label pending">{$addon.status}</span> {else} <span class="label">{$addon.status}</span> {/if} {$addon.duedate}
                        </p>
                        {/foreach} {else} {$LANG.admin_license_none} {/if}
                    </label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_validdomains}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">{$license.validdomain}</label>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_validips}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">{$license.validip}</label>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_maintenance">{$LANG.admin_license_validdirectory}:</label>
                </div>
                <div class="col-md-9 data_text">
                    <label class="info_text" for="sdns_maintenance">{$license.validdirectory}</label>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_title_licensesettings}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right">
                    <label for="sdns_license">{$LANG.admin_license_licensekey}:</label>
                </div>
                <div class="col-md-4">
                    <input type="textbox" class="form-padding form-control" name="sdns_license" id="sdns_license" value="{$license.licensekey}">
                </div>
                <div class="col-md-5"></div>
            </div>
            
            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onClick="updatesettings('license');" value="{$LANG.admin_savechanges}" />
            </div>
            
        </fieldset>
    </form>
    
</div>