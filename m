Content-Type: multipart/mixed; boundary="===============2655333276306587548=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/5] hugetlb: use page.private for hugetlb specific page flags
Date: Wed, 20 Jan 2021 16:43:09 +0800
Message-ID: <202101201627.PJpv1iOE-lkp@intel.com>
In-Reply-To: <20210120013049.311822-2-mike.kravetz@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2655333276306587548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20210119]
[also build test ERROR on v5.11-rc4]
[cannot apply to linux/master linus/master hnaz-linux-mm/master v5.11-rc4 v=
5.11-rc3 v5.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mike-Kravetz/create-hugetl=
b-flags-to-consolidate-state/20210120-142142
base:    b4bb878f3eb3e604ebfe83bbc17eb7af8d99cbf4
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ebeb3dd25715894428a510772=
0212b022616c02f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mike-Kravetz/create-hugetlb-flags-=
to-consolidate-state/20210120-142142
        git checkout ebeb3dd25715894428a5107720212b022616c02f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:51:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   kernel/fork.c: At top level:
   kernel/fork.c:161:13: warning: no previous prototype for 'arch_release_t=
ask_struct' [-Wmissing-prototypes]
     161 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:746:20: warning: no previous prototype for 'arch_task_cach=
e_init' [-Wmissing-prototypes]
     746 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:836:12: warning: no previous prototype for 'arch_dup_task_=
struct' [-Wmissing-prototypes]
     836 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sysctl.c:45:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
--
   In file included from include/linux/migrate.h:8,
                    from kernel/sched/sched.h:53,
                    from kernel/sched/core.c:13:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2955:13: warning: variable 'rq' set but not used [-W=
unused-but-set-variable]
    2955 |  struct rq *rq;
         |             ^~
   kernel/sched/core.c: In function 'schedule_tail':
   kernel/sched/core.c:4298:13: warning: variable 'rq' set but not used [-W=
unused-but-set-variable]
    4298 |  struct rq *rq;
         |             ^~
--
   In file included from include/linux/migrate.h:8,
                    from kernel/sched/sched.h:53,
                    from kernel/sched/fair.c:23:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:5399:6: warning: no previous prototype for 'init_cfs=
_bandwidth' [-Wmissing-prototypes]
    5399 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11218:6: warning: no previous prototype for 'free_fa=
ir_sched_group' [-Wmissing-prototypes]
   11218 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11220:5: warning: no previous prototype for 'alloc_f=
air_sched_group' [-Wmissing-prototypes]
   11220 | int alloc_fair_sched_group(struct task_group *tg, struct task_gr=
oup *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11225:6: warning: no previous prototype for 'online_=
fair_sched_group' [-Wmissing-prototypes]
   11225 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11227:6: warning: no previous prototype for 'unregis=
ter_fair_sched_group' [-Wmissing-prototypes]
   11227 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/migrate.h:8,
                    from kernel/sched/sched.h:53,
                    from kernel/sched/rt.c:6:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:253:6: warning: no previous prototype for 'free_rt_sch=
ed_group' [-Wmissing-prototypes]
     253 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:255:5: warning: no previous prototype for 'alloc_rt_sc=
hed_group' [-Wmissing-prototypes]
     255 | int alloc_rt_sched_group(struct task_group *tg, struct task_grou=
p *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:669:6: warning: no previous prototype for 'sched_rt_ba=
ndwidth_account' [-Wmissing-prototypes]
     669 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/migrate.h:8,
                    from mm/page_alloc.c:61:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:2618:5: warning: no previous prototype for 'find_suitabl=
e_fallback' [-Wmissing-prototypes]
    2618 | int find_suitable_fallback(struct free_area *area, unsigned int =
order,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3597:15: warning: no previous prototype for 'should_fail=
_alloc_page' [-Wmissing-prototypes]
    3597 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned in=
t order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6257:23: warning: no previous prototype for 'memmap_init=
' [-Wmissing-prototypes]
    6257 | void __meminit __weak memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~
--
   In file included from fs/proc/meminfo.c:6:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   fs/proc/meminfo.c: At top level:
   fs/proc/meminfo.c:22:28: warning: no previous prototype for 'arch_report=
_meminfo' [-Wmissing-prototypes]
      22 | void __attribute__((weak)) arch_report_meminfo(struct seq_file *=
m)
         |                            ^~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/events/core.c:31:
   include/linux/hugetlb.h: In function 'HPageRestoreReserve':
>> include/linux/hugetlb.h:512:11: error: expected ';' before '}' token
     512 |  return 0 }
         |           ^
   include/linux/hugetlb.h:524:2: note: in expansion of macro 'TESTHPAGEFLA=
G'
     524 |  TESTHPAGEFLAG(uname, flname)    \
         |  ^~~~~~~~~~~~~
   include/linux/hugetlb.h:531:1: note: in expansion of macro 'HPAGEFLAG'
     531 | HPAGEFLAG(RestoreReserve, restore_reserve)
         | ^~~~~~~~~
   kernel/events/core.c: At top level:
   kernel/events/core.c:6539:6: warning: no previous prototype for 'perf_pm=
u_snapshot_aux' [-Wmissing-prototypes]
    6539 | long perf_pmu_snapshot_aux(struct perf_buffer *rb,
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +512 include/linux/hugetlb.h

   488	=

   489	/*
   490	 * Macros to create test, set and clear function definitions for
   491	 * hugetlb specific page flags.
   492	 */
   493	#ifdef CONFIG_HUGETLB_PAGE
   494	#define TESTHPAGEFLAG(uname, flname)				\
   495	static inline int HPage##uname(struct page *page)		\
   496		{ BUILD_BUG_ON(sizeof_field(struct page, private) *	\
   497				BITS_PER_BYTE < __NR_HPAGEFLAGS);	\
   498		return test_bit(HPG_##flname, &(page->private)); }
   499	=

   500	#define SETHPAGEFLAG(uname, flname)				\
   501	static inline void SetHPage##uname(struct page *page)		\
   502		{ set_bit(HPG_##flname, &(page->private)); }
   503	=

   504	#define CLEARHPAGEFLAG(uname, flname)				\
   505	static inline void ClearHPage##uname(struct page *page)		\
   506		{ clear_bit(HPG_##flname, &(page->private)); }
   507	#else
   508	#define TESTHPAGEFLAG(uname, flname)				\
   509	static inline int HPage##uname(struct page *page)		\
   510		{ BUILD_BUG_ON(sizeof_field(struct page, private) *	\
   511				BITS_PER_BYTE < __NR_HPAGEFLAGS);	\
 > 512		return 0 }
   513	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2655333276306587548==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICJLmB2AAAy5jb25maWcAnFxbc9u4kn6fX8HKVG3NeUjGlzjj1FYeIBCUMOLNAKiLX1iKzCSq
cSyvJM9M/v12g6QIUg05u1t1dix049ZodH/daObXX34N2Mth+3112KxXj48/gq/VU7VbHaqH4Mvm
sfrvIMyCNDOBCKV5B8zx5unl39+fHvbXV8HNu8vLdxdvd+v3wbTaPVWPAd8+fdl8fYH+m+3TL7/+
wrM0kuOS83ImlJZZWhqxMJ/e2P6P1dtHHO3t1/U6+G3M+X+Cj++u3128cbpJXQLh04+2adwN9enj
xfXFRUuIw2P71fX7C/t/x3Filo6P5K6L0+fCmXPCdMl0Uo4zk3UzOwSZxjIVHUmqu3KeqWnXYiZK
sBAYowz+X2mYRiII5NdgbOX7GOyrw8tzJ6KRyqYiLUFCOsmdoVNpSpHOSqZgwTKR5tP1FYzSLipL
chkLkKo2wWYfPG0POPBxhxlncbvFN2+o5pIV7i5HhQSpaBYbhz8UEStiYxdDNE8ybVKWiE9vfnva
PlX/OTLoOXO2opd6JnN+0oD/5Sbu2vNMy0WZ3BWiEHRr1+UoiTkzfFJaKiEIrjKty0QkmVqWzBjG
J27nQotYjtx+RxIrQPFdij1EOPFg//J5/2N/qL53hzgWqVCSW4XQk2zu6K1D4ROZ95UnzBIm065t
wtIQTrVuRg672OrpIdh+Gcw9nMDIRJQzlA+L49P5OZz9VMxEanSrkGbzvdrtqe0YyaegkQK2YpzF
3Zc5jJWFkrsyTDOkSFg3KUdLJk5mIseTUgltF660u9GThXWj5UqIJDcwakpP1zLMsrhIDVNLYuqG
x1GxphPPoM9JM96hRmQ8L343q/1fwQGWGKxgufvD6rAPVuv19uXpsHn6OhAidCgZt+PKdOxcNx3C
8BkXoJ1AN35KObt2pY0WRRtmNL17LfvtjUR/Yt12f4oXgSb0AQRRAu1UYnXjcX74WYoFaAlllHRv
BDvmoAn3ZsdotJYgdU3IB5KIYzSGSZb2KakQYM7EmI9iqY2rXf09Hm/jtP7DuZ/T416znsLL6QRs
POgsaXjRlEZgBGRkPl2+7+QlUzMF+xqJIc91LXq9/lY9vDxWu+BLtTq87Kq9bW4WTVAdZzBWWZFT
y0HrrHMGytTtqzC6TJ3faInd32ATVa8hl2HvdypM/btbwETwaZ7BFvFGm0zRd1MDX2j9jl0wzbPU
kQYPAwrGmREhsSklYrZ0Lkw8Bf6ZdVIq7HtQxRIYTWeF4sJxYCosx/euLYaGETRc9Vri+4T1Ghb3
A3o2+P2+9/tem9CV0ijL0MTg35Sn4mUGtiaR96KMMoWmFv6TsJSLnqgHbBr+oO7awLWO8sgdxXtH
E/DrEjWg561RhkPHEtW+auinj9a8p/guznCumIgjEIhyBhkxDfsqehMVAB0HP0EnnVHyzOXXcpyy
OHI0wa7JbbB+0G3QE4AI3U8mnZOVWVmonvFm4Uxq0YrE2SwMMmJKSVd8U2RZJvq0pezJ89hqRYA6
buSsd/Rwhu2c5NXBY7PALApJOixOhCF5pSZsJqzGlX2I0KD7vNp92e6+r57WVSD+rp7AczCwSxx9
B3jqzlH0hzjOHAo49poIiyxnCWwh46Sn+skZ2wlnST1d7bp7mqfjYlTP7GB5gM3MAOaeusvTMRtR
dwgGcIdjIzhgNRYt/h0OUUbg0tDblAquRpbQ9q3HOGEqBFdHn5eeFFEEaDBnMKeVGAPTSuKZLJJx
raJHQfbDjaPtDvW1Y+WO6JABDFZgb2FvPeN6ZNBFcto6mQtAceaUgGBzBJGQGxkpcEMIaaOYjcGe
FHmeKacruHI+rZlOaBEYFsFUvITfZe+m5mPDRiCjGLQAbuJV40utbw/Mj+cKftumfLddV/v9dhdE
nXtttQJAWiyNgXFEGkqWuicb5QVlraELh2ACD0Yy3creoaaXN+Sp1rTrM7QLLy08M2bY7+dQLIBs
TVcaAuS2GoWeo3w/HbkLH5Jvp3RwhMPKev+h1HgC/nX9n9jmShoBQXRWjCck73yUMjpei8HuJ2gK
QIlobDGZt6pVFmnHDygbwDa9Mruo+IoymXMEwa2hTKrv292PYD1IgxwHmiU6BxUrrynX3xHRt7vn
0VKuxuTyWvIlNao9xSyKtDCfLv4dXTSpkaOBIJd8tBMKT0V/ujy6tsSB3taK2JQBRDVlaEaIrTqs
6tw+14ucXjyIGy8vLtwNQ8vVDX0BgHR94SXBOJT+T+4/XXb5oBqAThSGZq6tHC6wthjbfwBugwta
fa2+gwcKts8oImf5TPEJaJTOwWog/NFy5AKihnLSYM3/vYsR8gT8ghC5KwloQ6Rs2+lYLynnbCrQ
1FLQP08Go1lXSDKWPO75w/kd7GYOUYCIIskl3pHG5ZEu2yuoXtprtVt/2xyqNUr47UP1DJ1JoYK6
lpHjxi00sZK2zmGSZY5Tse3XVyO4A6DppRl0UwI8Ddi02rk0F71kLniMTWaTCQ6Iy8IiBiuISAUB
KkKxwbhiARPWqT4HW8QwDKA3Pp2DV3d20ICOepmIRY8ZQZ7N3n5e7auH4K9aA5932y+bxzqN0Hny
c2xDd/+KmI/hiQGoD0DaDQwt8NSIzbqsaCMMVzvqJgw+OMayjMKTDU+RIt3buSaTyg18TZ6SNszN
OFrxYzrTg4pbTkmb0IaMZ6R8XqDhQQg2LxOp0d13oXUpE3QpdNciBTUC/VsmoyymWYySScs3xQjA
K09dJ01iuAKFE7yO0AT0AoUmIh5pes8O3Zf97IJqI8bgk5dnue4zH4ZFDp6EmDYHh6QgQvGyzUfG
S0PZZDmjTxgZ6sw8wDeuljZjd5K5zVe7wwYvgXVMe9c5w8KMNFaJwhkG3KRK6zDTHasTTEay19zZ
xcGMbsLCWuc6o5x1yR3HDCZ3EHjW/ioEM9N/d3CI0+XIepIuO9UQRtEdaa378x2TPmkjQZ2DR8eL
yR0z2zksu2Txb7V+Oaw+P1b2qSiwkdrBWfxIplFi0Hr2Yv0m1HceMRQAwyLJjy8KaG/9ybVmWM2V
7MOkhgBXkxPdcBqcxT0b3xZcMJeccf0QxJheIIIN4EhCgfFJmfTePyxGyw3KtEZV7/sPOYwPNdZR
zTG6MTQwYHRIlqlOiE23Ek1gKSAYVO1QfXp/8fFDl8YDLYGY3MLvaQ8t8FjANUDsS84YqQwC/LkH
ZfOEBuj3eZbRF/h+VNDW415TmYJW0cM2NkZgMPWJB3aIGzzJmdceuMjrJ7SnqnrYB4dt8G31dxXU
+YpIg7agijy43tivHE5+1Dn86QjgghGp9WXtDUqrwz/b3V/gwU9VC9RhKnrqXbdACMUo/AZX10mP
4S+4Ib3jtG3D3p3/iam7toiUo934C/zfOHOHtY2Fz6Rbqi5GACVjyWn/YXkSOcbMw5lB4OikBsxO
ZrhBMFOx7D1I1U3UwK3q9I5I5nXakzPdEzu0t/6ghIDUeDYKbHlKXwVciczlOeIYTaBIioVv7MRO
7cmVp2A/sqkUNLKoZ5gZ6aVGWUHPi0RGR+CWBtDHT5Q5WjU/3a+KPMcE+ficHz7y8GLkvhC1Bq+l
f3qzfvm8Wb/pj56ENz4kCJL6QMO/HHr6RIjP/wBPwOip6VmefLK04B+0Ocl9xgqYIwiqfSgpP0ME
VQm5Z51A09zQNAhV6LOAU6QTLYbObMZXnhlGSoZj6hraWMoqhGbDCwxNdMojZml5e3F1eUeSQ8Gh
N72+mF95NsRi+uwWV3S+LWY5DZvzSeabXgohcN0377230QI3elucni9MNb64ZVjUQcseTotZXEuS
s1ykMz2XhtN3faaxasAT28CSATJO/dc5yT0hT/2CSE850fROrIDsSiHi8HLE14C9NNyR0sd1p4x/
gpT3H9AdklqUo0Ivy/5j0+guHvj04FDtD20E7/TPp2YsBiCvgRQnPQcEFyY4gmKJYiHAeTpxSeNJ
T4zFItif8l34qJxyCmPOpRIQlfafgqMxavnlCdQ6Eo5Q63PV4iuE30HCuGVwYqCmBREA1mBNoGVh
E9OfLhwDFk2lJ/ZHuX/0oFQmI5og8knpC4vTiBZRrsGo+wpg0CNGNC2emyJNRUwId6wyWEv9vNgh
bybjbHDX2/jKTAwA7PZWtloZVn9v1oBod5u/6/iyWzPnTIUn52QTSZt10yPIjvC0g5P1i9tExLnH
6sDdM0keUXgNjjINWdzLuOWqHjGSKpkzAES2GK3dQbTZff9ntauCx+3qodo5Mdjcpp/cRCogbcWO
49RZ6SF3XeBwZvUdJ5UV6phsgOQGlcOVHrOUNnGEiZJeKHoUFgYboZI+G94wiJny4LyaAeOYZhjw
CQmoCe3XkY0BdOQtc66yEeWej29/+DwjZpKLXpWWR1HsmY1e9sGD1bye5miJtwQzzmBKaZcxkae0
ZkJ3UDeAhgvEBw+jR+o49eX0DAUuQ+MgyqxXMpFFGEcZT8ElUDEDgPk5d4D61ZImTbPRn70GjNBr
a9q11SWA3e9e4JJhchqUeQYBSp2McFeLdiJmdOCVM4UphXNJvRPDkM4SEeiX5+ft7tBzbtBeeuyi
pRmmxkNQ1Do4d8w697LZrynVgVuTLFEc5Dwi5XGmCzAdKA7UVDpgUozGrgt8PgfXEkbCY+BnOUsl
TeNXQ1nWWTIBFysJ9qcSqynlx2u++ECKZdC1rtas/l3tA/m0P+xevtuCiP03sDUPwWG3etojX/C4
eaqCBxDg5hn/dLMW/4/etjt7PFS7VRDlYxZ8ac3bw/afJzRxwfctphGD33bV/7xsdhVMcMX/09sp
n2TkDnvHXL/ZI/SqWxyZtQcHREyCuyqumAyxpFd5zpp7aiGpiXrBAG0vaGBe67a16zRu7AxnO5B0
Xp/Spm+/TCwNffGhvQUkBbHYuBg49O4c7goWA27yI18jPFcDQBjGXL6Q2UeaLXwUdCse3zQCp12E
NGAbe6JLWJ/2XFrYF/wF0ZHHExb0AqG9nNmTscXjnt4zAFz0rHFCPD+EG7h6m88v+H2F/mdzWH8L
mPNUFzw4AK1R1J/t4iBAoXoOAjcByCrMFGAQxrG2ol//zjCdwEqjPdp77J2we/fNwyWBaqVGMpqo
ON1eqEz1Yv66pUxHt7eeR36n+0gBPuMZFZM4XBww3KB6EpSFqvTqdZpJt9TJJdkkfG/VY5HIVB4l
74nRBYUYnIHFffNlQHdfbUuZ5hqWnDKYBvGxeHWkiEFI6NZvRRD+80GNRWTGdeP5scZZNnbLGRzS
pGBzIYcpm4aIT4b+cKxhShigljNRW8smuSKjowFP1v+0YkjVcEye1abMIPX8FPCnytIsoaWR9seW
5WIszh1bd8pmklEPVs7YuUg1FhOSE6NRx9p3d/o7aCgFnC+d7EteVSEFy9VMkxMqzAYpkgQBsC76
VXB6MR6J0msmnb5C3J1fFNhwpgBFK/oEdMYlRJQL4zlkbawavDLHMs1yvewXrs55uYjHA3Ge9p3J
nlmAn0CJYVWeh3On61zev3omNTztvb3UgJUtpP+wG544Bufu48knS1+uIwll1sR9J94s57qFUITj
IqjOjLmn8D/uv5PYASfb/eHtfvNQBYUetWjNclXVQ5M3QkqbQWMPq2cArKcAch4zx33hr6MrChMj
ph6a6XtLM/FWUfW7JSKmR2w9F03lUvOMJlmr6icpLXtfxeGnef33WaJjY4TpURMRSuaVDGF0XbJi
TQ6KoglEHT6iljRBG7rdePjvl6FrxFySBSwi7XvyuQet2lcyIuvWYWAdenrOkhN9lk/PLwdvlCPT
vOi/QGJDGUUY3ce+6qSaSdvqmmnieZSvmRJmlFwMmezKin21e8QPwzZYYP9lNQi/m/4ZVil5Eus1
y5/ZcsDQI4sZUE+3KGaDW+VIy5/BrPtOxXKU+QIfZ93nF43vy/QjUM1iy8wpM92Qs4JPNIAV4ZgZ
pxGTbPjJjezX0rkcLPzj9o+PdETisPGlMTo/iTjP8L7/OeZwmbJc0c8JLt+EJbmeyJ8YUYwh6lhg
SkZ6Srdc7qj4UxpNv0e7fOMivf+JuePXdzJnCJbmEHBcvsqb2B+vsklAIZ4nmd5o0z8u6cfIns6I
NMHPWl5ltH8r/BTj51jn0hP5DhmlufJ8qtBj1dweMr3v5goOarMcSCpPFbR2/qvdg803yd+zAC1l
P5fsnXDMEnGa3WywCTXosTSOss71nN9Wu9UakUWXmmwFYZxwa+Z4qSb1gNVJqcavuTL3I8qZaRmo
tmM5eOvO5yR314wlcGHvIzUs+vl4W+Zm6cwaw5XkS29j8wH01c2xSCwO4dxsIXpTyVvn6qrdZvXo
QD/nTFh8/FTHqYKqCbdXN71I1Gl2Pvm0HzgOCn+JDpcfbm4uAGczaBp8b+ayRQiPpq+MdSJcl5iq
smAKZrimqAo/7U7EkYVchK0AC33feblSmL/KoszV7e3Cv6EsKnNQN/x49Pg0vX16i32B2x6cRdFE
YroZAbcSS7JyquHof7TpNDqSHI6qZSQ9eb+Wg/N04YkOao4RTz5cL+haqYalSWn9aRimQ2mD2Gd9
ja2Jo3L9KidTtI1ryJGOyzh/bRDLJdMoFovXWDkGvQw/z5BjyeGK0hC1FW8+BEltRrx/nU86pnCm
9tnWA7LAJ2s6eZwWGH16guDmYz8IFM6t2haqe14LZxIQVdbqnCdFncjmn9WghQM29PRzzTb8F7PB
uxq0TKGJ9mRsfu4Z13D4X+59f4qXvnfPU+fjzolLB1EW2tgPzOuX61MofcWpC4/N1JQuu8N97VHv
nK4w1HlCEybDp5ljbuC0RDc3ebB+3K7/otYPxPLy5va2/udNTp/gbHlJ0CQ5MLrxVuMdttCtCg7f
qmD18GDL9uFK2In373rJjZP1OMuRKTeKhrrjXGa+VMucxp/1R1j4xEtbgZqOnzTG9A2bzBNPXTkm
rBMPKLf/ok6YUVkOrUfuh27dSWsqrQ7WmpHso0GNeP3y+/J42Hx5eVrbTyaI7FLTOYnCOsNSoonk
nu+sO65JzENab5EnweviefID8kR+eH91WYIi00NMDC9zpiWnUTIOMRVJHnu+csIFmA/XH//wknVy
44lO2Ghxc3Hhj+1s76XmHg1AspElS66vbxYI4dkZKZm7ZHFLv1WfPTbHUIlxEQ+/X++o/Mw+MBFV
csHbj3fPcBEcdVHTbvX8bbPeUzYkVKd5GgZtbhFCs1e3ua5N2q2+V8Hnly9fwDqHp1UL0YiUGdmt
LpxZrf963Hz9dgj+KwC9PU0VHYcGKv77ZloTOdruojE+jTEuPMPaVtecn7meevu03z7aKoHnx9WP
5phPE1l1scYJqO41w3/jIoGQ6PaCpqtsriEUcfzgK7MfC5OGh+3YKYhvTkveJjI83QM09hKqMsRi
WgCMy1IbJdKx510DGAEIkKQCJzo1kzh09w8e1QHWc7VGSIYdCBOIPdh7fMz1LaFkXHm+KbDU3Fet
aKkF5mi95JGIp54EApI5uBb1v5VdWXMbOQ5+31+hytNuVZLxFcd5yEOrD6njvtyHDr+oFFtjqya2
XJK8O9lfvwDZbJFsgNJWTTkjAs1m8wBBEPjA7EeCDJpq5qDnzchjVLUY5TXinzgeF4KAJ8/5ME+k
w9iN8qyMGXMhsoRptYho31FBTkJuTxLk+9uQb/0oTIcxo2ULelTyVY9A/49zRlVGhkk88eBAz9Kh
ZbyVSzDM+W6ZwmkqZ3AXxLvDaZVzLlSi+fPSY+PgkCHGC32eygTJIO2HN2T2eKTW0zgbM+Z/2S0Z
RvzWjqYlvtDFeHqY5RPaWiUnNRzfeCO1ZEnwDtpBn0cg4o2x08hlKGe2LdLk9Xge0Zuq4Mjxeskx
Z0XslHveZEwIEtJguw7pAyBSCzjdgjyBmc0viiKsvWSe8dKuwLOx76gggbeUODn5tVOUcerxr6i8
2PUZ7e04Ty/CEGN8HTWwDlotNUzwwMw4PgqeJisSh3QoucMark2084Kayy+iKvXK+kc+d76ijh2L
AKRHFTImMkEf4yFXRnewTA1uvouiotVx5JjFWco34j4sc+cn4L2i71qIFUgL4SJDH/XE/poU9Emf
3PY7y7WmpXRGXjiP5WM/5uGLkMOpN6eM1g/bHHslloVTEGlM4JhE2YiHccJ5P8TwN4uHXkai+8GJ
Cs7Jhqdn7Uv9lawtwCPcxPb5lU53qTdsIi3E9qAIov97FDNKkHxugT70iyyv44j+jpat5xJgM4xD
jxlwq4FaJzazIK4Kzn+7Ya4+0CDW2qAo83lrL0vDzEDtVMUpV2tQeFRt6GTQr0yUci5PkiodK+Vk
ba8f+uaA9cN2s9v8uR+Mf7+ttp8mg6f31W5vHIU6Z2I36+H1IMf6ZjY1JWrYhRkZPcqTIIrp3RWD
GCWATlsCP9BoacN0KEYMdyk83X4u8UttFJ5DKeKfoYs/Nz7jKaI2kBYwX1iqqs371jCmtA8KYEQZ
52CUiIgQ44MqOKHj+w+FXu0XcX1+diafMbwslXMI7Lz19RV9BiZbptXhxckwp645YuiXRsOIM6KW
BHFQLJ9WEtyh6s+WY6wSCHf1stmv3rabB+r8heE1Nfro09ZT4mFZ6dvL7omsr0grtQzpGo0nrfPs
NCYuTyto2z9bJK78deA/r9/+Ndjh/vJnF7OzU+B43suvzRMUVxuf8ueiyNJasd0sHx82L9yDJF3e
SM2KP6LtarV7WELX32228R1XyTFWwbv+nM64Cno03TacrPcrSR2+r389oj1BdRIxUHgrNkN3Q7RS
gMqY9G4VVATHybWL6u/el7+gn9iOJOn6NED8794cmCFG1N+9OtuH2mutid+QX0A93OkpJ02uw6sE
+tgkKkMmemeGfvqcGpIzxoSYkYbFlPC7Ku8GD9BKwueqvLOdr/EOzj6nahDsRj1acxClg72pEkZ8
ZtLIa47xnELeVjF4QLYM6IvbPPNQvbtAIt0T47lyggftuizDjLlH0PiCUyqrvIRR5JELLzDjdHaT
3mHzWLYUNrUE/hax+6XFzFtc3GQp3hqxTqwHLuwRcuzMHtaexpO7z/jNpWa8gBwqDZv2ZfO63m+2
lFbiYtMmhtdXW73Xx+1m/agvVtCVyzymr28Vu6Z3MidVDLfrL47xFKPAHjDKnPIJYOAehEPqwjaC
qrNKv8rDkyKYjKoyYq4FqzhnrvyTOOVWnPCK9WVwKMnQIgbTw55XtPuQ5YzYBiiDpJfTyhCwEy+J
A8TUjSoC+6z7ZlRoPDP6Y1ZfLCL6s4B2uSAjq4FyZSAnigJEMUSccKzTImGzBGa35yd9UhX6DQK/
WQ27Yj2gfwyDC50Zf7PM8IJ0eAig7qRkjBjWFffxP3jSjCeNoortztx3EIe1oy1ZnDgejS74JxHf
3qM0W25AUNGNKnMgZJnE/lvkJPg/Hm8FErPhF5aiI0eN6VBoelRpKHpMMUJBmbgEFSbUsc77HU0e
obV7ILsglgWLFnj+UK3nOH0L10h5PI99r+cx1vHdNTkT04lubVF1xY2TJNOLLRLrykS+4My37fGa
m4EyTNsiSzmyfHi27hMrApVNHagkt2QPPpV5+kcwCYR0IoRTXOXfrq/PuFY1QdQjqffQdUuDS179
EXn1H+EM/4K6Yb69G1YT4lVCK+olE5sFfyuEJz8PQsR9+351+ZWix3D2RHFbf/+w3m1ubr58+3Su
A0ForE0d3TBiVraAXvo1sbjVBuHqAak+7FbvjxsBO9jrGTxSWtNKFN0yAcaC2EujhIUCGC/NsxiW
eq860HiToDTRaFr6bVhmeseL7A+afQBhPayflNCShBmGZ2vjHKIvgV+GsCkafrLwT1Sp71bqU7+b
DiHUlTTeQePqMDW6Ky+9bBTywtcLHLSIp4VC9nHUMf8gkNCgzO4xjrYOHc3hSb5IekLrS3eNV40Z
4sSxhWKU64yVYKnj6wuedpfNrpzUa55aul5aOFLQzKsJK/Mc3V2yO4HyKDPnoyJGplzD35ML6/el
/dtcSqLsyohsRPVsSoZ3SebFuc0OZRSIfSEaKPQAb543eu4rQUlAjGnUF/s1CwHoglGuYgNe4A26
TGn2QUJVf95snz70mnLeYjNat70aE26vrV96kFkd2KYSgD2q0MyA+juoe4WR8DaVCcw033dQf+yf
sre1F8Jw9HNSIMFOPFU1WWkkuhO/FyMd1KUtQ88c2KYQ/MlwpJNU/kpBwFNxKz/mCHng8UKPm9h6
Zhv40aU90XdVjay25QVsy8Z46LSvl7Srm8n0lYbdM5humDQBFhMdZWMxnfS6Exp+c31Km65pfz6L
6ZSGX9PXnBYTAzhoMp3SBdc0PqbFRIewGUzfLk+o6dspA/zt8oR++nZ1QptuvvL9BMoyTvgFrSsa
1Zxz6StsLn4SeJUfk4AEWkvO7RWmCHx3KA5+ziiO4x3BzxbFwQ+w4uDXk+LgR63rhuMfc378a5is
Oshym8c3CwY1R5HpkEUkp56PmgoXWtxy+CGCDx9hyeqwYYIzO6Yyhy312MvmZZwkR1438sKjLGXI
+Lsojhi+y7ri7/NkTUxb54zuO/ZRdVPexgyeKPKwx7wgoY2bTRbjWiUWIRzkp0ZWVsP610bHPbxv
1/vffWjv29CEl8DfizK8axCTj8dbLzC8HzTLTAQ7Yy46RkuVBppQePLRLIiLHYwR97V0mEyU7W8R
pGElLi/qMmbMqIrXSSQVDHEhrjKgCduPnxfzQ6Yzw1fNZqNfh2qoL3hSGL4+xqMa9vb4f/hOT9Pa
kir9/gFvpxHn7OPv5cvyI6Kdva1fP+6Wf66gnvXjRwyTf8JR/vjz7c8PRp6j5+X2cfVqYrvreQXW
r+v9evlr/V8rWbZI+Swz1bQZaTRjNma4yWTfdM1n7swUM2ZtYHlNNHu7SVZiJOKLDrFj1mTvjvU4
FXN1P+9vf7/tN4OHzXY12GwHz6tfbzqUp2RGs6KRnMcovuiXh17QL61u/bgY6zA1FqH/CGLLkoV9
1jIbEQ1ha74tCoIdcUX7xRIyqN/uttwwrrckG32ffLA7MCF2ZUXUglF6fC1Ipd4t/qHFu/rOph6D
THKx2HCa0kL2/vPX+uHTX6vfgwcxb57Qo/+3br5Uo8GghLfkgN4SWmroH6OXHAq5mlEprW6pHmrK
SXjx5cv5t94neu/759Xrfv2wRHS38FV8JwbQ/Ge9fx54u93mYS1IwXK/JD7c9+mNqyWP3GQ4eMJ/
F2dFnszPL8+YpIJqkY3i6vyC3j9VP4R3MQ0K0nXl2AOx1AcVHQovoJfNo5GPsW3l0KemnR1TY5Fr
x4Lw66q3ukJ/SLwlKekQjpacuxtRQNP5VszIRQg785RLXKiGAv3l6sY5tOh62e/m8XL33PVyr8to
eCslBlOPGoaZ9Yk2fWJV2oIgPq12+/5Al/7lBTnWSHC9ZTYbe4ze13IME+82vHCOlmThjKmqIfX5
WcBBhreL7lhbTlluaUCfVzqy++kYFprwqnAOTpkGR1Y0cjDGjAPHxRf6lHfguLxw1lGNPfoYfKBb
7+jRv5xTexMQmAyrSnC7yQjWPMwZC1y7c43K82/OyTktvpggL3Ltrd+eDSfMTs5SUsHDpG+0V0Q3
e/Op7Zram75eGsKhz7mXYfYb59xCBud4B0zwQUuOxL/ObveSynPPGLVzuXejsuBcnbrxd66yeprb
XdrGP768bVe7nZXctft+xPlmUty228o9k65Bkm+unBMquXe2Gshj57LHhPS9byqXr4+bl0H2/vJz
tW3TSNrZa9VkzKp44Rcl4yStuqEcjoRXuIvpByKpo0NayZ3lNA0XM3YujgnXjlGp+ScxH/mWjg+P
Gv3pIA81v9Y/t0s4RG037/v1K6HIJPGQWd5IOWH7QTY5849ykSpnn09tRQi4dx9+PycrO2W/OjSN
Vif73FKoE50xplUur5qnaYgGCGG9qOdF39vZX2336HsKKvNOgELu1k+vIpnv4OF59fCXlY9F3tNh
z2N4dNWZVcgj8il1i8qT/jw4mHD6GepayjCuMf1FWWlX4srrE/ahzC/mmHAvVc4xBEsSZgwV0Qub
OjaTiPh5GTD6AUa5hXDiS4d0AIk0GnmJOXo+HEdgPZPD7p9f28xOTcpfxHWzYOq6tPZ6KABpn0RM
UoaWIYn9cDi/IR6VFE6oChavnPIyHTmGjAETqMzNC1BYAm0Uh2UjdWTusRvi66VubLjXCbAYd5/d
4xJF9CHDRwP2LUyt1aZD0cuvyHLcaUjC7B6L7d+L2c11r0z45RZ93ti7vuoVeka2wq6sHsNU7hEQ
K7Nf79D/oXdWW8p00+HbFqN7HQVVIwyBcEFSkvvUIwmze4Y/Z8qvyHLs/r4w0A2rnWxF6GRY1CLH
dqkjh8PkQc9UPcepLMJrcDPBKZYHqYEAj2lrUw/ZhFFWB4GAYmgqYjmDJBoLJUBrECb0xvpkghrg
RedVGd93jMsvGoIFqRhxRbwMSVmeKYLIlWpSOxLmLjVJZdjjDuIy9OuOcrhlABoqEZwzbDVK5OBo
1d3pHiCJ6UfVDWidw0Hv2vANics7kaKMeA2s7CjQ08eIuPAR7H+lNu4VCDSr/Wj9z0ak1Oh2yd7m
Zzc2zq0eUwShHVXjJIgvWWLJEhMXMW34Wv20CHSbsk5rOqJp11eKhCh9265f938JVKnHl9XuiQoz
hf00q29FhBy33yIdIS1oQ26LhZIgFP8kTDofjK8sx10Th/X3q4PPXVXhjXOvhqtDKxA3TDUlCLmY
U8SHhenmCnfVObicKDIVOnCFZYk51PW7NLZLu9PX+tfq03790qpeO8H6IMu31ADIpsB+RoG/RyW8
fzH1yuz7+dnFlTnhC5h36YLJx17CcUCY1IFHk4MyczW8DmSejqstW1GFIs8zui+mCLGlrTmLItq0
yLNkbgm0KYL9yWYXucT91nxk9XJD/sh0xnnpw9eG3q3K+kyru6f2shF32S6RYPXz/ekJL4q0VEP/
0BL6jWLhr6pntdIKD3nAM+zd72d/n1NcEhmQrkFhHeKlKib/0FPAdWmdySvfYWXfMlsBo85vNIca
vWjD3gRAv1UlU9qLt64y87AAC7ZLGk0vNVEhMvIJskU1+TRjjsKCDLMFUVm4dEPiLfnwB8xP5qY4
aYaKjW6p4Ohl3+40h0moukxgnHu3/YmrKI4mylvTBiUd3QjMrNpyhZnAKGKgDWR9ExoNUgyiiEgU
l6zaXYIvdI1bD+aQhuVkUtFNFPfRLAeuuIZzt5byzb6RPUyM3reOrSxo0rSO/IN887b7OEg2D3+9
v8llO16+PhnJxTNYKiBq8rzQRIdRjIFLDdoEDCLuYegDqmXeRNwY9JhsCmhazSfhk8TFuMkwYVZF
d/z0jgQe7Ogib6F8G7lK3R0gHTNAnGHCsi297OQk4bc3Qe/N5MNNOFG7PXbYibdhyOZ/bpd1GYZp
0b8Xxc/SxM8/d2/rVwFQ+XHw8r5f/b2C/1ntHz5//vyv/h6ISntThzNnDkkKR8BiOV5JOa3C1MUg
9VaJce1ga0OTpFGv1T3pakUQFMy+GjMA9lVUNcOmsvGMItuNcuSoSmm7/8dIdJs8Sh+BeauLOLHT
gwxfNBmi32Cq+R4arS0PpUBmRID0ux48LvfLAW5PIlcYoROh3cs1B4/QK9cElkFZIZOZT24Wi8Cr
8YBVlk3Rh/0yFjXzSfZb/RL6D1ORmVmnpZXbb+hFDwQYci9xzBtkOTq5kKkMI6YujQmzqQr1sJOo
l2dnOkNvimBheFdRkknBQxhfZ/cLSFap+5WE1mdwymhC0DxEBl96qcFhPvPnFtSbvp1HTSa1WfEh
2rHVpI5KrxjTPOocEamuMCqQsNGpCN+FLkdr5oFFEgUasFkoDrC2D3/U62ur8bSEEGqEgwH2Z9ga
IxdLK+KdrxHbkYNhPIXBcDFILbpTqiUnvSYlbVFlXlGNc2ruDkEuwQmkKHMREWJ7qKlyL4PFL1D8
5QPMTtGxwzpwMrbZaNHvUrSR7qp5Vo8XIom04/PEyWgxhOk7Tr2S3uPacYnFWQTDMvl9QmT87kua
18fd5QUta9rdLw6Euaqa3w9zenux69CtELVMEi90G3/z79V2+bTSX3KLWYrJFiupjCdvkTbqhzx2
ksxtKCXFY2q1oMv6+aRdeLq5ViVGwB7E1WcDRUmFDm9fKg6cTLCkcSYQtHgO9vmh2nHFlu8Q3kO8
8HfQ0Z5Z5UmOgEwslzh3g+68cFcGh2/cA1i6suq51RTx4eNwhtnEHT0jLXfSEZZZGi1f5TMXsYLh
FjhqBoVBMAjzEX2pI+jSqsjTm8ZGt9CpM2Gc5ukYRB0lOX2BKDhKvAwRSZwc3cldMQtqHNC3r3Ie
39Iam/r23AaA0+mTlD/Ey86pRDJ61wANC1fn40XnOBd7Ae2nF8VwKoZ2HhGPorYoLlNQWx0dKSOS
Hd/DWxnb6Sj8uFkvdjkl09wxY+CY7sPu6Fwb4k6WEZaqEjeDcLFGQwoTNhum7BHCKc57/tfS8vw/
voTI2rWpAAA=
--===============2655333276306587548==--

