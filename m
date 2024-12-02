Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57AC1DED42
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733181019; cv=none; b=W9FeBsi9e0RLQZ4V7T0qx/p5tyOkMYVf5s0RiyQkmKc36D4khrxm+YBy1sYwsbJCKSSsI2Nfev2nE2syAeJMonGtQ271ijM5/70uKt4Vbat0SJgfRbUOB4A8pVz5johQm9VFmWB11A9BkC/uEeg35gYkFdwa+Jw9eiip8X4k528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733181019; c=relaxed/simple;
	bh=dl6V/5lNyZp7qjMRv+q8K0BEJ87o340il5pQiYzuM2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4nbB0WkVqw9RKEhQlu12VzrtNNuIytAHRT8UM8rlEAAV2SCVI/AP4jWsbxTc9e3cmFJHYTvkJjOv5rSueSxUPdIsz16Dpa3JlE8vCiVATMghFeJ1a6QpFTBIBK+KR9BFdD3Dl9wlR6TwklK/yNX0zChe+hFZIgFn5fI4B8b7Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4V4lTPp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4V4lTPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733181017; x=1764717017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dl6V/5lNyZp7qjMRv+q8K0BEJ87o340il5pQiYzuM2E=;
  b=M4V4lTPp0lZ1BhnWEYWPKTBbMoL9Ek4P5VXqiH8OPuu3hBe7WGEmooqs
   j3ZfrAmwqWg/PI9z/VOuQHg39lqUbR9YW2ilL9WWDGHLCARlpckT20kiE
   xM1s2R56bD/n4VxMPHzJYCdcqM+OHUcSIWEkTh97T29WFsj29BdrPrBK8
   Ok9TmzoBefZoE3DhXfIpw7+YGdB4ZSNYTJGJX7OIUosr3ZHvJrWSH1JE3
   +mCSiQqrrz1W6iN0kh6NehnhQx4npezAe5Ipv7Wigrw/ZpYwj9BvJH1s6
   thSAXBncnllM5ACqYC6z2EzCKnQ5EESc6uD8hWBT+9NsAPcNgBQRexml/
   Q==;
X-CSE-ConnectionGUID: 8GxOnQ5ZR+eqaiRS9QQHlg==
X-CSE-MsgGUID: DnlUueEaSau95fi5y/O8jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33520892"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33520892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 15:10:17 -0800
X-CSE-ConnectionGUID: TAKfmfb3TvGZgcKSL0NQjA==
X-CSE-MsgGUID: HcPsYhncSjiJPnyMfCLx5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97682429"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 15:10:15 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIFYT-00030n-0u;
	Mon, 02 Dec 2024 23:10:13 +0000
Date: Tue, 3 Dec 2024 07:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/text_poke_early 2/2]
 arch/x86/kernel/alternative.c:1756: warning: Function parameter or struct
 member 'mod' not described in 'text_poke_early'
Message-ID: <202412030721.h86XRJ2p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/text_poke_early
head:   04de1a34ab130ce60ea1ee66d67d02e544fd541c
commit: 04de1a34ab130ce60ea1ee66d67d02e544fd541c [2/2] x86: Push module_writable_address() into text_poke_early()
config: i386-buildonly-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030721.h86XRJ2p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030721.h86XRJ2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030721.h86XRJ2p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/alternative.c:1756: warning: Function parameter or struct member 'mod' not described in 'text_poke_early'


vim +1756 arch/x86/kernel/alternative.c

19d36ccdc34f5ed arch/i386/kernel/alternative.c Andi Kleen        2007-07-22  1741  
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1742  /**
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1743   * text_poke_early - Update instructions on a live kernel at boot time
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1744   * @addr: address to modify
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1745   * @opcode: source of the copy
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1746   * @len: length to copy
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1747   *
19d36ccdc34f5ed arch/i386/kernel/alternative.c Andi Kleen        2007-07-22  1748   * When you use this code to patch more than one byte of an instruction
19d36ccdc34f5ed arch/i386/kernel/alternative.c Andi Kleen        2007-07-22  1749   * you need to make sure that other CPUs cannot execute this code in parallel.
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1750   * Also no thread must be currently preempted in the middle of these
32b1cbe380417f2 arch/x86/kernel/alternative.c  Marco Ammon       2019-09-02  1751   * instructions. And on the local CPU you need to be protected against NMI or
32b1cbe380417f2 arch/x86/kernel/alternative.c  Marco Ammon       2019-09-02  1752   * MCE handlers seeing an inconsistent instruction while you patch.
19d36ccdc34f5ed arch/i386/kernel/alternative.c Andi Kleen        2007-07-22  1753   */
04de1a34ab130ce arch/x86/kernel/alternative.c  Peter Zijlstra    2024-12-02  1754  __init_or_module
04de1a34ab130ce arch/x86/kernel/alternative.c  Peter Zijlstra    2024-12-02  1755  void text_poke_early(struct module *mod, void *addr, const void *opcode, size_t len)
19d36ccdc34f5ed arch/i386/kernel/alternative.c Andi Kleen        2007-07-22 @1756  {
04de1a34ab130ce arch/x86/kernel/alternative.c  Peter Zijlstra    2024-12-02  1757  	void *wr_addr = module_writable_address(mod, addr);
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1758  	unsigned long flags;
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1759  
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1760  	if (boot_cpu_has(X86_FEATURE_NX) &&
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1761  	    is_module_text_address((unsigned long)addr)) {
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1762  		/*
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1763  		 * Modules text is marked initially as non-executable, so the
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1764  		 * code cannot be running and speculative code-fetches are
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1765  		 * prevented. Just change the code.
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1766  		 */
04de1a34ab130ce arch/x86/kernel/alternative.c  Peter Zijlstra    2024-12-02  1767  		memcpy(wr_addr, opcode, len);
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1768  	} else {
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1769  		local_irq_save(flags);
04de1a34ab130ce arch/x86/kernel/alternative.c  Peter Zijlstra    2024-12-02  1770  		memcpy(wr_addr, opcode, len);
6fffacb30349e09 arch/x86/kernel/alternative.c  Pavel Tatashin    2018-07-19  1771  		sync_core();
3ea1704a9296783 arch/x86/kernel/alternative.c  Thomas Gleixner   2023-12-07  1772  		local_irq_restore(flags);
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1773  
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1774  		/*
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1775  		 * Could also do a CLFLUSH here to speed up CPU recovery; but
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1776  		 * that causes hangs on some VIA CPUs.
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1777  		 */
f2c65fb3221adc6 arch/x86/kernel/alternative.c  Nadav Amit        2019-04-25  1778  	}
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1779  }
e587cadd8f47e20 arch/x86/kernel/alternative.c  Mathieu Desnoyers 2008-03-06  1780  

:::::: The code at line 1756 was first introduced by commit
:::::: 19d36ccdc34f5ed444f8a6af0cbfdb6790eb1177 x86: Fix alternatives and kprobes to remap write-protected kernel text

:::::: TO: Andi Kleen <ak@suse.de>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
