Content-Type: multipart/mixed; boundary="===============6185131636783246696=="
MIME-Version: 1.0
From: Roberto Sassu <roberto.sassu@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 9753/9999] WARNING: vmlinux.o(.text+0x2f872e): Section mismatch in reference from the function ima_calc_boot_aggregate_tfm() to the function .init.text:ima_pcrread()
Date: Mon, 18 Jan 2021 09:01:58 +0000
Message-ID: <a4867445057a4b8997c4470899dc310b@huawei.com>
In-Reply-To: <202101170926.7gVGRoMm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6185131636783246696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: kernel test robot [mailto:lkp(a)intel.com]
> Sent: Sunday, January 17, 2021 2:53 AM
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-
> rc.git linux-4.19.y
> head:   e864f43593ccf9180c61738abdf1c1dde091367d
> commit: fcb067cb457e2326c6d759e346f5f5dfef351d50 [9753/9999] ima: Call
> ima_calc_boot_aggregate() in ima_eventdigest_init()
> config: x86_64-randconfig-a015-20210117 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> bfd75bdf3fd62d4f5e7028d4122f9ffa517f2a09)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-
> rc.git/commit/?id=3Dfcb067cb457e2326c6d759e346f5f5dfef351d50
>         git remote add linux-stable-rc
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-4.19.y
>         git checkout fcb067cb457e2326c6d759e346f5f5dfef351d50
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Please include commit 8b8c704d913b.

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Li Jian, Shi Yanli

> All warnings (new ones prefixed by >>):
> =

> >> WARNING: vmlinux.o(.text+0x2f872e): Section mismatch in reference
> from the function ima_calc_boot_aggregate_tfm() to the
> function .init.text:ima_pcrread()
>    The function ima_calc_boot_aggregate_tfm() references
>    the function __init ima_pcrread().
>    This is often because ima_calc_boot_aggregate_tfm lacks a __init
>    annotation or the annotation of ima_pcrread is wrong.
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6185131636783246696==--

