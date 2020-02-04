Content-Type: multipart/mixed; boundary="===============8288504522881491924=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [net:master 40/48] drivers/net/netdevsim/dev.c:937:1-3: WARNING: PTR_ERR_OR_ZERO can be used
Date: Tue, 04 Feb 2020 22:21:57 +0800
Message-ID: <202002042248.5gLay9S1%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8288504522881491924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
head:   83b43045308ea0600099830292955f18818f8d5e
commit: 6556ff32f12d0a5380dd2fa6bbaa01373925a7d1 [40/48] netdevsim: use IS_=
ERR instead of IS_ERR_OR_NULL for debugfs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/netdevsim/dev.c:937:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============8288504522881491924==--

