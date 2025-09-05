Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED92296BC4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066347; cv=none; b=FPRpeVsHPaMEZ1bri8BiUW7EwMil2BNdhJN87fnj0RBDLEu1aPy6SXbtmWyN5DbqHUkI5CAs+M9Xw8IwgFjFR8jZOtMjAZwPMRz5vdj62WX3V+anr1/ae41PkDNOa5imLSIPV1VeRta/zQ6paLzvZb2mPLhnEZaeUyhSptPj0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066347; c=relaxed/simple;
	bh=h2azeLnI4IxeSOdlncGKp/6vj1tk1JVVzJeuvs3kuMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhpxQFqhp058hQnZp8UogH2f5bvCGODHVmFdsPDOnNrIoXTd54132ZDRHIKZp97ThQzXFL/+K8vBaUreZMyW1rklWxZYvUscpg5+Jo7LksCrdKPu3KS0xBMPLJmdRdkH0LiKuiTrHTuhIGuNyVaFSNNQfXKGn8+v10kF/0N61Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZARSrmV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZARSrmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757066345; x=1788602345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2azeLnI4IxeSOdlncGKp/6vj1tk1JVVzJeuvs3kuMo=;
  b=eZARSrmVkllVYYWfso8UyWYQdHso+/9toW4gVIesElFVPMi5Jt7oSdbt
   hlUiSvlb5j2zLoaQWB0kUAW7gw4cXVKXTfFEHlRbudPOlbnQxwITUZWFa
   wO598A4r5sU0sjyWlE61xG+MF9SXzHQGNMDsQYMDRPurSjh19DQZnl0bG
   +URVUo/y5ytw+7WZUhoOH5jNI98sgsAhO747l3hHiqZBDQkm8EBjYwGcf
   5xf8FOjNjHh724gBOtkzEZfBXTboQqSzR/OzOMajrY+Q4Ozf3DKmMUuhg
   7SC9cLEXQjNb9hVLGwKmEQRDv8ix7hulfwhxKfo8boC6kiBbd4cN9DrQ5
   Q==;
X-CSE-ConnectionGUID: 9kPFKaTeTNa9hV5ptOAo5g==
X-CSE-MsgGUID: +rzZPd6lSrCoJY8Q+iqI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="77023423"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="77023423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 02:59:01 -0700
X-CSE-ConnectionGUID: +oq96yugSIaZah4SuzQIXA==
X-CSE-MsgGUID: ZpWbrpqXS/yWd4qElFyZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="209306056"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Sep 2025 02:59:00 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuTDc-0000Ht-0a;
	Fri, 05 Sep 2025 09:58:56 +0000
Date: Fri, 5 Sep 2025 17:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:401:5:
 sparse: sparse: symbol 'reliable_pagecache_max_bytes_write' was not
 declared. Should it be static?
Message-ID: <202509051719.RKG4X8Zq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1668dbce6652e9dda648454d3f23d43f913bc9b4
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [1740/1740] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250905/202509051719.RKG4X8Zq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250905/202509051719.RKG4X8Zq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051719.RKG4X8Zq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:39:1: sparse: sparse: symbol 'pagecache_reliable_pages' was not declared. Should it be static?
   mm/mem_reliable.c:67:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:250:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:323:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:356:5: sparse: sparse: symbol 'reliable_reserve_size_handler' was not declared. Should it be static?
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
