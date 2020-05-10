Content-Type: multipart/mixed; boundary="===============3860737704550626101=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 1266/7905] drivers/soc/mediatek/mtk-mmsys.c:28:1-3: WARNING: PTR_ERR_OR_ZERO can be used
Date: Sun, 10 May 2020 10:53:37 +0800
Message-ID: <202005101033.xLBIJF9V%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3860737704550626101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: 13032709e2328553970f0002df5edce6aac69425 [1266/7905] clk / soc: med=
iatek: Move mt8173 MMSYS to platform driver

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/soc/mediatek/mtk-mmsys.c:28:1-3: WARNING: PTR_ERR_OR_ZERO can be=
 used

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3860737704550626101==--

