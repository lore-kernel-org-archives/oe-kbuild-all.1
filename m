Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4EB2397A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138852; cv=none; b=TrWFboOomFAg24gTKw8G5pTBF2R5YkyjR5zPf6+6BaczYq3UF3fd1At2U4Uy2zMmXV9WrZJDmWmvFtEe7NMim1ZroDlC3rxfh+GgtmbUAO6H8EFkZ/33sLb8f/fJ8gbCTnlxAyL5ywQa3KDGmxHh9P0il6O/ccCvoGih/ZPfdJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138852; c=relaxed/simple;
	bh=WYRwRe8JUgyuS6aJ/MdjCf4ws7GSj9AyfmtxfMKqDSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtHCBBNoOj/WHFpgnkpuTyZiqv5LqsK/l5gIsDENasiPo7Tp29Il3Pu+XEI8e8t+9zUUJQO7PsbM4quDmM631X+pbaWPfIbi9Yf4AsTRlFkoJIptukZ8OaU/sCHYvOW1I0AaVUM/OqeYUU9Yi6npZN9FjaxyM3y/WAzexknosyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKiV34Mp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKiV34Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750138850; x=1781674850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYRwRe8JUgyuS6aJ/MdjCf4ws7GSj9AyfmtxfMKqDSY=;
  b=ZKiV34Mpm4GhWmNGR3iIZWAwg+SW1CRGKaaDV1Fa1dqJ4gG8shs6pq7q
   6TzF67pjRJklFCERqJwBtC6VB7stKv38zGyWfhSAL4cfkrwHEmZXPlzDb
   oc0mJpeUNhzm5D1wtZO5BUXhtykOjibdP/2CH+dafq+wYJA0wM4SmV+9q
   kmCm7ngogcMjk+EydC3jYO1JETNe9k5YIktu9D5oxDaYZuD04vijZrZ+p
   XnLX3dN47GB5RSPzx0BFPTvnSVcTwOJzIg8VesdbwX7+DJvUCiliUyqC0
   o5PWg8pDm1s0BH0bBYg/xWZpNhi/wACOKJC+LuKHytComWudH+pLj3xCZ
   w==;
X-CSE-ConnectionGUID: FNdM4fxzREO+p4ocSF+AsQ==
X-CSE-MsgGUID: B/tmOw+NR8eOMxKlZJqqHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39905518"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="39905518"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 22:40:49 -0700
X-CSE-ConnectionGUID: oUlIwpwrTMaW0XC4znsAtA==
X-CSE-MsgGUID: tulPzxreS6eWaDsT4RLK2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="171901800"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2025 22:40:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRP3u-000FdD-2d;
	Tue, 17 Jun 2025 05:40:46 +0000
Date: Tue, 17 Jun 2025 13:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2402/2402] kernel/cgroup/ifs.c:92:19: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202506171339.AD6u1vHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   852df0842f6ca5e0b4808eb4b1368aed4b492917
commit: edff31302c6d1f41a3da02c92118b06a203f3248 [2402/2402] interference: Add smt interference track support
config: loongarch-randconfig-r112-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171339.AD6u1vHW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171339.AD6u1vHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171339.AD6u1vHW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/ifs.c:92:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/cgroup/ifs.c:92:19: sparse:     expected void *ptr
   kernel/cgroup/ifs.c:92:19: sparse:     got int [noderef] __percpu *
>> kernel/cgroup/ifs.c:92:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/cgroup/ifs.c:92:19: sparse:     expected void *ptr
   kernel/cgroup/ifs.c:92:19: sparse:     got int [noderef] __percpu *
>> kernel/cgroup/ifs.c:92:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/cgroup/ifs.c:92:19: sparse:     expected void *ptr
   kernel/cgroup/ifs.c:92:19: sparse:     got int [noderef] __percpu *
>> kernel/cgroup/ifs.c:92:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/cgroup/ifs.c:92:19: sparse:     expected void *ptr
   kernel/cgroup/ifs.c:92:19: sparse:     got int [noderef] __percpu *

vim +92 kernel/cgroup/ifs.c

    83	
    84	void cgroup_ifs_account_smttime(struct task_struct *prev,
    85					struct task_struct *next,
    86					struct task_struct *idle)
    87	{
    88		struct smt_info *ci, *si;
    89		u64 now, delta;
    90		int sibling;
    91	
  > 92		sibling = this_cpu_read(smt_sibling);
    93		if (sibling == -1 || prev == next)
    94			return;
    95	
    96		ci = this_cpu_ptr(&smt_info);
    97		si = per_cpu_ptr(&smt_info, sibling);
    98	
    99		now = sched_clock_cpu(smp_processor_id());
   100	
   101		/* leave noidle */
   102		if (prev != idle && next == idle) {
   103			ci->is_noidle = false;
   104			/* account interference time */
   105			if (ci->noidle_enter_time && si->is_noidle) {
   106				delta = now - ci->noidle_enter_time;
   107	
   108				ci->total_time += delta;
   109				si->total_time += delta;
   110	
   111				si->noidle_enter_time = 0;
   112				ci->noidle_enter_time = 0;
   113	
   114				account_smttime(prev);
   115			}
   116		/* enter noidle */
   117		} else if (prev == idle && next != idle) {
   118			/* if the sibling is also nonidle, there is smt interference */
   119			if (si->is_noidle) {
   120				ci->noidle_enter_time = now;
   121				si->noidle_enter_time = now;
   122			}
   123			ci->is_noidle = true;
   124		/* cgroup changed */
   125		} else if (task_ifs(prev) != task_ifs(next))
   126			account_smttime(prev);
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
