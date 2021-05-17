Content-Type: multipart/mixed; boundary="===============1423401084351979119=="
MIME-Version: 1.0
From: Mark Rutland <mark.rutland@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [mark-rutland:atomics/arch-atomic 20/33] include/asm-generic/atomic-long.h:883:9: error: implicit declaration of function 'atomic_xchg'; did you mean 'atomic64_xchg'?
Date: Mon, 17 May 2021 15:19:48 +0100
Message-ID: <20210517141922.GA69219@C02TD0UTHF1T.local>
In-Reply-To: <202105171932.baR4hI4D-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1423401084351979119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 07:53:43PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git at=
omics/arch-atomic
> head:   11e2a4a373daf878d565ed5d53c35e4351d63221
> commit: a3a90a873f0a64157c7e11ac1edd78f1106ef29d [20/33] locking/atomic: =
m68k: move to ARCH_ATOMIC
> config: m68k-defconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/=
commit/?id=3Da3a90a873f0a64157c7e11ac1edd78f1106ef29d
>         git remote add mark-rutland https://git.kernel.org/pub/scm/linux/=
kernel/git/mark/linux.git
>         git fetch --no-tags mark-rutland atomics/arch-atomic
>         git checkout a3a90a873f0a64157c7e11ac1edd78f1106ef29d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dm68k =


The gist of this is that I'd failed to add:

#define arch_atomic_${FOO} arch_atomic_${FOO}

... for a bunch of the atomics. I've folded that into the series, and
will push that out soon. I'm intending to send a v2 with the various
fixups so far.

Thanks,
Mark.

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> Note: the mark-rutland/atomics/arch-atomic HEAD 11e2a4a373daf878d565ed5d5=
3c35e4351d63221 builds fine.
>       It only hurts bisectibility.
> =

> All errors (new ones prefixed by >>):
> =

>    In file included from include/linux/atomic.h:87,
>                     from include/linux/rcupdate.h:25,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from arch/m68k/kernel/asm-offsets.c:15:
>    include/asm-generic/atomic-long.h: In function 'atomic_long_add_return=
':
>    include/asm-generic/atomic-long.h:553:9: error: implicit declaration o=
f function 'atomic_add_return'; did you mean 'atomic64_add_return'? [-Werro=
r=3Dimplicit-function-declaration]
>      553 |  return atomic_add_return(i, v);
>          |         ^~~~~~~~~~~~~~~~~
>          |         atomic64_add_return
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_add':
>    include/asm-generic/atomic-long.h:577:9: error: implicit declaration o=
f function 'atomic_fetch_add'; did you mean 'atomic64_fetch_add'? [-Werror=
=3Dimplicit-function-declaration]
>      577 |  return atomic_fetch_add(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_add
>    include/asm-generic/atomic-long.h: In function 'atomic_long_sub_return=
':
>    include/asm-generic/atomic-long.h:607:9: error: implicit declaration o=
f function 'atomic_sub_return'; did you mean 'atomic64_sub_return'? [-Werro=
r=3Dimplicit-function-declaration]
>      607 |  return atomic_sub_return(i, v);
>          |         ^~~~~~~~~~~~~~~~~
>          |         atomic64_sub_return
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_sub':
>    include/asm-generic/atomic-long.h:631:9: error: implicit declaration o=
f function 'atomic_fetch_sub'; did you mean 'atomic64_fetch_sub'? [-Werror=
=3Dimplicit-function-declaration]
>      631 |  return atomic_fetch_sub(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_sub
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_and':
>    include/asm-generic/atomic-long.h:769:9: error: implicit declaration o=
f function 'atomic_fetch_and'; did you mean 'atomic64_fetch_and'? [-Werror=
=3Dimplicit-function-declaration]
>      769 |  return atomic_fetch_and(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_and
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
>    include/asm-generic/atomic-long.h:829:9: error: implicit declaration o=
f function 'atomic_fetch_or'; did you mean 'atomic64_fetch_or'? [-Werror=3D=
implicit-function-declaration]
>      829 |  return atomic_fetch_or(i, v);
>          |         ^~~~~~~~~~~~~~~
>          |         atomic64_fetch_or
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
>    include/asm-generic/atomic-long.h:859:9: error: implicit declaration o=
f function 'atomic_fetch_xor'; did you mean 'atomic64_fetch_xor'? [-Werror=
=3Dimplicit-function-declaration]
>      859 |  return atomic_fetch_xor(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_xor
>    include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
> >> include/asm-generic/atomic-long.h:883:9: error: implicit declaration o=
f function 'atomic_xchg'; did you mean 'atomic64_xchg'? [-Werror=3Dimplicit=
-function-declaration]
>      883 |  return atomic_xchg(v, i);
>          |         ^~~~~~~~~~~
>          |         atomic64_xchg
>    include/asm-generic/atomic-long.h: In function 'atomic_long_cmpxchg':
> >> include/asm-generic/atomic-long.h:907:9: error: implicit declaration o=
f function 'atomic_cmpxchg'; did you mean 'atomic64_cmpxchg'? [-Werror=3Dim=
plicit-function-declaration]
>      907 |  return atomic_cmpxchg(v, old, new);
>          |         ^~~~~~~~~~~~~~
>          |         atomic64_cmpxchg
>    cc1: some warnings being treated as errors
> --
>    In file included from include/linux/atomic.h:87,
>                     from include/linux/rcupdate.h:25,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from arch/m68k/kernel/asm-offsets.c:15:
>    include/asm-generic/atomic-long.h: In function 'atomic_long_add_return=
':
>    include/asm-generic/atomic-long.h:553:9: error: implicit declaration o=
f function 'atomic_add_return'; did you mean 'atomic64_add_return'? [-Werro=
r=3Dimplicit-function-declaration]
>      553 |  return atomic_add_return(i, v);
>          |         ^~~~~~~~~~~~~~~~~
>          |         atomic64_add_return
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_add':
>    include/asm-generic/atomic-long.h:577:9: error: implicit declaration o=
f function 'atomic_fetch_add'; did you mean 'atomic64_fetch_add'? [-Werror=
=3Dimplicit-function-declaration]
>      577 |  return atomic_fetch_add(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_add
>    include/asm-generic/atomic-long.h: In function 'atomic_long_sub_return=
':
>    include/asm-generic/atomic-long.h:607:9: error: implicit declaration o=
f function 'atomic_sub_return'; did you mean 'atomic64_sub_return'? [-Werro=
r=3Dimplicit-function-declaration]
>      607 |  return atomic_sub_return(i, v);
>          |         ^~~~~~~~~~~~~~~~~
>          |         atomic64_sub_return
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_sub':
>    include/asm-generic/atomic-long.h:631:9: error: implicit declaration o=
f function 'atomic_fetch_sub'; did you mean 'atomic64_fetch_sub'? [-Werror=
=3Dimplicit-function-declaration]
>      631 |  return atomic_fetch_sub(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_sub
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_and':
>    include/asm-generic/atomic-long.h:769:9: error: implicit declaration o=
f function 'atomic_fetch_and'; did you mean 'atomic64_fetch_and'? [-Werror=
=3Dimplicit-function-declaration]
>      769 |  return atomic_fetch_and(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_and
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
>    include/asm-generic/atomic-long.h:829:9: error: implicit declaration o=
f function 'atomic_fetch_or'; did you mean 'atomic64_fetch_or'? [-Werror=3D=
implicit-function-declaration]
>      829 |  return atomic_fetch_or(i, v);
>          |         ^~~~~~~~~~~~~~~
>          |         atomic64_fetch_or
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
>    include/asm-generic/atomic-long.h:859:9: error: implicit declaration o=
f function 'atomic_fetch_xor'; did you mean 'atomic64_fetch_xor'? [-Werror=
=3Dimplicit-function-declaration]
>      859 |  return atomic_fetch_xor(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_xor
>    include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
> >> include/asm-generic/atomic-long.h:883:9: error: implicit declaration o=
f function 'atomic_xchg'; did you mean 'atomic64_xchg'? [-Werror=3Dimplicit=
-function-declaration]
>      883 |  return atomic_xchg(v, i);
>          |         ^~~~~~~~~~~
>          |         atomic64_xchg
>    include/asm-generic/atomic-long.h: In function 'atomic_long_cmpxchg':
> >> include/asm-generic/atomic-long.h:907:9: error: implicit declaration o=
f function 'atomic_cmpxchg'; did you mean 'atomic64_cmpxchg'? [-Werror=3Dim=
plicit-function-declaration]
>      907 |  return atomic_cmpxchg(v, old, new);
>          |         ^~~~~~~~~~~~~~
>          |         atomic64_cmpxchg
>    cc1: some warnings being treated as errors
>    make[2]: *** [scripts/Makefile.build:117: arch/m68k/kernel/asm-offsets=
.s] Error 1
>    make[2]: Target '__build' not remade because of errors.
>    make[1]: *** [Makefile:1227: prepare0] Error 2
>    make[1]: Target 'modules_prepare' not remade because of errors.
>    make: *** [Makefile:215: __sub-make] Error 2
>    make: Target 'modules_prepare' not remade because of errors.
> --
>    In file included from include/linux/atomic.h:87,
>                     from include/linux/rcupdate.h:25,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from arch/m68k/kernel/asm-offsets.c:15:
>    include/asm-generic/atomic-long.h: In function 'atomic_long_add_return=
':
>    include/asm-generic/atomic-long.h:553:9: error: implicit declaration o=
f function 'atomic_add_return'; did you mean 'atomic64_add_return'? [-Werro=
r=3Dimplicit-function-declaration]
>      553 |  return atomic_add_return(i, v);
>          |         ^~~~~~~~~~~~~~~~~
>          |         atomic64_add_return
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_add':
>    include/asm-generic/atomic-long.h:577:9: error: implicit declaration o=
f function 'atomic_fetch_add'; did you mean 'atomic64_fetch_add'? [-Werror=
=3Dimplicit-function-declaration]
>      577 |  return atomic_fetch_add(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_add
>    include/asm-generic/atomic-long.h: In function 'atomic_long_sub_return=
':
>    include/asm-generic/atomic-long.h:607:9: error: implicit declaration o=
f function 'atomic_sub_return'; did you mean 'atomic64_sub_return'? [-Werro=
r=3Dimplicit-function-declaration]
>      607 |  return atomic_sub_return(i, v);
>          |         ^~~~~~~~~~~~~~~~~
>          |         atomic64_sub_return
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_sub':
>    include/asm-generic/atomic-long.h:631:9: error: implicit declaration o=
f function 'atomic_fetch_sub'; did you mean 'atomic64_fetch_sub'? [-Werror=
=3Dimplicit-function-declaration]
>      631 |  return atomic_fetch_sub(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_sub
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_and':
>    include/asm-generic/atomic-long.h:769:9: error: implicit declaration o=
f function 'atomic_fetch_and'; did you mean 'atomic64_fetch_and'? [-Werror=
=3Dimplicit-function-declaration]
>      769 |  return atomic_fetch_and(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_and
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_or':
>    include/asm-generic/atomic-long.h:829:9: error: implicit declaration o=
f function 'atomic_fetch_or'; did you mean 'atomic64_fetch_or'? [-Werror=3D=
implicit-function-declaration]
>      829 |  return atomic_fetch_or(i, v);
>          |         ^~~~~~~~~~~~~~~
>          |         atomic64_fetch_or
>    include/asm-generic/atomic-long.h: In function 'atomic_long_fetch_xor':
>    include/asm-generic/atomic-long.h:859:9: error: implicit declaration o=
f function 'atomic_fetch_xor'; did you mean 'atomic64_fetch_xor'? [-Werror=
=3Dimplicit-function-declaration]
>      859 |  return atomic_fetch_xor(i, v);
>          |         ^~~~~~~~~~~~~~~~
>          |         atomic64_fetch_xor
>    include/asm-generic/atomic-long.h: In function 'atomic_long_xchg':
> >> include/asm-generic/atomic-long.h:883:9: error: implicit declaration o=
f function 'atomic_xchg'; did you mean 'atomic64_xchg'? [-Werror=3Dimplicit=
-function-declaration]
>      883 |  return atomic_xchg(v, i);
>          |         ^~~~~~~~~~~
>          |         atomic64_xchg
>    include/asm-generic/atomic-long.h: In function 'atomic_long_cmpxchg':
> >> include/asm-generic/atomic-long.h:907:9: error: implicit declaration o=
f function 'atomic_cmpxchg'; did you mean 'atomic64_cmpxchg'? [-Werror=3Dim=
plicit-function-declaration]
>      907 |  return atomic_cmpxchg(v, old, new);
>          |         ^~~~~~~~~~~~~~
>          |         atomic64_cmpxchg
>    cc1: some warnings being treated as errors
>    make[2]: *** [scripts/Makefile.build:117: arch/m68k/kernel/asm-offsets=
.s] Error 1
>    make[2]: Target '__build' not remade because of errors.
>    make[1]: *** [Makefile:1227: prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:215: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> =

> =

> vim +883 include/asm-generic/atomic-long.h
> =

> bb2382c3e4395a include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  855  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  856  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  857  atomic_long_fetch_xor(long i, atomic_long_t *v)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  858  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04 @859  	return atomic_fetch_xor(i, v);
> bb2382c3e4395a include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  860  }
> bb2382c3e4395a include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  861  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  862  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  863  atomic_long_fetch_xor_acquire(long i, atomic_long_t *v)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  864  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  865  	return atomic_fetch_xor_acquire(i, v);
> bb2382c3e4395a include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  866  }
> 63ab7bd0d450b7 include/asm-generic/atomic-long.h Davidlohr Bueso   2015-0=
9-30  867  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  868  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  869  atomic_long_fetch_xor_release(long i, atomic_long_t *v)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  870  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  871  	return atomic_fetch_xor_release(i, v);
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  872  }
> bb2382c3e4395a include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  873  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  874  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  875  atomic_long_fetch_xor_relaxed(long i, atomic_long_t *v)
> 2856f5e31c1413 include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  876  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  877  	return atomic_fetch_xor_relaxed(i, v);
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  878  }
> 2856f5e31c1413 include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  879  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  880  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  881  atomic_long_xchg(atomic_long_t *v, long i)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  882  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04 @883  	return atomic_xchg(v, i);
> 2856f5e31c1413 include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  884  }
> bb2382c3e4395a include/asm-generic/atomic.h      Mathieu Desnoyers 2007-0=
5-08  885  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  886  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  887  atomic_long_xchg_acquire(atomic_long_t *v, long i)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  888  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  889  	return atomic_xchg_acquire(v, i);
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  890  }
> 4b358e22064b45 include/asm-generic/atomic.h      Adrian Bunk       2006-1=
2-06  891  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  892  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  893  atomic_long_xchg_release(atomic_long_t *v, long i)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  894  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  895  	return atomic_xchg_release(v, i);
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  896  }
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  897  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  898  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  899  atomic_long_xchg_relaxed(atomic_long_t *v, long i)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  900  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  901  	return atomic_xchg_relaxed(v, i);
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  902  }
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  903  =

> c020395b6634b7 include/asm-generic/atomic-long.h Marco Elver       2019-1=
1-26  904  static __always_inline long
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  905  atomic_long_cmpxchg(atomic_long_t *v, long old, long new)
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  906  {
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04 @907  	return atomic_cmpxchg(v, old, new);
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  908  }
> b5d47ef9ea5c5f include/asm-generic/atomic-long.h Mark Rutland      2018-0=
9-04  909  =

> =

> :::::: The code at line 883 was first introduced by commit
> :::::: b5d47ef9ea5c5fe31d7eabeb79f697629bd9e2cb locking/atomics: Switch t=
o generated atomic-long
> =

> :::::: TO: Mark Rutland <mark.rutland@arm.com>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============1423401084351979119==--

