Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A302D05D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 22:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716244200; cv=none; b=iKzV8SnXaVFTY8cJUAD2eeQo8wEVNbU+89JqhQuMyByKGuuX7EOLSqzYcKnGM92IM1U571S9o3zzmaalNufK7Z+Qk7bnKRsZhiMRLRzJQQhSyoY/XYWDCT0yCxvur2X6e7LWnXAaNbWWbSfxVod/lscZnNuLbw/iX+I5oXa7oaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716244200; c=relaxed/simple;
	bh=NUa/CXlqEi2X32+Cx8BOylMn3UniQmpQCBormdgnYVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjVbX5oX9b5FbWpv/qpf1sKi9E/EuwPOdFLNSXa9VLCf1WBlZ922xaqDFO/oghjEzOVGC2hqqAOoDiy68YiSMD+MeXvXq9dT71kx9XXvYls4GoZfAhbwPzJDS9S7OAABvNp4QFmjFEXqsToHzUnQWir5i5EJO0ejBSV17CANcbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBjuI/rM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBjuI/rM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716244198; x=1747780198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUa/CXlqEi2X32+Cx8BOylMn3UniQmpQCBormdgnYVc=;
  b=BBjuI/rMmEy4+zlLOm8+oMbVV4wefiAF8aA5l/7ogLhnbnOL81m0Dn7g
   f9GW56036Gq2LcIH2ponAuRQ86vz9iK79s0Izpe88boV7AUJXTN/Pbyf6
   gfYcJht4tDQt5fnQrRcAHiZpOZqJCI6jpjgspCKbK/woIv6dP9W0TCMat
   w0Vw5MSZPuk2fLAYZG3aIfkv9l3cVua3XOtsy6uY9LTjVldO344J/cpm/
   jE8Gfx2meKvkmVjN87KZbB6Royysf+DysfL+uho+kZC4C2YtlGaFt0oPc
   kdFX9ZaGOqX+gvufIpp1M3nsNl9ysBUcffW5IoJUOh3QRVYbDK+WS1KQB
   A==;
X-CSE-ConnectionGUID: BERDY3o4QqiNj6rPbu55Mg==
X-CSE-MsgGUID: bRTYWaCvTiO2Jt31LFV0OQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12247645"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12247645"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 15:29:57 -0700
X-CSE-ConnectionGUID: Al1vOwErQ4SESghO3lLpJQ==
X-CSE-MsgGUID: 58ylanahSoyzQSNnHe3HIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="32855831"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 May 2024 15:29:55 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9BVI-0005Cp-0S;
	Mon, 20 May 2024 22:29:24 +0000
Date: Tue, 21 May 2024 06:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rcu:boqun-dev/hazptr 1/1]
 arch/openrisc/include/asm/cmpxchg.h:137:48: warning: passing argument 1 of
 '__cmpxchg' makes pointer from integer without a cast
Message-ID: <202405210605.rEqRHXV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git boqun-dev/hazptr
head:   ca2ab86d71c6d322c87127363aa4b665012a0ac2
commit: ca2ab86d71c6d322c87127363aa4b665012a0ac2 [1/1] WIP
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240521/202405210605.rEqRHXV2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210605.rEqRHXV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210605.rEqRHXV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/linux/compiler_types.h:405:27: note: in definition of macro '__unqual_scalar_typeof'
     405 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   In file included from ./arch/openrisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:299,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from kernel/rcu/hazptr.c:3:
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79:
   kernel/rcu/hazptr.c:42:50: error: 'struct hazptr_context' has no member named 'slots'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                                                  ^~
   include/linux/atomic/atomic-instrumented.h:4808:16: note: in definition of macro 'cmpxchg_relaxed'
    4808 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   kernel/rcu/hazptr.c:42:50: error: 'struct hazptr_context' has no member named 'slots'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                                                  ^~
   include/linux/atomic/atomic-instrumented.h:4808:33: note: in definition of macro 'cmpxchg_relaxed'
    4808 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4809:55: error: invalid type argument of unary '*' (have 'int')
    4809 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/rcu/hazptr.c:42:29: note: in expansion of macro 'cmpxchg_relaxed'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                             ^~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4809:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4809 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/rcu/hazptr.c:42:29: note: in expansion of macro 'cmpxchg_relaxed'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                             ^~~~~~~~~~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/openrisc/include/asm/atomic.h:131,
                    from include/linux/atomic.h:7:
   arch/openrisc/include/asm/cmpxchg.h:137:29: error: invalid type argument of unary '*' (have 'int')
     137 |                 (__typeof__(*(ptr))) __cmpxchg((ptr),                   \
         |                             ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:42:29: note: in expansion of macro 'cmpxchg_relaxed'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                             ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/cmpxchg.h:140:55: error: invalid type argument of unary '*' (have 'int')
     140 |                                                sizeof(*(ptr)));         \
         |                                                       ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:42:29: note: in expansion of macro 'cmpxchg_relaxed'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                             ^~~~~~~~~~~~~~~
>> arch/openrisc/include/asm/cmpxchg.h:137:48: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     137 |                 (__typeof__(*(ptr))) __cmpxchg((ptr),                   \
         |                                                ^~~~~
         |                                                |
         |                                                int
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:42:29: note: in expansion of macro 'cmpxchg_relaxed'
      42 |                         if (cmpxchg_relaxed(&hzcp->slots[i], HAZPTR_UNUSED, (unsigned long)NULL) == HAZPTR_UNUSED) {
         |                             ^~~~~~~~~~~~~~~
   arch/openrisc/include/asm/cmpxchg.h:121:54: note: expected 'volatile void *' but argument is of type 'int'
     121 | static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
         |                                       ~~~~~~~~~~~~~~~^~~
   kernel/rcu/hazptr.c:43:57: error: 'struct hazptr_context' has no member named 'slots'
      43 |                                 return (hazptr_t *)&hzcp->slots[i];
         |                                                         ^~
   kernel/rcu/hazptr.c: In function 'check_readers_range':
   kernel/rcu/hazptr.c:82:67: error: 'struct hazptr_context' has no member named 'slots'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:82:54: note: in expansion of macro 'READ_ONCE'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                      ^~~~~~~~~
   kernel/rcu/hazptr.c:82:67: error: 'struct hazptr_context' has no member named 'slots'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:82:54: note: in expansion of macro 'READ_ONCE'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                      ^~~~~~~~~
   kernel/rcu/hazptr.c:82:67: error: 'struct hazptr_context' has no member named 'slots'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:82:54: note: in expansion of macro 'READ_ONCE'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                      ^~~~~~~~~
   kernel/rcu/hazptr.c:82:67: error: 'struct hazptr_context' has no member named 'slots'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \


vim +/__cmpxchg +137 arch/openrisc/include/asm/cmpxchg.h

489e0f802db708 Stafford Horne      2017-03-23  134  
3f1e931d158124 Mark Rutland        2021-05-25  135  #define arch_cmpxchg(ptr, o, n)						\
11595172537788 Stefan Kristiansson 2014-05-13  136  	({								\
11595172537788 Stefan Kristiansson 2014-05-13 @137  		(__typeof__(*(ptr))) __cmpxchg((ptr),			\
11595172537788 Stefan Kristiansson 2014-05-13  138  					       (unsigned long)(o),	\
11595172537788 Stefan Kristiansson 2014-05-13  139  					       (unsigned long)(n),	\
11595172537788 Stefan Kristiansson 2014-05-13  140  					       sizeof(*(ptr)));		\
11595172537788 Stefan Kristiansson 2014-05-13  141  	})
11595172537788 Stefan Kristiansson 2014-05-13  142  

:::::: The code at line 137 was first introduced by commit
:::::: 11595172537788f0007bfc16590aab18f2b9c40f openrisc: add cmpxchg and xchg implementations

:::::: TO: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
:::::: CC: Stafford Horne <shorne@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
