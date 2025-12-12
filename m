Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C71EF0B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765539053; cv=none; b=lQaj4KrRgVQNIJK4D7Ltj2TexnZR0OUuBdRAPnCEWnRCow3ml9ABaccxANh9Yhm3O1LmXTBYOxGa4CfpKeGC9GjjM2rR2k9F8DbxSa2jx/tpCvmC/imRIhRx9HL1Ie1p4er/N0UnpOlqt20tB7KurPOZU3tsdtPA2oQaIBaDKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765539053; c=relaxed/simple;
	bh=qEXBk4EpqvyMEZXXFWZwlN2Hs8N4jMXbSs8DUOMniWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fk8vBaB4Saj/13p1MoFrhZmBNtc6khbw64eXt0dLC60NqTnTDf7wKtPQDbgRsRDtxowvpiAVDThxpYnE5ZY2KRhjwIsULqsNxfyvHS/q85r03HB/Hl31M7o3PL9FKhSoyvazV/+5ahqMZCxAJhWy58glXXIWRzwg7jJuxXDEemE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9vJdHAO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9vJdHAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765539052; x=1797075052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEXBk4EpqvyMEZXXFWZwlN2Hs8N4jMXbSs8DUOMniWg=;
  b=j9vJdHAODrVHZRN6HX2tC5oAXEKL1gWkY5oMuKvuSx/j/LIsm7GI8D3m
   Tu1KHibG00Nuj2jnq56KjsOtcZ+PrtgTgTBYrsG1fR8GMvYL8a0PcZwa+
   X+AekxISNI34sM9mGpFFvv+tRNI3kYIsMcT9rvOPXefu0vBP8floT7c8T
   cqqDt7ujPnR9+1VBWRGAhZTAp2SA/JsAc9N/I//l0/mUvIyFw65akMsDI
   jXI8vMYId6fmzRcCOFuQUh8k/CIfKK8e+V/LaCes/73CshsjtBMQMfEnD
   KwxVgkBy7jh2jH4C5nqGLnzRFc0u/JEhsc95Mpwjvd6WEohzTYZsqdG5X
   A==;
X-CSE-ConnectionGUID: 5IwxB+4mQ9mzjwB64bpewA==
X-CSE-MsgGUID: Gaq17/zdRAi66Y3cFs0zZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66711679"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="66711679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 03:30:51 -0800
X-CSE-ConnectionGUID: FkJOoV8sQVSIPUZtcZzWnw==
X-CSE-MsgGUID: 8u0V2/5cTgeVMkvGUzj6lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196819444"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2025 03:30:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU1MF-000000005z7-3AG2;
	Fri, 12 Dec 2025 11:30:47 +0000
Date: Fri, 12 Dec 2025 19:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/prjc 583/596] kernel/sched/alt_core.c:1949:19: warning:
 stack frame size (2104) exceeds limit (2048) in 'select_task_rq'
Message-ID: <202512121936.zDnnXmBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.18/prjc
head:   3a7d9c177e26aeca8de1b259a7fe74908b3f4190
commit: e4b255e7df335060384f25467dd358d002112e24 [583/596] sched/alt: [Sync] 378b7708194f sched: Make migrate_{en,dis}able() inline
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121936.zDnnXmBA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121936.zDnnXmBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121936.zDnnXmBA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_core.c:1949:19: warning: stack frame size (2104) exceeds limit (2048) in 'select_task_rq' [-Wframe-larger-than]
    1949 | static inline int select_task_rq(struct task_struct *p)
         |                   ^
>> kernel/sched/alt_core.c:4413:20: warning: stack frame size (2232) exceeds limit (2048) in 'prio_balance' [-Wframe-larger-than]
    4413 | static inline void prio_balance(struct rq *rq, const int cpu)
         |                    ^
   2 warnings generated.


vim +/select_task_rq +1949 kernel/sched/alt_core.c

58ffb66740ab33 Alfred Chen 2024-04-24  1948  
32856cbc88b1e2 Alfred Chen 2021-05-24 @1949  static inline int select_task_rq(struct task_struct *p)
fca81e904e9c3d Alfred Chen 2019-08-19  1950  {
096a4d19a3939b Alfred Chen 2022-12-21  1951  	cpumask_t allow_mask, mask;
fca81e904e9c3d Alfred Chen 2019-08-19  1952  
096a4d19a3939b Alfred Chen 2022-12-21  1953  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
fca81e904e9c3d Alfred Chen 2019-08-19  1954  		return select_fallback_rq(task_cpu(p), p);
fca81e904e9c3d Alfred Chen 2019-08-19  1955  
619e1a6679fece Alfred Chen 2025-08-28  1956  	if (static_call(sched_idle_select_func)(&mask, &allow_mask, sched_idle_mask)	||
f7b3698aa5b69d Alfred Chen 2024-01-31  1957  	    preempt_mask_check(&mask, &allow_mask, task_sched_prio(p)))
096a4d19a3939b Alfred Chen 2022-12-21  1958  		return best_mask_cpu(task_cpu(p), &mask);
fca81e904e9c3d Alfred Chen 2019-08-19  1959  
096a4d19a3939b Alfred Chen 2022-12-21  1960  	return best_mask_cpu(task_cpu(p), &allow_mask);
fca81e904e9c3d Alfred Chen 2019-08-19  1961  }
fca81e904e9c3d Alfred Chen 2019-08-19  1962  

:::::: The code at line 1949 was first introduced by commit
:::::: 32856cbc88b1e292fd444507690983bcb3ba43b2 sched/pds: Fix unexpected larger delta in task_sched_prio_normal()

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
