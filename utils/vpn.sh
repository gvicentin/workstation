# iHeart Cisco AnyConnect VPN
export CISCO_ANYCONNECT_VPN_URL="secure.iheartmedia.com"

vpnc(){
    local cisco_username="$(\cat ~/private-files/iheart-user | tr -d "\n")"
    local cisco_password=$(keyring get password ${cisco_username} | tr -d "\n")
    # I had to ommit the username because anyconnect is getting from /opt/cisco/anyconnect/profile/Profile.xml
    echo "y\nn\n${cisco_username}\n${cisco_password}\ny\n" | /opt/cisco/anyconnect/bin/vpn -s connect $CISCO_ANYCONNECT_VPN_URL
}

vpnd(){
   /opt/cisco/anyconnect/bin/vpn disconnect $CISCO_ANYCONNECT_VPN_URL
}

vpns(){
    /opt/cisco/anyconnect/bin/vpn state
}

save_vpn_password(){
    local cisco_username="$(\cat ~/private-files/iheart-user)"
    keyring set password ${cisco_username}
}

save_ihm_user(){
    local ihm_id=""
    echo "Type your ihm id (only numbers) followed by [ENTER]:"
    read ihm_id

    [[ ! -d ~/private-files/ ]] && mkdir -p ~/private-files/
    echo "${ihm_id}@iheartmedia.com" > ~/private-files/iheart-user
}
