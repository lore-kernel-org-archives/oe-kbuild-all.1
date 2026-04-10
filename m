Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E42392C57
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865510; cv=none; b=XxKvTp/ZVE8TZVY9INJw26ZqPgzPPCU6fWlTYd3jyabWbkeoR14dGnDe1/uzaiS3z5xGFh/r1LQoaW3bAW0ETtzq13fCSnmwiXEAjWVze7430PjK6fJPE0Zwp+34cJcwTHDIbm3bpvvafkFpDe+TxmlMuuB006qC+Q6OnjWamXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865510; c=relaxed/simple;
	bh=nN9x3z1CQWixZJhNfn65mWLD06L7xO0Jer2EEkUHAG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OVpPLEPQgKapjZ8FBPKiqq98KD9uOAAOYoLlMfN7MZIpJFAxgCub7NY4AuqGKoZA3ZEJvZ70g4RzJWSc6ElCrF9JtAfggO8ymEsm7xaT1RdG5zQhee7Sbw1zpp3Jsyq7VcYwVgOx61aK79SdEpJsvS704ojOm+yqEJLKexzJwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdFPxv7h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdFPxv7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775865509; x=1807401509;
  h=date:from:to:cc:subject:message-id;
  bh=nN9x3z1CQWixZJhNfn65mWLD06L7xO0Jer2EEkUHAG4=;
  b=CdFPxv7hGsDLGV5YXv+ojp5v7sPRO4GJqUbPuD72ktLta0b1Q3oabEuU
   utXtZSO5B71dt04FY2RaNjZOgTiOS+9Etr13HDN6r/6qT565F6nYuAIsV
   ZiFKgiarqmF1rTcQoa3i4A2docWx8eEeGhgiEHUe7iY+wZw+wj0bD8Z20
   hMPjFaoopyAS02WzFECzShMCJU1Up4NbJEvD/d1qsQ1ox6ZAXhmLJFhZn
   81qB2PmhSslPReob5UTTlAEkBdM5Q469E+m23i+Piu9av+qk778rNrw88
   Jb5FghKsn6oKSrb3Z7d9VjAHwURldGmQhk5QNPrKW2CddqkMjnPNiNivL
   A==;
X-CSE-ConnectionGUID: uCmWTexSRzGR+Vha3zg9ig==
X-CSE-MsgGUID: TWBkWIT9Ra2HCjWI/0pDMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88334400"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="88334400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:58:27 -0700
X-CSE-ConnectionGUID: uAf4cecYS92w1q3qyCthVg==
X-CSE-MsgGUID: 6q4gZSbMQG6Iqvco4LAI6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252616188"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 16:58:25 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLjz-000000000Q1-1lLj;
	Fri, 10 Apr 2026 23:58:23 +0000
Date: Sat, 11 Apr 2026 07:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 2/38]
 arch/x86/include/asm/msr.h:296:33: warning: passing argument 3 of
 'rdmsr_on_cpu' makes pointer from integer without a cast
Message-ID: <202604110754.OXKR26Yn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: b6f1012e23f9638e6c66029fa3d515ddf1775a80 [2/38] x86: Cleanup include recursion hell
config: i386-randconfig-141-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110754.OXKR26Yn-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110754.OXKR26Yn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110754.OXKR26Yn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/probe.c:6:
   arch/x86/include/asm/msr.h:293:47: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
     293 | static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
         |                                               ^~~~~~~
   arch/x86/include/asm/msr.h: In function 'rdmsr_on_cpus':
   arch/x86/include/asm/msr.h:296:33: error: implicit declaration of function 'raw_cpu_ptr' [-Werror=implicit-function-declaration]
     296 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |                                 ^~~~~~~~~~~
>> arch/x86/include/asm/msr.h:296:33: warning: passing argument 3 of 'rdmsr_on_cpu' makes pointer from integer without a cast [-Wint-conversion]
     296 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   arch/x86/include/asm/msr.h:273:67: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'int'
     273 | static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
         |                                                              ~~~~~^
   arch/x86/include/asm/msr.h:296:56: warning: passing argument 4 of 'rdmsr_on_cpu' makes pointer from integer without a cast [-Wint-conversion]
     296 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |                                                        ^~~~~~~~~~~~~~~~~~~~~
         |                                                        |
         |                                                        int
   arch/x86/include/asm/msr.h:273:75: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'int'
     273 | static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
         |                                                                      ~~~~~^
   arch/x86/include/asm/msr.h: At top level:
   arch/x86/include/asm/msr.h:298:47: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
     298 | static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
         |                                               ^~~~~~~
   arch/x86/include/asm/msr.h: In function 'wrmsr_on_cpus':
   arch/x86/include/asm/msr.h:301:33: error: implicit declaration of function 'raw_cpu_read' [-Werror=implicit-function-declaration]
     301 |         wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
         |                                 ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/rdmsr_on_cpu +296 arch/x86/include/asm/msr.h

b6f1012e23f963 arch/x86/include/asm/msr.h Thomas Gleixner 2026-04-09  259  
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  260  int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  261  int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
d7484babd2c4dc arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  262  int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
c895ecdab2e4de arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  263  int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  264  void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  265  void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  266  int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  267  int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
5e404cb7ac4c09 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  268  int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
27a23a544a55b5 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  269  int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  270  int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  271  int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  272  #else  /*  CONFIG_SMP  */
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  273  static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  274  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  275  	rdmsr(msr_no, *l, *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  276  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  277  }
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  278  static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  279  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  280  	wrmsr(msr_no, l, h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  281  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  282  }
d7484babd2c4dc arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  283  static inline int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  284  {
c435e608cf59ff arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  285  	rdmsrq(msr_no, *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  286  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  287  }
c895ecdab2e4de arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  288  static inline int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  289  {
78255eb2397332 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  290  	wrmsrq(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  291  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  292  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  293  static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  294  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  295  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04 @296  	rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  297  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  298  static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  299  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  300  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  301  	wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  302  }
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  303  static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  304  				    u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  305  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  306  	return rdmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  307  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  308  static inline int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  309  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  310  	return wrmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  311  }
5e404cb7ac4c09 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  312  static inline int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  313  {
6fe22abacd40e2 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  314  	return rdmsrq_safe(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  315  }
27a23a544a55b5 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  316  static inline int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  317  {
6fa17efe45440f arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  318  	return wrmsrq_safe(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  319  }
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  320  static inline int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  321  {
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  322  	return rdmsr_safe_regs(regs);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  323  }
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  324  static inline int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  325  {
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  326  	return wrmsr_safe_regs(regs);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  327  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  328  #endif  /* CONFIG_SMP */
a5447e92e169da arch/x86/include/asm/msr.h Ingo Molnar     2025-04-13  329  

:::::: The code at line 296 was first introduced by commit
:::::: 5323922f50ecdf9d10cdd2fabd06507e5b4f3feb x86/msr: Add missing __percpu annotations

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
