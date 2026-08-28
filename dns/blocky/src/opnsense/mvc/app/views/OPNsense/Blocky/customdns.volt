{#
 # Copyright (C) 2026 Greelan
 # All rights reserved.
 #
 # Redistribution and use in source and binary forms, with or without modification,
 # are permitted provided that the following conditions are met:
 #
 # 1. Redistributions of source code must retain the above copyright notice,
 #    this list of conditions and the following disclaimer.
 #
 # 2. Redistributions in binary form must reproduce the above copyright notice,
 #    this list of conditions and the following disclaimer in the documentation
 #    and/or other materials provided with the distribution.
 #
 # THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 # INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 # AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 # AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
 # OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 # SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 # INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 # CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 # ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 # POSSIBILITY OF SUCH DAMAGE.
 #}

<script>
    $( document ).ready(function() {
        mapDataToFormUI({'frm_customdnssettings':"/api/blocky/settings/get"}).done(function(){
            $('.selectpicker').selectpicker('refresh');
            updateServiceControlUI('blocky');
        });
        $("#{{formGridCustomdns['table_id']}}").UIBootgrid({
            search:'/api/blocky/settings/searchCustomdns/',
            get:'/api/blocky/settings/getCustomdns/',
            set:'/api/blocky/settings/setCustomdns/',
            add:'/api/blocky/settings/addCustomdns/',
            del:'/api/blocky/settings/delCustomdns/',
            toggle:'/api/blocky/settings/toggleCustomdns/'
        });

        /* rewrite grid starts in a hidden tab, initialise it the first time it is shown */
        let rewriteInit = false;
        $('#maintabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            history.pushState(null, null, e.target.hash);
            if (e.target.hash === '#rewrites' && !rewriteInit) {
                rewriteInit = true;
                $("#{{formGridCustomdnsrewrite['table_id']}}").UIBootgrid({
                    search:'/api/blocky/settings/searchCustomdnsrewrite/',
                    get:'/api/blocky/settings/getCustomdnsrewrite/',
                    set:'/api/blocky/settings/setCustomdnsrewrite/',
                    add:'/api/blocky/settings/addCustomdnsrewrite/',
                    del:'/api/blocky/settings/delCustomdnsrewrite/',
                    toggle:'/api/blocky/settings/toggleCustomdnsrewrite/'
                });
            }
        });

        if (window.location.hash != "") {
            $('#maintabs a[href="' + window.location.hash + '"]').click();
        }

        $("#reconfigureAct").SimpleActionButton({
            onPreAction: function() {
                const dfObj = new $.Deferred();
                saveFormToEndpoint("/api/blocky/settings/set", 'frm_customdnssettings', function () { dfObj.resolve(); }, true, function () { dfObj.reject(); });
                return dfObj;
            },
            onAction: function(data, status) {
                updateServiceControlUI('blocky');
            }
        });
    });
</script>

<ul class="nav nav-tabs" data-tabs="tabs" id="maintabs">
    <li class="active"><a data-toggle="tab" href="#overrides">{{ lang._('Host Overrides') }}</a></li>
    <li><a data-toggle="tab" href="#rewrites">{{ lang._('Rewrites') }}</a></li>
</ul>

<div class="tab-content content-box __mb">
    <div id="overrides" class="tab-pane fade in active">
        {{ partial('layout_partials/base_bootgrid_table', formGridCustomdns)}}
        <div style="padding: 10px;">
            {{ lang._('Map an internal name (e.g. printer.lan) to fixed IP address(es) that Blocky answers directly, like a hosts file. To forward a whole domain to another DNS server instead, use Domain Overrides.') }}
        </div>
    </div>
    <div id="rewrites" class="tab-pane fade in">
        {{ partial('layout_partials/base_bootgrid_table', formGridCustomdnsrewrite)}}
        <div style="padding: 10px;">
            {{ lang._('Rewrite a queried domain to another domain before it is looked up in the host overrides above. Example: queries for example.com are answered using the mapping for printer.lan.') }}
        </div>
    </div>
</div>

<div class="content-box">
    {{ partial("layout_partials/base_form",['fields':customdnsForm,'id':'frm_customdnssettings'])}}
</div>

{{ partial('layout_partials/base_apply_button', {'data_endpoint': '/api/blocky/service/reconfigure', 'data_service_widget': 'blocky'}) }}
{{ partial("layout_partials/base_dialog",['fields':formDialogCustomdns,'id':formGridCustomdns['edit_dialog_id'],'label':lang._('Edit host override')])}}
{{ partial("layout_partials/base_dialog",['fields':formDialogCustomdnsrewrite,'id':formGridCustomdnsrewrite['edit_dialog_id'],'label':lang._('Edit rewrite')])}}
