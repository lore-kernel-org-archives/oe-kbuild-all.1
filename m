Content-Type: multipart/mixed; boundary="===============1380196447185240852=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [jwboyer-fedora:f31 15/46] drivers/pci/controller/pcie-brcmstb.c:545:13-16: ERROR: Missing resource_size with res
Date: Wed, 26 Feb 2020 02:21:11 +0800
Message-ID: <202002260236.4E73SrpH%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1380196447185240852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jwboyer/fedora.git =
f31
head:   4382f76bc8ef9fce5e7e96d4cdb0c073564ad249
commit: e75e162cd3b2056352a4797879dbd5c2d9fd8f2e [15/46] PCI: brcmstb: Add =
Broadcom STB PCIe host controller driver

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/pci/controller/pcie-brcmstb.c:545:13-16: ERROR: Missing resource=
_size with res

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1380196447185240852==--

