Content-Type: multipart/mixed; boundary="===============5869664889272570731=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Mon, 31 May 2021 17:45:10 +0200
Message-ID: <CAMuHMdWiPjuf47=SBjNrQNjf4QiwDf6t0kkx_5BdPVoa22zxmw@mail.gmail.com>
In-Reply-To: <9db68758-1bf0-cec9-4914-ccb8439e2d1f@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5869664889272570731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, May 31, 2021 at 5:12 PM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> On 5/31/21 12:32 AM, Geert Uytterhoeven wrote:
> > CC David (original author, asked by driver location change)
> >
> > On Mon, May 31, 2021 at 9:29 AM Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> >>
> >> On Mon, May 31, 2021 at 2:05 AM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> >>> On 5/29/21 4:25 PM, kernel test robot wrote:
> >>>> First bad commit (maybe !=3D root cause):
> >>>>
> >>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git master
> >>>> head:   df8c66c4cfb91f2372d138b9b714f6df6f506966
> >>>> commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDI=
O drivers into a new subdirectory
> >>>> date:   9 months ago
> >>>> config: sh-allmodconfig (attached as .config)
> >>>> compiler: sh4-linux-gcc (GCC) 9.3.0
> >>>> reproduce (this is a W=3D1 build):
> >>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/maste=
r/sbin/make.cross -O ~/bin/make.cross
> >>>>         chmod +x ~/bin/make.cross
> >>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/commit/?id=3Da9770eac511ad82390b9f4a3c1728e078c387ac7
> >>>>         git remote add linus https://git.kernel.org/pub/scm/linux/ke=
rnel/git/torvalds/linux.git
> >>>>         git fetch --no-tags linus master
> >>>>         git checkout a9770eac511ad82390b9f4a3c1728e078c387ac7
> >>>>         # save the attached .config to linux build tree
> >>>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make=
.cross ARCH=3Dsh
> >>>>
> >>>> If you fix the issue, kindly add following tag as appropriate
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>
> >>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
> >>>>
> >>>>>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefi=
ned!
> >>>
> >>> Just a comment here.  kernel test robot has reported this issue
> >>> 5 times in 2021 that I know of -- and I could have missed some.
> >>>
> >>> I see that Geert recently (June 2020) reverted the
> >>> EXPORT_SYMBOL(__delay) in arch/sh/lib/delay.c, with this comment:
> >>>
> >>>     __delay() is an internal implementation detail on several archite=
ctures.
> >>>     Drivers should not call __delay() directly, as it has non-standar=
dized
> >>>     semantics, or may not even exist.
> >>>     Hence there is no need to export __delay() to modules.
> >>>
> >>>     See also include/asm-generic/delay.h:
> >>>
> >>>         /* Undefined functions to get compile-time errors */
> >>>         ...
> >>>         extern void __delay(unsigned long loops);
> >>>
> >>> However, s/several architectures/all but one architecture: SH/.
> >>> All architectures except for SH provide either an exported function,
> >>> an inline function, or a macro for __delay(). Yeah, they probably
> >>> don't all do the same delay.
> >>
> >> Hence it must not be used by drivers, as it might give the false assum=
ption
> >> of working everywhere.  While drivers/net/mdio/mdio-cavium is
> >> platform-specific, code might be copied in a new driver, less restrict=
ed
> >> to a specific platform.
>
> Geert, should all (15) of the other arch EXPORT_SYMBOL(__delay); exports
> be removed?  (in theory?  I'm not planning to remove them.)

It depends.  If they are internal implementation details of an
architecture's mdelay() or udelay() function (i.e. the latter are
static inline functions that may call into out-of-line __delay()
functions), then they should be kept.

I haven't checked all of them, but e.g. on arm64, mdelay() and udelay()
don't call into __delay, so IMHO its export should be removed.

Generic drivers should not use __delay() with a hardcoded value, as
its semantics are not defined (cfr. the undefined function comment
in asm-generic).

Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============5869664889272570731==--

