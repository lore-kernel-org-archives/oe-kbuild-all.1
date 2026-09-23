Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E64E77EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183151; cv=none; b=D/ybkOj7gbiMmwj7XJGGh2svDOG3MGCbKqMANaB/22lWJP3MlfkERHriHeFz5PoB81YKRML6r+hsg7lJAzNAi2uqS2mdjFWJZPWwMeM4wPowmFBzVjRUugz8IQ1L//k7VAcDtz2duwQZQrepQCun0xAblHa2BXxktMVta3J4rjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183151; c=relaxed/simple;
	bh=0XaS81+WlvWhDwe4jwlS4JKtTgRr7FFxJtUVlPDmCrQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WfTJy9QUyim5puhXWWu9DMnIzhcVvUMmEEalcZ5R7EflxHv5kYgYmRg5l9IW/tHWMp93QDq0Wnpd3EBUOij/CAGKdhyy/X9LCl73tD5W9BoR+feEcH9PqVgUcnoTZhjvAHLoCGnNce4r4qtUnf8Js+owAoma4SeEuSa1245orbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cfJy42B5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=G4ir7clH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cfJy42B5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="G4ir7clH"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790183142; bh=UgGD0mGiVynIqt/2ZkEVumX
	xEwUtzk9c02GGRe49haA=; b=cfJy42B5loshCFVG05nVFXVm5gL2za9x4PinLrnCBCXpSMFTY3
	TykOOBvo2JyGxE3kIkIjC/BWtX1kgskTh707dwh1TfL8X33uei/vVDk5y4yvISEDVGbi52yULq6
	+5gzNxHFYI2fYpmCb7eZs71IUUBvTIcgX2RhPSTfSjry7m1ZmOAWd2yCIfXWG7euV6v/QIa952G
	ULOJWRz0CTp85X78AvZhizju8yKDxAMUCPdvEGS0Hb0ptM+pEyUOwC35vnK9mALZqDaiXPehndX
	wWoLPrrJ30YqzpyNfQss1vte2hlkNpIkM+1Ifx2IQfMEGTU+mReZzCur0JBUt4rUVVg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790183142; bh=UgGD0mGiVynIqt/2ZkEVumX
	xEwUtzk9c02GGRe49haA=; b=G4ir7clHjp3RYt43M82bkLNf0Pdc/fCvM/qYO+HiGumiR49eAb
	+NVnVPomg/+XezTcTNgpDiwDAe1nb2mKn6Bw==;
Date: Wed, 23 Sep 2026 18:05:42 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kernel test robot <lkp@intel.com>
CC: oe-kbuild-all@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Acmpxchg2=2E2026=2E09=2E2?=
 =?US-ASCII?Q?2a_28/28=5D_arch/xtensa/include/asm/c?=
 =?US-ASCII?Q?mpxchg=2Eh=3A88=3A58=3A_error=3A_pointer_type?=
 =?US-ASCII?Q?_mismatch_in_conditional_expression?=
In-Reply-To: <202609230743.rxxNILn7-lkp@intel.com>
References: <202609230743.rxxNILn7-lkp@intel.com>
Message-ID: <D43C55DD-9765-4960-8E91-4679164C4201@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 23 September 2026 06:12:20 BST, kernel test robot <lkp@intel.com> wrote:
>tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
>head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
>commit: 54c282c15475ebfae4712fe3ab637c9d19c723d6 [28/28] xtensa: Emulate two-byte cmpxchg
>config: xtensa-randconfig-r2102-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230743.rxxNILn7-lkp@intel.com/config)
>compiler: xtensa-linux-gcc (GCC) 15.2.0
>reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20260923/202609230743.rxxNILn7-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes:
>https://lore.kernel.org/oe-kbuild-all/202609230743.rxxNILn7-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>   In file included from include/linux/export.h:5,
>                    from fs/crypto/hooks.c:8:
>   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch
>in conditional expression [-Wincompatible-pointer-types]
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                          ^
>   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
>      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>         |                                                    ^~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                   ^~~~~~
>   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
>      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>         |                                                    ^~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                            ^~~
>   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
>      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>         |                                                    ^~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch
>in conditional expression [-Wincompatible-pointer-types]
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                          ^
>   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
>      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>         |                                                             ^~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                   ^~~~~~
>   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
>      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>         |                                                             ^~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                            ^~~
>   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
>      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>         |                                                             ^~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch
>in conditional expression [-Wincompatible-pointer-types]
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                          ^
>   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
>      68 |         (cond) ?                                        \
>         |          ^~~~
>   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
>      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>         |                            ^~~~~~~~~~~~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                   ^~~~~~
>   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
>      68 |         (cond) ?                                        \
>         |          ^~~~
>   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
>      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>         |                            ^~~~~~~~~~~~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
>      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
>         |                                                            ^~~
>   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
>      68 |         (cond) ?                                        \
>         |          ^~~~
>   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
>      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>         |                            ^~~~~~~~~~~~~~
>   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
>     419 |         if (!has_key ||
>         |         ^~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>         |             ^~~~~~~~~~~~~~~
>
>
>vim +88 arch/xtensa/include/asm/cmpxchg.h
>
>    85	
>    86	#define arch_cmpxchg(ptr,o,n)						      \
>    87		({ unsigned long _old_ = (unsigned long)(0 ? *(ptr) : (o));	      \
>  > 88		unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));	      \
>    89		(__typeof__(*(ptr))) __cmpxchg((ptr), _old_,		      \
>    90					_new_, sizeof (*(ptr))); \
>    91		})
>    92	
>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
oh here we go

I'm suggesting 

lib changes first, then arch.

Like:

lib

|
|
↓

Merge window time

|
|
|
↓

Arch changes after merge window, for next merge window


What do you reckon?

Arch is a pain in the ass in my opinion, so much errors and bugs, probably
cuz I'm a arm guy anyway, but if I keep going at it I'll fix it.

My V7 of panic changes got merged finally, and they were just fixing
sashiko bugs !
--- Thanks!
"I'm not a very positive person" - Linus torvalds
