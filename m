Content-Type: multipart/mixed; boundary="===============5153896599307506390=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm-platforms:pci/xilinx 3/3] checkpatch: ERROR: space required before the open parenthesis '('
Date: Sun, 24 May 2020 23:17:06 +0800
Message-ID: <20200524151706.GB17853@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5153896599307506390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it pci/xilinx
head:   8b5d158374e59edf26e61c512eeb00ca7c9d891d
commit: 8b5d158374e59edf26e61c512eeb00ca7c9d891d [3/3] PCI: xilinx-cpm: Rev=
amp irq handling
reproduce:
        scripts/checkpatch.pl 0001-PCI-xilinx-cpm-Revamp-irq-handling.patch

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

# many are suggestions rather than must-fix

ERROR: space required before the open parenthesis '('
#456: drivers/pci/controller/pcie-xilinx-cpm.c:342:
+	switch(d->hwirq) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5153896599307506390==--

