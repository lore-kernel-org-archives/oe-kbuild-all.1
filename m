Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE830DEA5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436856; cv=none; b=BFOM0YYbA4Qs5NuFdd1Txdrc0BvaRuj6zWKL9s1iwPA6xSUvxGq9NAUHW7ajo8TOiP7OUejT4HJ8L8JMXaOkeHyqU+nOCSl8xxItkAn2nOjF8yNPRg1YbcNNkEywYhhVVytScQkvMZW1fi9qxYTgcmcHrvVx897w+yLQctXS+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436856; c=relaxed/simple;
	bh=/xMJlXHdjVkSzzRcaVVMSPf79SvgSwJAkawQbu/QBEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GQWLaT4aBriLGb6FerycVqvr26GEjJ/wMEd20Bu1LvW2+XYY9kb04zS1uDrG+d0i+of0G1kh9RwI7/M2ug+KhcGeLd+Bos6DeT5zilhrXrs9Xx9J9Dal31eF63EA1naxhBR5KhenX+83SQvxpTBeXoUWtKuwUJ6n+i37tEU3qaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7WnY7l0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7WnY7l0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436855; x=1819972855;
  h=date:from:to:cc:subject:message-id;
  bh=/xMJlXHdjVkSzzRcaVVMSPf79SvgSwJAkawQbu/QBEw=;
  b=J7WnY7l0oxriUDZiTaAJBgBQFbts5iDezbL5h3SaioGGAGSDRn91XZbP
   FtC/KCJFMgmfe7/EYpsH25+S4oxUW4u9vIiirEB44qp7Ez6H+mJkPMHsV
   24vjSA6jECYYlx2NI/m3uiwe3o8Puu807eNY6fa5MJHiKpAArOZvwBTi+
   Ekg1AV1YcionTIyc7JeO/aYsSJM8Ce3tehDsSzxayXLtZH8nNc75Zr7ow
   aJVJxgnLYj5CaMMQ6sGyQxRWPOepZJdiNZO5BFCdjGjZRz678Fgf6Yc4p
   B7Rv6fUAu1eKrGlRTqJDY3EE1j2UqaikFXCCeoosPF48xs/iO453rK7/T
   g==;
X-CSE-ConnectionGUID: gerBAajYSTeE0XvZgzucFw==
X-CSE-MsgGUID: HDY2P6LxRxSCeZuBFQWolQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92736941"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92736941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:00:54 -0700
X-CSE-ConnectionGUID: o0K2EAg9RZifaWxOJkZhjQ==
X-CSE-MsgGUID: rcjiwQwlSpK1ERI3z5cNqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="269169791"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2026 05:00:53 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x267f-000000000w3-0Pm0;
	Thu, 03 Sep 2026 12:00:51 +0000
Date: Thu, 03 Sep 2026 14:00:00 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 648/767] kernel/sched/alt_core.c:1979:19:
 warning: stack frame size (2104) exceeds limit (2048) in 'select_task_rq'
Message-ID: <202609031352.hqUoMi0K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   b93a6c25160bf4f198c279466dfabfb399f5d973
commit: ca8e0fde64fcfaf8691f1aa16d875770a5896ca5 [648/767] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031352.hqUoMi0K-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031352.hqUoMi0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031352.hqUoMi0K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_core.c:1979:19: warning: stack frame size (2104) exceeds limit (2048) in 'select_task_rq' [-Wframe-larger-than]
    1979 | static inline int select_task_rq(struct task_struct *p)
         |                   ^
>> kernel/sched/alt_core.c:4450:20: warning: stack frame size (2224) exceeds limit (2048) in 'prio_balance' [-Wframe-larger-than]
    4450 | static inline void prio_balance(struct rq *rq, const int cpu)
         |                    ^
   2 warnings generated.


vim +/select_task_rq +1979 kernel/sched/alt_core.c

d61ec5fb1be3213 Alfred Chen 2024-04-24  1978  
ff5c45dfa194c44 Alfred Chen 2021-05-24 @1979  static inline int select_task_rq(struct task_struct *p)
2f7ec82370cbb70 Alfred Chen 2019-08-19  1980  {
ca82bd6ba136130 Alfred Chen 2022-12-21  1981  	cpumask_t allow_mask, mask;
2f7ec82370cbb70 Alfred Chen 2019-08-19  1982  
ca82bd6ba136130 Alfred Chen 2022-12-21  1983  	if (unlikely(!cpumask_and(&allow_mask, p->cpus_ptr, cpu_active_mask)))
2f7ec82370cbb70 Alfred Chen 2019-08-19  1984  		return select_fallback_rq(task_cpu(p), p);
2f7ec82370cbb70 Alfred Chen 2019-08-19  1985  
1cb8e7e744b4a93 Alfred Chen 2025-08-28  1986  	if (static_call(sched_idle_select_func)(&mask, &allow_mask, sched_idle_mask)	||
081f001d0ed9543 Alfred Chen 2024-01-31  1987  	    preempt_mask_check(&mask, &allow_mask, task_sched_prio(p)))
ca82bd6ba136130 Alfred Chen 2022-12-21  1988  		return best_mask_cpu(task_cpu(p), &mask);
2f7ec82370cbb70 Alfred Chen 2019-08-19  1989  
ca82bd6ba136130 Alfred Chen 2022-12-21  1990  	return best_mask_cpu(task_cpu(p), &allow_mask);
2f7ec82370cbb70 Alfred Chen 2019-08-19  1991  }
2f7ec82370cbb70 Alfred Chen 2019-08-19  1992  

:::::: The code at line 1979 was first introduced by commit
:::::: ff5c45dfa194c44ec3b146644154ca07a35eef2a sched/pds: Fix unexpected larger delta in task_sched_prio_normal()

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
