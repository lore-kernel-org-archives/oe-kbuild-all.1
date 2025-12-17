Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4579C2877E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 03:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765943690; cv=none; b=RUdh5gnCWC0v4wfDcqu1DkduIpyGbh6NZxQeT42o3hBfnKsSmjnusZTnZCKPLvt7IbTsE6ItUlSt5H1BKK6a6JrCv5AeO8JeCgfliyynlWMDU+4SJvYromyNiJbf0ju+G+IQZwdugo7knCZQxDnNTDH9iu2Du4LvR4VzvdYL/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765943690; c=relaxed/simple;
	bh=SM2V1hU0X/oUc2kwgDAKqXudgLZSxHVMwCl7z3sJUXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hjq3BLaEUndtJNa7DPnxpXtbm3gBs+FXzp+njnvBlXLA7kFRvy+boVsQQ4OXsF3Kc5d43u/V70OkEl2+2f3PNEBZ/292boq4v2S/Q7fWXsNHU0wjgRXVH6YjmyBOAfJwDylSlyRRyc9YR/C3CdBseXGGQtb9hIS3HFmKW+E4CdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKbGKnH5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKbGKnH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765943688; x=1797479688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SM2V1hU0X/oUc2kwgDAKqXudgLZSxHVMwCl7z3sJUXU=;
  b=CKbGKnH5tgc+4iyPMu7MZv9a9xTGco4SvBRYlOM7AYFx53Gki6DDlpKK
   CA28aYPGhviGoAKXr4z6ADONJYs0Ouk8lmlsqWgnKlfA09iXo49sehuzn
   cPM+qVELRGKNY6CFkSwUQGeNbAnB553uFwixf8M1oBfMhEMoTjHQxWEMj
   cf/SljbzJayTauJ4USrtKnbVOquBGWhpCi7FNeU3LCIhItzyKDIB4VIuC
   oNS74cUs5pOf/uN/5nyqB7PlhE/iyXqSmT0ySeesOkqL0/r40VZm9n9+/
   HlNN6ZF5TjPikRKjy8HJcZ1U9/YZiHQdrVlRwuX3WCTyIsOjbWCe+cmCD
   g==;
X-CSE-ConnectionGUID: yJ5JsycmQASlcSUpFv22Rg==
X-CSE-MsgGUID: d7DckP6WS962Ee2tkyyWQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70449941"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="70449941"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 19:54:47 -0800
X-CSE-ConnectionGUID: 3qsct2YmTO2C+ieNa0umIg==
X-CSE-MsgGUID: ryG97WJqRP2HkROr50x2WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="197805530"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Dec 2025 19:54:45 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVica-0000000049A-0xoI;
	Wed, 17 Dec 2025 03:54:40 +0000
Date: Wed, 17 Dec 2025 11:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 19/35] include/linux/cleanup.h:554:73:
 warning: cast to generic address space pointer from disjoint '__seg_fs'
 address space pointer
Message-ID: <202512171127.RpZhinvv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   ce5acac3089f2dd72a384cbcd3f0e4ec28e9cf29
commit: 55ba795143c3f548c5d0d7ead143ebea3ee8405c [19/35] locking/local_lock: Support Clang's context analysis
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251217/202512171127.RpZhinvv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171127.RpZhinvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171127.RpZhinvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/jump_label.h:78,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from include/linux/bit_spinlock.h:5,
                    from lib/test_context-analysis.c:7:
   lib/test_context-analysis.c: In function 'test_local_lock_guard':
>> include/linux/cleanup.h:554:73: warning: cast to generic address space pointer from disjoint '__seg_fs' address space pointer
     554 |         *__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(_T)
         |                                                                         ^
   include/linux/local_lock.h:108:42: note: in expansion of macro 'WITH_LOCK_GUARD_1_ATTRS'
     108 | #define class_local_lock_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock, _T)
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:300:17: note: in expansion of macro 'class_local_lock_constructor'
     300 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:419:9: note: in expansion of macro 'CLASS'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   lib/test_context-analysis.c:502:11: note: in expansion of macro 'guard'
     502 |         { guard(local_lock)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
         |           ^~~~~
>> include/linux/cleanup.h:554:73: warning: cast to generic address space pointer from disjoint '__seg_fs' address space pointer
     554 |         *__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(_T)
         |                                                                         ^
   include/linux/local_lock.h:110:46: note: in expansion of macro 'WITH_LOCK_GUARD_1_ATTRS'
     110 | #define class_local_lock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_irq, _T)
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:300:17: note: in expansion of macro 'class_local_lock_irq_constructor'
     300 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:419:9: note: in expansion of macro 'CLASS'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   lib/test_context-analysis.c:503:11: note: in expansion of macro 'guard'
     503 |         { guard(local_lock_irq)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
         |           ^~~~~
>> include/linux/cleanup.h:554:73: warning: cast to generic address space pointer from disjoint '__seg_fs' address space pointer
     554 |         *__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(_T)
         |                                                                         ^
   include/linux/local_lock.h:112:50: note: in expansion of macro 'WITH_LOCK_GUARD_1_ATTRS'
     112 | #define class_local_lock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_irqsave, _T)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:300:17: note: in expansion of macro 'class_local_lock_irqsave_constructor'
     300 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:419:9: note: in expansion of macro 'CLASS'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   lib/test_context-analysis.c:504:11: note: in expansion of macro 'guard'
     504 |         { guard(local_lock_irqsave)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
         |           ^~~~~
>> include/linux/cleanup.h:554:73: warning: cast to generic address space pointer from disjoint '__seg_fs' address space pointer
     554 |         *__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(_T)
         |                                                                         ^
   include/linux/local_lock.h:114:52: note: in expansion of macro 'WITH_LOCK_GUARD_1_ATTRS'
     114 | #define class_local_lock_nested_bh_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_nested_bh, _T)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:300:17: note: in expansion of macro 'class_local_lock_nested_bh_constructor'
     300 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:419:9: note: in expansion of macro 'CLASS'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   lib/test_context-analysis.c:505:11: note: in expansion of macro 'guard'
     505 |         { guard(local_lock_nested_bh)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
         |           ^~~~~


vim +/__seg_fs +554 include/linux/cleanup.h

5acc03642ea67f Marco Elver 2025-01-17  518  
5acc03642ea67f Marco Elver 2025-01-17  519  /*
5acc03642ea67f Marco Elver 2025-01-17  520   * To support Context Analysis, we need to allow the compiler to see the
5acc03642ea67f Marco Elver 2025-01-17  521   * acquisition and release of the context lock. However, the "cleanup" helpers
5acc03642ea67f Marco Elver 2025-01-17  522   * wrap the lock in a struct passed through seperate helper functions, which
5acc03642ea67f Marco Elver 2025-01-17  523   * hides the lock alias from the compiler (no inter-procedural analysis).
5acc03642ea67f Marco Elver 2025-01-17  524   *
5acc03642ea67f Marco Elver 2025-01-17  525   * To make it work, we introduce an explicit alias to the context lock instance
5acc03642ea67f Marco Elver 2025-01-17  526   * that is "cleaned" up with a separate cleanup helper. This helper is a dummy
5acc03642ea67f Marco Elver 2025-01-17  527   * function that does nothing at runtime, but has the "_unlock" attribute to
5acc03642ea67f Marco Elver 2025-01-17  528   * tell the compiler what happens at the end of the scope.
5acc03642ea67f Marco Elver 2025-01-17  529   *
5acc03642ea67f Marco Elver 2025-01-17  530   * To generalize the pattern, the WITH_LOCK_GUARD_1_ATTRS() macro should be used
5acc03642ea67f Marco Elver 2025-01-17  531   * to redefine the constructor, which then also creates the alias variable with
5acc03642ea67f Marco Elver 2025-01-17  532   * the right "cleanup" attribute, *after* DECLARE_LOCK_GUARD_1_ATTRS() has been
5acc03642ea67f Marco Elver 2025-01-17  533   * used.
5acc03642ea67f Marco Elver 2025-01-17  534   *
5acc03642ea67f Marco Elver 2025-01-17  535   * Example usage:
5acc03642ea67f Marco Elver 2025-01-17  536   *
5acc03642ea67f Marco Elver 2025-01-17  537   *   DECLARE_LOCK_GUARD_1_ATTRS(mutex, __acquires(_T), __releases(*(struct mutex **)_T))
5acc03642ea67f Marco Elver 2025-01-17  538   *   #define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)
5acc03642ea67f Marco Elver 2025-01-17  539   *
5acc03642ea67f Marco Elver 2025-01-17  540   * Note: To support the for-loop based scoped helpers, the auxiliary variable
5acc03642ea67f Marco Elver 2025-01-17  541   * must be a pointer to the "class" type because it is defined in the same
5acc03642ea67f Marco Elver 2025-01-17  542   * statement as the guard variable. However, we initialize it with the lock
5acc03642ea67f Marco Elver 2025-01-17  543   * pointer (despite the type mismatch, the compiler's alias analysis still works
5acc03642ea67f Marco Elver 2025-01-17  544   * as expected). The "_unlock" attribute receives a pointer to the auxiliary
5acc03642ea67f Marco Elver 2025-01-17  545   * variable (a double pointer to the class type), and must be cast and
5acc03642ea67f Marco Elver 2025-01-17  546   * dereferenced appropriately.
5acc03642ea67f Marco Elver 2025-01-17  547   */
5acc03642ea67f Marco Elver 2025-01-17  548  #define DECLARE_LOCK_GUARD_1_ATTRS(_name, _lock, _unlock)		\
5acc03642ea67f Marco Elver 2025-01-17  549  static inline class_##_name##_t class_##_name##_constructor(lock_##_name##_t *_T) _lock;\
5acc03642ea67f Marco Elver 2025-01-17  550  static __always_inline void __class_##_name##_cleanup_ctx(class_##_name##_t **_T) \
5acc03642ea67f Marco Elver 2025-01-17  551  	__no_context_analysis _unlock { }
5acc03642ea67f Marco Elver 2025-01-17  552  #define WITH_LOCK_GUARD_1_ATTRS(_name, _T)				\
5acc03642ea67f Marco Elver 2025-01-17  553  	class_##_name##_constructor(_T),				\
5acc03642ea67f Marco Elver 2025-01-17 @554  	*__UNIQUE_ID(unlock) __cleanup(__class_##_name##_cleanup_ctx) = (void *)(_T)
5acc03642ea67f Marco Elver 2025-01-17  555  

:::::: The code at line 554 was first introduced by commit
:::::: 5acc03642ea67f590f3c0995602631339d26ec01 cleanup: Basic compatibility with context analysis

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Marco Elver <elver@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
