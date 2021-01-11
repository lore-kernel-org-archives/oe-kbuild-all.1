Content-Type: multipart/mixed; boundary="===============3668653462488328760=="
MIME-Version: 1.0
From: Chao Yu <yuchao0@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: fs/f2fs/gc.c:622:12: warning: stack frame size of 3056 bytes in function 'get_victim_by_default'
Date: Mon, 11 Jan 2021 16:23:28 +0800
Message-ID: <c59ab262-4b64-794c-3dd9-fa571848562a@huawei.com>
In-Reply-To: <202101092153.mJkwUvtn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3668653462488328760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the report.

I replied for your previous report [1], could you please check that?

[1] https://lore.kernel.org/lkml/8a8ef6b8-84c2-abfe-e758-2fa52a989c72(a)hua=
wei.com/

That says, in my environment, get_victim_by_default()'s frame size is less =
than
512 bytes, and also after going through related code, I don't see any obvio=
us
large stack size usage.

Is that issue a powerpc specified issue?

Could you help to verify powerpc compiling with -Wframe-larger-than=3D512 a=
fter
reverting that atgc patch? I mean whether get_victim_by_default() already h=
ave
large frame size before applying atgc patch (commit 093749e296e2)?

On 2021/1/9 21:18, kernel test robot wrote:
> Hi Chao,
> =

> FYI, the error/warning still remains.
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   996e435fd401de35df62ac943ab9402cfe85c430
> commit: 093749e296e29a4b0162eb925a6701a01e8c9a98 f2fs: support age thresh=
old based garbage collection
> date:   4 months ago
> config: powerpc-randconfig-r033-20210109 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bc55=
6e5685c0f97e79fb7b3c6f15cc5062db8e36)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3D093749e296e29a4b0162eb925a6701a01e8c9a98
>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux.git
>          git fetch --no-tags linus master
>          git checkout 093749e296e29a4b0162eb925a6701a01e8c9a98
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Dpowerpc
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>     arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:182:1: note: expanded from here
>     __do_insw
>     ^
>     arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do=
_insw'
>     #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from fs/f2fs/gc.c:10:
>     In file included from include/linux/backing-dev.h:15:
>     In file included from include/linux/blkdev.h:13:
>     In file included from include/linux/pagemap.h:11:
>     In file included from include/linux/highmem.h:10:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:604:
>     arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:184:1: note: expanded from here
>     __do_insl
>     ^
>     arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do=
_insl'
>     #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from fs/f2fs/gc.c:10:
>     In file included from include/linux/backing-dev.h:15:
>     In file included from include/linux/blkdev.h:13:
>     In file included from include/linux/pagemap.h:11:
>     In file included from include/linux/highmem.h:10:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:604:
>     arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned lon=
g c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>     arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:186:1: note: expanded from here
>     __do_outsb
>     ^
>     arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do=
_outsb'
>     #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>                                             ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from fs/f2fs/gc.c:10:
>     In file included from include/linux/backing-dev.h:15:
>     In file included from include/linux/blkdev.h:13:
>     In file included from include/linux/pagemap.h:11:
>     In file included from include/linux/highmem.h:10:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:604:
>     arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned lon=
g c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>     arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:188:1: note: expanded from here
>     __do_outsw
>     ^
>     arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do=
_outsw'
>     #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>                                             ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from fs/f2fs/gc.c:10:
>     In file included from include/linux/backing-dev.h:15:
>     In file included from include/linux/blkdev.h:13:
>     In file included from include/linux/pagemap.h:11:
>     In file included from include/linux/highmem.h:10:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:604:
>     arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned lon=
g c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>     arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:190:1: note: expanded from here
>     __do_outsl
>     ^
>     arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do=
_outsl'
>     #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>                                             ~~~~~~~~~~~~~~~~~~~~~^
>>> fs/f2fs/gc.c:622:12: warning: stack frame size of 3056 bytes in functio=
n 'get_victim_by_default' [-Wframe-larger-than=3D]
>     static int get_victim_by_default(struct f2fs_sb_info *sbi,
>                ^
>     13 warnings generated.
> =

> =

> vim +/get_victim_by_default +622 fs/f2fs/gc.c
> =

> 093749e296e29a4 Chao Yu       2020-08-04  613
> 0a8165d7c2cf139 Jaegeuk Kim   2012-11-29  614  /*
> 111d2495a8a8fbd Masanari Iida 2013-03-19  615   * This function is called=
 from two paths.
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  616   * One is garbage collecti=
on and the other is SSR segment selection.
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  617   * When it is called durin=
g GC, it just gets a victim segment
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  618   * and it does not remove =
it from dirty seglist.
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  619   * When it is called from =
SSR segment selection, it finds a segment
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  620   * which has minimum valid=
 blocks and removes it from dirty seglist.
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  621   */
> 7bc0900347e069a Jaegeuk Kim   2012-11-02 @622  static int get_victim_by_d=
efault(struct f2fs_sb_info *sbi,
> 093749e296e29a4 Chao Yu       2020-08-04  623  			unsigned int *result, i=
nt gc_type, int type,
> 093749e296e29a4 Chao Yu       2020-08-04  624  			char alloc_mode, unsign=
ed long long age)
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  625  {
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  626  	struct dirty_seglist_info=
 *dirty_i =3D DIRTY_I(sbi);
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  627  	struct sit_info *sm =3D S=
IT_I(sbi);
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  628  	struct victim_sel_policy =
p;
> 3fa565039e3338f Sheng Yong    2016-09-29  629  	unsigned int secno, last_=
victim;
> 04f0b2eaa3b3ee2 Qiuyang Sun   2019-06-05  630  	unsigned int last_segment;
> 093749e296e29a4 Chao Yu       2020-08-04  631  	unsigned int nsearched;
> 093749e296e29a4 Chao Yu       2020-08-04  632  	bool is_atgc;
> 97767500781fae9 Qilong Zhang  2020-06-28  633  	int ret =3D 0;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  634
> 210f41bc048263d Chao Yu       2014-09-15  635  	mutex_lock(&dirty_i->segl=
ist_lock);
> 04f0b2eaa3b3ee2 Qiuyang Sun   2019-06-05  636  	last_segment =3D MAIN_SEC=
S(sbi) * sbi->segs_per_sec;
> 210f41bc048263d Chao Yu       2014-09-15  637
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  638  	p.alloc_mode =3D alloc_mo=
de;
> 093749e296e29a4 Chao Yu       2020-08-04  639  	p.age =3D age;
> 093749e296e29a4 Chao Yu       2020-08-04  640  	p.age_threshold =3D sbi->=
am.age_threshold;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  641
> 093749e296e29a4 Chao Yu       2020-08-04  642  retry:
> 093749e296e29a4 Chao Yu       2020-08-04  643  	select_policy(sbi, gc_typ=
e, type, &p);
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  644  	p.min_segno =3D NULL_SEGN=
O;
> 093749e296e29a4 Chao Yu       2020-08-04  645  	p.oldest_age =3D 0;
> 3fa565039e3338f Sheng Yong    2016-09-29  646  	p.min_cost =3D get_max_co=
st(sbi, &p);
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  647
> 093749e296e29a4 Chao Yu       2020-08-04  648  	is_atgc =3D (p.gc_mode =
=3D=3D GC_AT || p.alloc_mode =3D=3D AT_SSR);
> 093749e296e29a4 Chao Yu       2020-08-04  649  	nsearched =3D 0;
> 093749e296e29a4 Chao Yu       2020-08-04  650
> 093749e296e29a4 Chao Yu       2020-08-04  651  	if (is_atgc)
> 093749e296e29a4 Chao Yu       2020-08-04  652  		SIT_I(sbi)->dirty_min_mt=
ime =3D ULLONG_MAX;
> 093749e296e29a4 Chao Yu       2020-08-04  653
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  654  	if (*result !=3D NULL_SEG=
NO) {
> 97767500781fae9 Qilong Zhang  2020-06-28  655  		if (!get_valid_blocks(sb=
i, *result, false)) {
> 97767500781fae9 Qilong Zhang  2020-06-28  656  			ret =3D -ENODATA;
> 97767500781fae9 Qilong Zhang  2020-06-28  657  			goto out;
> 97767500781fae9 Qilong Zhang  2020-06-28  658  		}
> 97767500781fae9 Qilong Zhang  2020-06-28  659
> 97767500781fae9 Qilong Zhang  2020-06-28  660  		if (sec_usage_check(sbi,=
 GET_SEC_FROM_SEG(sbi, *result)))
> 97767500781fae9 Qilong Zhang  2020-06-28  661  			ret =3D -EBUSY;
> 97767500781fae9 Qilong Zhang  2020-06-28  662  		else
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  663  			p.min_segno =3D *result;
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  664  		goto out;
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  665  	}
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  666
> 97767500781fae9 Qilong Zhang  2020-06-28  667  	ret =3D -ENODATA;
> 3342bb303bf48dd Chao Yu       2015-10-05  668  	if (p.max_search =3D=3D 0)
> 3342bb303bf48dd Chao Yu       2015-10-05  669  		goto out;
> 3342bb303bf48dd Chao Yu       2015-10-05  670
> e3080b0120a15e6 Chao Yu       2018-10-24  671  	if (__is_large_section(sb=
i) && p.alloc_mode =3D=3D LFS) {
> e3080b0120a15e6 Chao Yu       2018-10-24  672  		if (sbi->next_victim_seg=
[BG_GC] !=3D NULL_SEGNO) {
> e3080b0120a15e6 Chao Yu       2018-10-24  673  			p.min_segno =3D sbi->ne=
xt_victim_seg[BG_GC];
> e3080b0120a15e6 Chao Yu       2018-10-24  674  			*result =3D p.min_segno;
> e3080b0120a15e6 Chao Yu       2018-10-24  675  			sbi->next_victim_seg[BG=
_GC] =3D NULL_SEGNO;
> e3080b0120a15e6 Chao Yu       2018-10-24  676  			goto got_result;
> e3080b0120a15e6 Chao Yu       2018-10-24  677  		}
> e3080b0120a15e6 Chao Yu       2018-10-24  678  		if (gc_type =3D=3D FG_GC=
 &&
> e3080b0120a15e6 Chao Yu       2018-10-24  679  				sbi->next_victim_seg[F=
G_GC] !=3D NULL_SEGNO) {
> e3080b0120a15e6 Chao Yu       2018-10-24  680  			p.min_segno =3D sbi->ne=
xt_victim_seg[FG_GC];
> e3080b0120a15e6 Chao Yu       2018-10-24  681  			*result =3D p.min_segno;
> e3080b0120a15e6 Chao Yu       2018-10-24  682  			sbi->next_victim_seg[FG=
_GC] =3D NULL_SEGNO;
> e3080b0120a15e6 Chao Yu       2018-10-24  683  			goto got_result;
> e3080b0120a15e6 Chao Yu       2018-10-24  684  		}
> e3080b0120a15e6 Chao Yu       2018-10-24  685  	}
> e3080b0120a15e6 Chao Yu       2018-10-24  686
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  687  	last_victim =3D sm->last_=
victim[p.gc_mode];
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  688  	if (p.alloc_mode =3D=3D L=
FS && gc_type =3D=3D FG_GC) {
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  689  		p.min_segno =3D check_bg=
_victims(sbi);
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  690  		if (p.min_segno !=3D NUL=
L_SEGNO)
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  691  			goto got_it;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  692  	}
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  693
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  694  	while (1) {
> da52f8ade40b032 Jack Qiu      2020-06-18  695  		unsigned long cost, *dir=
ty_bitmap;
> da52f8ade40b032 Jack Qiu      2020-06-18  696  		unsigned int unit_no, se=
gno;
> da52f8ade40b032 Jack Qiu      2020-06-18  697
> da52f8ade40b032 Jack Qiu      2020-06-18  698  		dirty_bitmap =3D p.dirty=
_bitmap;
> da52f8ade40b032 Jack Qiu      2020-06-18  699  		unit_no =3D find_next_bi=
t(dirty_bitmap,
> da52f8ade40b032 Jack Qiu      2020-06-18  700  				last_segment / p.ofs_u=
nit,
> da52f8ade40b032 Jack Qiu      2020-06-18  701  				p.offset / p.ofs_unit);
> da52f8ade40b032 Jack Qiu      2020-06-18  702  		segno =3D unit_no * p.of=
s_unit;
> a43f7ec327b0d86 Chao Yu       2015-10-05  703  		if (segno >=3D last_segm=
ent) {
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  704  			if (sm->last_victim[p.g=
c_mode]) {
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  705  				last_segment =3D
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  706  					sm->last_victim[p.gc_=
mode];
> e066b83c9b40f3a Jaegeuk Kim   2017-04-13  707  				sm->last_victim[p.gc_m=
ode] =3D 0;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  708  				p.offset =3D 0;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  709  				continue;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  710  			}
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  711  			break;
> 7bc0900347e069a Jaegeuk Kim   2012-11-02  712  		}
> a57e564d14d9d12 Jin Xu        2013-09-13  713
> a57e564d14d9d12 Jin Xu        2013-09-13  714  		p.offset =3D segno + p.o=
fs_unit;
> 688159b6db47a9e Fan Li        2016-02-03  715  		nsearched++;
> 688159b6db47a9e Fan Li        2016-02-03  716
> =

> :::::: The code at line 622 was first introduced by commit
> :::::: 7bc0900347e069a1676d28ad6f98cafaf8cfd6e9 f2fs: add garbage collect=
ion functions
> =

> :::::: TO: Jaegeuk Kim <jaegeuk.kim@samsung.com>
> :::::: CC: Jaegeuk Kim <jaegeuk.kim@samsung.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============3668653462488328760==--

