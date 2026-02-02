Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891BE1C01
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769990958; cv=none; b=g7C3c2IE1zUGkEp7IWyqRs3gTGeYhcGk+ojV4EgmtGIyf6v7sMaxFVB5zC7emTYecqSM+Ojyyl8JLZMAmju8KiVX2CothQYhwE1XlSoHlZvDL52kAgxS0sj/49/wzFtGWoyOcpRjmvzAgbMwz5Fy35pSP8Z713rcTQsncid1hgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769990958; c=relaxed/simple;
	bh=9HcfVib4Vby2jmrM8iiMK9Ms34HRxMg6+zW51JNrlfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jkg7UxG55g46JT29yBKPUbCT77ATVj5D6yp439DrgeLUqZrITVkY6wDDU8ABDFI3dEZBqHHKYn1bFPnE3LGzzM9NzWU0hd0KWsotVQNv18dsSkSYoCp8WUQp6KVVWyjE6/N6ahbxUwiT1kWSM75JCLxDnrl4+ULfgtaxRaiVISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grXgKOid; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grXgKOid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769990956; x=1801526956;
  h=date:from:to:cc:subject:message-id;
  bh=9HcfVib4Vby2jmrM8iiMK9Ms34HRxMg6+zW51JNrlfM=;
  b=grXgKOid0H/k8ah5neo1K/I8RGkcGrFBK9VevhVVvhrmius4BwFx2jCv
   ovMtMfWfMS8OHOkjsoOJ5lDqDv/HcKeU1NQ3rjUxbG9Q5L1G2tPtnIzSx
   iwvDkixHDomsvE4mgHMnArRQh36jlk3ClVzodBt3V8mqC1A04vgrhxRc2
   x8mWr7o1rRjl7URt+FhcSU8j7XhwhI9h29TtOFO8XXx6hsT7a2SY1dfZe
   oST6rIJjZ0d0AV6mO8onHzd7t3AhRJbB44vz/pKXx5WLDStnD+cLT8bi9
   DXo+suhG3/N7KuJDg0Vl0F6D0ZufGEkFAIyT6QyZkATxfDLe+0JkLDBLP
   g==;
X-CSE-ConnectionGUID: ivswyP6oTZ+G+8Qgfs7tlg==
X-CSE-MsgGUID: 4keKopt/TR2VlKi9bC4leQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="73753597"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="73753597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 16:09:15 -0800
X-CSE-ConnectionGUID: nPG6c5JmQSupGT4HjwxL+A==
X-CSE-MsgGUID: 4vcPMg2IScmTZBD8shM2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209361303"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Feb 2026 16:09:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmhVA-00000000f7Y-0FFw;
	Mon, 02 Feb 2026 00:09:12 +0000
Date: Mon, 02 Feb 2026 08:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/prjc 583/598] kernel/sched/alt_core.c:1949:19:
 warning: stack frame size (2104) exceeds limit (2048) in 'select_task_rq'
Message-ID: <202602020819.yM7bmEEO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.18/prjc
head:   e2ff5de4ddea9af7483ba312272b6c4ddc9f1e8c
commit: e4b255e7df335060384f25467dd358d002112e24 [583/598] sched/alt: [Sync] 378b7708194f sched: Make migrate_{en,dis}able() inline
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260202/202602020819.yM7bmEEO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020819.yM7bmEEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020819.yM7bmEEO-lkp@intel.com/

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
