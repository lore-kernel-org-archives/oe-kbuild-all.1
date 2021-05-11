Content-Type: multipart/mixed; boundary="===============6903099787769219296=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date: Tue, 11 May 2021 19:22:56 +0300
Message-ID: <d0b84024-2f91-bc0a-8d3b-ec342ac4812d@gmail.com>
In-Reply-To: <202105112327.nAMH7lzl-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6903099787769219296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

11.05.2021 18:43, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Dmitry,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on tegra/for-next]
> [also build test ERROR on v5.13-rc1 next-20210511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Enable-c=
ompile-testing-for-Tegra-memory-drivers/20210511-053910
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git f=
or-next
> config: parisc-randconfig-r011-20210511 (attached as .config)
> compiler: hppa64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/ecd67b1d49eb33c9821130a=
2b3b896bab395118d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Enable-compile-t=
esting-for-Tegra-memory-drivers/20210511-053910
>         git checkout ecd67b1d49eb33c9821130a2b3b896bab395118d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dparisc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    hppa64-linux-ld: drivers/memory/tegra/tegra20-emc.o: in function `.LC9=
':
>>> (.data.rel.ro+0x30): undefined reference to `tegra20_clk_set_emc_round_=
callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra20-emc.o: in function `.LC5=
2':
>    (.data.rel.ro+0xe0): undefined reference to `tegra20_clk_set_emc_round=
_callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra30-emc.o: in function `.LC1=
1':
>>> (.data.rel.ro+0x30): undefined reference to `tegra20_clk_set_emc_round_=
callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra30-emc.o: in function `.LC4=
8':
>    (.data.rel.ro+0xd0): undefined reference to `tegra20_clk_set_emc_round=
_callback'
>    hppa64-linux-ld: drivers/memory/tegra/tegra30-emc.o: in function `.LC6=
0':
>>> (.data.rel.ro+0x118): undefined reference to `tegra20_clk_prepare_emc_m=
c_same_freq'
>    hppa64-linux-ld: drivers/memory/tegra/tegra124-emc.o: in function `.LC=
3':
>>> (.data.rel.ro+0x10): undefined reference to `tegra124_clk_set_emc_callb=
acks'
>    hppa64-linux-ld: drivers/memory/tegra/tegra124-emc.o: in function `.LC=
55':
>    (.data.rel.ro+0x110): undefined reference to `tegra124_clk_set_emc_cal=
lbacks'
> =

> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for TEGRA124_CLK_EMC
>    Depends on COMMON_CLK
>    Selected by
>    - TEGRA124_EMC && MEMORY && TEGRA_MC && (ARCH_TEGRA_124_SOC || COMPILE=
_TEST

I'll fix these missing stubs in v2.
--===============6903099787769219296==--

