{% if helpers.exists('OPNsense.blocky.general.enabled') and OPNsense.blocky.general.enabled == '1' %}
blocky_enable="YES"
blocky_config="/usr/local/etc/blocky/config.yml"
{% else %}
blocky_enable="NO"
{% endif %}
