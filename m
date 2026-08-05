Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2743E2740
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921842; cv=none; b=HPkDiCZ9g1mQm0xLPGAc12Q4nev9GMTXpi5/j5Q5F6nBJrOqeSZBRtAFpr1X7G+O52O650VQzD5lHuWTo1X5f3wnLStq+iIEJUG7GY0ZVAWFZ3vx2ODQYroiR1vRouJCTFtSQO2ezIFmtuR5Y3+wxFyVN+2YL8hhH4YRXR7p6G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921842; c=relaxed/simple;
	bh=+vgbpmuUP+QdLwmsKN3bQSWv9SYxrmCtnhxMsK6RLho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VUL+gtPgWwVQKqR8jXua4oF1IwtG9zxx6joDCVs8hxEvUtBKuKG5EEGOJwPE4OOY+mWXfqPE/OMjMBlKo/hyuFquSyE81nmWOuHnS4vuJalmO/3OQlLvi5seXivpqDpaCf0OVbKQ2QAyjCX//Bkt2/biqrmbD3W2ol3G3Iqc/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMDZpD4U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMDZpD4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785921837; x=1817457837;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+vgbpmuUP+QdLwmsKN3bQSWv9SYxrmCtnhxMsK6RLho=;
  b=eMDZpD4UGwsK85xAOYlIzz7gy8kz4gFNkmNTv8E72hNiZQevmRV7iwx7
   214dBLVGOPbP4Tkm3ONtwYjdSTCAc86HvjpAHiwk7bxdryiM/r3JV0EhN
   oDGe3Jy+N6hehpaYLwPBxBJxU5jFEB1OQfER2BcvzvNioVf6egHYhIOBa
   R/SSW3nFYBdAS4kkQD7A/gVLJGliVWjeI+VntFyZGs8nP9Yq01wKuwCtE
   9pf1GRXcuHQegJK2EnXLaROz/wZfg8ZF0xA+A4IzN8XyqAK6hOR46g4Zp
   J2a2ta3mHRECR75tInzSbcAm8fo4IxaTO0SqrXonDpfZadAg7HI/ZEASI
   A==;
X-CSE-ConnectionGUID: mGAN0MboQOOIkbg9bro1ag==
X-CSE-MsgGUID: f3bPjwPTTE2BwqWeUZWaJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86499563"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86499563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 02:23:56 -0700
X-CSE-ConnectionGUID: OBO/clJcTlGDVmNuVzcxBw==
X-CSE-MsgGUID: ZFK4atG6Rq21EKlNvaVTvg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Aug 2026 02:23:55 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrXqq-000000004Mw-37Bd;
	Wed, 05 Aug 2026 09:23:52 +0000
Date: Wed, 05 Aug 2026 11:23:52 +0200
From: kernel test robot <lkp@intel.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/team/team_core.c:1238:9: error: expected
 identifier or '(' before 'if'
Message-ID: <202608051149.XlLOsLEq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiale-Yao/team-rejec=
t-CAN-and-IEEE-802-15-4-devices-in-team_port_add/20260805-104604
head:   a97c4fcfc42bce9093da5954696ee602c1c6265c
commit: a97c4fcfc42bce9093da5954696ee602c1c6265c team: reject CAN and IEEE =
802.15.4 devices in team_port_add
date:   7 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0805/202608051149.XlLOsLEq-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260805/202608051149.XlLOsLEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051149.XlLOsLEq-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/team/team_core.c: In function 'team_port_add':
>> drivers/net/team/team_core.c:1218:13: warning: unused variable 'err' [-W=
unused-variable]
    1218 |         int err;
         |             ^~~
>> drivers/net/team/team_core.c:1216:27: warning: unused variable 'port' [-=
Wunused-variable]
    1216 |         struct team_port *port;
         |                           ^~~~
   drivers/net/team/team_core.c: At top level:
>> drivers/net/team/team_core.c:1238:9: error: expected identifier or '(' b=
efore 'if'
    1238 |         if (netif_is_team_port(port_dev)) {
         |         ^~
   drivers/net/team/team_core.c:1245:9: error: expected identifier or '(' b=
efore 'if'
    1245 |         if (dev =3D=3D port_dev) {
         |         ^~
   drivers/net/team/team_core.c:1251:9: error: expected identifier or '(' b=
efore 'if'
    1251 |         if (netdev_has_upper_dev(dev, port_dev)) {
         |         ^~
   drivers/net/team/team_core.c:1258:9: error: expected identifier or '(' b=
efore 'if'
    1258 |         if (netdev_has_upper_dev(port_dev, dev)) {
         |         ^~
   drivers/net/team/team_core.c:1265:9: error: expected identifier or '(' b=
efore 'if'
    1265 |         if (port_dev->features & NETIF_F_VLAN_CHALLENGED &&
         |         ^~
   drivers/net/team/team_core.c:1273:9: error: expected identifier or '(' b=
efore 'if'
    1273 |         if (port_dev->flags & IFF_UP) {
         |         ^~
>> drivers/net/team/team_core.c:1280:9: warning: data definition has no typ=
e or storage class
    1280 |         port =3D kzalloc(sizeof(struct team_port) + team->mode->=
port_priv_size,
         |         ^~~~
>> drivers/net/team/team_core.c:1280:9: error: type defaults to 'int' in de=
claration of 'port' [-Wimplicit-int]
   In file included from ./include/linux/percpu.h:5,
                    from ./arch/arm64/include/asm/arch_timer.h:18,
                    from ./arch/arm64/include/asm/timex.h:8,
                    from ./include/linux/timex.h:67,
                    from ./include/linux/time32.h:13,
                    from ./include/linux/time.h:60,
                    from ./include/linux/compat.h:10,
                    from ./include/linux/ethtool.h:17,
                    from drivers/net/team/team_core.c:7:
>> ./include/linux/alloc_tag.h:268:1: error: braced-group within expression=
 allowed only inside a function
     268 | ({                                                              =
        \
         | ^
   ./include/linux/slab.h:1320:49: note: in expansion of macro 'alloc_hooks'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzal=
loc_noprof(size, flags))
         |                                                 ^~~~~~~~~~~
   drivers/net/team/team_core.c:1280:16: note: in expansion of macro 'kzall=
oc'
    1280 |         port =3D kzalloc(sizeof(struct team_port) + team->mode->=
port_priv_size,
         |                ^~~~~~~
   drivers/net/team/team_core.c:1282:9: error: expected identifier or '(' b=
efore 'if'
    1282 |         if (!port)
         |         ^~
>> drivers/net/team/team_core.c:1285:13: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before '->' token
    1285 |         port->dev =3D port_dev;
         |             ^~
   drivers/net/team/team_core.c:1286:13: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before '->' token
    1286 |         port->team =3D team;
         |             ^~
>> drivers/net/team/team_core.c:1287:24: error: expected declaration specif=
iers or '...' before '&' token
    1287 |         INIT_LIST_HEAD(&port->qom_list);
         |                        ^
   drivers/net/team/team_core.c:1289:13: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before '->' token
    1289 |         port->orig.mtu =3D port_dev->mtu;
         |             ^~
   drivers/net/team/team_core.c:1294:9: error: expected identifier or '(' b=
efore 'if'
    1294 |         if (dev->type =3D=3D port_dev->type) {
         |         ^~
   In file included from ./include/linux/string.h:383,
                    from ./include/linux/bitmap.h:13,
                    from ./include/linux/ethtool.h:16:
>> ./include/linux/fortify-string.h:576:63: error: expected identifier or '=
(' before '{' token
     576 |                              p_size_field, q_size_field, op) ({ =
        \
         |                                                               ^
   ./include/linux/fortify-string.h:640:26: note: in expansion of macro '__=
fortify_memcpy_chk'
     640 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1302:9: note: in expansion of macro 'memcpy'
    1302 |         memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev=
->addr_len);
         |         ^~~~~~
   drivers/net/team/team_core.c:1304:9: warning: data definition has no typ=
e or storage class
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
>> drivers/net/team/team_core.c:1304:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
>> drivers/net/team/team_core.c:1304:31: error: 'team' undeclared here (not=
 in a function)
    1304 |         err =3D team_port_enter(team, port);
         |                               ^~~~
>> drivers/net/team/team_core.c:1304:37: error: passing argument 2 of 'team=
_port_enter' makes pointer from integer without a cast [-Wint-conversion]
    1304 |         err =3D team_port_enter(team, port);
         |                                     ^~~~
         |                                     |
         |                                     int
   drivers/net/team/team_core.c:1109:65: note: expected 'struct team_port *=
' but argument is of type 'int'
    1109 | static int team_port_enter(struct team *team, struct team_port *=
port)
         |                                               ~~~~~~~~~~~~~~~~~~=
^~~~
   drivers/net/team/team_core.c:1305:9: error: expected identifier or '(' b=
efore 'if'
    1305 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1311:9: warning: data definition has no typ=
e or storage class
    1311 |         err =3D dev_open(port_dev, extack);
         |         ^~~
   drivers/net/team/team_core.c:1311:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
>> drivers/net/team/team_core.c:1311:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
>> drivers/net/team/team_core.c:1311:24: error: 'port_dev' undeclared here =
(not in a function)
    1311 |         err =3D dev_open(port_dev, extack);
         |                        ^~~~~~~~
>> drivers/net/team/team_core.c:1311:34: error: 'extack' undeclared here (n=
ot in a function)
    1311 |         err =3D dev_open(port_dev, extack);
         |                                  ^~~~~~
   drivers/net/team/team_core.c:1312:9: error: expected identifier or '(' b=
efore 'if'
    1312 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1318:9: warning: data definition has no typ=
e or storage class
    1318 |         err =3D vlan_vids_add_by_dev(port_dev, dev);
         |         ^~~
   drivers/net/team/team_core.c:1318:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
   drivers/net/team/team_core.c:1318:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
>> drivers/net/team/team_core.c:1318:46: error: 'dev' undeclared here (not =
in a function); did you mean 'cdev'?
    1318 |         err =3D vlan_vids_add_by_dev(port_dev, dev);
         |                                              ^~~
         |                                              cdev
   drivers/net/team/team_core.c:1319:9: error: expected identifier or '(' b=
efore 'if'
    1319 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1325:9: warning: data definition has no typ=
e or storage class
    1325 |         err =3D team_port_enable_netpoll(port);
         |         ^~~
   drivers/net/team/team_core.c:1325:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
   drivers/net/team/team_core.c:1325:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
>> drivers/net/team/team_core.c:1325:40: error: passing argument 1 of 'team=
_port_enable_netpoll' makes pointer from integer without a cast [-Wint-conv=
ersion]
    1325 |         err =3D team_port_enable_netpoll(port);
         |                                        ^~~~
         |                                        |
         |                                        int
   drivers/net/team/team_core.c:1158:55: note: expected 'struct team_port *=
' but argument is of type 'int'
    1158 | static int team_port_enable_netpoll(struct team_port *port)
         |                                     ~~~~~~~~~~~~~~~~~~^~~~
>> drivers/net/team/team_core.c:1325:15: error: initializer element is not =
constant
    1325 |         err =3D team_port_enable_netpoll(port);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1326:9: error: expected identifier or '(' b=
efore 'if'
    1326 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1332:9: error: expected identifier or '(' b=
efore 'if'
    1332 |         if (!(dev->features & NETIF_F_LRO))
         |         ^~
   drivers/net/team/team_core.c:1335:9: warning: data definition has no typ=
e or storage class
    1335 |         err =3D netdev_rx_handler_register(port_dev, team_handle=
_frame,
         |         ^~~
   drivers/net/team/team_core.c:1335:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
   drivers/net/team/team_core.c:1335:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
>> drivers/net/team/team_core.c:1336:42: error: passing argument 3 of 'netd=
ev_rx_handler_register' makes pointer from integer without a cast [-Wint-co=
nversion]
    1336 |                                          port);
         |                                          ^~~~
         |                                          |
         |                                          int
   In file included from drivers/net/team/team_core.c:17:
   ./include/linux/netdevice.h:4332:38: note: expected 'void *' but argumen=
t is of type 'int'
    4332 |                                void *rx_handler_data);
         |                                ~~~~~~^~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1337:9: error: expected identifier or '(' b=
efore 'if'
    1337 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1343:9: warning: data definition has no typ=
e or storage class
    1343 |         err =3D team_upper_dev_link(team, port, extack);
         |         ^~~
   drivers/net/team/team_core.c:1343:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
   drivers/net/team/team_core.c:1343:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
>> drivers/net/team/team_core.c:1343:41: error: passing argument 2 of 'team=
_upper_dev_link' makes pointer from integer without a cast [-Wint-conversio=
n]
    1343 |         err =3D team_upper_dev_link(team, port, extack);
         |                                         ^~~~
         |                                         |
         |                                         int
   drivers/net/team/team_core.c:1186:69: note: expected 'struct team_port *=
' but argument is of type 'int'
    1186 | static int team_upper_dev_link(struct team *team, struct team_po=
rt *port,
         |                                                   ~~~~~~~~~~~~~~=
~~~~^~~~
   drivers/net/team/team_core.c:1344:9: error: expected identifier or '(' b=
efore 'if'
    1344 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1350:9: warning: data definition has no typ=
e or storage class
    1350 |         err =3D __team_option_inst_add_port(team, port);
         |         ^~~
   drivers/net/team/team_core.c:1350:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
   drivers/net/team/team_core.c:1350:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
   drivers/net/team/team_core.c:1350:49: error: passing argument 2 of '__te=
am_option_inst_add_port' makes pointer from integer without a cast [-Wint-c=
onversion]
    1350 |         err =3D __team_option_inst_add_port(team, port);
         |                                                 ^~~~
         |                                                 |
         |                                                 int
   drivers/net/team/team_core.c:219:58: note: expected 'struct team_port *'=
 but argument is of type 'int'
     219 |                                        struct team_port *port)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~
   drivers/net/team/team_core.c:1351:9: error: expected identifier or '(' b=
efore 'if'
    1351 |         if (err) {
         |         ^~
   drivers/net/team/team_core.c:1358:9: error: expected identifier or '(' b=
efore 'if'
    1358 |         if (dev->flags & IFF_PROMISC) {
         |         ^~
   drivers/net/team/team_core.c:1365:9: error: expected identifier or '(' b=
efore 'if'
    1365 |         if (dev->flags & IFF_ALLMULTI) {
         |         ^~
   drivers/net/team/team_core.c:1374:9: warning: data definition has no typ=
e or storage class
    1374 |         err =3D team_dev_type_check_change(dev, port_dev);
         |         ^~~
   drivers/net/team/team_core.c:1374:9: error: type defaults to 'int' in de=
claration of 'err' [-Wimplicit-int]
   drivers/net/team/team_core.c:1374:9: error: redefinition of 'err'
   drivers/net/team/team_core.c:1304:9: note: previous definition of 'err' =
with type 'int'
    1304 |         err =3D team_port_enter(team, port);
         |         ^~~
   drivers/net/team/team_core.c:1375:9: error: expected identifier or '(' b=
efore 'if'
    1375 |         if (err)
         |         ^~
   drivers/net/team/team_core.c:1378:9: error: expected identifier or '(' b=
efore 'if'
    1378 |         if (dev->flags & IFF_UP) {
         |         ^~
   In file included from ./arch/arm64/include/asm/rwonce.h:81,
                    from ./include/linux/compiler.h:369,
                    from ./include/linux/build_bug.h:5,
                    from ./include/linux/bits.h:30,
                    from ./include/linux/bitops.h:6,
                    from ./include/linux/bitmap.h:8:
   ./include/asm-generic/rwonce.h:59:1: error: expected identifier or '(' b=
efore 'do'
      59 | do {                                                            =
        \
         | ^~
   drivers/net/team/team_core.c:1385:9: note: in expansion of macro 'WRITE_=
ONCE'
    1385 |         WRITE_ONCE(port->tx_index, -1);
         |         ^~~~~~~~~~
   ./include/asm-generic/rwonce.h:62:3: error: expected identifier or '(' b=
efore 'while'
      62 | } while (0)
         |   ^~~~~
   drivers/net/team/team_core.c:1385:9: note: in expansion of macro 'WRITE_=
ONCE'
    1385 |         WRITE_ONCE(port->tx_index, -1);
         |         ^~~~~~~~~~
   drivers/net/team/team_core.c:1386:27: error: expected declaration specif=
iers or '...' before '&' token
    1386 |         list_add_tail_rcu(&port->list, &team->port_list);
         |                           ^
   drivers/net/team/team_core.c:1386:40: error: expected declaration specif=
iers or '...' before '&' token
    1386 |         list_add_tail_rcu(&port->list, &team->port_list);
         |                                        ^
   drivers/net/team/team_core.c:1387:9: warning: data definition has no typ=
e or storage class
    1387 |         team_port_enable(team, port);
         |         ^~~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1387:9: error: type defaults to 'int' in de=
claration of 'team_port_enable' [-Wimplicit-int]
   drivers/net/team/team_core.c:1387:9: error: parameter names (without typ=
es) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/net/team/team_core.c:1387:9: error: conflicting types for 'team_=
port_enable'; have 'int()'
   drivers/net/team/team_core.c:1060:13: note: previous definition of 'team=
_port_enable' with type 'void(struct team *, struct team_port *)'
    1060 | static void team_port_enable(struct team *team,
         |             ^~~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1388:9: warning: data definition has no typ=
e or storage class
    1388 |         netdev_compute_master_upper_features(dev, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1388:9: error: type defaults to 'int' in de=
claration of 'netdev_compute_master_upper_features' [-Wimplicit-int]
   drivers/net/team/team_core.c:1388:9: error: parameter names (without typ=
es) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/net/team/team_core.c:1388:9: error: conflicting types for 'netde=
v_compute_master_upper_features'; have 'int()'
   ./include/linux/netdevice.h:5460:6: note: previous declaration of 'netde=
v_compute_master_upper_features' with type 'void(struct net_device *, bool)=
' {aka 'void(struct net_device *, _Bool)'}
    5460 | void netdev_compute_master_upper_features(struct net_device *dev=
, bool update_header);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1389:9: warning: data definition has no typ=
e or storage class
    1389 |         netdev_lock_ops(port_dev);
         |         ^~~~~~~~~~~~~~~
   drivers/net/team/team_core.c:1389:9: error: type defaults to 'int' in de=
claration of 'netdev_lock_ops' [-Wimplicit-int]
   drivers/net/team/team_core.c:1389:9: error: parameter names (without typ=
es) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/net/team/team_core.c:1389:9: error: conflicting types for 'netde=
v_lock_ops'; have 'int()'
   In file included from drivers/net/team/team_core.c:26:
   ./include/net/netdev_lock.h:39:20: note: previous definition of 'netdev_=
lock_ops' with type 'void(struct net_device *)'
      39 | static inline void netdev_lock_ops(struct net_device *dev)


vim +1238 drivers/net/team/team_core.c

bb9215a9817950 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1056 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1057  /*
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1058   * Enable TX AND RX on the port.
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1059   */
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09 @=
1060  static void team_port_enable(struct team *team,
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1061  			     struct team_port *port)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1062  {
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1063  	bool rx_was_enabled;
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1064  	bool tx_was_enabled;
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1065 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1066  	if (team_port_enabled(port))
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1067  		return;
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1068 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1069  	rx_was_enabled =3D team_port_rx_enabled(port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1070  	tx_was_enabled =3D team_port_tx_enabled(port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1071 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1072  	if (!rx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1073  		__team_port_enable_rx(team, port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1074  	if (!tx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1075  		__team_port_enable_tx(team, port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1076 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1077  	team_adjust_ops(team);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1078  	if (!tx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1079  		team_queue_override_port_add(team, port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1080  	team_notify_peers(team);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1081  	if (!rx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1082  		team_mcast_rejoin(team);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1083  	if (!tx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1084  		team_lower_state_changed(port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1085  }
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1086 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1087  static void team_port_disable(struct team *team,
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1088  			      struct team_port *port)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1089  {
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1090  	bool rx_was_enabled =3D team_port_rx_enabled(port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1091  	bool tx_was_enabled =3D team_port_tx_enabled(port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1092 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1093  	if (!tx_was_enabled && !rx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1094  		return;
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1095 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1096  	if (tx_was_enabled) {
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1097  		__team_port_disable_tx(team, port);
735d381fa57c57 drivers/net/team/team.c      Jiri Pirko         2013-06-10  =
1098  		team_queue_override_port_del(team, port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1099  	}
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1100  	if (rx_was_enabled)
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1101  		__team_port_disable_rx(team, port);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1102 =20
735d381fa57c57 drivers/net/team/team.c      Jiri Pirko         2013-06-10  =
1103  	team_adjust_ops(team);
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1104 =20
68f0833f279ac2 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1105  	if (tx_was_enabled)
3a0d6c5af5e526 drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1106  		team_lower_state_changed(port);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1107  }
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1108 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1109  static int team_port_enter(struct team *team, struct team_port *port)
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1110  {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1111  	int err =3D 0;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1112 =20
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1113  	dev_hold(netdev_from_priv(team));
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1114  	if (team->ops.port_enter) {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1115  		err =3D team->ops.port_enter(team, port);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1116  		if (err) {
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1117  			netdev_err(netdev_from_priv(team),
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1118  				   "Device %s failed to enter team mode\n",
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1119  				   port->dev->name);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1120  			goto err_port_enter;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1121  		}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1122  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1123 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1124  	return 0;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1125 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1126  err_port_enter:
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1127  	dev_put(netdev_from_priv(team));
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1128 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1129  	return err;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1130  }
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1131 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1132  static void team_port_leave(struct team *team, struct team_port *port)
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1133  {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1134  	if (team->ops.port_leave)
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1135  		team->ops.port_leave(team, port);
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1136  	dev_put(netdev_from_priv(team));
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1137  }
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1138 =20
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1139  #ifdef CONFIG_NET_POLL_CONTROLLER
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1140  static int __team_port_enable_netpoll(struct team_port *port)
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1141  {
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1142  	struct netpoll *np;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1143  	int err;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1144 =20
bf4afc53b77aea drivers/net/team/team_core.c Linus Torvalds     2026-02-21  =
1145  	np =3D kzalloc_obj(*np);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1146  	if (!np)
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1147  		return -ENOMEM;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1148 =20
a8779ec1c5e605 drivers/net/team/team.c      Eric W. Biederman  2014-03-27  =
1149  	err =3D __netpoll_setup(np, port->dev);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1150  	if (err) {
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1151  		kfree(np);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1152  		return err;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1153  	}
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1154  	port->np =3D np;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1155  	return err;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1156  }
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1157 =20
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1158  static int team_port_enable_netpoll(struct team_port *port)
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1159  {
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1160  	if (!netdev_from_priv(port->team)->npinfo)
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1161  		return 0;
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1162 =20
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1163  	return __team_port_enable_netpoll(port);
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1164  }
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1165 =20
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1166  static void team_port_disable_netpoll(struct team_port *port)
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1167  {
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1168  	struct netpoll *np =3D port->np;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1169 =20
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1170  	if (!np)
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1171  		return;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1172  	port->np =3D NULL;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1173 =20
c9fbd71f730943 drivers/net/team/team.c      Debabrata Banerjee 2018-10-18  =
1174  	__netpoll_free(np);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1175  }
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1176  #else
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24  =
1177  static int team_port_enable_netpoll(struct team_port *port)
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1178  {
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1179  	return 0;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1180  }
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1181  static void team_port_disable_netpoll(struct team_port *port)
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1182  {
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1183  }
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1184  #endif
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1185 =20
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1186  static int team_upper_dev_link(struct team *team, struct team_port *p=
ort,
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1187  			       struct netlink_ext_ack *extack)
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1188  {
8fd728566a354f drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1189  	struct netdev_lag_upper_info lag_upper_info;
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1190  	int err;
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1191 =20
8fd728566a354f drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1192  	lag_upper_info.tx_type =3D team->mode->lag_tx_type;
f44aa9ef7950a5 drivers/net/team/team.c      John Hurley        2018-05-23  =
1193  	lag_upper_info.hash_type =3D NETDEV_LAG_HASH_UNKNOWN;
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1194  	err =3D netdev_master_upper_dev_link(port->dev, netdev_from_priv(tea=
m),
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1195  					   NULL, &lag_upper_info, extack);
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1196  	if (err)
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1197  		return err;
8fd728566a354f drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1198  	port->dev->priv_flags |=3D IFF_TEAM_PORT;
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1199  	return 0;
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1200  }
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1201 =20
8fd728566a354f drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1202  static void team_upper_dev_unlink(struct team *team, struct team_port=
 *port)
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1203  {
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1204  	netdev_upper_dev_unlink(port->dev, netdev_from_priv(team));
8fd728566a354f drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1205  	port->dev->priv_flags &=3D ~IFF_TEAM_PORT;
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1206  }
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1207 =20
10f3f51d56648f drivers/net/team/team.c      Jiri Pirko         2012-09-21  =
1208  static void __team_port_change_port_added(struct team_port *port, boo=
l linkup);
1d76efe1577b43 drivers/net/team/team.c      Jiri Pirko         2012-08-17  =
1209  static int team_dev_type_check_change(struct net_device *dev,
1d76efe1577b43 drivers/net/team/team.c      Jiri Pirko         2012-08-17  =
1210  				      struct net_device *port_dev);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1211 =20
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1212  static int team_port_add(struct team *team, struct net_device *port_d=
ev,
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1213  			 struct netlink_ext_ack *extack)
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1214  {
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20  =
1215  	struct net_device *dev =3D netdev_from_priv(team);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1216  	struct team_port *port;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1217  	char *portname =3D port_dev->name;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1218  	int err;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1219 =20
1d76efe1577b43 drivers/net/team/team.c      Jiri Pirko         2012-08-17  =
1220  	if (port_dev->flags & IFF_LOOPBACK) {
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1221  		NL_SET_ERR_MSG(extack, "Loopback device can't be added as a team po=
rt");
1d76efe1577b43 drivers/net/team/team.c      Jiri Pirko         2012-08-17  =
1222  		netdev_err(dev, "Device %s is loopback device. Loopback devices can=
't be added as a team port\n",
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1223  			   portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1224  		return -EINVAL;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1225  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1226 =20
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1227  		if (port_dev->type =3D=3D ARPHRD_CAN ||
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1228  		    port_dev->type =3D=3D ARPHRD_IEEE802154 ||
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1229  		    port_dev->type =3D=3D ARPHRD_IEEE802154_MONITOR) {
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1230  			NL_SET_ERR_MSG(extack,
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1231  				       "CAN and IEEE 802.15.4 devices can't be added as a team po=
rt");
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1232  			netdev_err(dev, "Device %s is CAN or IEEE 802.15.4. These device t=
ypes can't be added as a team port\n",
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1233  				   portname);
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1234  			return -EINVAL;
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1235  		}
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28 @=
1236  	}
a97c4fcfc42bce drivers/net/team/team_core.c Jiale Yao          2026-07-28  =
1237 =20
acb10eac5100ba drivers/net/team/team.c      Julian Wiedmann    2019-03-29 @=
1238  	if (netif_is_team_port(port_dev)) {
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1239  		NL_SET_ERR_MSG(extack, "Device is already a port of a team device");
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1240  		netdev_err(dev, "Device %s is already a port "
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1241  				"of a team device\n", portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1242  		return -EBUSY;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1243  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1244 =20
471b83bd8bbe4e drivers/net/team/team.c      Ido Schimmel       2018-10-01  =
1245  	if (dev =3D=3D port_dev) {
471b83bd8bbe4e drivers/net/team/team.c      Ido Schimmel       2018-10-01  =
1246  		NL_SET_ERR_MSG(extack, "Cannot enslave team device to itself");
471b83bd8bbe4e drivers/net/team/team.c      Ido Schimmel       2018-10-01  =
1247  		netdev_err(dev, "Cannot enslave team device to itself\n");
471b83bd8bbe4e drivers/net/team/team.c      Ido Schimmel       2018-10-01  =
1248  		return -EINVAL;
471b83bd8bbe4e drivers/net/team/team.c      Ido Schimmel       2018-10-01  =
1249  	}
471b83bd8bbe4e drivers/net/team/team.c      Ido Schimmel       2018-10-01  =
1250 =20
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1251  	if (netdev_has_upper_dev(dev, port_dev)) {
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1252  		NL_SET_ERR_MSG(extack, "Device is already an upper device of the te=
am interface");
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1253  		netdev_err(dev, "Device %s is already an upper device of the team i=
nterface\n",
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1254  			   portname);
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1255  		return -EBUSY;
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1256  	}
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1257 =20
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1258  	if (netdev_has_upper_dev(port_dev, dev)) {
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1259  		NL_SET_ERR_MSG(extack, "Device is already a lower device of the tea=
m interface");
3fff5da4ca2164 drivers/net/team/team_core.c Octavian Purdila   2024-12-30  =
1260  		netdev_err(dev, "Device %s is already a lower device of the team in=
terface\n",
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1261  			   portname);
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1262  		return -EBUSY;
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1263  	}
925b0c841e066b drivers/net/team/team.c      Hangbin Liu        2019-04-19  =
1264 =20
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1265  	if (port_dev->features & NETIF_F_VLAN_CHALLENGED &&
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1266  	    vlan_uses_dev(dev)) {
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1267  		NL_SET_ERR_MSG(extack, "Device is VLAN challenged and team device h=
as VLAN set up");
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1268  		netdev_err(dev, "Device %s is VLAN challenged and team device has V=
LAN set up\n",
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1269  			   portname);
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1270  		return -EPERM;
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1271  	}
2c33bb37cb69dc drivers/net/team/team.c      Jiri Pirko         2012-08-23  =
1272 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1273  	if (port_dev->flags & IFF_UP) {
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27  =
1274  		NL_SET_ERR_MSG(extack, "Device is up. Set it down before adding it =
as a team port");
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1275  		netdev_err(dev, "Device %s is up. Set it down before adding it as a=
 team port\n",
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1276  			   portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1277  		return -EBUSY;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1278  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1279 =20
5149ee58385bdf drivers/net/team/team.c      Jiri Pirko         2012-06-19 @=
1280  	port =3D kzalloc(sizeof(struct team_port) + team->mode->port_priv_si=
ze,
5149ee58385bdf drivers/net/team/team.c      Jiri Pirko         2012-06-19  =
1281  		       GFP_KERNEL);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1282  	if (!port)
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1283  		return -ENOMEM;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1284 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1285  	port->dev =3D port_dev;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1286  	port->team =3D team;
8ff5105a2b9dd0 drivers/net/team/team.c      Jiri Pirko         2012-07-27 @=
1287  	INIT_LIST_HEAD(&port->qom_list);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1288 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1289  	port->orig.mtu =3D port_dev->mtu;
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1290  	/*
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1291  	 * MTU assignment will be handled in team_dev_type_check_change
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1292  	 * if dev and port_dev are of different types
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1293  	 */
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1294  	if (dev->type =3D=3D port_dev->type) {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1295  		err =3D dev_set_mtu(port_dev, dev->mtu);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1296  		if (err) {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1297  			netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1298  			goto err_set_mtu;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1299  		}
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1300  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1301 =20
1d76efe1577b43 drivers/net/team/team.c      Jiri Pirko         2012-08-17  =
1302  	memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev->addr_len);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1303 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1304  	err =3D team_port_enter(team, port);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1305  	if (err) {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1306  		netdev_err(dev, "Device %s failed to enter team mode\n",
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1307  			   portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1308  		goto err_port_enter;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1309  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1310 =20
00f54e68924eaf drivers/net/team/team.c      Petr Machata       2018-12-06 @=
1311  	err =3D dev_open(port_dev, extack);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1312  	if (err) {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1313  		netdev_dbg(dev, "Device %s opening failed\n",
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1314  			   portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1315  		goto err_dev_open;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1316  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1317 =20
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08 @=
1318  	err =3D vlan_vids_add_by_dev(port_dev, dev);
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1319  	if (err) {
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1320  		netdev_err(dev, "Failed to add vlan ids to device %s\n",
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1321  				portname);
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1322  		goto err_vids_add;
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1323  	}
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1324 =20
9cf2f437ca5b39 drivers/net/team/team.c      Xin Long           2018-04-24 @=
1325  	err =3D team_port_enable_netpoll(port);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1326  	if (err) {
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1327  		netdev_err(dev, "Failed to enable netpoll on device %s\n",
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1328  			   portname);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1329  		goto err_enable_netpoll;
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1330  	}
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1331 =20
fbe168ba91f7c3 drivers/net/team/team.c      Michal Kube=C4=8Dek     2014-11=
-13  1332  	if (!(dev->features & NETIF_F_LRO))
fbe168ba91f7c3 drivers/net/team/team.c      Michal Kube=C4=8Dek     2014-11=
-13  1333  		dev_disable_lro(port_dev);
fbe168ba91f7c3 drivers/net/team/team.c      Michal Kube=C4=8Dek     2014-11=
-13  1334 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1335  	err =3D netdev_rx_handler_register(port_dev, team_handle_frame,
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1336  					 port);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1337  	if (err) {
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1338  		netdev_err(dev, "Device %s failed to register rx_handler\n",
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1339  			   portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1340  		goto err_handler_register;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1341  	}
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1342 =20
44d15d930bb846 drivers/net/team/team.c      Ido Schimmel       2018-02-27 @=
1343  	err =3D team_upper_dev_link(team, port, extack);
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1344  	if (err) {
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1345  		netdev_err(dev, "Device %s failed to set upper link\n",
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1346  			   portname);
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1347  		goto err_set_upper_link;
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1348  	}
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1349 =20
35b384bd14f91c drivers/net/team/team.c      Jiri Pirko         2012-06-19 @=
1350  	err =3D __team_option_inst_add_port(team, port);
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1351  	if (err) {
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1352  		netdev_err(dev, "Device %s failed to add per-port options\n",
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1353  			   portname);
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1354  		goto err_option_port_add;
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1355  	}
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1356 =20
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1357  	/* set promiscuity level to new slave */
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1358  	if (dev->flags & IFF_PROMISC) {
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1359  		err =3D dev_set_promiscuity(port_dev, 1);
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1360  		if (err)
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1361  			goto err_set_slave_promisc;
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1362  	}
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1363 =20
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1364  	/* set allmulti level to new slave */
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1365  	if (dev->flags & IFF_ALLMULTI) {
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1366  		err =3D dev_set_allmulti(port_dev, 1);
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1367  		if (err) {
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1368  			if (dev->flags & IFF_PROMISC)
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1369  				dev_set_promiscuity(port_dev, -1);
aee0f01b4f1188 drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-28  =
1370  			goto err_set_slave_allmulti;
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1371  		}
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1372  	}
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1373 =20
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1374  	err =3D team_dev_type_check_change(dev, port_dev);
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1375  	if (err)
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1376  		goto err_set_dev_type;
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22  =
1377 =20
bd60234222b2fd drivers/net/team/team.c      Benjamin Poirier   2022-09-07  =
1378  	if (dev->flags & IFF_UP) {
982cf3b3999d39 drivers/net/team/team.c      Xin Long           2018-03-26  =
1379  		netif_addr_lock_bh(dev);
982cf3b3999d39 drivers/net/team/team.c      Xin Long           2018-03-26  =
1380  		dev_uc_sync_multiple(port_dev, dev);
982cf3b3999d39 drivers/net/team/team.c      Xin Long           2018-03-26  =
1381  		dev_mc_sync_multiple(port_dev, dev);
982cf3b3999d39 drivers/net/team/team.c      Xin Long           2018-03-26  =
1382  		netif_addr_unlock_bh(dev);
bd60234222b2fd drivers/net/team/team.c      Benjamin Poirier   2022-09-07  =
1383  	}
982cf3b3999d39 drivers/net/team/team.c      Xin Long           2018-03-26  =
1384 =20
fa6ed31dd913b0 drivers/net/team/team_core.c Marc Harvey        2026-04-09  =
1385  	WRITE_ONCE(port->tx_index, -1);
19a0b58e506b06 drivers/net/team/team.c      Jiri Pirko         2012-04-20  =
1386  	list_add_tail_rcu(&port->list, &team->port_list);
72df935d985c15 drivers/net/team/team.c      Jiri Pirko         2013-06-08 @=
1387  	team_port_enable(team, port);
9027497a25e3c9 drivers/net/team/team_core.c Qingfang Deng      2026-03-20 @=
1388  	netdev_compute_master_upper_features(dev, true);
a6882c1583262d drivers/net/team/team_core.c Jakub Kicinski     2026-06-02 @=
1389  	netdev_lock_ops(port_dev);
8c7a77267eec81 drivers/net/team/team.c      George Wilkie      2019-02-20 @=
1390  	__team_port_change_port_added(port, !!netif_oper_up(port_dev));
a6882c1583262d drivers/net/team/team_core.c Jakub Kicinski     2026-06-02 @=
1391  	netdev_unlock_ops(port_dev);
35b384bd14f91c drivers/net/team/team.c      Jiri Pirko         2012-06-19 @=
1392  	__team_options_change_check(team);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1393 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1394  	netdev_info(dev, "Port device %s added\n", portname);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1395 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1396  	return 0;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1397 =20
0ae9cfc454ea5e drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-22 @=
1398  err_set_dev_type:
aee0f01b4f1188 drivers/net/team/team_core.c Nikola Z. Ivanov   2025-11-28  =
1399  err_set_slave_allmulti:
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1400  err_set_slave_promisc:
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1401  	__team_option_inst_del_port(team, port);
43c2adb9df7ddd drivers/net/team/team.c      Hangbin Liu        2019-04-08  =
1402 =20
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1403  err_option_port_add:
8fd728566a354f drivers/net/team/team.c      Jiri Pirko         2015-12-03  =
1404  	team_upper_dev_unlink(team, port);
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1405 =20
d7d3c05135f37d drivers/net/team/team.c      Jiri Pirko         2014-08-25  =
1406  err_set_upper_link:
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1407  	netdev_rx_handler_unregister(port_dev);
80f7c6683fe0e8 drivers/net/team/team.c      Jiri Pirko         2012-04-10  =
1408 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1409  err_handler_register:
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1410  	team_port_disable_netpoll(port);
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1411 =20
bd2d0837abc020 drivers/net/team/team.c      Jiri Pirko         2012-07-17  =
1412  err_enable_netpoll:
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1413  	vlan_vids_del_by_dev(port_dev, dev);
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1414 =20
57459185a19b02 drivers/net/team/team.c      Jiri Pirko         2011-12-08  =
1415  err_vids_add:
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1416  	dev_close(port_dev);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1417 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1418  err_dev_open:
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1419  	team_port_leave(team, port);
1d76efe1577b43 drivers/net/team/team.c      Jiri Pirko         2012-08-17 @=
1420  	team_port_set_orig_dev_addr(port);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1421 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1422  err_port_enter:
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1423  	dev_set_mtu(port_dev, port->orig.mtu);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1424 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1425  err_set_mtu:
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1426  	kfree(port);
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1427 =20
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1428  	return err;
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11 @=
1429  }
3d249d4ca7d0ed drivers/net/team/team.c      Jiri Pirko         2011-11-11  =
1430 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
