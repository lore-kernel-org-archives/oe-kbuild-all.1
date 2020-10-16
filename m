Content-Type: multipart/mixed; boundary="===============5095824205478470689=="
MIME-Version: 1.0
From: Jakub Kicinski <kuba@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/mips/include/asm/addrspace.h:88:37: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast
Date: Fri, 16 Oct 2020 08:02:51 -0700
Message-ID: <20201016080251.3e3c4dc0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <202010161852.CGdSDJx5-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5095824205478470689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Oct 2020 18:04:29 +0800 kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   9ff9b0d392ea08090cd1780fb196f36dbb586529
> commit: 3af5f0f5c74ecbaf757ef06c3f80d56751277637 net: korina: fix kfree o=
f rx/tx descriptor array
> date:   4 days ago
> config: mips-rb532_defconfig (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D3af5f0f5c74ecbaf757ef06c3f80d56751277637
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 3af5f0f5c74ecbaf757ef06c3f80d56751277637
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from arch/mips/include/asm/barrier.h:11,
>                     from arch/mips/include/asm/bitops.h:19,
>                     from include/linux/bitops.h:29,
>                     from include/linux/kernel.h:12,
>                     from include/linux/list.h:9,
>                     from include/linux/module.h:12,
>                     from drivers/net/ethernet/korina.c:36:
>    drivers/net/ethernet/korina.c: In function 'korina_probe':
> >> arch/mips/include/asm/addrspace.h:88:37: warning: passing argument 1 o=
f 'kfree' makes pointer from integer without a cast [-Wint-conversion]  =

>       88 | #define KSEG0ADDR(a)  (CPHYSADDR(a) | KSEG0)
>          |                       ~~~~~~~~~~~~~~^~~~~~~~
>          |                                     |
>          |                                     unsigned int
>    drivers/net/ethernet/korina.c:1116:8: note: in expansion of macro 'KSE=
G0ADDR'
>     1116 |  kfree(KSEG0ADDR(lp->td_ring));
>          |        ^~~~~~~~~

Valentin, looks like we're missing a cast to (void *) or some other
pointer.. Would you mind sending a fix? You can find cross compilers =

to test it here, cause this probably only builds for MIPS:

https://mirrors.edge.kernel.org/pub/tools/crosstool/

--===============5095824205478470689==--

