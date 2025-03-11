#!/bin/bash
# 修改lan口ip
uci set network.lan.ipaddr='10.0.0.2'
# 网关指向上级路由
uci set network.lan.gateway='10.0.0.1'
# 设置子网码
uci set network.lan.netmask='255.255.240.0'
# dns指向上级路由
uci set network.lan.dns='10.0.0.1'
# 确认修改
uci commit network
# 关闭lan口dhcp
uci set dhcp.lan.ignore='1'
uci commit dhcp

# 设置所有网口可访问网页终端
# uci delete ttyd.@ttyd[0].interface

# 设置所有网口可连接 SSH
# uci set dropbear.@dropbear[0].Interface=''
# uci commit

# docker mirror
# if [ -f /etc/config/dockerd ] && [ $(grep -c daocloud.io /etc/config/dockerd) -eq '0' ]; then
#     uci add_list dockerd.globals.registry_mirrors="https://docker.m.daocloud.io"
#     uci commit dockerd
# fi

exit 0
