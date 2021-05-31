Content-Type: multipart/mixed; boundary="===============9158820461856918564=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Mon, 31 May 2021 09:36:40 +0200
Message-ID: <CAMuHMdW1xZ-vJe2eOehNSKCP3T=-eq7ji4MBo3D6oGJyPNXGDw@mail.gmail.com>
In-Reply-To: <d4c47108-f4d2-4850-14fd-b4c4bd0e0591@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9158820461856918564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 3:13 AM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> On 5/30/21 5:05 PM, Randy Dunlap wrote:
> > On 5/29/21 4:25 PM, kernel test robot wrote:
> >> First bad commit (maybe !=3D root cause):
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
> >> head:   df8c66c4cfb91f2372d138b9b714f6df6f506966
> >> commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO =
drivers into a new subdirectory
> >> date:   9 months ago
> >> config: sh-allmodconfig (attached as .config)
> >> compiler: sh4-linux-gcc (GCC) 9.3.0
> >> reproduce (this is a W=3D1 build):
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3Da9770eac511ad82390b9f4a3c1728e078c387ac7
> >>         git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
> >>         git fetch --no-tags linus master
> >>         git checkout a9770eac511ad82390b9f4a3c1728e078c387ac7
> >>         # save the attached .config to linux build tree
> >>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross ARCH=3Dsh
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>, old ones prefixed by <<):
> >>
> >>>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefine=
d!
>
> Should we make this one driver depend on !SUPERH ?

No, we should just fix the driver instead.

+               /* Wait 1000 clocks so we don't saturate the RSL bus
+                * doing reads.
+                */
+               __delay(1000);

As this is used only on Cavium Octeon and Thunder SoCs, running
at 400-600 MHz resp. 1800-2000 Mhz, what about replacing the __delay()
call by a call to udelay(1) or udelay(2)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============9158820461856918564==--

