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

namespace OPNsense\Blocky\Api;

use OPNsense\Base\ApiMutableModelControllerBase;

class SettingsController extends ApiMutableModelControllerBase
{
    protected static $internalModelName = 'blocky';
    protected static $internalModelClass = '\OPNsense\Blocky\Blocky';

    /* upstreams */
    public function searchUpstreamAction()
    {
        return $this->searchBase('upstreams', null, 'group');
    }

    public function getUpstreamAction($uuid = null)
    {
        return $this->getBase('upstream', 'upstreams', $uuid);
    }

    public function setUpstreamAction($uuid)
    {
        return $this->setBase('upstream', 'upstreams', $uuid);
    }

    public function addUpstreamAction()
    {
        return $this->addBase('upstream', 'upstreams');
    }

    public function delUpstreamAction($uuid)
    {
        return $this->delBase('upstreams', $uuid);
    }

    public function toggleUpstreamAction($uuid, $enabled = null)
    {
        return $this->toggleBase('upstreams', $uuid, $enabled);
    }

    /* denylists */
    public function searchDenylistAction()
    {
        return $this->searchBase('denylists', null, 'group');
    }

    public function getDenylistAction($uuid = null)
    {
        return $this->getBase('denylist', 'denylists', $uuid);
    }

    public function setDenylistAction($uuid)
    {
        return $this->setBase('denylist', 'denylists', $uuid);
    }

    public function addDenylistAction()
    {
        return $this->addBase('denylist', 'denylists');
    }

    public function delDenylistAction($uuid)
    {
        return $this->delBase('denylists', $uuid);
    }

    public function toggleDenylistAction($uuid, $enabled = null)
    {
        return $this->toggleBase('denylists', $uuid, $enabled);
    }

    /* allowlists */
    public function searchAllowlistAction()
    {
        return $this->searchBase('allowlists', null, 'group');
    }

    public function getAllowlistAction($uuid = null)
    {
        return $this->getBase('allowlist', 'allowlists', $uuid);
    }

    public function setAllowlistAction($uuid)
    {
        return $this->setBase('allowlist', 'allowlists', $uuid);
    }

    public function addAllowlistAction()
    {
        return $this->addBase('allowlist', 'allowlists');
    }

    public function delAllowlistAction($uuid)
    {
        return $this->delBase('allowlists', $uuid);
    }

    public function toggleAllowlistAction($uuid, $enabled = null)
    {
        return $this->toggleBase('allowlists', $uuid, $enabled);
    }

    /* custom DNS */
    public function searchCustomdnsAction()
    {
        return $this->searchBase('customdns', null, 'domain');
    }

    public function getCustomdnsAction($uuid = null)
    {
        return $this->getBase('customdns', 'customdns', $uuid);
    }

    public function setCustomdnsAction($uuid)
    {
        return $this->setBase('customdns', 'customdns', $uuid);
    }

    public function addCustomdnsAction()
    {
        return $this->addBase('customdns', 'customdns');
    }

    public function delCustomdnsAction($uuid)
    {
        return $this->delBase('customdns', $uuid);
    }

    public function toggleCustomdnsAction($uuid, $enabled = null)
    {
        return $this->toggleBase('customdns', $uuid, $enabled);
    }

    /* conditional forwarding */
    public function searchConditionalAction()
    {
        return $this->searchBase('conditional', null, 'domain');
    }

    public function getConditionalAction($uuid = null)
    {
        return $this->getBase('conditional', 'conditional', $uuid);
    }

    public function setConditionalAction($uuid)
    {
        return $this->setBase('conditional', 'conditional', $uuid);
    }

    public function addConditionalAction()
    {
        return $this->addBase('conditional', 'conditional');
    }

    public function delConditionalAction($uuid)
    {
        return $this->delBase('conditional', $uuid);
    }

    public function toggleConditionalAction($uuid, $enabled = null)
    {
        return $this->toggleBase('conditional', $uuid, $enabled);
    }

    /* client groups */
    public function searchClientgroupAction()
    {
        return $this->searchBase('clientgroups', null, 'client');
    }

    public function getClientgroupAction($uuid = null)
    {
        return $this->getBase('clientgroup', 'clientgroups', $uuid);
    }

    public function setClientgroupAction($uuid)
    {
        return $this->setBase('clientgroup', 'clientgroups', $uuid);
    }

    public function addClientgroupAction()
    {
        return $this->addBase('clientgroup', 'clientgroups');
    }

    public function delClientgroupAction($uuid)
    {
        return $this->delBase('clientgroups', $uuid);
    }

    public function toggleClientgroupAction($uuid, $enabled = null)
    {
        return $this->toggleBase('clientgroups', $uuid, $enabled);
    }

    /* custom DNS rewrites */
    public function searchCustomdnsrewriteAction()
    {
        return $this->searchBase('customdnsrewrite', null, 'fromDomain');
    }

    public function getCustomdnsrewriteAction($uuid = null)
    {
        return $this->getBase('customdnsrewrite', 'customdnsrewrite', $uuid);
    }

    public function setCustomdnsrewriteAction($uuid)
    {
        return $this->setBase('customdnsrewrite', 'customdnsrewrite', $uuid);
    }

    public function addCustomdnsrewriteAction()
    {
        return $this->addBase('customdnsrewrite', 'customdnsrewrite');
    }

    public function delCustomdnsrewriteAction($uuid)
    {
        return $this->delBase('customdnsrewrite', $uuid);
    }

    public function toggleCustomdnsrewriteAction($uuid, $enabled = null)
    {
        return $this->toggleBase('customdnsrewrite', $uuid, $enabled);
    }

    /* conditional rewrites */
    public function searchConditionalrewriteAction()
    {
        return $this->searchBase('conditionalrewrite', null, 'fromDomain');
    }

    public function getConditionalrewriteAction($uuid = null)
    {
        return $this->getBase('conditionalrewrite', 'conditionalrewrite', $uuid);
    }

    public function setConditionalrewriteAction($uuid)
    {
        return $this->setBase('conditionalrewrite', 'conditionalrewrite', $uuid);
    }

    public function addConditionalrewriteAction()
    {
        return $this->addBase('conditionalrewrite', 'conditionalrewrite');
    }

    public function delConditionalrewriteAction($uuid)
    {
        return $this->delBase('conditionalrewrite', $uuid);
    }

    public function toggleConditionalrewriteAction($uuid, $enabled = null)
    {
        return $this->toggleBase('conditionalrewrite', $uuid, $enabled);
    }

    /* schedules */
    public function searchScheduleAction()
    {
        return $this->searchBase('schedules', null, 'name');
    }

    public function getScheduleAction($uuid = null)
    {
        return $this->getBase('schedule', 'schedules', $uuid);
    }

    public function setScheduleAction($uuid)
    {
        return $this->setBase('schedule', 'schedules', $uuid);
    }

    public function addScheduleAction()
    {
        return $this->addBase('schedule', 'schedules');
    }

    public function delScheduleAction($uuid)
    {
        return $this->delBase('schedules', $uuid);
    }

    public function toggleScheduleAction($uuid, $enabled = null)
    {
        return $this->toggleBase('schedules', $uuid, $enabled);
    }
}
