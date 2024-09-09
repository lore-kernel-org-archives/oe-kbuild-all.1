Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F38528F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898954; cv=none; b=Of3y48GIqruPDPuqObyDab054CGo9hQxJww6khiUdeJJN7NuhZ7xuYNvOF+dVDyp1twUtoeYXKsoJ0twsTlVDxCeCYvHIbbeU2xOttnZJ56DDkw7myVYEPJi32k9evYajVeWkNtqg+U62gKlq8bpDeg9GuRbhmd74gthTJ+gXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898954; c=relaxed/simple;
	bh=g5uMjK82t9AnErhKZI4ZljPl0vgCQFQW03LR/Bic3sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjLiZT8Mwvcp6isLrmrWYE3MbU8H5dLMF15vyop4wwmQow++sINEqXZ+EkVxH0yuwoF0LXKLXlPlEI5i33s4nU/3IkxxY8X9ffgA5NElSV8akezI1ewIJjz2dvw4nRntnLy1FJcvfn6YNLqjt6rCBiqzvwuUYlo+jqvIpHgrs1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qs/RMGyu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qs/RMGyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725898954; x=1757434954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5uMjK82t9AnErhKZI4ZljPl0vgCQFQW03LR/Bic3sg=;
  b=Qs/RMGyu8vokdQ6L7EZIFBSSo4DPZpj+BXWRX4QJIVF9RqHp7Y792A8j
   JUry2YhWS2BBXq9DHRGy4VqoydXBvJhjxE3qZUPgYe1DKYYEwXPeA8Nv+
   PRJ9WHVL70Pz3M5wZ2o9g+owBHni0i8SyaXCNp0MEe8xyZ8uzEcQmMULd
   vBIu0NbUJq0Zm70qqrZ6JkjmTptH++4Ios4YHAx0E6sV92yququK3fQwD
   AwGg9H8NkFJZexatMmuFfCoBXcfJQfhdr0dI0qxZ22i6IXSCwSVbXfB6Q
   FUQZcS6/gnwn2NpumOF4IOF/QlvFNQahaqEXhkyAnwq2MxQiVTOVfuevi
   g==;
X-CSE-ConnectionGUID: 0xUiArvCRrukTfCO1uCLIA==
X-CSE-MsgGUID: VowzwK08S1yBf7BgF/6/MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35182422"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35182422"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:22:33 -0700
X-CSE-ConnectionGUID: uiV9UTToSAOaqn5Xiv98Lg==
X-CSE-MsgGUID: qaToT7CCSQeTh0vxbc89UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97430309"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Sep 2024 09:22:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snh9p-000Ex6-1r;
	Mon, 09 Sep 2024 16:22:29 +0000
Date: Tue, 10 Sep 2024 00:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 201/258]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_736' declared with attribute error: BUILD_BUG failed
Message-ID: <202409100026.iYgBGzco-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 08354d16b5d03f4594c112c4c540a4a168f6a427 [201/258] trace_sched_wakeup_backtrace
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240910/202409100026.iYgBGzco-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100026.iYgBGzco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100026.iYgBGzco-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/sched/core.c: In function 'try_to_wake_up':
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_736' declared with attribute error: BUILD_BUG failed
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:108:17: note: in expansion of macro 'BUILD_BUG'
     108 |                 BUILD_BUG();                                            \
         |                 ^~~~~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/core.c:4069:28: note: in expansion of macro 'xchg'
    4069 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^~~~


vim +/__compiletime_assert_736 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
