Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D8C8E0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822819; cv=none; b=jPCIaHcW/amhKFWFXO6xniQNwKQZ95jG1rg9lOYhNxxaC9Tysw+uRxii3PwtrvODDogCXIV1mCbZSquCwnWtlDnWDjdnSiXdjEoUwF38fTw4pRp2c1SCT/3InrDAdfBSAUuWz0ZNhbmY8u9Z749SLPaTfbpleVSBs8Tliujc3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822819; c=relaxed/simple;
	bh=EoYpC/FZiubpqPEOzy4M4GX2b7T10IGl82l8JZP9zj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVem0CunaI46stRfhDi6NBgqKW58O8m7nmTKWbNRntapTglkOKD6ysfF2aCjUBDuoaTXodOAJlh8c+EOsJD9/+g+f2MHfmFRWS0tjNIsSODrDXNj4+ashz27sbWJUuAOuZ4VHn4vUbTTulmyZknkjQHPbu6o+GIjKuyZSFLuWEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5EA68/Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5EA68/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743822816; x=1775358816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoYpC/FZiubpqPEOzy4M4GX2b7T10IGl82l8JZP9zj8=;
  b=W5EA68/QfHTmF3AnGjo+h9BOTid2ZqPPNm9WRXMTRXa+1qSNp8+pdWWm
   7Al9g3L7+EvFJmWDg69SgT/zbAsy9itJ/8bDtE1MDNPtys16M6kO5lAYS
   U9aeZqEVQT5Y8+fdfv0BNsVi+H5VeMVwCFt35FGR2EmiA4OSWgc3FI3FT
   9L8Ox6Xrldcz4s0Gbt/zUj3PNnVPmdT1gGjRQjCAx3BVr+IXhjwyMfL8c
   8jPiBd9Tyouo1Ec3aK5o7QDWLQ/jcbUI+kAIa3pxDGtUqo81/YFGvNku3
   UTKO2E5GhqDkJ26cOwmNmJgd6OH+B5COS5qoj3JEeqsLvDk6xLBJpBvfe
   Q==;
X-CSE-ConnectionGUID: WhmIbhpAQIul348yZBVzmw==
X-CSE-MsgGUID: 6kMm8y2rR4yhywzIzrV72A==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55907842"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="55907842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 20:13:35 -0700
X-CSE-ConnectionGUID: VBTsdAkdRYqYCeOzvqgdZw==
X-CSE-MsgGUID: u5A5D1N0QQWg3RExGIV2kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127307058"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2025 20:13:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0tyN-0001ln-2i;
	Sat, 05 Apr 2025 03:13:31 +0000
Date: Sat, 5 Apr 2025 11:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 7/7] include/linux/ktime.h:134:23: error:
 macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
Message-ID: <202504051148.eH6mf67H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   d9200f830505ef0415720e0bd90fe183e62222c5
commit: d9200f830505ef0415720e0bd90fe183e62222c5 [7/7] todo
config: i386-buildonly-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051148.eH6mf67H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051148.eH6mf67H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051148.eH6mf67H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:19,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/ktime.h: In function 'ktime_divns':
>> include/linux/ktime.h:134:23: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     134 |         BUG_ON(div < 0);
         |                       ^
   In file included from include/linux/bug.h:5,
                    from include/linux/jump_label.h:258,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15:
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/ktime.h:134:9: note: in expansion of macro 'BUG_ON'
     134 |         BUG_ON(div < 0);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:87:9: note: each undeclared identifier is reported only once for each function it appears in
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/ktime.h:134:9: note: in expansion of macro 'BUG_ON'
     134 |         BUG_ON(div < 0);
         |         ^~~~~~
   In file included from include/linux/mmzone.h:23:
   include/linux/page-flags.h: In function 'const_folio_flags':
>> include/linux/page-flags.h:310:56: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     310 |         VM_BUG_ON_PGFLAGS(page->compound_head & 1, page);
         |                                                        ^
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:310:9: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     310 |         VM_BUG_ON_PGFLAGS(page->compound_head & 1, page);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:311:8: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     311 |         VM_BUG_ON_PGFLAGS(n > 0 && !test_bit(PG_head, &page->flags), page);
         | ^       ~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   include/linux/page-flags.h: In function 'folio_flags':
   include/linux/page-flags.h:319:56: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     319 |         VM_BUG_ON_PGFLAGS(page->compound_head & 1, page);
         |                                                        ^
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:319:9: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     319 |         VM_BUG_ON_PGFLAGS(page->compound_head & 1, page);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:320:8: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     320 |         VM_BUG_ON_PGFLAGS(n > 0 && !test_bit(PG_head, &page->flags), page);
         | ^       ~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   include/linux/page-flags.h: In function 'PageLocked':
   include/linux/page-flags.h:510:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   include/linux/page-flags.h:510:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   In file included from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60:
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:411:10: note: in expansion of macro 'test_bit'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |          ^~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:353:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     353 |                 VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:411:32: note: in expansion of macro 'PF_NO_TAIL'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |                                ^~~~~~
   include/linux/page-flags.h:449:9: note: in expansion of macro 'TESTPAGEFLAG'
     449 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:510:1: note: in expansion of macro '__PAGEFLAG'
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~~
   include/linux/page-flags.h: In function '__SetPageLocked':
   include/linux/page-flags.h:510:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   include/linux/page-flags.h:510:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:426:3: note: in expansion of macro '__set_bit'
     426 | { __set_bit(PG_##lname, &policy(page, 1)->flags); }
         |   ^~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:353:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     353 |                 VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:426:26: note: in expansion of macro 'PF_NO_TAIL'
     426 | { __set_bit(PG_##lname, &policy(page, 1)->flags); }
         |                          ^~~~~~
   include/linux/page-flags.h:450:9: note: in expansion of macro '__SETPAGEFLAG'
     450 |         __SETPAGEFLAG(uname, lname, policy)                             \
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h:510:1: note: in expansion of macro '__PAGEFLAG'
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~~
   include/linux/page-flags.h: In function '__ClearPageLocked':
   include/linux/page-flags.h:510:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   include/linux/page-flags.h:510:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:431:3: note: in expansion of macro '__clear_bit'
     431 | { __clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |   ^~~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:353:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     353 |                 VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:431:28: note: in expansion of macro 'PF_NO_TAIL'
     431 | { __clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                            ^~~~~~
   include/linux/page-flags.h:451:9: note: in expansion of macro '__CLEARPAGEFLAG'
     451 |         __CLEARPAGEFLAG(uname, lname, policy)
         |         ^~~~~~~~~~~~~~~
   include/linux/page-flags.h:510:1: note: in expansion of macro '__PAGEFLAG'
     510 | __PAGEFLAG(Locked, locked, PF_NO_TAIL)
         | ^~~~~~~~~~
   include/linux/page-flags.h: In function 'PageDirty':
   include/linux/page-flags.h:515:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         | ^~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:411:10: note: in expansion of macro 'test_bit'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |          ^~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:411:32: note: in expansion of macro 'PF_HEAD'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |                                ^~~~~~
   include/linux/page-flags.h:444:9: note: in expansion of macro 'TESTPAGEFLAG'
     444 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:515:1: note: in expansion of macro 'PAGEFLAG'
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'SetPageDirty':
   include/linux/page-flags.h:515:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:416:24: note: in expansion of macro 'PF_HEAD'
     416 | { set_bit(PG_##lname, &policy(page, 1)->flags); }
         |                        ^~~~~~
   include/linux/page-flags.h:445:9: note: in expansion of macro 'SETPAGEFLAG'
     445 |         SETPAGEFLAG(uname, lname, policy)                               \
         |         ^~~~~~~~~~~
   include/linux/page-flags.h:515:1: note: in expansion of macro 'PAGEFLAG'
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'ClearPageDirty':
   include/linux/page-flags.h:515:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:421:26: note: in expansion of macro 'PF_HEAD'
     421 | { clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                          ^~~~~~
   include/linux/page-flags.h:446:9: note: in expansion of macro 'CLEARPAGEFLAG'
     446 |         CLEARPAGEFLAG(uname, lname, policy)
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h:515:1: note: in expansion of macro 'PAGEFLAG'
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'TestSetPageDirty':
   include/linux/page-flags.h:515:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:436:40: note: in expansion of macro 'PF_HEAD'
     436 | { return test_and_set_bit(PG_##lname, &policy(page, 1)->flags); }
         |                                        ^~~~~~
   include/linux/page-flags.h:454:9: note: in expansion of macro 'TESTSETFLAG'
     454 |         TESTSETFLAG(uname, lname, policy)                               \
         |         ^~~~~~~~~~~
   include/linux/page-flags.h:515:33: note: in expansion of macro 'TESTSCFLAG'
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         |                                 ^~~~~~~~~~
   include/linux/page-flags.h: In function 'TestClearPageDirty':
   include/linux/page-flags.h:515:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         | ^~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:441:42: note: in expansion of macro 'PF_HEAD'
     441 | { return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                                          ^~~~~~
   include/linux/page-flags.h:455:9: note: in expansion of macro 'TESTCLEARFLAG'
     455 |         TESTCLEARFLAG(uname, lname, policy)
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h:515:33: note: in expansion of macro 'TESTSCFLAG'
     515 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, dirty, PF_HEAD)
         |                                 ^~~~~~~~~~
   include/linux/page-flags.h: In function '__ClearPageDirty':
   include/linux/page-flags.h:516:8: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     516 |         __CLEARPAGEFLAG(Dirty, dirty, PF_HEAD)
         | ^       ~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:431:3: note: in expansion of macro '__clear_bit'
     431 | { __clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |   ^~~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:431:28: note: in expansion of macro 'PF_HEAD'
     431 | { __clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                            ^~~~~~
   include/linux/page-flags.h:516:9: note: in expansion of macro '__CLEARPAGEFLAG'
     516 |         __CLEARPAGEFLAG(Dirty, dirty, PF_HEAD)
         |         ^~~~~~~~~~~~~~~
   include/linux/page-flags.h: In function 'PageLRU':
   include/linux/page-flags.h:517:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:411:10: note: in expansion of macro 'test_bit'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |          ^~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:411:32: note: in expansion of macro 'PF_HEAD'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |                                ^~~~~~
   include/linux/page-flags.h:444:9: note: in expansion of macro 'TESTPAGEFLAG'
     444 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:517:1: note: in expansion of macro 'PAGEFLAG'
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'SetPageLRU':
   include/linux/page-flags.h:517:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:416:24: note: in expansion of macro 'PF_HEAD'
     416 | { set_bit(PG_##lname, &policy(page, 1)->flags); }
         |                        ^~~~~~
   include/linux/page-flags.h:445:9: note: in expansion of macro 'SETPAGEFLAG'
     445 |         SETPAGEFLAG(uname, lname, policy)                               \
         |         ^~~~~~~~~~~
   include/linux/page-flags.h:517:1: note: in expansion of macro 'PAGEFLAG'
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'ClearPageLRU':
   include/linux/page-flags.h:517:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:421:26: note: in expansion of macro 'PF_HEAD'
     421 | { clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                          ^~~~~~
   include/linux/page-flags.h:446:9: note: in expansion of macro 'CLEARPAGEFLAG'
     446 |         CLEARPAGEFLAG(uname, lname, policy)
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h:517:1: note: in expansion of macro 'PAGEFLAG'
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function '__ClearPageLRU':
   include/linux/page-flags.h:517:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         | ^~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:431:3: note: in expansion of macro '__clear_bit'
     431 | { __clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |   ^~~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:431:28: note: in expansion of macro 'PF_HEAD'
     431 | { __clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                            ^~~~~~
   include/linux/page-flags.h:517:29: note: in expansion of macro '__CLEARPAGEFLAG'
     517 | PAGEFLAG(LRU, lru, PF_HEAD) __CLEARPAGEFLAG(LRU, lru, PF_HEAD)
         |                             ^~~~~~~~~~~~~~~
   include/linux/page-flags.h: In function 'TestClearPageLRU':
   include/linux/page-flags.h:518:8: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     518 |         TESTCLEARFLAG(LRU, lru, PF_HEAD)
         | ^       ~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:441:42: note: in expansion of macro 'PF_HEAD'
     441 | { return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                                          ^~~~~~
   include/linux/page-flags.h:518:9: note: in expansion of macro 'TESTCLEARFLAG'
     518 |         TESTCLEARFLAG(LRU, lru, PF_HEAD)
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h: In function 'PageWorkingset':
   include/linux/page-flags.h:522:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     522 | PAGEFLAG(Workingset, workingset, PF_HEAD)
         | ^~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
>> arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:411:10: note: in expansion of macro 'test_bit'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |          ^~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:411:32: note: in expansion of macro 'PF_HEAD'
     411 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
         |                                ^~~~~~
   include/linux/page-flags.h:444:9: note: in expansion of macro 'TESTPAGEFLAG'
     444 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:522:1: note: in expansion of macro 'PAGEFLAG'
     522 | PAGEFLAG(Workingset, workingset, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'SetPageWorkingset':
   include/linux/page-flags.h:522:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     522 | PAGEFLAG(Workingset, workingset, PF_HEAD)
         | ^~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:416:24: note: in expansion of macro 'PF_HEAD'
     416 | { set_bit(PG_##lname, &policy(page, 1)->flags); }
         |                        ^~~~~~
   include/linux/page-flags.h:445:9: note: in expansion of macro 'SETPAGEFLAG'
     445 |         SETPAGEFLAG(uname, lname, policy)                               \
         |         ^~~~~~~~~~~
   include/linux/page-flags.h:522:1: note: in expansion of macro 'PAGEFLAG'
     522 | PAGEFLAG(Workingset, workingset, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'ClearPageWorkingset':
   include/linux/page-flags.h:522:1: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     522 | PAGEFLAG(Workingset, workingset, PF_HEAD)
         | ^~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/mmdebug.h:26:25: note: in expansion of macro 'BUG'
      26 |                         BUG();                                          \
         |                         ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
     136 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
         |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:348:17: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     348 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:351:33: note: in expansion of macro 'PF_POISONED_CHECK'
     351 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(compound_head(page))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:421:26: note: in expansion of macro 'PF_HEAD'
     421 | { clear_bit(PG_##lname, &policy(page, 1)->flags); }
         |                          ^~~~~~
   include/linux/page-flags.h:446:9: note: in expansion of macro 'CLEARPAGEFLAG'
     446 |         CLEARPAGEFLAG(uname, lname, policy)
         |         ^~~~~~~~~~~~~
   include/linux/page-flags.h:522:1: note: in expansion of macro 'PAGEFLAG'
     522 | PAGEFLAG(Workingset, workingset, PF_HEAD)
         | ^~~~~~~~
   include/linux/page-flags.h: In function 'TestClearPageWorkingset':
   include/linux/page-flags.h:523:8: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     523 |         TESTCLEARFLAG(Workingset, workingset, PF_HEAD)
         | ^       ~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:79: note: macro "_BUG_FLAGS" defined here
      79 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:87:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      87 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \


vim +/_BUG_FLAGS +134 include/linux/ktime.h

67cb9366ff5f99 Daniel Borkmann 2014-06-11  125  
166afb64511eef Thomas Gleixner 2014-07-16  126  #if BITS_PER_LONG < 64
f7bcb70ebae0dc John Stultz     2015-05-08  127  extern s64 __ktime_divns(const ktime_t kt, s64 div);
f7bcb70ebae0dc John Stultz     2015-05-08  128  static inline s64 ktime_divns(const ktime_t kt, s64 div)
8b618628b2bf83 Nicolas Pitre   2014-12-03  129  {
f7bcb70ebae0dc John Stultz     2015-05-08  130  	/*
f7bcb70ebae0dc John Stultz     2015-05-08  131  	 * Negative divisors could cause an inf loop,
f7bcb70ebae0dc John Stultz     2015-05-08  132  	 * so bug out here.
f7bcb70ebae0dc John Stultz     2015-05-08  133  	 */
f7bcb70ebae0dc John Stultz     2015-05-08 @134  	BUG_ON(div < 0);
8b618628b2bf83 Nicolas Pitre   2014-12-03  135  	if (__builtin_constant_p(div) && !(div >> 32)) {
2456e855354415 Thomas Gleixner 2016-12-25  136  		s64 ns = kt;
f7bcb70ebae0dc John Stultz     2015-05-08  137  		u64 tmp = ns < 0 ? -ns : ns;
f7bcb70ebae0dc John Stultz     2015-05-08  138  
f7bcb70ebae0dc John Stultz     2015-05-08  139  		do_div(tmp, div);
f7bcb70ebae0dc John Stultz     2015-05-08  140  		return ns < 0 ? -tmp : tmp;
8b618628b2bf83 Nicolas Pitre   2014-12-03  141  	} else {
8b618628b2bf83 Nicolas Pitre   2014-12-03  142  		return __ktime_divns(kt, div);
8b618628b2bf83 Nicolas Pitre   2014-12-03  143  	}
8b618628b2bf83 Nicolas Pitre   2014-12-03  144  }
166afb64511eef Thomas Gleixner 2014-07-16  145  #else /* BITS_PER_LONG < 64 */
f7bcb70ebae0dc John Stultz     2015-05-08  146  static inline s64 ktime_divns(const ktime_t kt, s64 div)
f7bcb70ebae0dc John Stultz     2015-05-08  147  {
f7bcb70ebae0dc John Stultz     2015-05-08  148  	/*
f7bcb70ebae0dc John Stultz     2015-05-08  149  	 * 32-bit implementation cannot handle negative divisors,
f7bcb70ebae0dc John Stultz     2015-05-08  150  	 * so catch them on 64bit as well.
f7bcb70ebae0dc John Stultz     2015-05-08  151  	 */
f7bcb70ebae0dc John Stultz     2015-05-08  152  	WARN_ON(div < 0);
2456e855354415 Thomas Gleixner 2016-12-25  153  	return kt / div;
f7bcb70ebae0dc John Stultz     2015-05-08  154  }
166afb64511eef Thomas Gleixner 2014-07-16  155  #endif
166afb64511eef Thomas Gleixner 2014-07-16  156  

:::::: The code at line 134 was first introduced by commit
:::::: f7bcb70ebae0dcdb5a2d859b09e4465784d99029 ktime: Fix ktime_divns to do signed division

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
