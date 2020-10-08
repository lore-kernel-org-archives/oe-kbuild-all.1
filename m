Content-Type: multipart/mixed; boundary="===============6402056735525513431=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: kbuild-all@lists.01.org
Subject: Re: arceb-elf-ld: include/linux/leds.h:193: undefined reference to `devm_led_classdev_register_ext'
Date: Thu, 08 Oct 2020 09:15:07 +0200
Message-ID: <20201008071507.GA29893@amd>
In-Reply-To: <202010081415.2R50UmDQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6402056735525513431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c85fb28b6f999db9928b841f63f1beeb3074eeca
> commit: 92a81562e695628086acb92f95090ab09d9b9ec0 leds: lp55xx: Add multic=
olor framework support to lp55xx
> date:   3 months ago
> config: arc-randconfig-r035-20201008 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D92a81562e695628086acb92f95090ab09d9b9ec0
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 92a81562e695628086acb92f95090ab09d9b9ec0
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Hi robot. Do you have human around to talk to?

> All errors (new ones prefixed by >>):
> =

>    arceb-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
>    lib/stackdepot.c:331: undefined reference to `__irqentry_text_start'
>    arceb-elf-ld: lib/stackdepot.c:331: undefined reference to `__irqentry=
_text_start'
>    arceb-elf-ld: lib/stackdepot.o: in function `in_irqentry_text':
>    lib/stackdepot.c:323: undefined reference to `__irqentry_text_end'
>    arceb-elf-ld: lib/stackdepot.c:323: undefined reference to `__irqentry=
_text_end'
>    arceb-elf-ld: lib/stackdepot.c:324: undefined reference to `__softirqe=
ntry_text_start'
>    arceb-elf-ld: lib/stackdepot.c:324: undefined reference to `__softirqe=
ntry_text_start'
>    arceb-elf-ld: lib/stackdepot.c:325: undefined reference to `__softirqe=
ntry_text_end'
>    arceb-elf-ld: lib/stackdepot.c:325: undefined reference to

What is going on here? Did you just start testing arc? The commit
is... really old.

Best regards,
								Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============6402056735525513431==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsOSt2SHNBQ2drUU1PZndhcFhiK3ZJcmh3Q2d1YjBJVzViZlMrSTArZWpvWFh1T0lYNkgK
T2FFQW5qRXhlNVRrelA1WWs5RksvWDMzRC9ZWjJWcXIKPVFDL1YKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============6402056735525513431==--

