Content-Type: multipart/mixed; boundary="===============2580347489578514386=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 9340/10701] arch/arc/mm/init.c:80:6: warning: no previous prototype for 'arch_has_descending_max_zone_pfns'
Date: Tue, 19 May 2020 17:08:00 -0700
Message-ID: <20200519170800.cd2519210f476141e9573375@linux-foundation.org>
In-Reply-To: <202005200351.ALIftL4S%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2580347489578514386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2020 03:43:55 +0800 kbuild test robot <lkp@intel.com> wrot=
e:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: aa3238a152d1646868ac81bee4eee08ba39594de [9340/10701] mm: free_ar=
ea_init: allow defining max_zone_pfn in descending order
> config: arc-randconfig-r011-20200519 (attached as .config)
> compiler: arc-elf-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout aa3238a152d1646868ac81bee4eee08ba39594de
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> arch/arc/mm/init.c:39:13: warning: no previous prototype for 'arc_get_mem=
_sz' [-Wmissing-prototypes]
> 39 | long __init arc_get_mem_sz(void)
> |             ^~~~~~~~~~~~~~
> >> arch/arc/mm/init.c:80:6: warning: no previous prototype for 'arch_has_=
descending_max_zone_pfns' [-Wmissing-prototypes]
> 80 | bool arch_has_descending_max_zone_pfns(void)
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arc/mm/init.c:91:13: warning: no previous prototype for 'setup_arch_=
memory' [-Wmissing-prototypes]

Thanks.  This should do it:

--- a/include/linux/mm.h~mm-free_area_init-allow-defining-max_zone_pfn-in-d=
escending-order-fix-2-fix
+++ a/include/linux/mm.h
@@ -2464,6 +2464,7 @@ extern void setup_per_cpu_pageset(void);
 extern int min_free_kbytes;
 extern int watermark_boost_factor;
 extern int watermark_scale_factor;
+extern bool arch_has_descending_max_zone_pfns(void);
 =

 /* nommu.c */
 extern atomic_long_t mmap_pages_allocated;
_

--===============2580347489578514386==--

