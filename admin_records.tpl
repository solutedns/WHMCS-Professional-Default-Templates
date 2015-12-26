<div class="col-md-12">

    <form role="form" id="records">
        <fieldset>
            <input type="hidden" name="sdns_form" value="records">

            <h4>{$LANG.admin_records_title_allowed}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_desc">
                    <label for="sdns_type">{$LANG.admin_records_option_allowedtypes}:</label>
                </div>
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_a" id="sdns_type_a" type="checkbox" {if $settings.A} CHECKED{/if}>
                                <label for="sdns_type_a">A</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_aaaa" id="sdns_type_aaaa" type="checkbox" {if $settings.AAAA} CHECKED{/if}>
                                <label for="sdns_type_aaaa">AAAA</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_cname" id="sdns_type_cname" type="checkbox" {if $settings.CNAME} CHECKED{/if}>
                                <label for="sdns_type_cname">CNAME</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_hinfo" id="sdns_type_hinfo" type="checkbox" {if $settings.HINFO} CHECKED{/if}>
                                <label for="sdns_type_hinfo">HINFO</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_mx" id="sdns_type_mx" type="checkbox" {if $settings.MX} CHECKED{/if}>
                                <label for="sdns_type_mx">MX</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_naptr" id="sdns_type_naptr" type="checkbox" {if $settings.NAPTR} CHECKED{/if}>
                                <label for="sdns_type_naptr">NAPTR</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_ns" id="sdns_type_ns" type="checkbox" {if $settings.NS} CHECKED{/if}>
                                <label for="sdns_type_ns">NS</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_ptr" id="sdns_type_ptr" type="checkbox" {if $settings.PTR} CHECKED{/if}>
                                <label for="sdns_type_ptr">PTR</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_soa" id="sdns_type_soa" type="checkbox" disabled>
                                <label for="sdns_type_soa">SOA</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_spf" id="sdns_type_spf" type="checkbox" {if $settings.SPF} CHECKED{/if}>
                                <label for="sdns_type_spf">SPF</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_srv" id="sdns_type_srv" type="checkbox" {if $settings.SRV} CHECKED{/if}>
                                <label for="sdns_type_srv">SRV</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_sshfp" id="sdns_type_sshfp" type="checkbox" {if $settings.SSHFP} CHECKED{/if}>
                                <label for="sdns_type_sshfp">SSHFP</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="checkbox">
                                <input name="sdns_type_txt" id="sdns_type_txt" type="checkbox" {if $settings.TXT} CHECKED{/if}>
                                <label for="sdns_type_txt">TXT</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_records_title_defaultsoa}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_soa_hostmaster">{$LANG.admin_records_option_hostmaster}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_soa_hostmaster" id="sdns_soa_hostmaster" value="{$settings.soa_hostmaster}">
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_soa_hostmaster">{$LANG.admin_records_desc_hostmaster}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_soa_serial">{$LANG.admin_records_option_serial}:</label>
                </div>
                <div class="col-md-3">
                    <select class="form-padding form-control" name="sdns_soa_serial" id="sdns_soa_serial">
                        <option {if $settings.soa_serial eq 'default'}SELECTED{/if} value="default">{$LANG.admin_records_select_default}</option>
                        <option {if $settings.soa_serial eq 'epoch'}SELECTED{/if} value="epoch">{$LANG.admin_records_select_epoch}</option>
                        <option {if $settings.soa_serial eq 'zero'}SELECTED{/if} value="zero">{$LANG.admin_records_select_zero}</option>
                    </select>
                </div>
                <div class="col-md-6 chx_form">
                    <label class="info_text" for="sdns_soa_serial">{$LANG.admin_records_desc_serial}</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_soa_refresh">{$LANG.admin_records_option_refresh}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_soa_refresh" id="sdns_soa_refresh" value="{$settings.soa_refresh}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_soa_retry">{$LANG.admin_records_option_retry}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_soa_retry" id="sdns_soa_retry" value="{$settings.soa_retry}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_soa_expire">{$LANG.admin_records_option_expire}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_soa_expire" id="sdns_soa_expire" value="{$settings.soa_expire}">
                </div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_soa_ttl">{$LANG.admin_records_option_ttl}:</label>
                </div>
                <div class="col-md-3">
                    <input type="textbox" class="form-padding form-control" name="sdns_soa_ttl" id="sdns_soa_ttl" value="{$settings.soa_ttl}">
                </div>
                <div class="col-md-6"></div>
            </div>
            
            <hr />
            <h4>{$LANG.admin_records_title_limit}</h4>
            
            <div class="row">
                <div class="col-md-3 text-right chx_form">
                    <label for="sdns_record_limit">{$LANG.admin_records_option_recordlimit}:</label>
                </div>
                <div class="col-md-1">
                    <input name="sdns_record_limit" type="textbox" class="form-control" name="sdns_record_limit" id="sdns_record_limit" value="{$settings.record_limit}">
                </div>
                <div class="col-md-8 chx_form">
                    <label class="info_text" for="sdns_record_limit">{$LANG.admin_records_desc_recordlimit}</label>
                </div>
            </div>

            <div class="row text-center">
                <br />
                <input class="btn btn-primary" type="button" onclick="updatesettings('records');" value="{$LANG.admin_savechanges}" />

            </div>

        </fieldset>
    </form>

</div>