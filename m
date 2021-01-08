Content-Type: multipart/mixed; boundary="===============7434970046873911829=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [arm-platforms:kvm-arm64/pmu-undef-fixes 29/30] arch/arm64/kvm/sys_regs.c:1544:13: warning: initializer overrides prior initialization of this subobject
Date: Fri, 08 Jan 2021 14:29:53 +0000
Message-ID: <074e77e62c94400da4bac17e1aa137e9@kernel.org>
In-Reply-To: <202101082253.LtrQbZvn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7434970046873911829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-08 14:18, kernel test robot wrote:
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> kvm-arm64/pmu-undef-fixes
> head:   248735e2001115f36e70105cb9dadff95a9fdb42
> commit: 9bde3c476c881793f310f38a5f705b0394283f8b [29/30] KVM: arm64:
> Hide PMU registers from userspace when not available
> config: arm64-randconfig-r012-20210108 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> 5c951623bc8965fa1e89660f2f5f4a2944e4981a)
> reproduce (this is a W=3D1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/com=
mit/?id=3D9bde3c476c881793f310f38a5f705b0394283f8b
>         git remote add arm-platforms
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
>         git fetch --no-tags arm-platforms kvm-arm64/pmu-undef-fixes
>         git checkout 9bde3c476c881793f310f38a5f705b0394283f8b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =

> ARCH=3Darm64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>>> arch/arm64/kvm/sys_regs.c:1544:13: warning: initializer overrides =

>>> prior initialization of this subobject [-Winitializer-overrides]
>              .reset =3D reset_pmcr, .reg =3D PMCR_EL0 },
>                       ^~~~~~~~~~
>    arch/arm64/kvm/sys_regs.c:1543:4: note: previous initialization is =

> here
>            { PMU_SYS_REG(SYS_PMCR_EL0), .access =3D access_pmcr,
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro =

> 'PMU_SYS_REG'
>            SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D =

> pmu_visibility
>                                  ^~~~~~~~~~~~~

[...]

No, this is correct and done on purpose. There is a default =

initialisation,
and some structures do override the default.

         M.
-- =

Jazz is not dead. It just smells funny...
--===============7434970046873911829==--

