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
        mapDataToFormUI({'frm_clientlookupsettings':"/api/blocky/settings/get"}).done(function(){
            $('.selectpicker').selectpicker('refresh');
            updateServiceControlUI('blocky');
        });
        $("#{{formGridClientgroup['table_id']}}").UIBootgrid({
            search:'/api/blocky/settings/searchClientgroup/',
            get:'/api/blocky/settings/getClientgroup/',
            set:'/api/blocky/settings/setClientgroup/',
            add:'/api/blocky/settings/addClientgroup/',
            del:'/api/blocky/settings/delClientgroup/',
            toggle:'/api/blocky/settings/toggleClientgroup/'
        });
        $("#reconfigureAct").SimpleActionButton({
            onPreAction: function() {
                const dfObj = new $.Deferred();
                saveFormToEndpoint("/api/blocky/settings/set", 'frm_clientlookupsettings', function () { dfObj.resolve(); }, true, function () { dfObj.reject(); });
                return dfObj;
            },
            onAction: function(data, status) {
                updateServiceControlUI('blocky');
            }
        });
    });
</script>

<div class="content-box __mb">
    {{ partial('layout_partials/base_bootgrid_table', formGridClientgroup)}}
    <div style="padding: 10px;">
        {{ lang._('Map clients to blocking groups. When no "default" client is defined here, the "default" group is applied to every client automatically.') }}
    </div>
</div>

<div class="content-box">
    {{ partial("layout_partials/base_form",['fields':clientlookupForm,'id':'frm_clientlookupsettings'])}}
</div>

{{ partial('layout_partials/base_apply_button', {'data_endpoint': '/api/blocky/service/reconfigure', 'data_service_widget': 'blocky'}) }}
{{ partial("layout_partials/base_dialog",['fields':formDialogClientgroup,'id':formGridClientgroup['edit_dialog_id'],'label':lang._('Edit client group')])}}
