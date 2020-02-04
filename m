Content-Type: multipart/mixed; boundary="===============7612702790668160507=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-5.4.y 2308/2429] drivers/mmc/host/sdhci-pci-core.c:1607:6: sparse: sparse: symbol 'amd_sdhci_reset' was not declared. Should it be static?
Date: Wed, 05 Feb 2020 07:18:49 +0800
Message-ID: <202002050744.h2qH0Mph%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7612702790668160507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.4.y
head:   a59b851019bc15226d5c7c31ac4e0452e9a57d13
commit: ac342e0a1f186954013024079da24b5beaa9276d [2308/2429] mmc: sdhci-pci=
: Quirk for AMD SDHC Device 0x7906
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout ac342e0a1f186954013024079da24b5beaa9276d
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mmc/host/sdhci-pci-core.c:1607:6: sparse: sparse: symbol 'amd_sd=
hci_reset' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============7612702790668160507==--

