Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B7499F0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 23:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639326; cv=none; b=HQ94ubrPeucc0Hl47dTy7VvuaGaEH9SRrxRc5BgTiMIAsloZCUQ5Mht7CLuP/iLaH/0ljgEqbGgWBKQS3K/mlnj4Rzeos1/nKDUHLKMQklUJ2KZbjAfuPY8ZoH9i+EqEVoSHLl/TxAYSxnfzG89J30kgT/3KhjDvE/mfjGB6BwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639326; c=relaxed/simple;
	bh=UMLdeFKqBoACzLJR6+9tKLRKPifTsl+0F+EJd33PD2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2UHgMlBVK3XQwc2DV9QV0u01aPiHIfE4bFLx6a+5EiJEjWN+T1UjmCnjgasYIZouK80bIe9o2Bm/70tnmF3HVN/mnlpfxicVlMYmAQmL45D+iKRcdAVX7Xw2fUXyzIWPjyYmkUuOq0RBrYvwJ3WrJn3eRLp8Nvh78ukS0HwsDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNbCsVLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNbCsVLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BD01F000FF;
	Mon, 28 Sep 2026 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790639324;
	bh=NBy7T12ssbIQffnxy4rd350DmqAuJIT7QJ/i1HML60M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CNbCsVLVwnTOmtaYV0L23eQQs+GD4gzSDE85T/zC9L/dbLW45LbUFbuHbFdSM9FsK
	 CXwhrB5w1KG9evvnaw2aCm/bFdIqK+bdJ6UvgTDxsxB99Nwlf9TO3grqSOcaKA6hIh
	 wQAwFbt6aApr4V84TCmIRzlK9hk+ujRqGA3XyqXZLhVeHrad2N6PKFjb4tuK+VbsBu
	 NljsqEun7LJKCAn2lSHkNTwqN+oIkE6FIfV6gO4DnkbO2EgST8EXYtR7Gc1gji6qVL
	 283dfO2Q+MWODGaQZm+oDd5I5dvOwkoPclCskG6FdqkcEa32BCb36J9gYeikeSuvLK
	 SH4O6eNZGt3+Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D4844CE10F4; Mon, 28 Sep 2026 16:48:43 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:48:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:cmpxchg2.2026.09.22a 28/28]
 arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch in
 conditional expression
Message-ID: <f8cee0b0-76f5-4215-bb17-f2cb509b6fba@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609230743.rxxNILn7-lkp@intel.com>
 <D43C55DD-9765-4960-8E91-4679164C4201@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D43C55DD-9765-4960-8E91-4679164C4201@mainlining.org>

On Wed, Sep 23, 2026 at 06:05:42PM +0100, Bradley Morgan wrote:
> On 23 September 2026 06:12:20 BST, kernel test robot <lkp@intel.com> wrote:
> >tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
> >head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
> >commit: 54c282c15475ebfae4712fe3ab637c9d19c723d6 [28/28] xtensa: Emulate two-byte cmpxchg
> >config: xtensa-randconfig-r2102-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230743.rxxNILn7-lkp@intel.com/config)
> >compiler: xtensa-linux-gcc (GCC) 15.2.0
> >reproduce (this is a W=1 build):
> >(https://download.01.org/0day-ci/archive/20260923/202609230743.rxxNILn7-lkp@intel.com/reproduce)
> >
> >If you fix the issue in a separate patch/commit (i.e. not just a new
> >version of
> >the same patch/commit), kindly add following tags
> >| Reported-by: kernel test robot <lkp@intel.com>
> >| Closes:
> >https://lore.kernel.org/oe-kbuild-all/202609230743.rxxNILn7-lkp@intel.com/
> >
> >All errors (new ones prefixed by >>):
> >
> >   In file included from include/linux/export.h:5,
> >                    from fs/crypto/hooks.c:8:
> >   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
> >>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch
> >in conditional expression [-Wincompatible-pointer-types]
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                          ^
> >   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
> >      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> >         |                                                    ^~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                   ^~~~~~
> >   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
> >      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> >         |                                                    ^~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                            ^~~
> >   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
> >      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> >         |                                                    ^~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch
> >in conditional expression [-Wincompatible-pointer-types]
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                          ^
> >   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
> >      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> >         |                                                             ^~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                   ^~~~~~
> >   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
> >      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> >         |                                                             ^~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                            ^~~
> >   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
> >      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> >         |                                                             ^~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch
> >in conditional expression [-Wincompatible-pointer-types]
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                          ^
> >   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
> >      68 |         (cond) ?                                        \
> >         |          ^~~~
> >   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
> >      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> >         |                            ^~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                   ^~~~~~
> >   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
> >      68 |         (cond) ?                                        \
> >         |          ^~~~
> >   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
> >      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> >         |                            ^~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
> >      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
> >         |                                                            ^~~
> >   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
> >      68 |         (cond) ?                                        \
> >         |          ^~~~
> >   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
> >      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> >         |                            ^~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
> >     419 |         if (!has_key ||
> >         |         ^~
> >   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> >      82 | #define raw_cmpxchg_release arch_cmpxchg
> >         |                             ^~~~~~~~~~~~
> >   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
> >    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
> >         |         ^~~~~~~~~~~~~~~~~~~
> >   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
> >     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
> >         |             ^~~~~~~~~~~~~~~
> >
> >
> >vim +88 arch/xtensa/include/asm/cmpxchg.h
> >
> >    85	
> >    86	#define arch_cmpxchg(ptr,o,n)						      \
> >    87		({ unsigned long _old_ = (unsigned long)(0 ? *(ptr) : (o));	      \
> >  > 88		unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));	      \
> >    89		(__typeof__(*(ptr))) __cmpxchg((ptr), _old_,		      \
> >    90					_new_, sizeof (*(ptr))); \
> >    91		})
> >    92	
> >
> >--
> >0-DAY CI Kernel Test Service
> >https://github.com/intel/lkp-tests/wiki
> oh here we go
> 
> I'm suggesting 
> 
> lib changes first, then arch.
> 
> Like:
> 
> lib
> 
> |
> |
> ↓
> 
> Merge window time
> 
> |
> |
> |
> ↓
> 
> Arch changes after merge window, for next merge window
> 
> 
> What do you reckon?

This would require that we do something different for the transition from
ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU.  One approach is
to do the change as a separate initial patch.  Another is to handle it
at the end.

Handling it at the end is easier because at that point there is a
name-meaning bug to fix.

> Arch is a pain in the ass in my opinion, so much errors and bugs, probably
> cuz I'm a arm guy anyway, but if I keep going at it I'll fix it.

Which is one reason why guys like Arnd Bergmann put so much time and
effort into consolidating common per-architecture code into common
cross-architecture code.  ;-)

> My V7 of panic changes got merged finally, and they were just fixing
> sashiko bugs !

I am not seeing panic changes, but I am seeing 11 of your patches merged
into mainline since v7.2, which is not at all bad!

							Thanx, Paul

> --- Thanks!
> "I'm not a very positive person" - Linus torvalds
