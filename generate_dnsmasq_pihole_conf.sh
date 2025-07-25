# This is a script which will take the list of all the domains and then convert it in such a way so that it can be used with pihole. The main need for this (for me) is I wanted to forward these game domains to a DNS which has caches or lancache serving DNS.
# CHATGPT: https://chatgpt.com/share/6877afdd-a8b0-8000-b439-0311dbe3413d
#!/bin/bash
INPUT="all_domains.txt"
OUTPUT="/etc/dnsmasq.d/05-lancache-forwarding.conf"
DNS_IP="172.21.0.5"

echo "# Auto-generated by script" > "$OUTPUT"

while IFS= read -r domain; do
    # Remove leading *.
    domain=$(echo "$domain" | sed 's/^\*\.\?//')
    # Skip empty lines
    [[ -z "$domain" ]] && continue
    echo "server=/$domain/$DNS_IP" >> "$OUTPUT"
done < "$INPUT"



# Run Command: sudo bash generate_dnsmasq_pihole_conf.sh
# And then pihole restartdns