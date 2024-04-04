Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BC74405
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712222025; cv=none; b=erimtKjrd2aWaMzPEwK+wONuO2Gs1gAOC+N2nzPIb2MRLPFFD5l+A2eNQpSBoD2gLr6riNz/rDyHZ+sFAoJmifxDsrRTZPo/U9Zq3ixa42JJfkHMo2JcsjXsjZL1e4BI0cSsEClHNbk71Zrv2ZL1Ry4dtRrgpfa44XBTFE3jNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712222025; c=relaxed/simple;
	bh=mccAjsrZtrDKZcf2L/In/Nw2m9ypdgH1FRGM/2YgdCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3daryfosKMQmV1duKtrZw1qgs5r9XbENenpiViAuhca6GvfIhjl9OvSJFfA7vKysPQ5Mp+xvNX79W2WCf0UFcLW6Bm1inG6ML0MoaxmUq4tGWxcDH2wL8LMfEY9kYl5WBfWxfw++hMKdMtH4df7rqhDrSj/AQAhgMzoGfmYWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZHdPr6Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZHdPr6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712222023; x=1743758023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mccAjsrZtrDKZcf2L/In/Nw2m9ypdgH1FRGM/2YgdCg=;
  b=OZHdPr6Qj47WSNQG0oPO+HnDtMmpAey1JOtNHaZ65b2vgp3J9wxF4xb0
   dqcf2pBHkP2R7s6YqLky+JbTxPdPisQi4t9dYAMfF7X6VPfpbjlxyNvkv
   VqZ87Tb1NZIqVLowP7S9YXr6NkPeManz9susjj5V+s/7KNWAqiJ/IM3cw
   dHUyRw70aHNfI4JE/fnHYUDUISjFPVrHaBdMllzQ21BS/RRDJhCGXdPhJ
   9zKZnhZqAsUPmu+lRLiwrMTLR+plo3jJbicyINlSCLwyD5IeoKGUkJKtl
   Lehj6W91uMUgZIR9khY0uip23IVsan+zHzxXg/OC+H0IfON8y/OGKG7xV
   w==;
X-CSE-ConnectionGUID: kw/SGAHoRuaUqKYjL/tS+A==
X-CSE-MsgGUID: /iNCNzpFQrGZNkW/1uQYnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7332639"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7332639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:13:38 -0700
X-CSE-ConnectionGUID: nqXp53MIQpW7Z8kumRM2Kg==
X-CSE-MsgGUID: qgPHgJLUSleYuhB12X7VMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23372617"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2024 02:13:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsJA7-0000p2-0h;
	Thu, 04 Apr 2024 09:13:35 +0000
Date: Thu, 4 Apr 2024 17:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-hardening-rebased 36/36]
 arch/x86/include/asm/msr.h:344:2: error: call to undeclared function
 'rdmsr'; ISO C99 and later do not support implicit function declarations
Message-ID: <202404041725.aGjeIgr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   4d356858e22b5daf59ef3f38b776ed0f63ca70e0
commit: 4d356858e22b5daf59ef3f38b776ed0f63ca70e0 [36/36] x86/paravirt: Explicitly include msr.h
config: x86_64-randconfig-161-20240404 (https://download.01.org/0day-ci/archive/20240404/202404041725.aGjeIgr2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041725.aGjeIgr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041725.aGjeIgr2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:5:
   In file included from arch/x86/include/asm/processor-flags.h:6:
   In file included from include/linux/mem_encrypt.h:17:
   arch/x86/include/asm/mem_encrypt.h:112:27: error: redefinition of 'mem_encrypt_setup_arch'
     112 | static inline void __init mem_encrypt_setup_arch(void) { }
         |                           ^
   arch/x86/include/asm/mem_encrypt.h:26:27: note: previous definition is here
      26 | static inline void __init mem_encrypt_setup_arch(void) { }
         |                           ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   In file included from arch/x86/include/asm/paravirt.h:8:
   arch/x86/include/asm/msr.h:320:9: error: call to undeclared function 'wrmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |         return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
         |                ^
   arch/x86/include/asm/msr.h:320:9: note: did you mean 'wrmsrl_safe'?
   arch/x86/include/asm/msr.h:318:19: note: 'wrmsrl_safe' declared here
     318 | static inline int wrmsrl_safe(u32 msr, u64 val)
         |                   ^
     319 | {
     320 |         return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
         |                ~~~~~~~~~~
         |                wrmsrl_safe
>> arch/x86/include/asm/msr.h:344:2: error: call to undeclared function 'rdmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     344 |         rdmsr(msr_no, *l, *h);
         |         ^
>> arch/x86/include/asm/msr.h:349:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |         wrmsr(msr_no, l, h);
         |         ^
>> arch/x86/include/asm/msr.h:354:2: error: call to undeclared function 'rdmsrl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     354 |         rdmsrl(msr_no, *q);
         |         ^
>> arch/x86/include/asm/msr.h:359:2: error: call to undeclared function 'wrmsrl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |         wrmsrl(msr_no, q);
         |         ^
   arch/x86/include/asm/msr.h:359:2: note: did you mean 'wrmsrns'?
   arch/x86/include/asm/msr.h:310:29: note: 'wrmsrns' declared here
     310 | static __always_inline void wrmsrns(u32 msr, u64 val)
         |                             ^
>> arch/x86/include/asm/msr.h:375:9: error: call to undeclared function 'rdmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     375 |         return rdmsr_safe(msr_no, l, h);
         |                ^
   arch/x86/include/asm/msr.h:375:9: note: did you mean 'wrmsrl_safe'?
   arch/x86/include/asm/msr.h:318:19: note: 'wrmsrl_safe' declared here
     318 | static inline int wrmsrl_safe(u32 msr, u64 val)
         |                   ^
   arch/x86/include/asm/msr.h:379:9: error: call to undeclared function 'wrmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     379 |         return wrmsr_safe(msr_no, l, h);
         |                ^
>> arch/x86/include/asm/msr.h:383:9: error: call to undeclared function 'rdmsrl_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     383 |         return rdmsrl_safe(msr_no, q);
         |                ^
   arch/x86/include/asm/msr.h:383:9: note: did you mean 'wrmsrl_safe'?
   arch/x86/include/asm/msr.h:318:19: note: 'wrmsrl_safe' declared here
     318 | static inline int wrmsrl_safe(u32 msr, u64 val)
         |                   ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   arch/x86/include/asm/paravirt.h:119:20: error: static declaration of 'wrmsrl' follows non-static declaration
     119 | static inline void wrmsrl(unsigned msr, u64 val)
         |                    ^
   arch/x86/include/asm/msr.h:359:2: note: previous implicit declaration is here
     359 |         wrmsrl(msr_no, q);
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   arch/x86/include/asm/paravirt.h:249:19: error: static declaration of 'rdmsrl_safe' follows non-static declaration
     249 | static inline int rdmsrl_safe(unsigned msr, unsigned long long *p)
         |                   ^
   arch/x86/include/asm/msr.h:383:9: note: previous implicit declaration is here
     383 |         return rdmsrl_safe(msr_no, q);
         |                ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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


vim +/rdmsr +344 arch/x86/include/asm/msr.h

505422517d3f12 arch/x86/include/asm/msr.h Borislav Petkov 2009-12-11  327  
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  328  #ifdef CONFIG_SMP
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  329  int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  330  int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  331  int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  332  int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  333  void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  334  void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  335  int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  336  int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  337  int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  338  int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  339  int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  340  int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  341  #else  /*  CONFIG_SMP  */
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  342  static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  343  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23 @344  	rdmsr(msr_no, *l, *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  345  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  346  }
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  347  static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  348  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23 @349  	wrmsr(msr_no, l, h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  350  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  351  }
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  352  static inline int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  353  {
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11 @354  	rdmsrl(msr_no, *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  355  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  356  }
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  357  static inline int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  358  {
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11 @359  	wrmsrl(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  360  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  361  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  362  static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  363  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  364  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  365  	rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  366  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  367  static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  368  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  369  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  370  	wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  371  }
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  372  static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  373  				    u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  374  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23 @375  	return rdmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  376  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  377  static inline int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  378  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  379  	return wrmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  380  }
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  381  static inline int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  382  {
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11 @383  	return rdmsrl_safe(msr_no, q);

:::::: The code at line 344 was first introduced by commit
:::::: be7baf80a699644850ff27c2105c171177ece4ea x86: merge msr_32/64.h

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
