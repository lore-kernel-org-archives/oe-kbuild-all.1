Content-Type: multipart/mixed; boundary="===============3410594982464404227=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 08/14] memory: tegra: Enable compile testing for all drivers
Date: Mon, 31 May 2021 22:08:19 +0300
Message-ID: <3dedc9da-66ff-83ed-836a-5ff6ff321dc9@gmail.com>
In-Reply-To: <202105311837.4zaj25Fo-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3410594982464404227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

31.05.2021 14:01, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Dmitry,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on regulator/for-next]
> [also build test ERROR on robh/for-next v5.13-rc4 next-20210528]
> [cannot apply to tegra/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/NVIDIA-T=
egra-memory-and-power-management-changes-for-5-14/20210528-075529
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator=
.git for-next
> config: arm64-randconfig-r013-20210531 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc67=
99f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/a384967a654ee34cdf5ade1=
92aaccecf0adac21e
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/NVIDIA-Tegra-mem=
ory-and-power-management-changes-for-5-14/20210528-075529
>         git checkout a384967a654ee34cdf5ade192aaccecf0adac21e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>>> ld.lld: error: undefined symbol: tegra20_clk_set_emc_round_callback
>    >>> referenced by tegra20-emc.c
>    >>> memory/tegra/tegra20-emc.o:(tegra_emc_init_clk) in archive drivers=
/built-in.a
>    >>> referenced by tegra20-emc.c
>    >>> memory/tegra/tegra20-emc.o:(tegra_emc_init_clk) in archive drivers=
/built-in.a
>    >>> referenced by tegra20-emc.c
>    >>> memory/tegra/tegra20-emc.o:(devm_tegra_emc_unset_callback) in arch=
ive drivers/built-in.a
>    >>> referenced 3 more times
> --
>>> ld.lld: error: undefined symbol: tegra20_clk_prepare_emc_mc_same_freq
>    >>> referenced by tegra30-emc.c
>    >>> memory/tegra/tegra30-emc.o:(emc_clk_change_notify) in archive driv=
ers/built-in.a
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =


I missed that T20/30 clk drivers are built conditionally based on
CONFIG_ARCH_TEGRA_xx_SOC. Will fix this.
--===============3410594982464404227==--

