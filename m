Content-Type: multipart/mixed; boundary="===============3216050611740526310=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [monstr-microblaze:master-next-test 37/84] drivers/clk/clk-xlnx-clock-wizard.c:125:43: sparse: sparse: cast removes address space '<asn:2>' of expression
Date: Tue, 26 Jan 2021 04:06:44 +0800
Message-ID: <202101260439.XUx8TN2v-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3216050611740526310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.monstr.eu/linux-2.6-microblaze master-next-test
head:   851bfc6a2e2551b819a7f0d8791ea0a0cce089bf
commit: 060ba9cd02a160888fe34a4f0b97e5933ceeb2b0 [37/84] clk: clocking-wiza=
rd: Move clocking wizard out of staging area
config: arc-randconfig-s031-20210125 (attached as .config)
compiler: arceb-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-212-g56dbccf5-dirty
        git remote add monstr-microblaze git://git.monstr.eu/linux-2.6-micr=
oblaze
        git fetch --no-tags monstr-microblaze master-next-test
        git checkout 060ba9cd02a160888fe34a4f0b97e5933ceeb2b0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/clk/clk-xlnx-clock-wizard.c:125:43: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
   drivers/clk/clk-xlnx-clock-wizard.c:144:43: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
   drivers/clk/clk-xlnx-clock-wizard.c:225:43: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
   drivers/clk/clk-xlnx-clock-wizard.c:244:43: sparse: sparse: cast removes=
 address space '<asn:2>' of expression
   drivers/clk/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_rate':
   drivers/clk/clk-xlnx-clock-wizard.c:125:21: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
     125 |    (void __iomem *)((u64)divider->base + divider->offset);
         |                     ^
   drivers/clk/clk-xlnx-clock-wizard.c:125:4: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
     125 |    (void __iomem *)((u64)divider->base + divider->offset);
         |    ^
   drivers/clk/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_dynamic_recon=
fig':
   drivers/clk/clk-xlnx-clock-wizard.c:144:21: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
     144 |    (void __iomem *)((u64)divider->base + divider->offset);
         |                     ^
   drivers/clk/clk-xlnx-clock-wizard.c:144:4: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
     144 |    (void __iomem *)((u64)divider->base + divider->offset);
         |    ^
   drivers/clk/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_ratef':
   drivers/clk/clk-xlnx-clock-wizard.c:225:21: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
     225 |    (void __iomem *)((u64)divider->base + divider->offset);
         |                     ^
   drivers/clk/clk-xlnx-clock-wizard.c:225:4: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
     225 |    (void __iomem *)((u64)divider->base + divider->offset);
         |    ^
   drivers/clk/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_dynamic_recon=
fig_f':
   drivers/clk/clk-xlnx-clock-wizard.c:244:21: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
     244 |    (void __iomem *)((u64)divider->base + divider->offset);
         |                     ^
   drivers/clk/clk-xlnx-clock-wizard.c:244:4: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
     244 |    (void __iomem *)((u64)divider->base + divider->offset);
         |    ^

vim +125 drivers/clk/clk-xlnx-clock-wizard.c

74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  119  =

74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  120  static unsigned long clk_wzrd_recalc_rate(stru=
ct clk_hw *hw,
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  121  					  unsigned long parent_rate)
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  122  {
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  123  	struct clk_wzrd_divider *divider =3D to_clk_w=
zrd_divider(hw);
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  124  	void __iomem *div_addr =3D
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10 @125  			(void __iomem *)((u64)divider->base + divid=
er->offset);
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  126  	unsigned int val;
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  127  =

74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  128  	val =3D readl(div_addr) >> divider->shift;
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  129  	val &=3D div_mask(divider->width);
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  130  =

74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  131  	return divider_recalc_rate(hw, parent_rate, v=
al, divider->table,
26a8a4d03250e9f7 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Mi=
chal Simek  2018-11-27  132  			divider->flags, divider->width);
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  133  }
74788b36bff8a38b drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Ch=
irag Parekh 2018-09-10  134  =


:::::: The code at line 125 was first introduced by commit
:::::: 74788b36bff8a38bd9070823a3e5e03dcb77c99c staging: clocking-wizard: A=
dd support for dynamic reconfiguration

:::::: TO: Chirag Parekh <chirag.parekh@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3216050611740526310==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3216050611740526310==--

