Content-Type: multipart/mixed; boundary="===============5142401721576578371=="
MIME-Version: 1.0
From: Bjorn Helgaas <helgaas@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/pci/controller/dwc/pcie-tegra194.c:243:27: warning: unused variable 'pcie_gen_freq'
Date: Fri, 07 May 2021 12:50:51 -0500
Message-ID: <20210507175051.GA1521138@bjorn-Precision-5520>
In-Reply-To: <202105080046.TTuEQIwi-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5142401721576578371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 08, 2021 at 12:33:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   a48b0872e69428d3d02994dcfad3519f01def7fa
> commit: 7f100744749e4fe547dece3bb6557fae5f0a7252 PCI: tegra: Add Tegra194=
 MCFG quirks for ECAM errata
> date:   3 weeks ago
> config: arm64-randconfig-r013-20210507 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a3a8=
a1a15b524d91b5308db68e9d293b34cd88dd)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D7f100744749e4fe547dece3bb6557fae5f0a7252
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7f100744749e4fe547dece3bb6557fae5f0a7252
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Darm64 =


Thanks for the report!

Just FYI, I followed the instructions above and got this:

  12:32:35 ~/linux (kbuild)$ COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3D=
clang make.cross W=3D1 ARCH=3Darm64
  Compiler will be installed in /home/bjorn/0day
  cd: received redirection to `https://download.01.org/0day-ci/cross-packag=
e/'
  lftpget -c https://download.01.org/0day-ci/cross-package/./clang-latest/c=
lang.tar.xz
  tar Jxf clang-latest/clang.tar.xz -C /home/bjorn/0day
  make CONFIG_OF_ALL_DTBS=3Dy CONFIG_DTC=3Dy HOSTCC=3D/home/bjorn/0day/clan=
g-latest/bin/clang CC=3D/home/bjorn/0day/clang-latest/bin/clang LD=3D/home/=
bjorn/0day/clang-latest/bin/ld.lld HOSTLD=3D/home/bjorn/0day/clang-latest/b=
in/ld.lld AR=3D/home/bjorn/0day/clang-latest/bin/llvm-ar NM=3D/home/bjorn/0=
day/clang-latest/bin/llvm-nm STRIP=3D/home/bjorn/0day/clang-latest/bin/llvm=
-strip OBJDUMP=3D/home/bjorn/0day/clang-latest/bin/llvm-objdump OBJSIZE=3D/=
home/bjorn/0day/clang-latest/bin/llvm-size READELF=3D/home/bjorn/0day/clang=
-latest/bin/llvm-readelf HOSTCXX=3D/home/bjorn/0day/clang-latest/bin/clang+=
+ HOSTAR=3D/home/bjorn/0day/clang-latest/bin/llvm-ar CROSS_COMPILE=3Daarch6=
4-linux-gnu- --jobs=3D16 W=3D1 ARCH=3Darm64
  make: /home/bjorn/0day/clang-latest/bin/clang: Command not found
    SYNC    include/config/auto.conf.cmd
    HOSTCC  scripts/basic/fixdep
  /bin/sh: 1: /home/bjorn/0day/clang-latest/bin/clang: not found
  make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 127
  make[1]: *** [Makefile:533: scripts_basic] Error 2
  make: *** [Makefile:709: include/config/auto.conf.cmd] Error 2
  make: *** [include/config/auto.conf.cmd] Deleting file 'include/generated=
/autoconf.h'

After adding a symlink "clang-latest -> clang/", it worked as
expected and reproduced the warning.

But I guess I'll wait for Vidya to fix it.

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from drivers/pci/controller/dwc/pcie-tegra194.c:25:
>    In file included from include/linux/pci-acpi.h:12:
>    In file included from include/linux/acpi.h:35:
>    In file included from include/acpi/acpi_io.h:7:
>    In file included from arch/arm64/include/asm/acpi.h:12:
>    include/linux/efi.h:1093:34: warning: passing 1-byte aligned argument =
to 4-byte aligned parameter 2 of 'get_var' may result in an unaligned point=
er access [-Walign-mismatch]
>            status =3D get_var(L"SecureBoot", &EFI_GLOBAL_VARIABLE_GUID, N=
ULL, &size,
>                                            ^
>    include/linux/efi.h:1101:24: warning: passing 1-byte aligned argument =
to 4-byte aligned parameter 2 of 'get_var' may result in an unaligned point=
er access [-Walign-mismatch]
>            get_var(L"SetupMode", &EFI_GLOBAL_VARIABLE_GUID, NULL, &size, =
&setupmode);
>                                  ^
> >> drivers/pci/controller/dwc/pcie-tegra194.c:243:27: warning: unused var=
iable 'pcie_gen_freq' [-Wunused-const-variable]
>    static const unsigned int pcie_gen_freq[] =3D {
>                              ^
>    drivers/pci/controller/dwc/pcie-tegra194.c:250:18: warning: unused var=
iable 'event_cntr_ctrl_offset' [-Wunused-const-variable]
>    static const u32 event_cntr_ctrl_offset[] =3D {
>                     ^
>    drivers/pci/controller/dwc/pcie-tegra194.c:259:18: warning: unused var=
iable 'event_cntr_data_offset' [-Wunused-const-variable]
>    static const u32 event_cntr_data_offset[] =3D {
>                     ^
>    5 warnings generated.
> =

> =

> vim +/pcie_gen_freq +243 drivers/pci/controller/dwc/pcie-tegra194.c
> =

> c57247f940e8ea Vidya Sagar 2020-03-03  242  =

> 56e15a238d9278 Vidya Sagar 2019-08-13 @243  static const unsigned int pci=
e_gen_freq[] =3D {
> 56e15a238d9278 Vidya Sagar 2019-08-13  244  	GEN1_CORE_CLK_FREQ,
> 56e15a238d9278 Vidya Sagar 2019-08-13  245  	GEN2_CORE_CLK_FREQ,
> 56e15a238d9278 Vidya Sagar 2019-08-13  246  	GEN3_CORE_CLK_FREQ,
> 56e15a238d9278 Vidya Sagar 2019-08-13  247  	GEN4_CORE_CLK_FREQ
> 56e15a238d9278 Vidya Sagar 2019-08-13  248  };
> 56e15a238d9278 Vidya Sagar 2019-08-13  249  =

> =

> :::::: The code at line 243 was first introduced by commit
> :::::: 56e15a238d92788a2d09e0c5c26a5de1b3156931 PCI: tegra: Add Tegra194 =
PCIe support
> =

> :::::: TO: Vidya Sagar <vidyas@nvidia.com>
> :::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============5142401721576578371==--

