Content-Type: multipart/mixed; boundary="===============7789444903009797096=="
MIME-Version: 1.0
From: Jeremy Linton <jeremy.linton@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] mmc: sdhci-iproc: Add ACPI bindings for the rpi4
Date: Fri, 08 Jan 2021 21:18:54 -0600
Message-ID: <58062024-ca6a-f763-3634-9995f494e81e@arm.com>
In-Reply-To: <202101090943.lYXU9GHI-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7789444903009797096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 1/8/21 7:10 PM, kernel test robot wrote:
> Hi Jeremy,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.11-rc2 next-20210108]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Jeremy-Linton/mmc-sdhci-=
iproc-Add-ACPI-bindings-for-the-rpi4/20210109-051645
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 6279d812eab67a6df6b22fa495201db6f2305924
> config: riscv-randconfig-r012-20210108 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bc55=
6e5685c0f97e79fb7b3c6f15cc5062db8e36)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install riscv cross compiling tool for clang build
>          # apt-get install binutils-riscv64-linux-gnu
>          # https://github.com/0day-ci/linux/commit/659eacf5a5de971ea94390=
dd6c7443c82d53ea5e
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Jeremy-Linton/mmc-sdhci-iproc-A=
dd-ACPI-bindings-for-the-rpi4/20210109-051645
>          git checkout 659eacf5a5de971ea94390dd6c7443c82d53ea5e
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Driscv
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):

(trimming)

>     include/asm-generic/io.h:1005:55: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                       ~~~~~~~~~~ ^
>>> drivers/mmc/host/sdhci-iproc.c:272:38: warning: unused variable 'bcm_ar=
asan_data' [-Wunused-const-variable]
>     static const struct sdhci_iproc_data bcm_arasan_data =3D {

I think this is the only one caused by this patch, and its because the =

new structures are only used inside the #ifdef ACPI block.

I will post a v2.

>                                          ^
>     8 warnings generated.
> =

> =

> vim +/bcm_arasan_data +272 drivers/mmc/host/sdhci-iproc.c
> =

>     271	=

>   > 272	static const struct sdhci_iproc_data bcm_arasan_data =3D {
>     273		.pdata =3D &sdhci_bcm_arasan_data,
>     274	};
>     275	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============7789444903009797096==--

