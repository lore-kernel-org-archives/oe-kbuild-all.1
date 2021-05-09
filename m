Content-Type: multipart/mixed; boundary="===============2866790100446352525=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm/boot/compressed/decompress.c:50: warning: "memmove" redefined
Date: Sun, 09 May 2021 17:17:49 +0200
Message-ID: <CACRpkdaNVg9zgaDN0JG+Z8dMMk+0fdpYHwGMHS-FKUG9MZAb4w@mail.gmail.com>
In-Reply-To: <20210509122227.GH1336@shell.armlinux.org.uk>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2866790100446352525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

OK, paging in the KSan mailing list and key people.

Certainly this problem must be the same on all platforms
using an XZ-compressed kernel and not just Arm?

What I wonder is why the other platforms that use
XZ compression don't redefine memmove and
memcpy in their decompress.c clause for XZ?

Can we just delete these two lines?
#define memmove memmove
#define memcpy memcpy

Imre?

I can test some platforms without these defines later
tonight and see what happens.

Yours,
Linus Walleij

On Sun, May 9, 2021 at 2:22 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> Maybe the KASan folk can look into this, it isn't obvious how to fix
> this, since XZ needs memcpy/memmove #defined to avoid using its own
> version. Having KASan override these with a #define is all very well,
> but it makes the behaviour of lib/decompress_unxz.c indeterminant if
> we get rid of the definitions the XZ support added.
>
> On Sun, May 09, 2021 at 11:32:17AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   b741596468b010af2846b75f5e75a842ce344a6e
> > commit: 421015713b306e47af95d4d61cdfbd96d462e4cb ARM: 9017/2: Enable KA=
San for ARM
> > date:   6 months ago
> > config: arm-randconfig-r015-20210509 (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D421015713b306e47af95d4d61cdfbd96d462e4cb
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 421015713b306e47af95d4d61cdfbd96d462e4cb
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss W=3D1 ARCH=3Darm
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> arch/arm/boot/compressed/decompress.c:50: warning: "memmove" redefin=
ed
> >       50 | #define memmove memmove
> >          |
> >    In file included from arch/arm/boot/compressed/decompress.c:8:
> >    arch/arm/include/asm/string.h:59: note: this is the location of the =
previous definition
> >       59 | #define memmove(dst, src, len) __memmove(dst, src, len)
> >          |
> >    arch/arm/boot/compressed/decompress.c:51: warning: "memcpy" redefined
> >       51 | #define memcpy memcpy
> >          |
> >    In file included from arch/arm/boot/compressed/decompress.c:8:
> >    arch/arm/include/asm/string.h:58: note: this is the location of the =
previous definition
> >       58 | #define memcpy(dst, src, len) __memcpy(dst, src, len)
> >          |
> >    arch/arm/boot/compressed/decompress.c:59:5: warning: no previous pro=
totype for 'do_decompress' [-Wmissing-prototypes]
> >       59 | int do_decompress(u8 *input, int len, u8 *output, void (*err=
or)(char *x))
> >          |     ^~~~~~~~~~~~~
> >
> >
> > vim +/memmove +50 arch/arm/boot/compressed/decompress.c
> >
> > 6e8699f7d68589 Albin Tonnerre 2010-04-03  48
> > a7f464f3db93ae Imre Kaloz     2012-01-26  49  #ifdef CONFIG_KERNEL_XZ
> > a7f464f3db93ae Imre Kaloz     2012-01-26 @50  #define memmove memmove
> > a7f464f3db93ae Imre Kaloz     2012-01-26  51  #define memcpy memcpy
> > a7f464f3db93ae Imre Kaloz     2012-01-26  52  #include "../../../../lib=
/decompress_unxz.c"
> > a7f464f3db93ae Imre Kaloz     2012-01-26  53  #endif
> > a7f464f3db93ae Imre Kaloz     2012-01-26  54
> >
> > :::::: The code at line 50 was first introduced by commit
> > :::::: a7f464f3db93ae5492bee6f6e48939fd8a45fa99 ARM: 7001/2: Wire up su=
pport for the XZ decompressor
> >
> > :::::: TO: Imre Kaloz <kaloz@openwrt.org>
> > :::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
>
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
--===============2866790100446352525==--

