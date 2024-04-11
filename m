Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B811754B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712867016; cv=none; b=EQnGcZdLZ0dTyTPYb3UJJJulymOr3Yp+Q4Kn+weK5vQwHhjzBbQK1ijeJyBH6+0voeZj84tsRNKcUrkSvNQeE5z2DE797ArSu/ZU38pWWANpBLIVhY85AjQeANN9W/CHszUddkei5RrR3RguWtZ3dGU/GG9ECZQYtt37XxRin+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712867016; c=relaxed/simple;
	bh=lG+99FMQLohF69XheHkjDJHJ8oouZGTiDY55UKixSxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2JrHhYIW3sQmilWzT/tjokGWN67YUqb61dgqjlfCtPJvmmnPKxm+6dVZACrgpQDPnKo4m0+SZo/NqUQ/i4dQXvYFiPLqjBSdiFHmEMFp/6xKD1mue4J8PNXW/MJd5pNCdlDXpu2eyzZ/4bzJUn7OwvUKsplAPaO0Qk6rMFlMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hk3v8+e7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hk3v8+e7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712867014; x=1744403014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lG+99FMQLohF69XheHkjDJHJ8oouZGTiDY55UKixSxw=;
  b=Hk3v8+e7OQ8gmXVG1WNbeD8JVyMiltwlqc+SOAOWERnrVrRSXdt6uDvy
   Ppw7jsYlCJNHCxod94nxZFL21Cpqy9NyA11bS2IcsRTsRRLFw8OV9VU4w
   5Q0jbbhCuLo7hIFqWrg6zSelsXHYuACfrreGcJrNMlxIo/GVo2OLEzVZu
   Le7VHkvfWeqyvbKr5jsmrm2axfWLDiANHzQJBJ/DqstZ49upyDJM9XqEj
   M2J4jdVQMj9r/HMtLkWqGbIs5hUduuVozUhqRfn00DJ+wpYT4OcYHHCvL
   zUAe4aEiQ8z02NkixMyg+cfaXb7XfCdCr6tCdU2IOBm2LTOVmmwpIV3bD
   Q==;
X-CSE-ConnectionGUID: sGXj7ATcTbml6m82hxONbw==
X-CSE-MsgGUID: /ZFog3+zTGKe+ymE9cB84A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8157755"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8157755"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 13:23:32 -0700
X-CSE-ConnectionGUID: bRg/8lakTUGNHaGnvEAMWQ==
X-CSE-MsgGUID: Ia0j5BrnROiOXAyv4LrHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="25661995"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2024 13:23:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv0xD-0008xZ-0g;
	Thu, 11 Apr 2024 20:23:27 +0000
Date: Fri, 12 Apr 2024 04:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2387/7374] kernel/sched/psi.c:387:1: error:
 function definition is not allowed here
Message-ID: <202404120405.QVyKazJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8f7c77eb69ee331fb66fad8eec5ca81b8843eaf3
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2387/7374] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: x86_64-randconfig-121-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120405.QVyKazJb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120405.QVyKazJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120405.QVyKazJb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:387:1: error: function definition is not allowed here
     387 | {
         | ^
   kernel/sched/psi.c:421:1: error: function definition is not allowed here
     421 | {
         | ^
   kernel/sched/psi.c:449:1: error: function definition is not allowed here
     449 | {
         | ^
   kernel/sched/psi.c:471:1: error: function definition is not allowed here
     471 | {
         | ^
   kernel/sched/psi.c:517:17: error: function definition is not allowed here
     517 |                                         bool next) {}
         |                                                    ^
   kernel/sched/psi.c:523:1: error: function definition is not allowed here
     523 | {
         | ^
   kernel/sched/psi.c:590:1: error: function definition is not allowed here
     590 | {
         | ^
   kernel/sched/psi.c:608:1: error: function definition is not allowed here
     608 | {
         | ^
   kernel/sched/psi.c:635:1: error: function definition is not allowed here
     635 | {
         | ^
   kernel/sched/psi.c:707:1: error: function definition is not allowed here
     707 | {
         | ^
   kernel/sched/psi.c:772:1: error: function definition is not allowed here
     772 | {
         | ^
   kernel/sched/psi.c:808:1: error: function definition is not allowed here
     808 | {
         | ^
   kernel/sched/psi.c:822:1: error: function definition is not allowed here
     822 | {
         | ^
   kernel/sched/psi.c:848:1: error: function definition is not allowed here
     848 | {
         | ^
   kernel/sched/psi.c:932:1: error: function definition is not allowed here
     932 | {
         | ^
   kernel/sched/psi.c:950:1: error: function definition is not allowed here
     950 | {
         | ^
   kernel/sched/psi.c:958:1: error: function definition is not allowed here
     958 | {
         | ^
   kernel/sched/psi.c:993:1: error: function definition is not allowed here
     993 | {
         | ^
   kernel/sched/psi.c:1107:1: error: function definition is not allowed here
    1107 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +387 kernel/sched/psi.c

a65983d90bfb5e0 Lu Jialin 2024-01-04  383  
a65983d90bfb5e0 Lu Jialin 2024-01-04  384  static bool test_fine_grained_stat(unsigned int *stat_tasks,
a65983d90bfb5e0 Lu Jialin 2024-01-04  385  				   unsigned int nr_running,
a65983d90bfb5e0 Lu Jialin 2024-01-04  386  				   enum psi_stat_states state)
a65983d90bfb5e0 Lu Jialin 2024-01-04 @387  {
a65983d90bfb5e0 Lu Jialin 2024-01-04  388  	switch (state) {
a65983d90bfb5e0 Lu Jialin 2024-01-04  389  	case PSI_MEMCG_RECLAIM_SOME:
a65983d90bfb5e0 Lu Jialin 2024-01-04  390  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM]);
a65983d90bfb5e0 Lu Jialin 2024-01-04  391  	case PSI_MEMCG_RECLAIM_FULL:
a65983d90bfb5e0 Lu Jialin 2024-01-04  392  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM] &&
a65983d90bfb5e0 Lu Jialin 2024-01-04  393  		       nr_running == stat_tasks[NR_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  394  	case PSI_GLOBAL_RECLAIM_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  395  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM]);
25d00f6853c3c6c Lu Jialin 2024-01-04  396  	case PSI_GLOBAL_RECLAIM_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  397  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  398  		       nr_running == stat_tasks[NR_GLOBAL_RECLAIM_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  399  	case PSI_COMPACT_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  400  		return unlikely(stat_tasks[NR_COMPACT]);
25d00f6853c3c6c Lu Jialin 2024-01-04  401  	case PSI_COMPACT_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  402  		return unlikely(stat_tasks[NR_COMPACT] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  403  		       nr_running == stat_tasks[NR_COMPACT_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  404  	case PSI_ASYNC_MEMCG_RECLAIM_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  405  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM]);
25d00f6853c3c6c Lu Jialin 2024-01-04  406  	case PSI_ASYNC_MEMCG_RECLAIM_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  407  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  408  		      nr_running == stat_tasks[NR_ASYNC_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  409  	case PSI_SWAP_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  410  		return unlikely(stat_tasks[NR_SWAP]);
25d00f6853c3c6c Lu Jialin 2024-01-04  411  	case PSI_SWAP_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  412  		return unlikely(stat_tasks[NR_SWAP] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  413  		       nr_running == stat_tasks[NR_SWAP_RUNNING]);
a65983d90bfb5e0 Lu Jialin 2024-01-04  414  	default:
a65983d90bfb5e0 Lu Jialin 2024-01-04  415  		return false;
a65983d90bfb5e0 Lu Jialin 2024-01-04  416  	}
a65983d90bfb5e0 Lu Jialin 2024-01-04  417  }
a65983d90bfb5e0 Lu Jialin 2024-01-04  418  

:::::: The code at line 387 was first introduced by commit
:::::: a65983d90bfb5e031444fea492b32f931c83ffcf sched/psi: Introduce fine grained stall time collect for cgroup reclaim

:::::: TO: Lu Jialin <lujialin4@huawei.com>
:::::: CC: yanhaitao <yanhaitao2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
