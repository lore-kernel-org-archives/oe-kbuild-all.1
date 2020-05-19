Content-Type: multipart/mixed; boundary="===============4466042987016914382=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Date: Tue, 19 May 2020 22:46:57 +0800
Message-ID: <202005192248.hhYtuqDw%lkp@intel.com>
In-Reply-To: <20200519101320.33495-1-emil.l.velikov@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4466042987016914382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Emil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[also build test WARNING on linus/master v5.7-rc6 next-20200518]
[cannot apply to linux/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Emil-Velikov/linux-bits-h-=
adjust-GENMASK_INPUT_CHECK-check/20200519-205452
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from drivers/clk/clk-multiplier.c:6:
drivers/clk/clk-multiplier.c: In function 'clk_multiplier_recalc_rate':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-multiplier.c:48:9: note: in expansion of macro 'GENMASK'
48 |  val &=3D GENMASK(mult->width - 1, 0);
|         ^~~~~~~
drivers/clk/clk-multiplier.c: In function 'clk_multiplier_set_rate':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-multiplier.c:139:10: note: in expansion of macro 'GENMASK'
139 |  val &=3D ~GENMASK(mult->width + mult->shift - 1, mult->shift);
|          ^~~~~~~
--
In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from include/linux/of.h:15,
from include/linux/clk-provider.h:9,
from drivers/clk/clk-fractional-divider.c:10:
drivers/clk/clk-fractional-divider.c: In function 'clk_fd_general_approxima=
tion':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-fractional-divider.c:88:4: note: in expansion of macro '=
GENMASK'
88 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|    ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:88:32: note: in expansion of macro 'GE=
NMASK'
88 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|                                ^~~~~~~
drivers/clk/clk-fractional-divider.c: In function 'clk_fd_set_rate':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:122:4: note: in expansion of macro 'GE=
NMASK'
122 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|    ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:122:32: note: in expansion of macro 'G=
ENMASK'
122 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|                                ^~~~~~~
drivers/clk/clk-fractional-divider.c: In function 'clk_hw_register_fraction=
al_divider':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:178:14: note: in expansion of macro 'G=
ENMASK'
178 |  fd->mmask =3D GENMASK(mwidth - 1, 0) << mshift;
|              ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:181:14: note: in expansion of macro 'G=
ENMASK'
181 |  fd->nmask =3D GENMASK(nwidth - 1, 0) << nshift;
|              ^~~~~~~
--
In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/linux/interrupt.h:6,
from drivers/clocksource/arc_timer.c:15:
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:45:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
45 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/linux/clocksource.h:136:32: note: in expansion of macro 'GENMASK_UL=
L'
136 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
|                                ^~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:99:12: note: in expansion of macro 'CLOC=
KSOURCE_MASK'
99 |  .mask   =3D CLOCKSOURCE_MASK(64),
|            ^~~~~~~~~~~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:45:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
45 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/linux/clocksource.h:136:32: note: in expansion of macro 'GENMASK_UL=
L'
136 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
|                                ^~~~~~~~~~~
drivers/clocksource/arc_timer.c:157:12: note: in expansion of macro 'CLOCKS=
OURCE_MASK'
157 |  .mask   =3D CLOCKSOURCE_MASK(64),
|            ^~~~~~~~~~~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:45:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
45 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/linux/clocksource.h:136:32: note: in expansion of macro 'GENMASK_UL=
L'
136 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
|                                ^~~~~~~~~~~
drivers/clocksource/arc_timer.c:210:12: note: in expansion of macro 'CLOCKS=
OURCE_MASK'
210 |  .mask   =3D CLOCKSOURCE_MASK(32),
|            ^~~~~~~~~~~~~~~~
--
In file included from include/linux/kernel.h:11,
from include/linux/list.h:9,
from include/linux/module.h:12,
from net/core/filter.c:20:
net/core/filter.c: In function '____bpf_skb_set_tunnel_opt':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
78 | # define unlikely(x) __builtin_expect(!!(x), 0)
|                                          ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/net/ip_tunnels.h:66:2: note: in expansion of macro 'GENMASK'
66 |  GENMASK((sizeof_field(struct ip_tunnel_info,           |  ^~~~~~~
net/core/filter.c:3945:22: note: in expansion of macro 'IP_TUNNEL_OPTS_MAX'
3945 |  if (unlikely(size > IP_TUNNEL_OPTS_MAX))
|                      ^~~~~~~~~~~~~~~~~~
In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/linux/list.h:9,
from include/linux/module.h:12,
from net/core/filter.c:20:
net/core/filter.c: In function 'bpf_get_skb_set_tunnel_proto':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anony=
mous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~=
~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/net/ip_tunnels.h:66:2: note: in expansion of macro 'GENMASK'
66 |  GENMASK((sizeof_field(struct ip_tunnel_info,           |  ^~~~~~~
net/core/filter.c:3968:35: note: in expansion of macro 'IP_TUNNEL_OPTS_MAX'
3968 |   tmp =3D metadata_dst_alloc_percpu(IP_TUNNEL_OPTS_MAX,
|                                   ^~~~~~~~~~~~~~~~~~
In file included from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/linux/list.h:9,
from include/linux/module.h:12,
from net/core/filter.c:20:
>> include/linux/bits.h:39:2: warning: conversion from 'long unsigned int' =
to 'u8' {aka 'unsigned char'} changes value from '256' to '0' [-Woverflow]
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/net/ip_tunnels.h:66:2: note: in expansion of macro 'GENMASK'
66 |  GENMASK((sizeof_field(struct ip_tunnel_info,           |  ^~~~~~~
net/core/filter.c:3968:35: note: in expansion of macro 'IP_TUNNEL_OPTS_MAX'
3968 |   tmp =3D metadata_dst_alloc_percpu(IP_TUNNEL_OPTS_MAX,
|                                   ^~~~~~~~~~~~~~~~~~

vim +39 include/linux/bits.h

295bcca84916cb Rikard Falkeborn 2020-04-06  34  =

295bcca84916cb Rikard Falkeborn 2020-04-06  35  #define __GENMASK(h, l) \
95b980d62d52c4 Masahiro Yamada  2019-07-16  36  	(((~UL(0)) - (UL(1) << (l)=
) + 1) & \
95b980d62d52c4 Masahiro Yamada  2019-07-16  37  	 (~UL(0) >> (BITS_PER_LONG=
 - 1 - (h))))
295bcca84916cb Rikard Falkeborn 2020-04-06  38  #define GENMASK(h, l) \
295bcca84916cb Rikard Falkeborn 2020-04-06 @39  	(GENMASK_INPUT_CHECK(h, l)=
 + __GENMASK(h, l))
8bd9cb51daac89 Will Deacon      2018-06-19  40  =


:::::: The code at line 39 was first introduced by commit
:::::: 295bcca84916cb5079140a89fccb472bb8d1f6e2 linux/bits.h: add compile t=
ime sanity check of GENMASK inputs

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4466042987016914382==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4466042987016914382==--

