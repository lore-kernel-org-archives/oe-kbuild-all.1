Content-Type: multipart/mixed; boundary="===============6612741564200322903=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [brauner:rtm_newlink_device_ownership 9/10] net/core/net-sysfs.c:1000:5: sparse: sparse: symbol 'net_rx_queue_change_owner' was not declared. Should it be static?
Date: Fri, 14 Feb 2020 06:07:39 +0800
Message-ID: <202002140651.3Ri4hWg4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6612741564200322903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git r=
tm_newlink_device_ownership
head:   49d07791c3d4f73d5c7db0491a9562db3e4a74f9
commit: 7911cab5a7fd5a3c1d687659532e493d22c095a0 [9/10] net-sysfs: add queu=
e_change_owner()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout 7911cab5a7fd5a3c1d687659532e493d22c095a0
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/core/net-sysfs.c:1000:5: sparse: sparse: symbol 'net_rx_queue_change=
_owner' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6612741564200322903==--

