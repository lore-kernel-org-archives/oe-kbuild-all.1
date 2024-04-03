Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6C156966
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712182827; cv=none; b=FSuP+E6aqEYzxjx+d9qeD4izC4rUozUMcUYYoRWQi3kURrGJFvtrlIRX36pWQRFHh5zP/Q1jbpeinOWfO9KaKlrHXy/ATzEzO6rXINISJ9rf+GRtHcBsH+bab7Vr9vQIxYk/K2NTudBqwXiOZpTo0w9zG5mHBhmW4IT+i/F3dNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712182827; c=relaxed/simple;
	bh=cTdWIoaZlq+r4qfukwnFko9/NhS7MaaBZeksyFEC4+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6BuRBbHvK37zZ9IABJX8xSufzUOj1a4jMm7UJZXPJXgLwX9yvs1YCi58IREH9wSsLBeZe9bk+rLy/jyCQFC4Q7Yybe/gMh971eK4qLX62wyptZ5pQUmWE3DWZ8xv908DKWRWNI0CcIYOgAKW3zaXSocjl78bnH8nBkly0PoLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOQ6Vpna; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOQ6Vpna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B6C433C7;
	Wed,  3 Apr 2024 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712182826;
	bh=cTdWIoaZlq+r4qfukwnFko9/NhS7MaaBZeksyFEC4+Q=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=dOQ6Vpnar79q7DBVdk0qGLhK3En2mKFEbZAGmFwtdgtr8Uuj+PCcz8utq8nPW1x4N
	 6/cNv3bk+O8BIr1ScP6qLbmHPjq8qPzlIe6P176jAut3Yk4rEWjsWkXfhOo+Ta6RjD
	 UmgaW/FZBR+CKGkMTZbxMnaugtDwcRuy0/FK8nsIgK465PPc/I/j4N6G3I9jhgTazu
	 gUr9Fyrlngm4aSMSicRbSTuL/1nCTaOa8BFVIN1gEnYcQjTZmpCG+7XS0lIJyg4f3f
	 Y6xiBRrr901JlQkhB6a94oomTF2eNIeO2wfhVkbWXdGPX1K39GQ0ktGJlYkzMmkIMt
	 YpU5e8oS2YzdA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8A579CE109B; Wed,  3 Apr 2024 15:20:26 -0700 (PDT)
Date: Wed, 3 Apr 2024 15:20:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2555/3220]
 arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of
 function 'cmpxchg_emu_u8'
Message-ID: <9035b0a2-9b9f-4b9c-b562-3e57a25efc68@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404022106.mYwpypit-lkp@intel.com>
 <eec09843-3962-4951-ad17-b15f2e311eb2@paulmck-laptop>
 <Zg0Cajm4nmQ67UTE@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg0Cajm4nmQ67UTE@yujie-X299>

On Wed, Apr 03, 2024 at 03:16:58PM +0800, Yujie Liu wrote:
> Hi Paul,
> 
> On Tue, Apr 02, 2024 at 10:26:22AM -0700, Paul E. McKenney wrote:
> > On Tue, Apr 02, 2024 at 09:15:39PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
> > > commit: ea7f9bb7268e89fff8590ab5a360f5b27a0fc19a [2555/3220] csky: Emulate one-byte and two-byte cmpxchg
> > > config: csky-randconfig-r012-20230202 (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/config)
> > > compiler: csky-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202404022106.mYwpypit-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > 
> > And yet again, does the patch at the end of this email clear this up
> > for you?
> 
> Please kindly see the inline comments.

Thank you, and likewise!  ;-)

> > 						Thanx, Paul
> > 
> > >    In file included from arch/csky/include/asm/atomic.h:9,
> > >                     from include/linux/atomic.h:7,
> > >                     from include/asm-generic/bitops/lock.h:5,
> > >                     from arch/csky/include/asm/bitops.h:69,
> > >                     from include/linux/bitops.h:68,
> > >                     from include/linux/log2.h:12,
> > >                     from kernel/bounds.c:13:
> > >    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
> > > >> arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
> 
> This error is caused by missing header file. It can be fixed by adding
> the include, similar to some previous reports.
> 
> #include <linux/cmpxchg-emu.h>
> 
> > >      138 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                         ^~~~~~~~~~~~~~
> > >    arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
> > >      165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
> > >          |          ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > > >> arch/csky/include/asm/cmpxchg.h:141:25: error: implicit declaration of function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
> > >      141 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                         ^~~~~~~~~~~~~~~
> > >    arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
> > >      165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
> > >          |          ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > >    cc1: some warnings being treated as errors
> > >    make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
> > >    make[3]: Target 'prepare' not remade because of errors.
> > >    make[2]: *** [Makefile:1197: prepare0] Error 2
> > >    make[2]: Target 'prepare' not remade because of errors.
> > >    make[1]: *** [Makefile:240: __sub-make] Error 2
> > >    make[1]: Target 'prepare' not remade because of errors.
> > >    make: *** [Makefile:240: __sub-make] Error 2
> > >    make: Target 'prepare' not remade because of errors.
> > > 
> > > 
> > > vim +/cmpxchg_emu_u8 +138 arch/csky/include/asm/cmpxchg.h
> > > 
> > >    125	
> > >    126	#define arch_cmpxchg_acquire(ptr, o, n) \
> > >    127		(__cmpxchg_acquire((ptr), (o), (n), sizeof(*(ptr))))
> > >    128	
> > >    129	#define __cmpxchg(ptr, old, new, size)				\
> > >    130	({								\
> > >    131		__typeof__(ptr) __ptr = (ptr);				\
> > >    132		__typeof__(new) __new = (new);				\
> > >    133		__typeof__(new) __tmp;					\
> > >    134		__typeof__(old) __old = (old);				\
> > >    135		__typeof__(*(ptr)) __ret;				\
> > >    136		switch (size) {						\
> > >    137		case 1:							\
> > >  > 138			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >    139			break;						\
> > >    140		case 2:							\
> > >  > 141			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >    142			break;						\
> > >    143		case 4:							\
> > >    144			asm volatile (					\
> > >    145			RELEASE_FENCE					\
> > >    146			"1:	ldex.w		%0, (%3) \n"		\
> > >    147			"	cmpne		%0, %4   \n"		\
> > >    148			"	bt		2f       \n"		\
> > >    149			"	mov		%1, %2   \n"		\
> > >    150			"	stex.w		%1, (%3) \n"		\
> > >    151			"	bez		%1, 1b   \n"		\
> > >    152			FULL_FENCE					\
> > >    153			"2:				 \n"		\
> > >    154				: "=&r" (__ret), "=&r" (__tmp)		\
> > >    155				: "r" (__new), "r"(__ptr), "r"(__old)	\
> > >    156				:);					\
> > >    157			break;						\
> > >    158		default:						\
> > >    159			BUILD_BUG();					\
> > >    160		}							\
> > >    161		__ret;							\
> > >    162	})
> > >    163	
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 58155a7e67f350f00c2df5b6066597fe438543cb
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Tue Apr 2 10:24:57 2024 -0700
> > 
> >     squash! csky: Emulate one-byte and two-byte cmpxchg
> >     
> >     [ paulmck: Apply kernel test robot feedback. ]
> >     
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
> > index 848a8691c5a2a..a3dc0a5b1cc3d 100644
> > --- a/arch/csky/include/asm/cmpxchg.h
> > +++ b/arch/csky/include/asm/cmpxchg.h
> > @@ -62,10 +62,10 @@
> >  	__typeof__(*(ptr)) __ret;				\
> >  	switch (size) {						\
> >  	case 1:							\
> > -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;						\
> >  	case 2:							\
> > -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;						\
> >  	case 4:							\
> >  		asm volatile (					\
> > @@ -98,10 +98,10 @@
> >  	__typeof__(*(ptr)) __ret;				\
> >  	switch (size) {						\
> >  	case 1:							\
> > -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;						\
> >  	case 2:							\
> > -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;						\
> >  	case 4:							\
> >  		asm volatile (					\
> > @@ -135,10 +135,10 @@
> >  	__typeof__(*(ptr)) __ret;				\
> >  	switch (size) {						\
> >  	case 1:							\
> > -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;						\
> >  	case 2:							\
> > -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;						\
> >  	case 4:							\
> >  		asm volatile (					\
> > 
> 
> The patch above can fix some of the warnings, but not completely. An
> extended fix is shown below. Could you please help review?

Very good, thank you!

I have pulled this into the original, adjusting for the need to drop
16-bit support.  I will be adding your Co-developed-by and Signed-off-by,
so please let me know if that does not work for you.

							Thanx, Paul

> Thanks,
> Yujie
> 
> -----------------------------------------------------------------
> 
> diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
> index 848a8691c5a2a..a6a4805064a40 100644
> --- a/arch/csky/include/asm/cmpxchg.h
> +++ b/arch/csky/include/asm/cmpxchg.h
> @@ -6,6 +6,7 @@
>  #ifdef CONFIG_SMP
>  #include <linux/bug.h>
>  #include <asm/barrier.h>
> +#include <linux/cmpxchg-emu.h>
>  
>  #define __xchg_relaxed(new, ptr, size)                         \
>  ({                                                             \
> @@ -62,10 +63,10 @@
>         __typeof__(*(ptr)) __ret;                               \
>         switch (size) {                                         \
>         case 1:                                                 \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                          \
>         case 2:                                                 \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                          \
>         case 4:                                                 \
>                 asm volatile (                                  \
> @@ -98,10 +99,10 @@
>         __typeof__(*(ptr)) __ret;                               \
>         switch (size) {                                         \
>         case 1:                                                 \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                          \
>         case 2:                                                 \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                          \
>         case 4:                                                 \
>                 asm volatile (                                  \
> @@ -135,10 +136,10 @@
>         __typeof__(*(ptr)) __ret;                               \
>         switch (size) {                                         \
>         case 1:                                                 \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                          \
>         case 2:                                                 \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                          \
>         case 4:                                                 \
>                 asm volatile (                                  \
> 
