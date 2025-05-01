Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0F2AEE9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746085169; cv=none; b=tVZVDrj6iPZVSR511h4YQt/Te064cTIt42eF4fEj3zDI/U4LJmyPNVM+JYQKXPgMb8ZwZiB9E1aE+W3F8b007JvPYzcpLrDL1ccgV25reQlDDSSphkKkmLRCAYrWEhnz/95/gqWQJ+LVmPat4Oc5rvHqpxOVA+TbiJScG0nNW5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746085169; c=relaxed/simple;
	bh=lux83CcwY6ET+08+loul6u9UpKjmQsIrPfG+/UVqyLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMldFuDspy8PBcMNLP+a6V9CYyyFQA0IeCjn7rIreOtgjCgrRNgo8Cg+CCVX32LB/vLSbRrEjOEV7jY1+nYjOxsJYAdT5/R/iBqGNE/8SWwS8VkSx/Hncv0jExpSfk8VCVLRXQ9yGEzSWnfub1BhmXoIwrwTt5MBR6yQAK3EMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ie3oANeQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie3oANeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746085168; x=1777621168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lux83CcwY6ET+08+loul6u9UpKjmQsIrPfG+/UVqyLw=;
  b=ie3oANeQCtyTjRxxaH1vcxaAvGxnz4wAd43awqy/A2gkgSPVJ0QswK3F
   gGxugnGhbiP27bdZUcH9rZ/0Wx0+IPMIxyMEfzC8oQV+/uI7mtFPkgGki
   NyeEaypWoyVWzYa1dzOESJ54+5gYPUPUOTVP/wjjCj1bVTESgPviaYiVH
   klksNwfgVR0G2hOAjlEDo07wtlVTHqenu3Wt7rjyGqPMelaz+J2Qyfq/v
   9zMgLTuwfMv5Q5zkzPD+OMINXjNZE0aXbHNLP4fFUKNoKioe54aaCtI1Q
   13Q1+C0/wbMaUmnURj5EEvoloFmv9RVjAF8yhTXoT5IIC0HeYYAUw1GOD
   A==;
X-CSE-ConnectionGUID: wkrsj2e8SjOg7PczZQND8A==
X-CSE-MsgGUID: mwVhNWO8QZ25PRiQM3K1yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57953062"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="57953062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 00:39:27 -0700
X-CSE-ConnectionGUID: t8d10BKOQJag5NTvVU3nXQ==
X-CSE-MsgGUID: drLe3sBKRgOdN7XdJNtNhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="134849784"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2025 00:39:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAOVv-00041h-1T;
	Thu, 01 May 2025 07:39:23 +0000
Date: Thu, 1 May 2025 15:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 26/34] kernel/extable.c:58:22: error:
 'EXTABLE_SIZE' undeclared
Message-ID: <202505011539.usT7odhi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   69a817d602ee843bd52388638c4d2fdce7c20fa7
commit: b28d1ed99a57c85da1d595604fc812dfb69f9dfa [26/34] x86/alternative: Create symbols for special section entries
config: arc-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011539.usT7odhi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011539.usT7odhi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011539.usT7odhi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/uapi/asm/elf.h:13,
                    from arch/arc/include/asm/elf.h:11,
                    from include/linux/elf.h:6,
                    from kernel/extable.c:6:
   kernel/extable.c: In function 'search_exception_tables':
>> kernel/extable.c:58:22: error: 'EXTABLE_SIZE' undeclared (first use in this function)
      58 |         BUILD_BUG_ON(EXTABLE_SIZE != sizeof(struct exception_table_entry));
         |                      ^~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:537:17: note: in expansion of macro 'if'
     537 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:545:9: note: in expansion of macro '__compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/extable.c:58:9: note: in expansion of macro 'BUILD_BUG_ON'
      58 |         BUILD_BUG_ON(EXTABLE_SIZE != sizeof(struct exception_table_entry));
         |         ^~~~~~~~~~~~
   kernel/extable.c:58:22: note: each undeclared identifier is reported only once for each function it appears in
      58 |         BUILD_BUG_ON(EXTABLE_SIZE != sizeof(struct exception_table_entry));
         |                      ^~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:537:17: note: in expansion of macro 'if'
     537 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:545:9: note: in expansion of macro '__compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/extable.c:58:9: note: in expansion of macro 'BUILD_BUG_ON'
      58 |         BUILD_BUG_ON(EXTABLE_SIZE != sizeof(struct exception_table_entry));
         |         ^~~~~~~~~~~~


vim +/EXTABLE_SIZE +58 kernel/extable.c

    52	
    53	/* Given an address, look for it in the exception tables. */
    54	const struct exception_table_entry *search_exception_tables(unsigned long addr)
    55	{
    56		const struct exception_table_entry *e;
    57	
  > 58		BUILD_BUG_ON(EXTABLE_SIZE != sizeof(struct exception_table_entry));
    59	
    60		e = search_kernel_exception_table(addr);
    61		if (!e)
    62			e = search_module_extables(addr);
    63		if (!e)
    64			e = search_bpf_extables(addr);
    65		return e;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
