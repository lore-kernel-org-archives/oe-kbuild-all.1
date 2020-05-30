Content-Type: multipart/mixed; boundary="===============2572857222738449674=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lee:android-3.18-preview 7/74] drivers/net/phy/micrel.c:392:11: warning: Variable 'of_node' is reassigned a value before the old one has been used. [redundantAssignment]
Date: Sat, 30 May 2020 23:23:13 +0800
Message-ID: <202005302308.08asYfKV%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2572857222738449674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/linux.git andro=
id-3.18-preview
head:   5f0d8dab651699c96d18a23329aadc25bc2394f7
commit: da7c917adca3840de9a5372c6ab36ec417ee551a [7/74] phy: micrel: Fix fi=
nding PHY properties in MAC node for KSZ9031.
compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/ipv4/udp.c:1076:6: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    err =3D ip_append_data(sk, fl4, getfrag, msg->msg_iov, ulen,
        ^
   net/ipv4/udp.c:1027:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D -EACCES;
         ^
   net/ipv4/udp.c:1076:6: note: Variable 'err' is reassigned a value before=
 the old one has been used.
    err =3D ip_append_data(sk, fl4, getfrag, msg->msg_iov, ulen,
        ^
>> net/ipv4/devinet.c:997:26: warning: Either the condition '!ifa' is redun=
dant or there is possible null pointer dereference: ifa. [nullPointerRedund=
antCheck]
     sin->sin_addr.s_addr =3D ifa->ifa_local;
                            ^
   net/ipv4/devinet.c:1015:8: note: Assuming that condition '!ifa' is not r=
edundant
      if (!ifa)
          ^
   net/ipv4/devinet.c:997:26: note: Null pointer dereference
     sin->sin_addr.s_addr =3D ifa->ifa_local;
                            ^
   net/ipv4/devinet.c:1001:26: warning: Either the condition '!ifa' is redu=
ndant or there is possible null pointer dereference: ifa. [nullPointerRedun=
dantCheck]
     sin->sin_addr.s_addr =3D ifa->ifa_broadcast;
                            ^
   net/ipv4/devinet.c:1015:8: note: Assuming that condition '!ifa' is not r=
edundant
      if (!ifa)
          ^
   net/ipv4/devinet.c:1001:26: note: Null pointer dereference
     sin->sin_addr.s_addr =3D ifa->ifa_broadcast;
                            ^
   net/ipv4/devinet.c:1005:26: warning: Either the condition '!ifa' is redu=
ndant or there is possible null pointer dereference: ifa. [nullPointerRedun=
dantCheck]
     sin->sin_addr.s_addr =3D ifa->ifa_address;
                            ^
   net/ipv4/devinet.c:1015:8: note: Assuming that condition '!ifa' is not r=
edundant
      if (!ifa)
          ^
   net/ipv4/devinet.c:1005:26: note: Null pointer dereference
     sin->sin_addr.s_addr =3D ifa->ifa_address;
                            ^
   net/ipv4/devinet.c:1009:26: warning: Either the condition '!ifa' is redu=
ndant or there is possible null pointer dereference: ifa. [nullPointerRedun=
dantCheck]
     sin->sin_addr.s_addr =3D ifa->ifa_mask;
                            ^
   net/ipv4/devinet.c:1015:8: note: Assuming that condition '!ifa' is not r=
edundant
      if (!ifa)
          ^
   net/ipv4/devinet.c:1009:26: note: Null pointer dereference
     sin->sin_addr.s_addr =3D ifa->ifa_mask;
                            ^
>> net/ipv4/devinet.c:257:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D devinet_sysctl_register(in_dev);
        ^
   net/ipv4/devinet.c:236:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    int err =3D -ENOMEM;
   ^
   net/ipv4/devinet.c:257:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D devinet_sysctl_register(in_dev);
        ^
   net/ipv4/devinet.c:566:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D nlmsg_parse(nlh, sizeof(*ifm), tb, IFA_MAX, ifa_ipv4_policy);
        ^
   net/ipv4/devinet.c:562:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    int err =3D -EINVAL;
   ^
   net/ipv4/devinet.c:566:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D nlmsg_parse(nlh, sizeof(*ifm), tb, IFA_MAX, ifa_ipv4_policy);
        ^
   net/ipv4/devinet.c:744:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D -ENODEV;
        ^
   net/ipv4/devinet.c:739:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D -EINVAL;
        ^
   net/ipv4/devinet.c:744:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D -ENODEV;
        ^
   net/ipv4/devinet.c:749:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D -ENOBUFS;
        ^
   net/ipv4/devinet.c:744:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D -ENODEV;
        ^
   net/ipv4/devinet.c:749:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D -ENOBUFS;
        ^
>> net/ipv4/devinet.c:955:6: warning: Variable 'ret' is reassigned a value =
before the old one has been used. 'break;' missing? [redundantAssignInSwitc=
h]
    ret =3D -ENODEV;
        ^
   net/ipv4/devinet.c:898:0: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
    int ret =3D -EFAULT;
   ^
   net/ipv4/devinet.c:955:6: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
    ret =3D -ENODEV;
        ^
>> net/ipv4/devinet.c:955:6: warning: Variable 'ret' is reassigned a value =
before the old one has been used. 'break;' missing? [redundantAssignInSwitc=
h]
    ret =3D -ENODEV;
        ^
   net/ipv4/devinet.c:933:7: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
     ret =3D -EPERM;
         ^
   net/ipv4/devinet.c:955:6: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
    ret =3D -ENODEV;
        ^
>> net/ipv4/devinet.c:944:7: warning: Variable 'ret' is reassigned a value =
before the old one has been used. [redundantAssignment]
     ret =3D -EINVAL;
         ^
   net/ipv4/devinet.c:941:7: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used.
     ret =3D -EPERM;
         ^
   net/ipv4/devinet.c:944:7: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used.
     ret =3D -EINVAL;
         ^
   net/ipv4/devinet.c:955:6: warning: Variable 'ret' is reassigned a value =
before the old one has been used. [redundantAssignment]
    ret =3D -ENODEV;
        ^
   net/ipv4/devinet.c:944:7: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used.
     ret =3D -EINVAL;
         ^
   net/ipv4/devinet.c:955:6: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used.
    ret =3D -ENODEV;
        ^
   net/ipv4/devinet.c:991:6: warning: Variable 'ret' is reassigned a value =
before the old one has been used. [redundantAssignment]
    ret =3D -EADDRNOTAVAIL;
        ^
   net/ipv4/devinet.c:955:6: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used.
    ret =3D -ENODEV;
        ^
   net/ipv4/devinet.c:991:6: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used.
    ret =3D -EADDRNOTAVAIL;
        ^
   net/ipv4/devinet.c:1017:8: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
      ret =3D 0;
          ^
   net/ipv4/devinet.c:1014:8: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
      ret =3D -EADDRNOTAVAIL;
          ^
   net/ipv4/devinet.c:1017:8: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
      ret =3D 0;
          ^
   net/ipv4/devinet.c:1031:8: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
      ret =3D -ENOBUFS;
          ^
   net/ipv4/devinet.c:1026:7: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
     ret =3D -EINVAL;
         ^
   net/ipv4/devinet.c:1031:8: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
      ret =3D -ENOBUFS;
          ^
   net/ipv4/devinet.c:1063:7: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
     ret =3D inet_set_ifa(dev, ifa);
         ^
   net/ipv4/devinet.c:1031:8: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
      ret =3D -ENOBUFS;
          ^
   net/ipv4/devinet.c:1063:7: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
     ret =3D inet_set_ifa(dev, ifa);
         ^
   net/ipv4/devinet.c:1082:7: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
     ret =3D 0;
         ^
   net/ipv4/devinet.c:1079:7: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
     ret =3D -EINVAL;
         ^
   net/ipv4/devinet.c:1082:7: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
     ret =3D 0;
         ^
   net/ipv4/devinet.c:1096:7: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
     ret =3D 0;
         ^
   net/ipv4/devinet.c:1093:7: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
     ret =3D -EINVAL;
         ^
   net/ipv4/devinet.c:1096:7: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
     ret =3D 0;
         ^
>> net/ipv4/devinet.c:1546:51: warning: Variable 's_idx' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv4/devinet.c:1543:8: note: Variable 's_idx' is reassigned a value =
before the old one has been used.
    s_idx =3D idx =3D cb->args[1];
          ^
   net/ipv4/devinet.c:1546:51: note: Variable 's_idx' is reassigned a value=
 before the old one has been used.
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv4/devinet.c:1601:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D inet_fill_ifaddr(skb, ifa, portid, seq, event, 0);
        ^
   net/ipv4/devinet.c:1593:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv4/devinet.c:1601:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D inet_fill_ifaddr(skb, ifa, portid, seq, event, 0);
        ^
   net/ipv4/devinet.c:1768:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D inet_netconf_fill_devconf(skb, ifindex, devconf, 0, 0,
        ^
   net/ipv4/devinet.c:1762:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv4/devinet.c:1768:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D inet_netconf_fill_devconf(skb, ifindex, devconf, 0, 0,
        ^
>> net/ipv4/devinet.c:1831:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. 'break;' missing? [redundantAssignInSwit=
ch]
    err =3D -ENOBUFS;
        ^
   net/ipv4/devinet.c:1808:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -EINVAL;
        ^
   net/ipv4/devinet.c:1831:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -ENOBUFS;
        ^
   net/ipv4/devinet.c:1836:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D inet_netconf_fill_devconf(skb, ifindex, devconf,
        ^
   net/ipv4/devinet.c:1831:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/ipv4/devinet.c:1836:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D inet_netconf_fill_devconf(skb, ifindex, devconf,
        ^
   net/ipv4/devinet.c:1864:51: warning: Variable 's_idx' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv4/devinet.c:1862:8: note: Variable 's_idx' is reassigned a value =
before the old one has been used.
    s_idx =3D idx =3D cb->args[1];
          ^
   net/ipv4/devinet.c:1864:51: note: Variable 's_idx' is reassigned a value=
 before the old one has been used.
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv4/devinet.c:2264:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D __devinet_sysctl_register(net, "all", all);
        ^
   net/ipv4/devinet.c:2239:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOMEM;
        ^
   net/ipv4/devinet.c:2264:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D __devinet_sysctl_register(net, "all", all);
        ^
>> net/ipv6/addrconf.c:424:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D addrconf_sysctl_register(ndev);
        ^
   net/ipv6/addrconf.c:343:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOMEM;
   ^
   net/ipv6/addrconf.c:424:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D addrconf_sysctl_register(ndev);
        ^
   net/ipv6/addrconf.c:539:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D inet6_netconf_fill_devconf(skb, ifindex, devconf, 0, 0,
        ^
   net/ipv6/addrconf.c:533:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv6/addrconf.c:539:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D inet6_netconf_fill_devconf(skb, ifindex, devconf, 0, 0,
        ^
>> net/ipv6/addrconf.c:600:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. 'break;' missing? [redundantAssignInSwit=
ch]
    err =3D -ENOBUFS;
        ^
   net/ipv6/addrconf.c:577:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -EINVAL;
        ^
   net/ipv6/addrconf.c:600:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -ENOBUFS;
        ^
   net/ipv6/addrconf.c:605:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D inet6_netconf_fill_devconf(skb, ifindex, devconf,
        ^
   net/ipv6/addrconf.c:600:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/ipv6/addrconf.c:605:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D inet6_netconf_fill_devconf(skb, ifindex, devconf,
        ^
>> net/ipv6/addrconf.c:633:51: warning: Variable 's_idx' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv6/addrconf.c:631:8: note: Variable 's_idx' is reassigned a value =
before the old one has been used.
    s_idx =3D idx =3D cb->args[1];
          ^
   net/ipv6/addrconf.c:633:51: note: Variable 's_idx' is reassigned a value=
 before the old one has been used.
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv6/addrconf.c:2498:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D -EFAULT;
        ^
   net/ipv6/addrconf.c:2494:0: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    int err =3D -EINVAL;
   ^
   net/ipv6/addrconf.c:2498:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D -EFAULT;
        ^
   net/ipv6/addrconf.c:2504:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D -ENODEV;
        ^
   net/ipv6/addrconf.c:2498:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D -EFAULT;
        ^
   net/ipv6/addrconf.c:2504:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D -ENODEV;
        ^
   net/ipv6/addrconf.c:4305:51: warning: Variable 's_idx' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv6/addrconf.c:4300:8: note: Variable 's_idx' is reassigned a value=
 before the old one has been used.
    s_idx =3D idx =3D cb->args[1];
          ^
   net/ipv6/addrconf.c:4305:51: note: Variable 's_idx' is reassigned a valu=
e before the old one has been used.
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv6/addrconf.c:4418:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D inet6_fill_ifaddr(skb, ifa, 0, 0, event, 0);
        ^
   net/ipv6/addrconf.c:4412:0: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv6/addrconf.c:4418:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D inet6_fill_ifaddr(skb, ifa, 0, 0, event, 0);
        ^
   net/ipv6/addrconf.c:4791:51: warning: Variable 's_idx' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv6/addrconf.c:4788:8: note: Variable 's_idx' is reassigned a value=
 before the old one has been used.
    s_idx =3D cb->args[1];
          ^
   net/ipv6/addrconf.c:4791:51: note: Variable 's_idx' is reassigned a valu=
e before the old one has been used.
    for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                                                     ^
   net/ipv6/addrconf.c:4827:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D inet6_fill_ifinfo(skb, idev, 0, 0, event, 0);
        ^
   net/ipv6/addrconf.c:4821:0: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv6/addrconf.c:4827:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D inet6_fill_ifinfo(skb, idev, 0, 0, event, 0);
        ^
   net/ipv6/addrconf.c:4898:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D inet6_fill_prefix(skb, idev, pinfo, 0, 0, event, 0);
        ^
   net/ipv6/addrconf.c:4892:0: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv6/addrconf.c:4898:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D inet6_fill_prefix(skb, idev, pinfo, 0, 0, event, 0);
        ^
   net/ipv6/addrconf.c:1341:75: warning: Clarify calculation precedence for=
 '&' and '?'. [clarifyCalculation]
     int preftmp =3D dst->prefs & (IPV6_PREFER_SRC_PUBLIC|IPV6_PREFER_SRC_T=
MP) ?
                                                                           =
  ^
   net/ipv6/addrconf.c:1321:50: warning: Boolean result is used in bitwise =
operation. Clarify expression with parentheses. [clarifyCondition]
     ret =3D !(score->ifa->flags & IFA_F_HOMEADDRESS) ^ prefhome;
                                                    ^
   net/ipv6/addrconf.c:5529:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D __addrconf_sysctl_register(net, "all", NULL, all);
        ^
   net/ipv6/addrconf.c:5510:0: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    int err =3D -ENOMEM;
   ^
   net/ipv6/addrconf.c:5529:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D __addrconf_sysctl_register(net, "all", NULL, all);
        ^
>> net/ipv6/ip6mr.c:2440:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D ip6mr_fill_mroute(mrt, skb, 0, 0, mfc, cmd, 0);
        ^
   net/ipv6/ip6mr.c:2433:0: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv6/ip6mr.c:2440:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D ip6mr_fill_mroute(mrt, skb, 0, 0, mfc, cmd, 0);
        ^
   net/ipv6/ip6mr.c:2485:6: warning: Variable 'e' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
      e =3D s_e =3D 0;
        ^
   net/ipv6/ip6mr.c:2483:6: note: Variable 'e' is reassigned a value before=
 the old one has been used.
       e++;
        ^
   net/ipv6/ip6mr.c:2485:6: note: Variable 'e' is reassigned a value before=
 the old one has been used.
      e =3D s_e =3D 0;
        ^
   net/ipv6/ip6mr.c:2503:5: warning: Variable 'e' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     e =3D s_e =3D 0;
       ^
   net/ipv6/ip6mr.c:2500:5: note: Variable 'e' is reassigned a value before=
 the old one has been used.
      e++;
       ^
   net/ipv6/ip6mr.c:2503:5: note: Variable 'e' is reassigned a value before=
 the old one has been used.
     e =3D s_e =3D 0;
       ^
>> net/ipv6/ip6mr.c:2222:8: warning: Local variable err shadows outer varia=
ble [shadowVar]
      int err =3D ip6mr_cache_unresolved(mrt, vif, skb);
          ^
   net/ipv6/ip6mr.c:2194:6: note: Shadowed declaration
    int err;
        ^
   net/ipv6/ip6mr.c:2222:8: note: Shadow variable
      int err =3D ip6mr_cache_unresolved(mrt, vif, skb);
          ^
   net/ipv6/ip6mr.c:82:20: warning: struct member 'ip6mr_result::mrt' is ne=
ver used. [unusedStructMember]
    struct mr6_table *mrt;
                      ^
   net/ipv6/ip6_vti.c:747:7: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
     err =3D -EFAULT;
         ^
   net/ipv6/ip6_vti.c:744:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D -EPERM;
         ^
   net/ipv6/ip6_vti.c:747:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D -EFAULT;
         ^
   net/ipv6/ip6_vti.c:750:7: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
     err =3D -EINVAL;
         ^
   net/ipv6/ip6_vti.c:747:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D -EFAULT;
         ^
   net/ipv6/ip6_vti.c:750:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D -EINVAL;
         ^
   net/ipv6/ip6_vti.c:767:8: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
      err =3D 0;
          ^
   net/ipv6/ip6_vti.c:750:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D -EINVAL;
         ^
   net/ipv6/ip6_vti.c:767:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D 0;
          ^
   net/ipv6/ip6_vti.c:767:8: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
      err =3D 0;
          ^
   net/ipv6/ip6_vti.c:764:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D vti6_update(t, &p1);
          ^
   net/ipv6/ip6_vti.c:767:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D 0;
          ^
   net/ipv6/ip6_vti.c:794:7: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   net/ipv6/ip6_vti.c:776:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D -EPERM;
         ^
   net/ipv6/ip6_vti.c:794:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D 0;
         ^
   net/ipv6/ip6_vti.c:784:8: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
      err =3D -ENOENT;
          ^
   net/ipv6/ip6_vti.c:781:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D -EFAULT;
          ^
   net/ipv6/ip6_vti.c:784:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D -ENOENT;
          ^
   net/ipv6/ip6_vti.c:789:8: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
      err =3D -EPERM;
          ^
   net/ipv6/ip6_vti.c:784:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D -ENOENT;
          ^
   net/ipv6/ip6_vti.c:789:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D -EPERM;
          ^
   net/ipv6/ip6_vti.c:794:7: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   net/ipv6/ip6_vti.c:789:8: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
      err =3D -EPERM;
          ^
   net/ipv6/ip6_vti.c:794:7: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
     err =3D 0;
         ^
   net/ipv6/ip6_vti.c:1075:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D vti6_fb_tnl_dev_init(ip6n->fb_tnl_dev);
        ^
   net/ipv6/ip6_vti.c:1066:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOMEM;
        ^
   net/ipv6/ip6_vti.c:1075:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D vti6_fb_tnl_dev_init(ip6n->fb_tnl_dev);
        ^
>> net/ipv6/ip6_vti.c:1146:6: warning: Variable 'msg' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    msg =3D "tunnel protocols";
        ^
   net/ipv6/ip6_vti.c:1141:6: note: Variable 'msg' is reassigned a value be=
fore the old one has been used.
    msg =3D "tunnel device";
        ^
   net/ipv6/ip6_vti.c:1146:6: note: Variable 'msg' is reassigned a value be=
fore the old one has been used.
    msg =3D "tunnel protocols";
        ^
   net/ipv6/ip6_vti.c:1157:6: warning: Variable 'msg' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    msg =3D "netlink interface";
        ^
   net/ipv6/ip6_vti.c:1146:6: note: Variable 'msg' is reassigned a value be=
fore the old one has been used.
    msg =3D "tunnel protocols";
        ^
   net/ipv6/ip6_vti.c:1157:6: note: Variable 'msg' is reassigned a value be=
fore the old one has been used.
    msg =3D "netlink interface";
        ^
--
>> net/netfilter/nf_tables_api.c:451:6: warning: Variable 'err' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_fill_table_info(skb, ctx->net, ctx->portid, ctx->seq,
        ^
   net/netfilter/nf_tables_api.c:446:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/netfilter/nf_tables_api.c:451:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D nf_tables_fill_table_info(skb, ctx->net, ctx->portid, ctx->seq,
        ^
   net/netfilter/nf_tables_api.c:995:6: warning: Variable 'err' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_fill_chain_info(skb, ctx->net, ctx->portid, ctx->seq,
        ^
   net/netfilter/nf_tables_api.c:990:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/netfilter/nf_tables_api.c:995:6: note: Variable 'err' is reassigned =
a value before the old one has been used.
    err =3D nf_tables_fill_chain_info(skb, ctx->net, ctx->portid, ctx->seq,
        ^
   net/netfilter/nf_tables_api.c:1736:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_fill_rule_info(skb, ctx->net, ctx->portid, ctx->seq,
        ^
   net/netfilter/nf_tables_api.c:1731:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/netfilter/nf_tables_api.c:1736:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D nf_tables_fill_rule_info(skb, ctx->net, ctx->portid, ctx->seq,
        ^
   net/netfilter/nf_tables_api.c:1958:8: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
      err =3D nf_tables_expr_parse(&ctx, tmp, &info[n]);
          ^
   net/netfilter/nf_tables_api.c:1953:8: note: Variable 'err' is reassigned=
 a value before the old one has been used.
      err =3D -EINVAL;
          ^
   net/netfilter/nf_tables_api.c:1958:8: note: Variable 'err' is reassigned=
 a value before the old one has been used.
      err =3D nf_tables_expr_parse(&ctx, tmp, &info[n]);
          ^
   net/netfilter/nf_tables_api.c:2391:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_fill_set(skb, ctx, set, event, 0);
        ^
   net/netfilter/nf_tables_api.c:2386:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/netfilter/nf_tables_api.c:2391:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D nf_tables_fill_set(skb, ctx, set, event, 0);
        ^
   net/netfilter/nf_tables_api.c:2672:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_set_alloc_name(&ctx, set, name);
        ^
   net/netfilter/nf_tables_api.c:2666:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -ENOMEM;
        ^
   net/netfilter/nf_tables_api.c:2672:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D nf_tables_set_alloc_name(&ctx, set, name);
        ^
   net/netfilter/nf_tables_api.c:3066:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_fill_setelem_info(skb, ctx, 0, portid, event, flags,
        ^
   net/netfilter/nf_tables_api.c:3061:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/netfilter/nf_tables_api.c:3066:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D nf_tables_fill_setelem_info(skb, ctx, 0, portid, event, flags,
        ^
   net/netfilter/nf_tables_api.c:3143:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D -EEXIST;
        ^
   net/netfilter/nf_tables_api.c:3139:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -EINVAL;
        ^
   net/netfilter/nf_tables_api.c:3143:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -EEXIST;
        ^
   net/netfilter/nf_tables_api.c:3175:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D set->ops->insert(set, &elem);
        ^
   net/netfilter/nf_tables_api.c:3143:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -EEXIST;
        ^
   net/netfilter/nf_tables_api.c:3175:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D set->ops->insert(set, &elem);
        ^
   net/netfilter/nf_tables_api.c:3175:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D set->ops->insert(set, &elem);
        ^
   net/netfilter/nf_tables_api.c:3152:7: note: Variable 'err' is reassigned=
 a value before the old one has been used.
     err =3D -EINVAL;
         ^
   net/netfilter/nf_tables_api.c:3175:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D set->ops->insert(set, &elem);
        ^
   net/netfilter/nf_tables_api.c:3252:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D nft_data_init(ctx, &elem.key, &desc, nla[NFTA_SET_ELEM_KEY]);
        ^
   net/netfilter/nf_tables_api.c:3248:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -EINVAL;
        ^
   net/netfilter/nf_tables_api.c:3252:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D nft_data_init(ctx, &elem.key, &desc, nla[NFTA_SET_ELEM_KEY]);
        ^
   net/netfilter/nf_tables_api.c:3260:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D set->ops->get(set, &elem);
        ^
   net/netfilter/nf_tables_api.c:3256:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -EINVAL;
        ^
   net/netfilter/nf_tables_api.c:3260:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D set->ops->get(set, &elem);
        ^
   net/netfilter/nf_tables_api.c:3352:6: warning: Variable 'err' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    err =3D nf_tables_fill_gen_info(skb2, net, NETLINK_CB(skb).portid,
        ^
   net/netfilter/nf_tables_api.c:3347:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/netfilter/nf_tables_api.c:3352:6: note: Variable 'err' is reassigned=
 a value before the old one has been used.
    err =3D nf_tables_fill_gen_info(skb2, net, NETLINK_CB(skb).portid,
        ^
   net/netfilter/nf_tables_api.c:1195:43: warning: Clarify calculation prec=
edence for '&' and '?'. [clarifyCalculation]
    create =3D nlh->nlmsg_flags & NLM_F_CREATE ? true : false;
                                             ^
   net/netfilter/nf_tables_api.c:1902:43: warning: Clarify calculation prec=
edence for '&' and '?'. [clarifyCalculation]
    create =3D nlh->nlmsg_flags & NLM_F_CREATE ? true : false;
                                             ^
   net/netfilter/nf_tables_api.c:2628:43: warning: Clarify calculation prec=
edence for '&' and '?'. [clarifyCalculation]
    create =3D nlh->nlmsg_flags & NLM_F_CREATE ? true : false;
                                             ^
>> net/netfilter/nf_tables_api.c:2623:35: warning: Uninitialized variable: =
ctx [uninitvar]
     err =3D nf_tables_set_desc_parse(&ctx, &desc, nla[NFTA_SET_DESC]);
                                     ^
--
>> drivers/net/phy/micrel.c:392:11: warning: Variable 'of_node' is reassign=
ed a value before the old one has been used. [redundantAssignment]
     of_node =3D dev_walker->of_node;
             ^
   drivers/net/phy/micrel.c:373:0: note: Variable 'of_node' is reassigned a=
 value before the old one has been used.
    struct device_node *of_node =3D dev->of_node;
   ^
   drivers/net/phy/micrel.c:392:11: note: Variable 'of_node' is reassigned =
a value before the old one has been used.
     of_node =3D dev_walker->of_node;
             ^
   drivers/net/phy/micrel.c:426:9: warning: Variable 'regval' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^
   drivers/net/phy/micrel.c:424:9: note: Variable 'regval' is reassigned a =
value before the old one has been used.
    regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^
   drivers/net/phy/micrel.c:426:9: note: Variable 'regval' is reassigned a =
value before the old one has been used.
    regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^
>> drivers/net/wimax/i2400m/usb-fw.c:207:9: warning: Variable 'result' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    result =3D i2400mu_tx_bulk_out(i2400mu, i2400m->bm_cmd_buf, cmd_size);
           ^
   drivers/net/wimax/i2400m/usb-fw.c:194:9: note: Variable 'result' is reas=
signed a value before the old one has been used.
    result =3D -E2BIG;
           ^
   drivers/net/wimax/i2400m/usb-fw.c:207:9: note: Variable 'result' is reas=
signed a value before the old one has been used.
    result =3D i2400mu_tx_bulk_out(i2400mu, i2400m->bm_cmd_buf, cmd_size);
           ^
   drivers/net/wimax/i2400m/usb-fw.c:293:9: warning: Variable 'result' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    result =3D usb_autopm_get_interface(i2400mu->usb_iface);
           ^
   drivers/net/wimax/i2400m/usb-fw.c:280:0: note: Variable 'result' is reas=
signed a value before the old one has been used.
    ssize_t result =3D -ENOMEM;
   ^
   drivers/net/wimax/i2400m/usb-fw.c:293:9: note: Variable 'result' is reas=
signed a value before the old one has been used.
    result =3D usb_autopm_get_interface(i2400mu->usb_iface);
           ^

vim +/of_node +392 drivers/net/phy/micrel.c

   369	=

   370	static int ksz9031_config_init(struct phy_device *phydev)
   371	{
   372		struct device *dev =3D &phydev->dev;
   373		struct device_node *of_node =3D dev->of_node;
   374		char *clk_skews[2] =3D {"rxc-skew-ps", "txc-skew-ps"};
   375		char *rx_data_skews[4] =3D {
   376			"rxd0-skew-ps", "rxd1-skew-ps",
   377			"rxd2-skew-ps", "rxd3-skew-ps"
   378		};
   379		char *tx_data_skews[4] =3D {
   380			"txd0-skew-ps", "txd1-skew-ps",
   381			"txd2-skew-ps", "txd3-skew-ps"
   382		};
   383		char *control_skews[2] =3D {"txen-skew-ps", "rxdv-skew-ps"};
   384		const struct device *dev_walker;
   385	=

   386		/* The Micrel driver has a deprecated option to place phy OF
   387		 * properties in the MAC node. Walk up the tree of devices to
   388		 * find a device with an OF node.
   389		 */
   390		dev_walker =3D &phydev->dev;
   391		do {
 > 392			of_node =3D dev_walker->of_node;
   393			dev_walker =3D dev_walker->parent;
   394		} while (!of_node && dev_walker);
   395	=

   396		if (of_node) {
   397			ksz9031_of_load_skew_values(phydev, of_node,
   398					MII_KSZ9031RN_CLK_PAD_SKEW, 5,
   399					clk_skews, 2);
   400	=

   401			ksz9031_of_load_skew_values(phydev, of_node,
   402					MII_KSZ9031RN_CONTROL_PAD_SKEW, 4,
   403					control_skews, 2);
   404	=

   405			ksz9031_of_load_skew_values(phydev, of_node,
   406					MII_KSZ9031RN_RX_DATA_PAD_SKEW, 4,
   407					rx_data_skews, 4);
   408	=

   409			ksz9031_of_load_skew_values(phydev, of_node,
   410					MII_KSZ9031RN_TX_DATA_PAD_SKEW, 4,
   411					tx_data_skews, 4);
   412		}
   413		return 0;
   414	}
   415	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2572857222738449674==--

