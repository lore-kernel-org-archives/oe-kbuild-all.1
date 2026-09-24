Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9124399D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283488; cv=none; b=XSysdbzFwd04nLKZqqXQ/efYtupJyrv9W0cvAlFHtbCh9GlJdi7cNd4iqQRH/Vrt1PxCoNYO7SfeGRKbf07HDlAB7JJYESqT6T1VaWJBgOxX7fTaEgZmO8FUYHx2nIfRWRS/KYxQduQtjf2IJkDf17prwO1dmD+XwOkmicLxmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283488; c=relaxed/simple;
	bh=Y5QOiogfdThHBP8UQuQWkfS/Z3fpXmETRtrMvgM/b7M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PipvWG8DEgxcZgLQjMdNgACKPWMgr0pfLBV1r1bJn8Gvqs6+uEdGhsj0m8kpx4MwzZ5R86hnNKwH2rU90MHc2k5LY7SOdGgMyUvyyxDjLo24khhCRvRKBakx/winIwT4IwazTp/YHoj8ypwPFe9RltGw3CifHAStIQuGPe76K48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=p7B+NDxT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=W24s2vCh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="p7B+NDxT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="W24s2vCh"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790283484; bh=UwnBuuhWsFDraQBDzwKtuA/
	k6zumayuec5HixrXxqxo=; b=p7B+NDxTTPOLQFCrhzW/ulTMSv333LJwPfDBKwGwNvLbfS63oH
	yaK5nAlKdFKY2Z+RHMyyYXcJ4CwAmWFFpeiDraHFf7qzd8EUrcBKnaUsdLbLxI1VffLtLBD81NR
	ie7J/rNwNEPyMFzCK18u9PSz2nyYI6Hry+hrgtg5laOlt4lXqxGs+EgD3VuMFGo+wWU8Udf2NMv
	aaoF1km2N5X+8ICuXA/l8DL34CtSfDgu1VoegcfEZkIMbZSuBEy8jAbvwLf0CqDvbd07g0v15M3
	DuzWmCfBY39Tf/lCWVnD6xma2AvVAz2a6ByAkXptwEdGXG4F1WyAbyM4riVnRQD+IoQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790283484; bh=UwnBuuhWsFDraQBDzwKtuA/
	k6zumayuec5HixrXxqxo=; b=W24s2vChqE/WuTFZSBIOxv5d+zHFZiuwt8qsMTbZf5eM1y/pWp
	YYRcd9RcVp+Pw4glfJOL3gYQ6TIWiJS8VJDQ==;
Date: Thu, 24 Sep 2026 21:58:04 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Vineet Gupta <vgupta@kernel.org>, kernel test robot <lkp@intel.com>
CC: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Acmpxchg2=2E2026=2E09=2E2?=
 =?US-ASCII?Q?2a_25/28=5D_arch/arc/include/asm/cmp?=
 =?US-ASCII?Q?xchg=2Eh=3A46=3A58=3A_error=3A_pointer_type_?=
 =?US-ASCII?Q?mismatch_in_conditional_expression?=
In-Reply-To: <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
References: <202609241517.SSV1Goz3-lkp@intel.com> <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
Message-ID: <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 24 September 2026 21:52:55 BST, Vineet Gupta <vgupta@kernel.org> wrote:
>On 9/24/26 00:51, kernel test robot wrote:
>> tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
>> head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
>> commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate
>two-byte cmpxchg
>> config: arc-allyesconfig
>(https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
>> compiler: arc-linux-gcc (GCC) 16.1.0
>> reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>>     In file included from arch/arc/include/asm/atomic.h:13,
>>                      from include/linux/atomic.h:7,
>>                      from include/asm-generic/bitops/lock.h:5,
>>                      from arch/arc/include/asm/bitops.h:190,
>>                      from include/linux/bitops.h:67,
>>                      from include/linux/log2.h:12,
>>                      from include/asm-generic/div64.h:55,
>>                      from ./arch/arc/include/generated/asm/div64.h:1,
>>                      from include/linux/math.h:6,
>>                      from include/linux/math64.h:6,
>>                      from include/linux/time.h:6,
>>                      from include/linux/stat.h:19,
>>                      from include/linux/fs_dirent.h:5,
>>                      from include/linux/fs/super_types.h:5,
>>                      from include/linux/fs/super.h:5,
>>                      from include/linux/fs.h:5,
>>                      from include/linux/fscrypt.h:16,
>>                      from fs/crypto/fscrypt_private.h:15,
>>                      from fs/crypto/hooks.c:10:
>>     fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>>>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
>conditional expression [-Wincompatible-pointer-types]
>>        46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) :
>(new));              \
>
>Issue is in  fs/crypto/hooks.c doing cmpxchg_release(&inode->i_link, NULL,
>pstr.name)
>where i_link is char * and pstr.name is unsigned char *),
>
>The problem is when pointer types are incompatible and that's exactly the
>W toggle above.
>
>So Bradley's patch needs this fixup
>
>diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
>index 4596edfefa95..9053098bb152 100644
>--- a/arch/arc/include/asm/cmpxchg.h
>+++ b/arch/arc/include/asm/cmpxchg.h
>@@ -42,8 +42,10 @@
> #define arch_cmpxchg_relaxed(ptr, old, new)     \
> ({    \
>        __typeof__(ptr) _p_ = (ptr);     \
>-       unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));             \
>-       unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));             \
>+       __typeof__(*(ptr)) _o_ = (old);    \
>+       __typeof__(*(ptr)) _n_ = (new);    \
>+       unsigned long _old_ = (unsigned long)_o_;            \
>+       unsigned long _new_ = (unsigned long)_n_;            \
>
>P.S: For arch changes shouldn't the submitter be required to at least test
>the building, specially when this involves the macro maze. Its really easy
>with crosstool hosting all the cross-compilers [1] - just download and
>untar.
>
>[1]
>https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/16.2.0/

Well thanks but I didn't have a proper server till yesterday.

I'll post all arch patches when Paul tells me how he wants it 

Like if he wants u16 in first then arch changes sent.


>
>Thx,
>-Vineet
>
>>           |                                                          ^
>>     include/linux/atomic.h:68:9: note: in expansion of macro
>'arch_cmpxchg_relaxed'
>>        68 |         op##_relaxed(args);                                 
>           \
>>           |         ^~
>>     include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion
>of macro '__atomic_op_release'
>>        80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
>>           |         ^~~~~~~~~~~~~~~~~~~
>>     include/linux/atomic/atomic-instrumented.h:4803:9: note: in
>expansion of macro 'raw_cmpxchg_release'
>>      4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>>           |         ^~~~~~~~~~~~~~~~~~~
>>     fs/crypto/hooks.c:420:13: note: in expansion of macro
>'cmpxchg_release'
>>       420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name)
>!= NULL)
>>           |             ^~~~~~~~~~~~~~~
>>     arch/arc/include/asm/cmpxchg.h:46:51: note: first expression has
>type 'char *'
>>        46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) :
>(new));              \
>>           |                                                   ^~~~~~
>>     include/linux/atomic.h:68:9: note: in expansion of macro
>'arch_cmpxchg_relaxed'
>>        68 |         op##_relaxed(args);                                 
>           \
>>           |         ^~
>>     include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion
>of macro '__atomic_op_release'
>>        80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
>>           |         ^~~~~~~~~~~~~~~~~~~
>>     include/linux/atomic/atomic-instrumented.h:4803:9: note: in
>expansion of macro 'raw_cmpxchg_release'
>>      4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>>           |         ^~~~~~~~~~~~~~~~~~~
>>     fs/crypto/hooks.c:420:13: note: in expansion of macro
>'cmpxchg_release'
>>       420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name)
>!= NULL)
>>           |             ^~~~~~~~~~~~~~~
>>     arch/arc/include/asm/cmpxchg.h:46:60: note: second expression has
>type 'unsigned char *'
>>        46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) :
>(new));              \
>>           |                                                           
>^~~~~
>>     include/linux/atomic.h:68:9: note: in expansion of macro
>'arch_cmpxchg_relaxed'
>>        68 |         op##_relaxed(args);                                 
>           \
>>           |         ^~
>>     include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion
>of macro '__atomic_op_release'
>>        80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
>>           |         ^~~~~~~~~~~~~~~~~~~
>>     include/linux/atomic/atomic-instrumented.h:4803:9: note: in
>expansion of macro 'raw_cmpxchg_release'
>>      4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>>           |         ^~~~~~~~~~~~~~~~~~~
>>     fs/crypto/hooks.c:420:13: note: in expansion of macro
>'cmpxchg_release'
>>       420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name)
>!= NULL)
>>           |             ^~~~~~~~~~~~~~~
>> 
>> 
>> vim +46 arch/arc/include/asm/cmpxchg.h
>> 
>>      41	
>>      42	#define arch_cmpxchg_relaxed(ptr, old, new)				\
>>      43	({									\
>>      44		__typeof__(ptr) _p_ = (ptr);					\
>>      45		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
>>    > 46		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
>>      47		__typeof__(*(ptr)) _prev_;					\
>>      48										\
>>      49		switch (sizeof(*(_p_))) {						\
>>      50		case 1:								\
>>      51			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, _old_, _new_);	\
>>      52			break;							\
>>      53		case 2:								\
>>      54			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, _old_, _new_);	\
>>      55			break;							\
>>      56		case 4:								\
>>      57			_prev_ = (__typeof__(*(ptr)))__cmpxchg(_p_, _old_, _new_);			\
>>      58			break;							\
>>      59		default:							\
>>      60			BUILD_BUG();						\
>>      61		}								\
>>      62		_prev_;								\
>>      63	})
>>      64	
>> 
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>> 
>> _______________________________________________
>> linux-snps-arc mailing list
>> linux-snps-arc@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-snps-arc
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
