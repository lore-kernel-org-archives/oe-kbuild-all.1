Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00DB652
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765073416; cv=none; b=jDDkFN2L520EUIxF+1gDUQ2xgw5RL1v63KzZXizUbQJE68UIAT616fvL1+Ef/fEpFXN3mE93S2OmwJKt1koVF+E42UvUVK+hg89xDrMO28KiubZxf7Jk/6uhTFMH5YC/XSLSB8p9BIEcwulyMsvN+sN223z4GCHid3SAZP3G3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765073416; c=relaxed/simple;
	bh=5fTL5DOSs25eWnyibilpNc5W2KgejNqDmSFOygMfIvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kt0Dd6ZOi3GzdfrRzxhgahd/5GnPbo+DBRtJN+GZOeJtoWl3Vo65maFis1DJHRqdLwwAAL/TC7Wj2aDBtDuHv5Ki0ysTb9k2lyeSixsPJu7Kbl9GmbTFgxgSgNfOuhPS9uBabyByq6coQayD4oK7wpCrAmdgJlHwn6VmOS7Wm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/SXok8k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/SXok8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765073415; x=1796609415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5fTL5DOSs25eWnyibilpNc5W2KgejNqDmSFOygMfIvI=;
  b=e/SXok8kJvyxO7n5j6mLkd7ZDg5NMqFI9U6Vaje2OjVaXqattUfy82Ze
   Nt7fcZc4JF0bgLKIqQBn2DoT2MCaYPpTyxYDQX9HD4vBgrJHec9b7qugM
   vmqg1DnnyHayMO5EiArFvp0vyiN17vWSYqd75oeGtj2WPfkoQa2e8faGA
   XjO1w6eTDkKJMTQI4MIIp0QZjRG7vHArMFEZwLlcOs+YdTNbiIqTyOQlc
   T3uNir07NSuCcbA3U1jIC+WuAoCpwi1utV8im4gyQzlxYBSIjGYdEH+ub
   zM7RAFlDo9OTpW6ocAoTn4pWN/I5apcxXGATooNXPSjz1n/bISxsaJdm1
   Q==;
X-CSE-ConnectionGUID: UifFKU7ZQrir3zPGmLLidw==
X-CSE-MsgGUID: U7ElLYQKTXWLBAoh48WbeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67098859"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67098859"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 18:10:15 -0800
X-CSE-ConnectionGUID: mxYzUc6oTjGgTkBKmedqxw==
X-CSE-MsgGUID: xvsaNs2dSwiX9yddwWPs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200753316"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2025 18:10:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS4Dy-00000000Iuj-4353;
	Sun, 07 Dec 2025 02:10:10 +0000
Date: Sun, 7 Dec 2025 10:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 8/8] arch/x86/kernel/irq_32.c:59: Error:
 expecting mnemonic; got nothing
Message-ID: <202512070940.0mpeYCTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   051df5c21cbf6d9ac396c22b3ab3c51d73c0def7
commit: 051df5c21cbf6d9ac396c22b3ab3c51d73c0def7 [8/8] x86/alternative: Convert alternatives to assembler macros
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512070940.0mpeYCTn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070940.0mpeYCTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070940.0mpeYCTn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kernel/irq_32.c: Assembler messages:
>> arch/x86/kernel/irq_32.c:57: Warning: missing closing `"'
>> arch/x86/kernel/irq_32.c:59: Error: expecting mnemonic; got nothing
>> arch/x86/kernel/irq_32.c:61: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:64: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:66: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:70: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:71: Error: expecting mnemonic; got nothing
   arch/x86/kernel/irq_32.c:74: Warning: missing closing `"'
   arch/x86/kernel/irq_32.c:74: Error: expecting mnemonic; got nothing
   arch/x86/kernel/irq_32.c:96: Warning: missing closing `"'
   arch/x86/kernel/irq_32.c:98: Error: expecting mnemonic; got nothing
   arch/x86/kernel/irq_32.c:100: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:103: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:105: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:109: Error: invalid character ' ' before operand 1
   arch/x86/kernel/irq_32.c:110: Error: expecting mnemonic; got nothing
   arch/x86/kernel/irq_32.c:113: Warning: missing closing `"'
   arch/x86/kernel/irq_32.c:113: Error: expecting mnemonic; got nothing


vim +59 arch/x86/kernel/irq_32.c

c6a0918072eaa9 arch/x86/kernel/irq_32.c Brian Gerst     2025-03-03  53  
403d8efc94cd02 arch/x86/kernel/irq_32.c Thomas Gleixner 2008-05-05  54  static void call_on_stack(void *func, void *stack)
^1da177e4c3f41 arch/i386/kernel/irq.c   Linus Torvalds  2005-04-16  55  {
0ec914707c3ed0 arch/x86/kernel/irq_32.c Uros Bizjak     2025-03-03  56  	asm volatile("xchgl %[sp], %%esp\n"
7614e913db1f40 arch/x86/kernel/irq_32.c Andi Kleen      2018-01-11 @57  		     CALL_NOSPEC
0ec914707c3ed0 arch/x86/kernel/irq_32.c Uros Bizjak     2025-03-03  58  		     "movl %[sp], %%esp"
0ec914707c3ed0 arch/x86/kernel/irq_32.c Uros Bizjak     2025-03-03 @59  		     : [sp] "+b" (stack)
0ec914707c3ed0 arch/x86/kernel/irq_32.c Uros Bizjak     2025-03-03  60  		     : [thunk_target] "D" (func)
403d8efc94cd02 arch/x86/kernel/irq_32.c Thomas Gleixner 2008-05-05 @61  		     : "memory", "cc", "edx", "ecx", "eax");
^1da177e4c3f41 arch/i386/kernel/irq.c   Linus Torvalds  2005-04-16  62  }
^1da177e4c3f41 arch/i386/kernel/irq.c   Linus Torvalds  2005-04-16  63  

:::::: The code at line 59 was first introduced by commit
:::::: 0ec914707c3ed052ed26eb88f9300109030a7fb2 x86/irq/32: Use named operands in inline asm

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
