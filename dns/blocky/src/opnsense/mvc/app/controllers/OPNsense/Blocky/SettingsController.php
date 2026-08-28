<?php

/*
 * Copyright (C) 2026 Greelan
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
 * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

namespace OPNsense\Blocky;

class SettingsController extends \OPNsense\Base\IndexController
{
    public function generalAction()
    {
        $this->view->generalForm = $this->getForm("general");
        $this->view->pick('OPNsense/Blocky/general');
    }

    public function upstreamsAction()
    {
        $this->view->upstreamsForm = $this->getForm("upstreamsettings");
        $this->view->formDialogUpstream = $this->getForm("dialogUpstream");
        $this->view->formGridUpstream = $this->getFormGrid("dialogUpstream", "upstream");
        $this->view->pick('OPNsense/Blocky/upstreams');
    }

    public function filterlistsAction()
    {
        $this->view->filterForm = $this->getForm("filtersettings");
        $this->view->formDialogDenylist = $this->getForm("dialogDenylist");
        $this->view->formGridDenylist = $this->getFormGrid("dialogDenylist", "denylist");
        $this->view->formDialogAllowlist = $this->getForm("dialogAllowlist");
        $this->view->formGridAllowlist = $this->getFormGrid("dialogAllowlist", "allowlist");
        $this->view->pick('OPNsense/Blocky/filterlists');
    }

    public function customdnsAction()
    {
        $this->view->customdnsForm = $this->getForm("customdnssettings");
        $this->view->formDialogCustomdns = $this->getForm("dialogCustomdns");
        $this->view->formGridCustomdns = $this->getFormGrid("dialogCustomdns", "customdns");
        $this->view->formDialogCustomdnsrewrite = $this->getForm("dialogCustomdnsrewrite");
        $this->view->formGridCustomdnsrewrite = $this->getFormGrid("dialogCustomdnsrewrite", "customdnsrewrite");
        $this->view->pick('OPNsense/Blocky/customdns');
    }

    public function conditionalAction()
    {
        $this->view->conditionalForm = $this->getForm("conditionalsettings");
        $this->view->formDialogConditional = $this->getForm("dialogConditional");
        $this->view->formGridConditional = $this->getFormGrid("dialogConditional", "conditional");
        $this->view->formDialogConditionalrewrite = $this->getForm("dialogConditionalrewrite");
        $this->view->formGridConditionalrewrite = $this->getFormGrid("dialogConditionalrewrite", "conditionalrewrite");
        $this->view->pick('OPNsense/Blocky/conditional');
    }

    public function clientgroupsAction()
    {
        $this->view->clientlookupForm = $this->getForm("clientlookupsettings");
        $this->view->formDialogClientgroup = $this->getForm("dialogClientgroup");
        $this->view->formGridClientgroup = $this->getFormGrid("dialogClientgroup", "clientgroup");
        $this->view->pick('OPNsense/Blocky/clientgroups');
    }

    public function securityAction()
    {
        $this->view->securityForm = $this->getForm("securitysettings");
        $this->view->pick('OPNsense/Blocky/security');
    }

    public function querylogAction()
    {
        $this->view->querylogForm = $this->getForm("querylogsettings");
        $this->view->pick('OPNsense/Blocky/querylog');
    }

    public function advancedAction()
    {
        $this->view->advancedForm = $this->getForm("advancedsettings");
        $this->view->pick('OPNsense/Blocky/advanced');
    }

    public function schedulesAction()
    {
        $this->view->formDialogSchedule = $this->getForm("dialogSchedule");
        $this->view->formGridSchedule = $this->getFormGrid("dialogSchedule", "schedule");
        $this->view->pick('OPNsense/Blocky/schedules');
    }
}
