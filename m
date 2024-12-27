Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C9EA920
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735332045; cv=none; b=qnZ8y4YTJYlexHECDK5mAlWAbdKOI7Ez9UUrsBWzB+Wl7xz6eRHkxUx9UNEyiloTsH6hUoaSSFEJf4+O7kezs6fMVCv/UopAniMtl5IDjKK+GUwo0pm6PbqLt9y5Sgb2v0mUcVpQmpqhoVwsX1mAlkG8vCVYXYc/Kpfsi/UX14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735332045; c=relaxed/simple;
	bh=AZq5keRfuZDbi3ZoPt88AsBjkw+RkOq54cWaPgnxrNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IfIFYQE4YH52QJUgj2nB1dpUewUpIvOLFKVdUSLeSII0KoBlQZMPVhw/MFihVR54d7TqkmMlEkdkiCYx8gY621eQnsfFAO7HshlwEo05Nh/RlZeSgDkevzN3cla3yrWiGBUNZk+t5nIAMkFhQ7RMkWUGYRJmrqebMyWO9MBS7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxWmo4D8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxWmo4D8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735332043; x=1766868043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZq5keRfuZDbi3ZoPt88AsBjkw+RkOq54cWaPgnxrNU=;
  b=NxWmo4D8J1N8PJVDi0gg6EZst//0jl6r2HKbP4lDOK+PsBB1TvjuN5MJ
   vmXjfuiwe18rO5YqmA/axcN3RUBPn7jfT/r9/4tk9cZyryUG6S0cx6Hc5
   wOe+2D/LNQUexPbB5MQFS/PXyqo7/35EOrRPcrNnr7cKFKxIn/PJOMQ93
   qV0NcFrcCO5yN/cQBL2ud2FfppAKiHBusXq6uNFo7cQDsqErfOvEBKAsW
   C4xZUqXMZmXhqmhLxBNLFZsehDRpa1+BsYgmq77X023npq47nqsU/2zAj
   AOcSovGkk4Z18/RAob0DvmjIeZOLTOeWz2WOuRwZiKJGIm04y18s8kdw8
   A==;
X-CSE-ConnectionGUID: crti+c3PSbqilRXTmK3smA==
X-CSE-MsgGUID: tXBTMx3vQTq6rJP097Ns4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39505670"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39505670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 12:40:41 -0800
X-CSE-ConnectionGUID: plv6vxoLTHGaIuLIUdHeww==
X-CSE-MsgGUID: I+xYNchIQLaU6PlZb2+cBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104854259"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 12:40:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRH8P-0003ah-39;
	Fri, 27 Dec 2024 20:40:37 +0000
Date: Sat, 28 Dec 2024 04:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 12/13]
 arch/x86/include/asm/msr.h:364:9: error: call to undeclared function
 'wrmsr_safe'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412280449.8l1RvHBS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   04e87989806be09036718fa57acd80ea138c2319
commit: 688f8f5d716435f44712807ae801abfb1c1f5c50 [12/13] x86/msr: Remove MSR write APIs that take MSR value in two u32 arguments
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241228/202412280449.8l1RvHBS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280449.8l1RvHBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280449.8l1RvHBS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:364:9: error: call to undeclared function 'wrmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     364 |         return wrmsr_safe(msr_no, l, h);
         |                ^
   arch/x86/include/asm/msr.h:364:9: note: did you mean 'wrmsrl_safe'?
   arch/x86/include/asm/msr.h:303:19: note: 'wrmsrl_safe' declared here
     303 | static inline int wrmsrl_safe(u32 msr, u64 val)
         |                   ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:


vim +/wrmsr_safe +364 arch/x86/include/asm/msr.h

505422517d3f12 arch/x86/include/asm/msr.h Borislav Petkov 2009-12-11  312  
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  313  #ifdef CONFIG_SMP
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  314  int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  315  int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  316  int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  317  int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  318  void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  319  void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  320  int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  321  int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  322  int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  323  int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  324  int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  325  int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  326  #else  /*  CONFIG_SMP  */
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  327  static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  328  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  329  	rdmsr(msr_no, *l, *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  330  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  331  }
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  332  static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  333  {
027fda52cb9f7f arch/x86/include/asm/msr.h Xin Li (Intel   2024-08-05  334) 	wrmsrl(msr_no, (u64)h << 32 | l);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  335  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  336  }
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  337  static inline int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  338  {
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  339  	rdmsrl(msr_no, *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  340  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  341  }
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  342  static inline int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  343  {
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  344  	wrmsrl(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  345  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  346  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  347  static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  348  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  349  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  350  	rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  351  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  352  static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  353  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  354  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  355  	wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  356  }
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  357  static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  358  				    u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  359  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  360  	return rdmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  361  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  362  static inline int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  363  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23 @364  	return wrmsr_safe(msr_no, l, h);

:::::: The code at line 364 was first introduced by commit
:::::: be7baf80a699644850ff27c2105c171177ece4ea x86: merge msr_32/64.h

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
