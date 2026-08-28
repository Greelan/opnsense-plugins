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

use OPNsense\Base\BaseModel;
use OPNsense\Base\Messages\Message;
use OPNsense\Core\Backend;

/**
 * Class Blocky
 * @package OPNsense\Blocky
 */
class Blocky extends BaseModel
{
    /**
     * {@inheritdoc}
     */
    public function performValidation($validateFullModel = false)
    {
        $messages = parent::performValidation($validateFullModel);

        /* warn when the configured DNS port is already claimed by another service */
        if (
            ($validateFullModel || $this->general->enabled->isFieldChanged() || $this->general->dnsPort->isFieldChanged()) &&
            (string)$this->general->enabled == '1'
        ) {
            $dns_port = (string)$this->general->dnsPort;
            foreach (json_decode((new Backend())->configdpRun('service list'), true) ?? [] as $service) {
                if (empty($service['dns_ports']) || !is_array($service['dns_ports'])) {
                    continue;
                }
                if ($service['name'] != 'blocky' && in_array($dns_port, $service['dns_ports'])) {
                    $messages->appendMessage(new Message(
                        sprintf(gettext('%s is currently using this port.'), $service['description']),
                        'general.dnsPort'
                    ));
                    break;
                }
            }
        }

        return $messages;
    }
}
