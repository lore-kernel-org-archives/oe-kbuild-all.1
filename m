Content-Type: multipart/mixed; boundary="===============2219020863283525154=="
MIME-Version: 1.0
From: Lars Povlsen <lars.povlsen@microchip.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 09/14] pinctrl: ocelot: Add Sparx5 SoC support
Date: Fri, 15 May 2020 17:52:46 +0200
Message-ID: <87y2ptnqk1.fsf@soft-dev15.microsemi.net>
In-Reply-To: <202005150200.wnjISCrm%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2219020863283525154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


kbuild test robot writes:

> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e content is safe
>
> Hi Lars,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on pinctrl/devel clk/clk-next linus/master v5.7-=
rc5 next-20200512]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Lars-Povlsen/Adding-supp=
ort-for-Microchip-Sparx5-SoC/20200514-163536
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Dpowerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> drivers/pinctrl/pinctrl-ocelot.c:28: warning: "clrsetbits" redefined
> 28 | #define clrsetbits(addr, clear, set)          |
> In file included from include/linux/io.h:13,
> from include/linux/irq.h:20,
> from include/linux/gpio/driver.h:7,
> from drivers/pinctrl/pinctrl-ocelot.c:10:
> arch/powerpc/include/asm/io.h:849: note: this is the location of the prev=
ious definition
> 849 | #define clrsetbits(type, addr, clear, set)          |
>
> vim +/clrsetbits +28 drivers/pinctrl/pinctrl-ocelot.c
>
>     27
>   > 28  #define clrsetbits(addr, clear, set) \
>     29          writel((readl(addr) & ~(clear)) | (set), (addr))
>     30
>

I'll change the code to avoid the name clash.

Thanks,


> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

-- =

Lars Povlsen,
Microchip
--===============2219020863283525154==--

