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
        $("#{{formGridSchedule['table_id']}}").UIBootgrid({
            search:'/api/blocky/settings/searchSchedule/',
            get:'/api/blocky/settings/getSchedule/',
            set:'/api/blocky/settings/setSchedule/',
            add:'/api/blocky/settings/addSchedule/',
            del:'/api/blocky/settings/delSchedule/',
            toggle:'/api/blocky/settings/toggleSchedule/'
        });
        $("#reconfigureAct").SimpleActionButton();
        updateServiceControlUI('blocky');
    });
</script>

<div class="content-box">
    {{ partial('layout_partials/base_bootgrid_table', formGridSchedule)}}
    <div style="padding: 10px;">
        {{ lang._('Restrict deny list groups to specific times. A group listed here is only blocked during its scheduled window(s); outside those times the group is not blocked. Groups without any schedule are always blocked. Assign groups to clients under Client Groups.') }}
    </div>
</div>

{{ partial('layout_partials/base_apply_button', {'data_endpoint': '/api/blocky/service/reconfigure', 'data_service_widget': 'blocky'}) }}
{{ partial("layout_partials/base_dialog",['fields':formDialogSchedule,'id':formGridSchedule['edit_dialog_id'],'label':lang._('Edit schedule')])}}
