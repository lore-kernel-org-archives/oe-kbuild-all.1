Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D331864
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nICLY+zn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703908030; x=1735444030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XjNrJSnEa1ZL79wF8R+4dAxgRWOf6jHImuCkkd2UEo=;
  b=nICLY+zngHCrjjRRPVmwlS4LFn0zjvckfPtzyKePXtUuhxhpdTGmvHRi
   0UDVDNdDur9Yz4ACB1uEF5SWKFaFMm/+39Eg405RkO2obdE0/8bEcbZvM
   gRQi1fJjxfet3fbyzhBl+614mMIat8pP70nYaf8cz8EAeATXfH6V8K3/T
   ELp/HY1qBLH6vgFA/KG+28LTPOIQLCfxHmp8rBmwPiJlQYHNGb2k/PONB
   xsPte9Npwow73p2arI1TVVeVnAm8wP1QeW6Yftjl5yCec6aR77kRTIcmi
   pZXNofZZWpE4bgoVey/y1YGoL2RDk5OGD6k8aaD2qE56btnohKDdWUxAJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="10283369"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="10283369"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 19:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="21017325"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Dec 2023 19:47:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJQJV-000I1l-2b;
	Sat, 30 Dec 2023 03:47:05 +0000
Date: Sat, 30 Dec 2023 11:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: yongduan <yongduan@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Jiang Biao <benbjiang@tencent.com>
Subject: kernel/smp.c:179:12: warning: suggest explicit braces to avoid
 ambiguous 'else'
Message-ID: <202312301105.WG2MPikp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 505452dd073c1a8f6faa0bda630a39b375055edc smp: introduce a new interface smp_call_function_many_async
date:   2 years, 9 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20231230/202312301105.WG2MPikp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312301105.WG2MPikp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312301105.WG2MPikp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/smp.c: In function 'generic_exec_single':
>> kernel/smp.c:179:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     179 |         if (llist_add(&csd->llist, &per_cpu(call_single_queue, cpu)))
         |            ^


vim +/else +179 kernel/smp.c

^590eaf1fec755 Kaixu Xia 2021-03-16  136  
^590eaf1fec755 Kaixu Xia 2021-03-16  137  /*
^590eaf1fec755 Kaixu Xia 2021-03-16  138   * Insert a previously allocated call_single_data_t element
^590eaf1fec755 Kaixu Xia 2021-03-16  139   * for execution on the given CPU. data must already have
^590eaf1fec755 Kaixu Xia 2021-03-16  140   * ->func, ->info, and ->flags set.
^590eaf1fec755 Kaixu Xia 2021-03-16  141   */
^590eaf1fec755 Kaixu Xia 2021-03-16  142  static int generic_exec_single(int cpu, call_single_data_t *csd,
505452dd073c1a yongduan  2021-03-18  143  			       smp_call_func_t func, void *info, struct cpumask *mask)
^590eaf1fec755 Kaixu Xia 2021-03-16  144  {
^590eaf1fec755 Kaixu Xia 2021-03-16  145  	if (cpu == smp_processor_id()) {
^590eaf1fec755 Kaixu Xia 2021-03-16  146  		unsigned long flags;
^590eaf1fec755 Kaixu Xia 2021-03-16  147  
^590eaf1fec755 Kaixu Xia 2021-03-16  148  		/*
^590eaf1fec755 Kaixu Xia 2021-03-16  149  		 * We can unlock early even for the synchronous on-stack case,
^590eaf1fec755 Kaixu Xia 2021-03-16  150  		 * since we're doing this from the same CPU..
^590eaf1fec755 Kaixu Xia 2021-03-16  151  		 */
^590eaf1fec755 Kaixu Xia 2021-03-16  152  		csd_unlock(csd);
^590eaf1fec755 Kaixu Xia 2021-03-16  153  		local_irq_save(flags);
^590eaf1fec755 Kaixu Xia 2021-03-16  154  		func(info);
^590eaf1fec755 Kaixu Xia 2021-03-16  155  		local_irq_restore(flags);
^590eaf1fec755 Kaixu Xia 2021-03-16  156  		return 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  157  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  158  
^590eaf1fec755 Kaixu Xia 2021-03-16  159  
^590eaf1fec755 Kaixu Xia 2021-03-16  160  	if ((unsigned)cpu >= nr_cpu_ids || !cpu_online(cpu)) {
^590eaf1fec755 Kaixu Xia 2021-03-16  161  		csd_unlock(csd);
^590eaf1fec755 Kaixu Xia 2021-03-16  162  		return -ENXIO;
^590eaf1fec755 Kaixu Xia 2021-03-16  163  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  164  
^590eaf1fec755 Kaixu Xia 2021-03-16  165  	csd->func = func;
^590eaf1fec755 Kaixu Xia 2021-03-16  166  	csd->info = info;
^590eaf1fec755 Kaixu Xia 2021-03-16  167  
^590eaf1fec755 Kaixu Xia 2021-03-16  168  	/*
^590eaf1fec755 Kaixu Xia 2021-03-16  169  	 * The list addition should be visible before sending the IPI
^590eaf1fec755 Kaixu Xia 2021-03-16  170  	 * handler locks the list to pull the entry off it because of
^590eaf1fec755 Kaixu Xia 2021-03-16  171  	 * normal cache coherency rules implied by spinlocks.
^590eaf1fec755 Kaixu Xia 2021-03-16  172  	 *
^590eaf1fec755 Kaixu Xia 2021-03-16  173  	 * If IPIs can go out of order to the cache coherency protocol
^590eaf1fec755 Kaixu Xia 2021-03-16  174  	 * in an architecture, sufficient synchronisation should be added
^590eaf1fec755 Kaixu Xia 2021-03-16  175  	 * to arch code to make it appear to obey cache coherency WRT
^590eaf1fec755 Kaixu Xia 2021-03-16  176  	 * locking and barrier primitives. Generic code isn't really
^590eaf1fec755 Kaixu Xia 2021-03-16  177  	 * equipped to do the right thing...
^590eaf1fec755 Kaixu Xia 2021-03-16  178  	 */
^590eaf1fec755 Kaixu Xia 2021-03-16 @179  	if (llist_add(&csd->llist, &per_cpu(call_single_queue, cpu)))
505452dd073c1a yongduan  2021-03-18  180  		if (!mask) arch_send_call_function_single_ipi(cpu);
505452dd073c1a yongduan  2021-03-18  181  		else __cpumask_set_cpu(cpu, mask);
^590eaf1fec755 Kaixu Xia 2021-03-16  182  
^590eaf1fec755 Kaixu Xia 2021-03-16  183  	return 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  184  }
^590eaf1fec755 Kaixu Xia 2021-03-16  185  

:::::: The code at line 179 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
