Content-Type: multipart/mixed; boundary="===============1080518701239863902=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [omap-audio:peter/linux-next-wip 86/97] sound/soc/ti/omap-mcasp.c:691:3-8: No need to set .owner here. The core will do it.
Date: Tue, 04 Feb 2020 22:03:10 +0800
Message-ID: <202002042204.xtxoqBqR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1080518701239863902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   ae02767e557d4b75a99b7a5ea70c26594c54b5fb
commit: d9878b7a84c892731f887558e9d0fbe6965d5b0f [86/97] omap: mcasp: add o=
map-mcasp.* and add to Kconfig, Makefile

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> sound/soc/ti/omap-mcasp.c:691:3-8: No need to set .owner here. The core =
will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1080518701239863902==--

