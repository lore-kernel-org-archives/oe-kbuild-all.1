Content-Type: multipart/mixed; boundary="===============8265381256393476406=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: kbuild-all@lists.01.org
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Date: Thu, 20 Feb 2020 07:54:29 -0800
Message-ID: <20200220155429.GH37466@atomide.com>
In-Reply-To: <202002131856.VeW4PhBJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8265381256393476406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andrew,

* kbuild test robot <lkp@intel.com> [200213 10:27]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   0bf999f9c5e74c7ecf9dafb527146601e5c848b9
> commit: c37baa06f8a970e4a533d41f7d33e5e57de5ad25 ARM: OMAP2+: Fix undefin=
ed reference to omap_secure_init
> date:   3 weeks ago
> config: arm-randconfig-a001-20200213 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout c37baa06f8a970e4a533d41f7d33e5e57de5ad25
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    arch/arm/mach-omap2/omap-secure.o: In function `omap_smccc_smc':
> >> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'

Have you looked at this one? Looks like there's still an unhandled
randconfig build case.

Regards,

Tony
--===============8265381256393476406==--

