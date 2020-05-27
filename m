Content-Type: multipart/mixed; boundary="===============8135386890259293215=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] clk: Remove CONFIG_ARCH_HISI check for subdir hisilicon
Date: Wed, 27 May 2020 12:13:39 +0800
Message-ID: <202005271255.gDGHLamZ%lkp@intel.com>
In-Reply-To: <1590377516-32117-2-git-send-email-yangtiezhu@loongson.cn>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8135386890259293215==
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
config: m68k-allnoconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_=
fixed_rate':
clk.c:(.text+0xd0): undefined reference to `clk_register_fixed_rate'
>> m68k-linux-ld: clk.c:(.text+0x120): undefined reference to `clk_unregist=
er_fixed_rate'
m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_=
fixed_factor':
clk.c:(.text+0x166): undefined reference to `clk_register_fixed_factor'
>> m68k-linux-ld: clk.c:(.text+0x1ba): undefined reference to `clk_unregist=
er_fixed_factor'
m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_=
mux':
clk.c:(.text+0x208): undefined reference to `clk_register_mux_table'
>> m68k-linux-ld: clk.c:(.text+0x210): undefined reference to `clk_register=
_clkdev'
>> m68k-linux-ld: clk.c:(.text+0x2a8): undefined reference to `clk_unregist=
er_mux'
m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_=
divider':
clk.c:(.text+0x360): undefined reference to `clk_register_divider_table'
m68k-linux-ld: clk.c:(.text+0x366): undefined reference to `clk_register_cl=
kdev'
>> m68k-linux-ld: clk.c:(.text+0x3f0): undefined reference to `clk_unregist=
er_divider'
m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_=
gate':
clk.c:(.text+0x43c): undefined reference to `clk_register_gate'
m68k-linux-ld: clk.c:(.text+0x442): undefined reference to `clk_register_cl=
kdev'
>> m68k-linux-ld: clk.c:(.text+0x4c0): undefined reference to `clk_unregist=
er_gate'
m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_=
gate_sep':
clk.c:(.text+0x510): undefined reference to `clk_register_clkdev'
m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hi6220_clk_registe=
r_divider':
clk.c:(.init.text+0x16): undefined reference to `clk_register_clkdev'
m68k-linux-ld: drivers/clk/hisilicon/clkgate-separated.o: in function `hisi=
_register_clkgate_sep':
clkgate-separated.c:(.text+0x128): undefined reference to `clk_register'
>> m68k-linux-ld: clkgate-separated.c:(.text+0x176): undefined reference to=
 `clk_register'
m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi62=
20_clkdiv_set_rate':
clkdivider-hi6220.c:(.text+0x26): undefined reference to `divider_get_val'
m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi62=
20_clkdiv_round_rate':
clkdivider-hi6220.c:(.text+0xa6): undefined reference to `clk_hw_get_parent'
>> m68k-linux-ld: clkdivider-hi6220.c:(.text+0xc0): undefined reference to =
`divider_round_rate_parent'
m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi62=
20_clkdiv_recalc_rate':
clkdivider-hi6220.c:(.text+0x10a): undefined reference to `divider_recalc_r=
ate'
m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi62=
20_register_clkdiv':
clkdivider-hi6220.c:(.text+0x1f8): undefined reference to `clk_register'
m68k-linux-ld: drivers/clk/hisilicon/clk-hisi-phase.o: in function `clk_reg=
ister_hisi_phase':
clk-hisi-phase.c:(.text+0x172): undefined reference to `devm_clk_register'
>> m68k-linux-ld: clk-hisi-phase.c:(.text+0x1e2): undefined reference to `d=
evm_clk_register'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8135386890259293215==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8135386890259293215==--

