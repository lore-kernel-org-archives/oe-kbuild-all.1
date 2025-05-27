Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F4253B4C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359773; cv=none; b=Ovv2G/GY4y966IuTH8NQ/+FcmGZEGxPGprVJYaV0U6JZNqG+CRO8IjSKCG7YKd4orpp6qQ6F4/dDGo/hII0b7EWsjiuXsae/q1RRUqgko36acTSsvNZ/fiEwbKeoHTR0qE5EH8fqKFFk6MOzYpXKNtpppgWiXZmUS94GLYQ7BmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359773; c=relaxed/simple;
	bh=MydQqp6ctSk+ZWBPYxX0OWALefeoM5DKylxSi0IFd6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDixB10sQvT7cZH5swu1SgDf9PHh43tAqEuYte+muuOUXWMGt95J53G3nFtZcEJo4Dps9e3uH0yUmrTk8m8vQ9Mf1G7q8zMnq5HO69T1946mI+cFh2f56iV07+/WMjoJpndvHuIejSEis3bYBJTv1Rw4zt3O2vRYBSWD3qhRgCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYSQM5+F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYSQM5+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748359772; x=1779895772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MydQqp6ctSk+ZWBPYxX0OWALefeoM5DKylxSi0IFd6Q=;
  b=NYSQM5+FENPFsQ4g0pgx0ecbyavWh9Qasi35dTBijqH2dUZV5p6Cw63Y
   ZzvlmrOy0mIg361CcqNd3oOXV0Pp6SYoz6HCp0bpKXI6lKPqfEfrX9T3a
   OmwBCUh3hpfzt0mv9uX2w0KUPA0rSZsREgQj7jYw4Q1+DCYhhP9fY5pax
   iXiq1NGE/gksmBeO1v3yxpwqgtIcZI8zBtLXKoBkGNtcIvQQUxAFwUmo5
   3mYtOo5dxUISy8Kt8P6rjlOGZAVSL7w1buqdcRbsinS4yCnw3wjHgWNfX
   1bi6akymthKEJwy4jWKH23XAUT8XZGBZRWKdTOKlfV/iwx7CTVukXsvX8
   g==;
X-CSE-ConnectionGUID: p3r/Bsj/SKaETaOdYy3abw==
X-CSE-MsgGUID: PRws54L6SZyEXPZ1asSGng==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54011296"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="54011296"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 08:29:31 -0700
X-CSE-ConnectionGUID: uVZwupYbQqOka05MMplaFw==
X-CSE-MsgGUID: IIpnmzM0QcOwSbLF1PUv8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="142697972"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 08:29:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJwF5-000TJE-2K;
	Tue, 27 May 2025 15:29:27 +0000
Date: Tue, 27 May 2025 23:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2928/2928]
 arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x0'
 in asm
Message-ID: <202505272346.fzESqwgx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   45e99bc87727bf5be83ac512da687f7742d4a8fb
commit: 68ee705da160d123656dcbf9ebd449fb77b54bc0 [2928/2928] scripts: kernel-doc: Fix syntax error due to undeclared args variable
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250527/202505272346.fzESqwgx-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505272346.fzESqwgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505272346.fzESqwgx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/Makefile:44: Detected assembler with broken .inst; disassembly will be unreliable
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from kernel/bounds.c:10:
   In file included from include/linux/page-flags.h:10:
   In file included from include/linux/bug.h:5:
   In file included from arch/arm64/include/asm/bug.h:26:
   In file included from include/asm-generic/bug.h:20:
   In file included from include/linux/kernel.h:12:
   In file included from include/linux/bitops.h:29:
   In file included from arch/arm64/include/asm/bitops.h:26:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm64/include/asm/atomic.h:16:
   In file included from arch/arm64/include/asm/cmpxchg.h:14:
   In file included from arch/arm64/include/asm/lse.h:16:
>> arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x0' in asm
     364 | __CMPXCHG_CASE(w, b,     ,  8,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
>> arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
>> arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:365:1: error: unknown register name 'x0' in asm
     365 | __CMPXCHG_CASE(w, h,     , 16,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:365:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:365:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:366:1: error: unknown register name 'x0' in asm
     366 | __CMPXCHG_CASE(w,  ,     , 32,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:366:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:366:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:367:1: error: unknown register name 'x0' in asm
     367 | __CMPXCHG_CASE(x,  ,     , 64,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:367:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:367:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:368:1: error: unknown register name 'x0' in asm
     368 | __CMPXCHG_CASE(w, b, acq_,  8,  a, "memory")
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:368:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:368:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:369:1: error: unknown register name 'x0' in asm
     369 | __CMPXCHG_CASE(w, h, acq_, 16,  a, "memory")
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:369:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:369:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:370:1: error: unknown register name 'x0' in asm
     370 | __CMPXCHG_CASE(w,  , acq_, 32,  a, "memory")
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1252: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:195: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/x0 +364 arch/arm64/include/asm/atomic_lse.h

c342f78217e822 Will Deacon 2015-04-23  363  
5ef3fe4cecdf82 Will Deacon 2018-09-13 @364  __CMPXCHG_CASE(w, b,     ,  8,   )
5ef3fe4cecdf82 Will Deacon 2018-09-13  365  __CMPXCHG_CASE(w, h,     , 16,   )
5ef3fe4cecdf82 Will Deacon 2018-09-13  366  __CMPXCHG_CASE(w,  ,     , 32,   )
5ef3fe4cecdf82 Will Deacon 2018-09-13  367  __CMPXCHG_CASE(x,  ,     , 64,   )
5ef3fe4cecdf82 Will Deacon 2018-09-13  368  __CMPXCHG_CASE(w, b, acq_,  8,  a, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  369  __CMPXCHG_CASE(w, h, acq_, 16,  a, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  370  __CMPXCHG_CASE(w,  , acq_, 32,  a, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  371  __CMPXCHG_CASE(x,  , acq_, 64,  a, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  372  __CMPXCHG_CASE(w, b, rel_,  8,  l, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  373  __CMPXCHG_CASE(w, h, rel_, 16,  l, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  374  __CMPXCHG_CASE(w,  , rel_, 32,  l, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  375  __CMPXCHG_CASE(x,  , rel_, 64,  l, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  376  __CMPXCHG_CASE(w, b,  mb_,  8, al, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  377  __CMPXCHG_CASE(w, h,  mb_, 16, al, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  378  __CMPXCHG_CASE(w,  ,  mb_, 32, al, "memory")
5ef3fe4cecdf82 Will Deacon 2018-09-13  379  __CMPXCHG_CASE(x,  ,  mb_, 64, al, "memory")
c342f78217e822 Will Deacon 2015-04-23  380  

:::::: The code at line 364 was first introduced by commit
:::::: 5ef3fe4cecdf82fdd71ce78988403963d01444d4 arm64: Avoid redundant type conversions in xchg() and cmpxchg()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
