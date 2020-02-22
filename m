Content-Type: multipart/mixed; boundary="===============6546402779752650266=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hverkuil-media:tc358840 2/4] drivers/media/i2c/tc358840.c:3410:3-8: No need to set .owner here. The core will do it.
Date: Sat, 22 Feb 2020 21:19:03 +0800
Message-ID: <202002222148.FZDueoAa%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6546402779752650266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://linuxtv.org/hverkuil/media_tree.git tc358840
head:   54531afb55437b5dc44ce1bcf5f2e70889dc388d
commit: 217099c727b7a16fc643749d3bb9ddc3650315f4 [2/4] tc358840: add Toshib=
a tc358840 HDMI-to-CSI bridge.

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/media/i2c/tc358840.c:3410:3-8: No need to set .owner here. The c=
ore will do it.
--
>> drivers/media/i2c/tc358840.c:3346:5-8: Unneeded variable: "err". Return =
"0" on line 3362
   drivers/media/i2c/tc358840.c:3367:5-8: Unneeded variable: "err". Return =
"0" on line 3383

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6546402779752650266==--

