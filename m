Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9D71E526
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115727; cv=none; b=lwC8QX7DbMVII8AWxEfl8do4rSVPkD1F+SawyKlHf/JJoTCdBx2EFSkJ7xIQhJHONIS4CKmNRnfV3NJex+Lih0IkqKDLNzp3JRRqIX22qHhS4Sp1FKGg4AggWV0lypE1I7g8Kv6fRr+adg6rMaG8u9LD1aL7skPMMh6dJPaXsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115727; c=relaxed/simple;
	bh=aha61taFB/jn3LojHvj+zb2FAmUx6nc5NCCO+YMjibs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KK2EvU928xLWOW6QXxhV8bT//z1Xozm48zn99DraSIUFbGsmgKhHSNXZ51jctkeYyOwSuk8wNCECLrDrJcVRGTpAMqO+oRsOP6OrqoCC7wvZilTjQyHq4z2kYnr7OdXBLvobPJoenuKSEtgAEHRaVEU+CIzXgHXgYpOjqK/5qEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYJ4yOoa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYJ4yOoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739115725; x=1770651725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aha61taFB/jn3LojHvj+zb2FAmUx6nc5NCCO+YMjibs=;
  b=UYJ4yOoaNFPqAfEeMcEl9pNFDNCAA7ra5l/ACVB9VkBJF+ToulaECXcg
   wRmsz1DdbAK+TcZ5icB9lU2qvzmH/jrUy4qhh6U9u2Ia/IJeQll+tiUek
   TflV0ec+0rFlnk1vCdA2lswX/XPP4iMAwfj0KyuZ4oI4bFVyZCOpEMUe5
   pw+SWlOSCf4tOkaegraQHSDLqPT4EY/Q+RL104niQ1nsVm8iCITsBUM+8
   YezeJXSF7/PNEYdo1vOnSoqcnl8UnFEQggAoG2MdiGv/j7s1CHatdFw4w
   Ie2feBRjpX1QQdjembfr1faxTRN3lWUkMAbQEglFY81dBnNSJwrbKad9r
   g==;
X-CSE-ConnectionGUID: VssJ3d8uStmkuDdHQbfg+w==
X-CSE-MsgGUID: dCOgPjJYTZWBqUFQ/26RVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39724230"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39724230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 07:42:04 -0800
X-CSE-ConnectionGUID: 81n6WismRpuqsLZO4mlkeA==
X-CSE-MsgGUID: vZvu9FspQQaypuXfa8ZwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111806264"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2025 07:42:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th9RY-0011cR-0q;
	Sun, 09 Feb 2025 15:42:00 +0000
Date: Sun, 9 Feb 2025 23:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420] mm/mem_reliable.c:401:5:
 sparse: sparse: symbol 'reliable_pagecache_max_bytes_write' was not
 declared. Should it be static?
Message-ID: <202502092339.Fe6S9ctM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [1420/1420] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502092339.Fe6S9ctM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502092339.Fe6S9ctM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502092339.Fe6S9ctM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:39:1: sparse: sparse: symbol '__pcpu_scope_pagecache_reliable_pages' was not declared. Should it be static?
   mm/mem_reliable.c:67:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:250:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:323:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:356:5: sparse: sparse: symbol 'reliable_reserve_size_handler' was not declared. Should it be static?
   mm/mem_reliable.c:380:5: sparse: sparse: symbol 'reliable_shmem_bytes_limit_handler' was not declared. Should it be static?
>> mm/mem_reliable.c:401:5: sparse: sparse: symbol 'reliable_pagecache_max_bytes_write' was not declared. Should it be static?
>> mm/mem_reliable.c:487:14: sparse: sparse: invalid assignment: |=
   mm/mem_reliable.c:487:14: sparse:    left side has type restricted gfp_t
   mm/mem_reliable.c:487:14: sparse:    right side has type unsigned int
   mm/mem_reliable.c:491:14: sparse: sparse: invalid assignment: &=
   mm/mem_reliable.c:491:14: sparse:    left side has type restricted gfp_t
   mm/mem_reliable.c:491:14: sparse:    right side has type unsigned int
   mm/mem_reliable.c:250:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     250 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:323:5: warning: no previous prototype for 'reliable_debug_handler' [-Wmissing-prototypes]
     323 | int reliable_debug_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:356:5: warning: no previous prototype for 'reliable_reserve_size_handler' [-Wmissing-prototypes]
     356 | int reliable_reserve_size_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:380:5: warning: no previous prototype for 'reliable_shmem_bytes_limit_handler' [-Wmissing-prototypes]
     380 | int reliable_shmem_bytes_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:401:5: warning: no previous prototype for 'reliable_pagecache_max_bytes_write' [-Wmissing-prototypes]
     401 | int reliable_pagecache_max_bytes_write(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_pagecache_max_bytes_write +401 mm/mem_reliable.c

   400	
 > 401	int reliable_pagecache_max_bytes_write(struct ctl_table *table, int write,
   402		void __user *buffer, size_t *length, loff_t *ppos)
   403	{
   404		unsigned long old_value = reliable_pagecache_max_bytes;
   405		int ret;
   406	
   407		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   408		if (!ret && write) {
   409			if (reliable_pagecache_max_bytes > total_reliable_mem_sz()) {
   410				reliable_pagecache_max_bytes = old_value;
   411				return -EINVAL;
   412			}
   413		}
   414	
   415		return ret;
   416	}
   417	
   418	static struct ctl_table reliable_ctl_table[] = {
   419		{
   420			.procname = "task_reliable_limit",
   421			.data = &task_reliable_limit,
   422			.maxlen = sizeof(task_reliable_limit),
   423			.mode = 0644,
   424			.proc_handler = reliable_limit_handler,
   425		},
   426		{
   427			.procname = "reliable_debug",
   428			.data = &mem_reliable_ctrl_bits,
   429			.maxlen = sizeof(mem_reliable_ctrl_bits),
   430			.mode = 0600,
   431			.proc_handler = reliable_debug_handler,
   432		},
   433		{
   434			.procname = "reliable_reserve_size",
   435			.data = &sysctl_reliable_reserve_size,
   436			.maxlen = sizeof(sysctl_reliable_reserve_size),
   437			.mode = 0644,
   438			.proc_handler = reliable_reserve_size_handler,
   439		},
   440	#ifdef CONFIG_SHMEM
   441		{
   442			.procname = "shmem_reliable_bytes_limit",
   443			.data = &sysctl_shmem_reliable_bytes_limit,
   444			.maxlen = sizeof(sysctl_shmem_reliable_bytes_limit),
   445			.mode = 0644,
   446			.proc_handler = reliable_shmem_bytes_limit_handler,
   447		},
   448	#endif
   449		{
   450			.procname = "reliable_pagecache_max_bytes",
   451			.data = &reliable_pagecache_max_bytes,
   452			.maxlen = sizeof(reliable_pagecache_max_bytes),
   453			.mode = 0644,
   454			.proc_handler = reliable_pagecache_max_bytes_write,
   455			.extra1 = &zero,
   456		},
   457		{}
   458	};
   459	
   460	static struct ctl_table reliable_dir_table[] = {
   461		{
   462			.procname = "vm",
   463			.maxlen = 0,
   464			.mode = 0555,
   465			.child = reliable_ctl_table,
   466		},
   467		{}
   468	};
   469	
   470	void page_cache_prepare_alloc(gfp_t *gfp)
   471	{
   472		long nr_reliable = 0;
   473		int cpu;
   474	
   475		if (!mem_reliable_is_enabled())
   476			return;
   477	
   478		for_each_possible_cpu(cpu)
   479			nr_reliable += this_cpu_read(pagecache_reliable_pages);
   480	
   481		if (nr_reliable < 0)
   482			goto no_reliable;
   483	
   484		if (nr_reliable > reliable_pagecache_max_bytes >> PAGE_SHIFT)
   485			goto no_reliable;
   486	
 > 487		*gfp |= ___GFP_RELIABILITY;
   488		return;
   489	
   490	no_reliable:
   491		*gfp &= ~___GFP_RELIABILITY;
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
