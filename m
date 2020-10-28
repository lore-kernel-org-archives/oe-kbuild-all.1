Content-Type: multipart/mixed; boundary="===============3766295497408782322=="
MIME-Version: 1.0
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size of 13472 bytes in function 'ltv350qv_power'
Date: Wed, 28 Oct 2020 15:46:13 +0000
Message-ID: <20201028154613.fue7ilxdihj2cado@holly.lan>
In-Reply-To: <20201025121708.04d4070a44e28146baf9a6a7@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3766295497408782322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2020 at 12:17:08PM -0700, Andrew Morton wrote:
> On Mon, 26 Oct 2020 02:15:37 +0800 kernel test robot <lkp@intel.com> wr=
ote:
> =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   d76913908102044f14381df865bb74df17a538cb
> > commit: cae9dc35ed9ff82a99754e51d57ff6c332e1f7e4 kasan: allow enabling =
stack tagging for tag-based mode
> > date:   3 months ago
> > config: arm64-randconfig-r005-20201026 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1c=
8371692dfe8245bc6690ff1262dcced4649d21)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3Dcae9dc35ed9ff82a99754e51d57ff6c332e1f7e4
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout cae9dc35ed9ff82a99754e51d57ff6c332e1f7e4
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Darm64 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>):
> > =

> > >> drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size=
 of 13472 bytes in function 'ltv350qv_power' [-Wframe-larger-than=3D]
> =

> That's a lot of stack.
> =

> >    static int ltv350qv_power(struct ltv350qv *lcd, int power)
> >               ^
> >    1 warning generated.
> > =

> > vim +/ltv350qv_power +192 drivers/video/backlight/ltv350qv.c
> =

> Odd - the code looks pretty normal.  It is possible that your compiler
> is (crazily) inlining ltv350qv_write_reg()?

Certainly could be.

Same config compiled with gcc-9 gives ltv350qv_write_reg() a stack usage
that is large but not crazy: 768 bytes and dropping to 480 bytes with
the sanitizers disabled. With the sanitizers enabled then even the =

cumulative stack usage of ltv350qv_power() through to ltv350qv_write_reg() =
is
still less than 1k.


Daniel.
--===============3766295497408782322==--

