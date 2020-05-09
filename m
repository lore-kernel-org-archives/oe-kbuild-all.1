Content-Type: multipart/mixed; boundary="===============3939639632568808678=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [omap-audio:peter/linux-next-wip 76/89] sound/soc/ti/omap-mcasp.c:691:3-8: No need to set .owner here. The core will do it.
Date: Sat, 09 May 2020 23:20:19 +0800
Message-ID: <202005092317.l1ypyMzL%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3939639632568808678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   28a4f7200aca92725580b4399cfc33da62c3f676
commit: ccd7889c1dfc17842c3600c2f59f22e1363002a2 [76/89] omap: mcasp: add o=
map-mcasp.* and add to Kconfig, Makefile

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> sound/soc/ti/omap-mcasp.c:691:3-8: No need to set .owner here. The core =
will do it.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3939639632568808678==--

