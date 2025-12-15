Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01BA2FBDFA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799611; cv=none; b=nuED3Qx+keTcbH2e33d0yqqI+rw6XDLGOJy0Lhs/2QvDVQmyPuhZtYg0iZIdBcnY+b/asl02GigzLK2hduj7SJbBeD1pZNfNhoCamdOcIsSOLU/sioq0w+9GlCufjfhzVHrG9/rDyJNh6MBW3jXSZZGad4qwl/KewauxDYv1duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799611; c=relaxed/simple;
	bh=01VNhMkFNZMJ6y8yl9UYc+uUU1KW8rHY4BzGwUTH5wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LvzwDChPgcMcVYtAQIpdbZcungFx4gx41/DjooeXj/eRY9t+b6196j/JbCgjwqWpDPDqfIO56MvXA/iAjxVasRtPteV2odLJs31L2BZS1+qKP64kxJ6fwELmT2OhE1L8subKjTxI3CmeYHQS0l5kHqNvoS20sI4IXng/IH3q4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1z659gE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1z659gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765799609; x=1797335609;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=01VNhMkFNZMJ6y8yl9UYc+uUU1KW8rHY4BzGwUTH5wk=;
  b=i1z659gEwarhuf1l0FoAAHh4XQn/ishvtrH3bJCHzQ6e1tMBxtbsv+VI
   zQqXn5XJS4J22nY7jQ4rJz7yhzIr3kN1eM8H4AvaU8aejLODp+FG2Fxtu
   +Z+BKkw9cffdDVuVqM8R1OnjVwu0Xx0fFzTrecGxWPtKdpjAcTd6u1JJ3
   pJ19A/eVr3hlw+p7B7CLxIWyUTdk9WMG15P8cvQAGfUBkgDNZxgMkXDot
   pI0zanoJvZoQ0dtvdF0zXtWkqA3R93YGn62DSeZ0zi1qrnZ1Whl2GKmYY
   mN6DQN4q1uCG93XNCgy3qo68B+aen30ZJ2N+eZ2PWPkqY7rEeOmXxPUlQ
   Q==;
X-CSE-ConnectionGUID: +OaHzC5FT426NCMkPlUHeA==
X-CSE-MsgGUID: uigNsJhzQGelT/vbEb3RTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78007378"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78007378"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:53:29 -0800
X-CSE-ConnectionGUID: DiPUIamJQHSeAc2JqChTyQ==
X-CSE-MsgGUID: V3FoRI1hQ4W0ErYCLXCtIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="202618788"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Dec 2025 03:53:27 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV78S-000000000FR-2EOD;
	Mon, 15 Dec 2025 11:53:05 +0000
Date: Mon, 15 Dec 2025 19:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 1/1] kernel/sched/core.c:7733:12: warning: array
 index -1 is before the beginning of the array
Message-ID: <202512151943.Sgkny4eq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/alexshi/linux.git ptdesc
head:   70d5b71dd5496fcb74a973de41e3f18249c1f37f
commit: 70d5b71dd5496fcb74a973de41e3f18249c1f37f [1/1] convert pgtable_t to ptdesc pointer
config: arm-defconfig (https://download.01.org/0day-ci/archive/20251215/202512151943.Sgkny4eq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151943.Sgkny4eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151943.Sgkny4eq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:83:
   arch/arm/include/asm/tlb.h:35:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      35 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
>> kernel/sched/core.c:7733:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7733 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7708:1: note: array 'preempt_modes' declared here
    7708 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +7733 kernel/sched/core.c

8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7711  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7712  const char *preempt_model_str(void)
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7713  {
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7714  	bool brace = IS_ENABLED(CONFIG_PREEMPT_RT) &&
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7715  		(IS_ENABLED(CONFIG_PREEMPT_DYNAMIC) ||
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7716  		 IS_ENABLED(CONFIG_PREEMPT_LAZY));
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7717  	static char buf[128];
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7718  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7719  	if (IS_ENABLED(CONFIG_PREEMPT_BUILD)) {
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7720  		struct seq_buf s;
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7721  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7722  		seq_buf_init(&s, buf, sizeof(buf));
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7723  		seq_buf_puts(&s, "PREEMPT");
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7724  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7725  		if (IS_ENABLED(CONFIG_PREEMPT_RT))
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7726  			seq_buf_printf(&s, "%sRT%s",
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7727  				       brace ? "_{" : "_",
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7728  				       brace ? "," : "");
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7729  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7730  		if (IS_ENABLED(CONFIG_PREEMPT_DYNAMIC)) {
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7731  			seq_buf_printf(&s, "(%s)%s",
3ebb1b6522392f Thomas Weißschuh          2025-06-26  7732  				       preempt_dynamic_mode >= 0 ?
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14 @7733  				       preempt_modes[preempt_dynamic_mode] : "undef",
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7734  				       brace ? "}" : "");
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7735  			return seq_buf_str(&s);
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7736  		}
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7737  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7738  		if (IS_ENABLED(CONFIG_PREEMPT_LAZY)) {
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7739  			seq_buf_printf(&s, "LAZY%s",
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7740  				       brace ? "}" : "");
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7741  			return seq_buf_str(&s);
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7742  		}
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7743  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7744  		return seq_buf_str(&s);
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7745  	}
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7746  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7747  	if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY_BUILD))
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7748  		return "VOLUNTARY";
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7749  
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7750  	return "NONE";
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7751  }
8bdc5daaa01e30 Sebastian Andrzej Siewior 2025-03-14  7752  

:::::: The code at line 7733 was first introduced by commit
:::::: 8bdc5daaa01e3054647d394d354762210ad88f17 sched: Add a generic function to return the preemption string

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
