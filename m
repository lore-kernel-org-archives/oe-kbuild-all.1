Content-Type: multipart/mixed; boundary="===============8021533432633627749=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Sun, 30 May 2021 17:05:42 -0700
Message-ID: <a0edf640-ec05-524e-9125-44decba27bbb@infradead.org>
In-Reply-To: <202105300736.7wVLvXHr-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8021533432633627749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/29/21 4:25 PM, kernel test robot wrote:
> Hi Andrew,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   df8c66c4cfb91f2372d138b9b714f6df6f506966
> commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO dri=
vers into a new subdirectory
> date:   9 months ago
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Da9770eac511ad82390b9f4a3c1728e078c387ac7
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout a9770eac511ad82390b9f4a3c1728e078c387ac7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dsh =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

>>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

Just a comment here.  kernel test robot has reported this issue
5 times in 2021 that I know of -- and I could have missed some.

I see that Geert recently (June 2020) reverted the
EXPORT_SYMBOL(__delay) in arch/sh/lib/delay.c, with this comment:

    __delay() is an internal implementation detail on several architectures.
    Drivers should not call __delay() directly, as it has non-standardized
    semantics, or may not even exist.
    Hence there is no need to export __delay() to modules.

    See also include/asm-generic/delay.h:
    =

        /* Undefined functions to get compile-time errors */
        ...
        extern void __delay(unsigned long loops);

However, s/several architectures/all but one architecture: SH/.
All architectures except for SH provide either an exported function,
an inline function, or a macro for __delay(). Yeah, they probably
don't all do the same delay.

-- =

~Randy

--===============8021533432633627749==--

