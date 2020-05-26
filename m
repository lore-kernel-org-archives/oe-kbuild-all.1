Content-Type: multipart/mixed; boundary="===============7518316681353920689=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] clk: Remove CONFIG_ARCH_HISI check for subdir hisilicon
Date: Wed, 27 May 2020 02:55:46 +0800
Message-ID: <202005270245.sb1paW0C%lkp@intel.com>
In-Reply-To: <1590377516-32117-2-git-send-email-yangtiezhu@loongson.cn>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7518316681353920689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v5.7-rc7 next-20200526]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Tiezhu-Yang/clk-hisilicon-=
Use-correct-return-value-about-hisi_reset_init/20200525-113342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_rate':
>> clk.c:(.text+0x9e): undefined reference to `clk_register_fixed_rate'
>> ld: clk.c:(.text+0xdf): undefined reference to `clk_unregister_fixed_rat=
e'
ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_facto=
r':
>> clk.c:(.text+0x117): undefined reference to `clk_register_fixed_factor'
>> ld: clk.c:(.text+0x158): undefined reference to `clk_unregister_fixed_fa=
ctor'
ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_mux':
>> clk.c:(.text+0x1cb): undefined reference to `clk_register_mux_table'
>> ld: clk.c:(.text+0x1f2): undefined reference to `clk_register_clkdev'
>> ld: clk.c:(.text+0x21a): undefined reference to `clk_unregister_mux'
ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_divider':
>> clk.c:(.text+0x2c9): undefined reference to `clk_register_divider_table'
ld: clk.c:(.text+0x2e3): undefined reference to `clk_register_clkdev'
>> ld: clk.c:(.text+0x311): undefined reference to `clk_unregister_divider'
ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate':
>> clk.c:(.text+0x36c): undefined reference to `clk_register_gate'
ld: clk.c:(.text+0x393): undefined reference to `clk_register_clkdev'
>> ld: clk.c:(.text+0x3bb): undefined reference to `clk_unregister_gate'
ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate_sep':
>> clk.c:(.text+0x425): undefined reference to `clk_register_clkdev'
ld: drivers/clk/hisilicon/clk.o: in function `hi6220_clk_register_divider':
>> clk.c:(.init.text+0x5d): undefined reference to `clk_register_clkdev'
ld: drivers/clk/hisilicon/clkgate-separated.o: in function `hisi_register_c=
lkgate_sep':
>> clkgate-separated.c:(.text+0xf0): undefined reference to `clk_register'
ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_s=
et_rate':
>> clkdivider-hi6220.c:(.text+0x16): undefined reference to `divider_get_va=
l'
ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_r=
ecalc_rate':
>> clkdivider-hi6220.c:(.text+0x8a): undefined reference to `divider_recalc=
_rate'
ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_r=
ound_rate':
>> clkdivider-hi6220.c:(.text+0xa9): undefined reference to `clk_hw_get_par=
ent'
>> ld: clkdivider-hi6220.c:(.text+0xbd): undefined reference to `divider_ro=
und_rate_parent'
ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_register=
_clkdiv':
>> clkdivider-hi6220.c:(.text+0x1c5): undefined reference to `clk_register'
ld: drivers/clk/hisilicon/clk-hisi-phase.o: in function `clk_register_hisi_=
phase':
>> clk-hisi-phase.c:(.text+0x121): undefined reference to `devm_clk_registe=
r'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7518316681353920689==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Hfmao57/AZ0i3udtaAAA
--===============7518316681353920689==--

