Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A015A490
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712078783; cv=none; b=tJIj4Mpfh/h5qgxU6vKCt1ud5gS9HJPpw1WCcHI9RSHNWR6dh3k85/H30tHN/i+so0Kd8RhAvAX8qVKZYVOFlXi+l//UXYKnujHTCV/RMecvT5emEC+UYlCOgnW+AmNXLNk3JIo3j3SG0+N34wyjqq+2AJezhiNiNQja+x7LHgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712078783; c=relaxed/simple;
	bh=aPduhq46rSPeI7Urc4pNUadY5Sy6NK1y6o6fPQ+040M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7HTYKJHItfvA0QZmdWf6sCv+Blg3AhLUe7LDzG8r0vlcpadk8IfysCE6BKqofljxSwMBpBRZZuw/D1OVr3xng3SoS7fZZ/5n+S5/9mQhBigeTTivkHbS8Kkwx5Zx10+H532c7/PTJc5hjr0NysrHzw/6NZAx368zqjnQBfYCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/7rjMh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/7rjMh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F0CC433F1;
	Tue,  2 Apr 2024 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712078783;
	bh=aPduhq46rSPeI7Urc4pNUadY5Sy6NK1y6o6fPQ+040M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=c/7rjMh+ax7E8QhQZlrvhL9K3R4r7/0HxZs3E4y238kxL5zK9K9LTY6Bq00wUVock
	 k3aQZFs/OfIhMhwwYwo/yhN2UhlJeIvik7CIMOFaGjVAn9L/DCeWLqTsbSRjdyqlvW
	 u1dSBo9NpLaV2jZtytc3hNoMLdpUl1SnvIIRvnYheILbErQJYYCwK3yEuuYTbA7s25
	 JWX9NBGYTz4i6lcsUpwraiV+jP4i/DmhYGnKnjxsYiDVgsKYa3QZlpBOmpvYdfJ1Jh
	 xanaufVfWMAgKhkXmGSgmYwS9mu+z1z3nBmN/0NzZnSYR7/rcV7WU5AvhBLV1wbqG5
	 uhCrzjMLjgUaQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 900DDCE0FF2; Tue,  2 Apr 2024 10:26:22 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:26:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2555/3220]
 arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of
 function 'cmpxchg_emu_u8'
Message-ID: <eec09843-3962-4951-ad17-b15f2e311eb2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404022106.mYwpypit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404022106.mYwpypit-lkp@intel.com>

On Tue, Apr 02, 2024 at 09:15:39PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
> commit: ea7f9bb7268e89fff8590ab5a360f5b27a0fc19a [2555/3220] csky: Emulate one-byte and two-byte cmpxchg
> config: csky-randconfig-r012-20230202 (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404022106.mYwpypit-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

And yet again, does the patch at the end of this email clear this up
for you?

						Thanx, Paul

>    In file included from arch/csky/include/asm/atomic.h:9,
>                     from include/linux/atomic.h:7,
>                     from include/asm-generic/bitops/lock.h:5,
>                     from arch/csky/include/asm/bitops.h:69,
>                     from include/linux/bitops.h:68,
>                     from include/linux/log2.h:12,
>                     from kernel/bounds.c:13:
>    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
> >> arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
>      138 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                         ^~~~~~~~~~~~~~
>    arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
>      165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
>          |          ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>     2026 |         return raw_cmpxchg(&v->counter, old, new);
>          |                ^~~~~~~~~~~
> >> arch/csky/include/asm/cmpxchg.h:141:25: error: implicit declaration of function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
>      141 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                         ^~~~~~~~~~~~~~~
>    arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
>      165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
>          |          ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>     2026 |         return raw_cmpxchg(&v->counter, old, new);
>          |                ^~~~~~~~~~~
>    cc1: some warnings being treated as errors
>    make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1197: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +/cmpxchg_emu_u8 +138 arch/csky/include/asm/cmpxchg.h
> 
>    125	
>    126	#define arch_cmpxchg_acquire(ptr, o, n) \
>    127		(__cmpxchg_acquire((ptr), (o), (n), sizeof(*(ptr))))
>    128	
>    129	#define __cmpxchg(ptr, old, new, size)				\
>    130	({								\
>    131		__typeof__(ptr) __ptr = (ptr);				\
>    132		__typeof__(new) __new = (new);				\
>    133		__typeof__(new) __tmp;					\
>    134		__typeof__(old) __old = (old);				\
>    135		__typeof__(*(ptr)) __ret;				\
>    136		switch (size) {						\
>    137		case 1:							\
>  > 138			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>    139			break;						\
>    140		case 2:							\
>  > 141			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>    142			break;						\
>    143		case 4:							\
>    144			asm volatile (					\
>    145			RELEASE_FENCE					\
>    146			"1:	ldex.w		%0, (%3) \n"		\
>    147			"	cmpne		%0, %4   \n"		\
>    148			"	bt		2f       \n"		\
>    149			"	mov		%1, %2   \n"		\
>    150			"	stex.w		%1, (%3) \n"		\
>    151			"	bez		%1, 1b   \n"		\
>    152			FULL_FENCE					\
>    153			"2:				 \n"		\
>    154				: "=&r" (__ret), "=&r" (__tmp)		\
>    155				: "r" (__new), "r"(__ptr), "r"(__old)	\
>    156				:);					\
>    157			break;						\
>    158		default:						\
>    159			BUILD_BUG();					\
>    160		}							\
>    161		__ret;							\
>    162	})
>    163	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

------------------------------------------------------------------------

commit 58155a7e67f350f00c2df5b6066597fe438543cb
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Apr 2 10:24:57 2024 -0700

    squash! csky: Emulate one-byte and two-byte cmpxchg
    
    [ paulmck: Apply kernel test robot feedback. ]
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index 848a8691c5a2a..a3dc0a5b1cc3d 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -62,10 +62,10 @@
 	__typeof__(*(ptr)) __ret;				\
 	switch (size) {						\
 	case 1:							\
-		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
 	case 2:							\
-		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -98,10 +98,10 @@
 	__typeof__(*(ptr)) __ret;				\
 	switch (size) {						\
 	case 1:							\
-		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
 	case 2:							\
-		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -135,10 +135,10 @@
 	__typeof__(*(ptr)) __ret;				\
 	switch (size) {						\
 	case 1:							\
-		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
 	case 2:							\
-		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
