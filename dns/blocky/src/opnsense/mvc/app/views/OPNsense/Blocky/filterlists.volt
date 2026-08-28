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
        mapDataToFormUI({'frm_filtersettings':"/api/blocky/settings/get"}).done(function(){
            $('.selectpicker').selectpicker('refresh');
            updateServiceControlUI('blocky');
        });

        /* deny grid is in the active tab, so it can be initialised upfront */
        $("#{{formGridDenylist['table_id']}}").UIBootgrid({
            search:'/api/blocky/settings/searchDenylist/',
            get:'/api/blocky/settings/getDenylist/',
            set:'/api/blocky/settings/setDenylist/',
            add:'/api/blocky/settings/addDenylist/',
            del:'/api/blocky/settings/delDenylist/',
            toggle:'/api/blocky/settings/toggleDenylist/'
        });

        /* allow grid starts in a hidden tab, initialise it the first time it is shown */
        let allowInit = false;
        $('#maintabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            history.pushState(null, null, e.target.hash);
            if (e.target.hash === '#allow' && !allowInit) {
                allowInit = true;
                $("#{{formGridAllowlist['table_id']}}").UIBootgrid({
                    search:'/api/blocky/settings/searchAllowlist/',
                    get:'/api/blocky/settings/getAllowlist/',
                    set:'/api/blocky/settings/setAllowlist/',
                    add:'/api/blocky/settings/addAllowlist/',
                    del:'/api/blocky/settings/delAllowlist/',
                    toggle:'/api/blocky/settings/toggleAllowlist/'
                });
            }
        });

        if (window.location.hash != "") {
            $('#maintabs a[href="' + window.location.hash + '"]').click();
        }

        $("#reconfigureAct").SimpleActionButton({
            onPreAction: function() {
                const dfObj = new $.Deferred();
                saveFormToEndpoint("/api/blocky/settings/set", 'frm_filtersettings', function () { dfObj.resolve(); }, true, function () { dfObj.reject(); });
                return dfObj;
            },
            onAction: function(data, status) {
                updateServiceControlUI('blocky');
            }
        });
    });
</script>

<ul class="nav nav-tabs" data-tabs="tabs" id="maintabs">
    <li class="active"><a data-toggle="tab" href="#deny">{{ lang._('Deny Lists') }}</a></li>
    <li><a data-toggle="tab" href="#allow">{{ lang._('Allow Lists') }}</a></li>
</ul>

<div class="tab-content content-box __mb">
    <div id="deny" class="tab-pane fade in active">
        {{ partial('layout_partials/base_bootgrid_table', formGridDenylist)}}
    </div>
    <div id="allow" class="tab-pane fade in">
        {{ partial('layout_partials/base_bootgrid_table', formGridAllowlist)}}
        <div style="padding: 10px;">
            {{ lang._('Allow list entries override deny lists in the same group.') }}
        </div>
    </div>
</div>

<div class="content-box">
    {{ partial("layout_partials/base_form",['fields':filterForm,'id':'frm_filtersettings'])}}
</div>

{{ partial('layout_partials/base_apply_button', {'data_endpoint': '/api/blocky/service/reconfigure', 'data_service_widget': 'blocky'}) }}
{{ partial("layout_partials/base_dialog",['fields':formDialogDenylist,'id':formGridDenylist['edit_dialog_id'],'label':lang._('Edit deny list')])}}
{{ partial("layout_partials/base_dialog",['fields':formDialogAllowlist,'id':formGridAllowlist['edit_dialog_id'],'label':lang._('Edit allow list')])}}
