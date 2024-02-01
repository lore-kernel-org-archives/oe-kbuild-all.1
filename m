Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D5F4A2E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706750086; cv=none; b=jWJwAbMjY7DinFcgfo51sHw2UCwvyhFwUOQpz+ak2QdhkS5ESm2DmbQPcBwZABDCYgJQnVqUkbwzLhpvLCJ34fp7yrDTlsrIvg5TIPsHsFOCguHNRmhidiA6wrYf3UNtRYHTh+45RSg3fDQdi/jkgJotHaSCUw1hpvoxE+3Xr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706750086; c=relaxed/simple;
	bh=DvtCAqvYD7jtGBAvSuWPJc7CeLK74Zf+WcX3TYIYb68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6f3KPRyfbjSRJgqWxwX1F88k/CAbBDyb1IC6VW9ez0AB5Y4MLB2L3G+CmJFypHrhXDttP86wwNK4nXlvriixJlK3QWpmjOFYWbcmzeLB6KiOehF5R/UoyCBht2TVIf5eqJGCEOxqZumd2H5ybcw+LKbU9+KUKaEBLCOFU/lWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NytyICwO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NytyICwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706750084; x=1738286084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvtCAqvYD7jtGBAvSuWPJc7CeLK74Zf+WcX3TYIYb68=;
  b=NytyICwOgMBJZzjzeHbjVTiyzA5ddHoMEyfvbmeJ66NINtmu5s35XDxD
   TOuNQY7/tSPV3MpICCK9Q2FNXQSV70g4RnB+OY83eCwrOdooe4ngKrnwo
   YplYz0Bnwl5M19UOiJ66HJumAaf0gUDe7/CBeK93pVJAiVURDL6RvGR/q
   J6kQPPqul1Tkd/MtEZ1q8RMvA9+RToZDxmazwsMDKjNMXKbZoIqVzZgBQ
   wroCG+4Z3tNt/Zqu7IF9x2HLSepHWYKDdgK50cjoqBY1vf78uFMp3ybj7
   FYSWmbuvwiT9bQg1mnIwffYsTrac7Klbue9nWNJuMTF74w2NzcddP70ac
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2714815"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="2714815"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 17:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961771676"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="961771676"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2024 17:14:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVLf1-0002Dk-2G;
	Thu, 01 Feb 2024 01:14:35 +0000
Date: Thu, 1 Feb 2024 09:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29931/30000] kernel/sched/topology.c:1749:2:
 error: implicit declaration of function 'register_sysctl_init'
Message-ID: <202402010822.4gexaFuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   260c7a5874066269671cc826d6c9ccd70dd001e5
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [29931/30000] sched: Add cluster scheduler level for x86
config: x86_64-buildonly-randconfig-006-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010822.4gexaFuQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010822.4gexaFuQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010822.4gexaFuQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:1838:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1838 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c:718:6: warning: variable 'numa_distance' set but not used [-Wunused-but-set-variable]
     718 |         int numa_distance = 0;
         |             ^
>> kernel/sched/topology.c:1749:2: error: implicit declaration of function 'register_sysctl_init' [-Werror,-Wimplicit-function-declaration]
    1749 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^
   2 warnings and 1 error generated.


vim +/register_sysctl_init +1749 kernel/sched/topology.c

8ce3e706b31409 Tim Chen 2021-12-03  1746  
8ce3e706b31409 Tim Chen 2021-12-03  1747  static int __init sched_cluster_sysctl_init(void)
8ce3e706b31409 Tim Chen 2021-12-03  1748  {
8ce3e706b31409 Tim Chen 2021-12-03 @1749  	register_sysctl_init("kernel", sched_cluster_sysctls);
8ce3e706b31409 Tim Chen 2021-12-03  1750  	return 0;
8ce3e706b31409 Tim Chen 2021-12-03  1751  }
8ce3e706b31409 Tim Chen 2021-12-03  1752  late_initcall(sched_cluster_sysctl_init);
9e68cc2bf535a2 Tim Chen 2021-12-03  1753  

:::::: The code at line 1749 was first introduced by commit
:::::: 8ce3e706b31409147f035c037055caa68e450ce5 scheduler: Add runtime knob sysctl_sched_cluster

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Jie Liu <liujie375@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
