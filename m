Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC96298CAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 01:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893270; cv=none; b=nwG9C4oUzGZXQlxT2NbecSwomRWvCPUaiZb/q+xf0E0eEe3BQ8N3oqShrlKCT9ik+7KoBBV96BsSOG7rxy5a/PwPaKU2l9kNlgkdImtm0ZTFFsnNOIp0Ym/s74p97YAl9yveua+yjtnGOQO2NYVfi/68howeLAC6tjpmlyZ7S68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893270; c=relaxed/simple;
	bh=Tt75xcKUczX7CbcndROcPzhF48EGXMhg0dMULYaC6B4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C41O6KlPcj0va5DU7i5eJRTGuM25Aby7RVY3AxnZ3H3i4APAJxGlGUZv8PnCe3lrcvkAkSSW9fATceY6WRTnyI6pGyBjmuK3pAmUVaQl+nuJ7N5mjBDjvdb71b7TH9+Fp/v4JCqyEom9bCUFoDoPK/+tPApjW+nwIMp88bguvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkAuz0oc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkAuz0oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785893269; x=1817429269;
  h=date:from:to:cc:subject:message-id;
  bh=Tt75xcKUczX7CbcndROcPzhF48EGXMhg0dMULYaC6B4=;
  b=SkAuz0ocjmMOP30SDhe7bscYdZ1Tlple+gwZ3rUQCCzWKBh4GesrmR98
   T7XbYtEYmVWNLpf/GA3gRfCyI2AxMaOZQQGseInIL05mT5OdRLDBkuOGa
   RfBArwmug3t2tYKkJmQgtubPNk0fSA+K3J4swmQAPqxen78WSk4LsFlCi
   Ob1Eza1au8mj6cxEddU7JlupI4845bCGam8pIybQRlpNWDZ0oKOVYxtWP
   1mSFapi8omRILPSvkKcVpU5Ug5w+QLTX0ZUPLIrinzvUaBC9bDfTHepPf
   91rUA01DJQyKvgw+ZqIEP7scpsVr97f2b+RwwzHxdoGfdEpoMywzmhAhj
   A==;
X-CSE-ConnectionGUID: cIe3SXRaQ2u22T2fmnwgrw==
X-CSE-MsgGUID: WkzEmYnCQGmTE6u5TBQTng==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85435995"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="85435995"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:27:47 -0700
X-CSE-ConnectionGUID: 8pgo3DeYTCakltWOF2pF7g==
X-CSE-MsgGUID: UtwANQ0RRpuJFHJuB3P3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="255377276"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2026 18:27:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrQQ4-000000004JS-0FsW;
	Wed, 05 Aug 2026 01:27:44 +0000
Date: Wed, 05 Aug 2026 03:26:49 +0200
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [peterz-queue:locking/core 17/21]
 tools/arch/x86/include/asm/cpufeatures.h:228:68: error: "/*" within comment
Message-ID: <202608050334.83Ztbk9y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   098a858bcdad1b6327e23274626c9fb36c5932fc
commit: 6cbc4e025e8c31cdc861ad9f2f53dc0eb290d586 [17/21] x86/paravirt: Use static_call() for the paravirt spinlock ops
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260805/202608050334.83Ztbk9y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050334.83Ztbk9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050334.83Ztbk9y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   In file included from arch/x86/include/asm/nospec-branch.h:11,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   In file included from arch/x86/special.c:7:
>> tools/arch/x86/include/asm/cpufeatures.h:228:68: error: "/*" within comment [-Werror=comment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:95: tools/objtool/arch/x86/special.o] Error 1
   In file included from arch/x86/include/asm/cmpxchg.h:6,
                    from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/percpu.h:5,
                    from include/linux/prandom.h:13,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:123: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2
   make[2]: *** [Makefile:1587: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +228 tools/arch/x86/include/asm/cpufeatures.h

   222	
   223	#define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
   224	#define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
   225	#define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
   226	#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
   227	#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
 > 228	/* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   229	#define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
   230	#define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
