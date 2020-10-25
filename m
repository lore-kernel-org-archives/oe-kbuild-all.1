Content-Type: multipart/mixed; boundary="===============4137634507911853587=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size of 13472 bytes in function 'ltv350qv_power'
Date: Sun, 25 Oct 2020 12:17:08 -0700
Message-ID: <20201025121708.04d4070a44e28146baf9a6a7@linux-foundation.org>
In-Reply-To: <202010260230.VivTG0Gb-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4137634507911853587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2020 02:15:37 +0800 kernel test robot <lkp@intel.com> wrot=
e:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d76913908102044f14381df865bb74df17a538cb
> commit: cae9dc35ed9ff82a99754e51d57ff6c332e1f7e4 kasan: allow enabling st=
ack tagging for tag-based mode
> date:   3 months ago
> config: arm64-randconfig-r005-20201026 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1c83=
71692dfe8245bc6690ff1262dcced4649d21)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dcae9dc35ed9ff82a99754e51d57ff6c332e1f7e4
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout cae9dc35ed9ff82a99754e51d57ff6c332e1f7e4
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size o=
f 13472 bytes in function 'ltv350qv_power' [-Wframe-larger-than=3D]

That's a lot of stack.

>    static int ltv350qv_power(struct ltv350qv *lcd, int power)
>               ^
>    1 warning generated.
> =

> vim +/ltv350qv_power +192 drivers/video/backlight/ltv350qv.c

Odd - the code looks pretty normal.  It is possible that your compiler
is (crazily) inlining ltv350qv_write_reg()?
--===============4137634507911853587==--

