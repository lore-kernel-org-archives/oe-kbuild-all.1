Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F8354AF6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760800494; cv=none; b=BieFcuFoUP/pOZ8kERGk2L4ZHcgfPgc+sGvGC7DblB1I1ROzLloxLo2TK0qjX8n242JnSky0rbIP6pP1Xo/Qv2XtbGf+ef0nswT2ZHp8T59EsTMLXceLudJ84/wNXACiuDjbe0UZ2iEUvGoz+N1R8gHO9WkXaKMJFJSbGqQYXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760800494; c=relaxed/simple;
	bh=yh4hmj9+5elfzmapOTxbxXJis3SRVHABrslQ8bnFTc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OShw5I27WyfNaNq3UJcT1jvqYNtEqllT6jfSBDCoMSZuKabSbjvpAnF1LOq5grfmCifF4TSfbY/s4/xcPs6BpssQXX6OyE+OKg1uN156kf/BgfVJnMktWcPg1LKnPAOOSMvQRaFPLlCwRg3CVQAgswaehJ4zcWgFAi303WEuw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bId1Qgr/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bId1Qgr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760800490; x=1792336490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yh4hmj9+5elfzmapOTxbxXJis3SRVHABrslQ8bnFTc4=;
  b=bId1Qgr/PMBMjNmYRiAjaddACmBBQflNB2g8Vw/qC/MTIu1BFTQBh3cm
   8CF9nUICcF87omxmoQKCeVQnD2sR/z9yPtiaG395wAlE9mRue/juuE61e
   9uZ0ZM3UsVCGjYm3eRP0Rj3YvW2ET/JDI4c+2tURMPSFQxGeTKw0ECBNu
   ok6Nf0r/DOFsnrfhty2AM90gVKbp/rpNno/XL7ecVIPL+FC5ow0jS9f4H
   QoBsmaeIKu34fsGdWHoVpbpSAVn8ZL+65RwVEnbaVI6lmgoL1juLlgH0n
   KRjaVLiVoA8N1k3XLJNjIUgCWb4qcdr/Pffbq9NSeblxyjECZv3p84y6k
   Q==;
X-CSE-ConnectionGUID: 0NHiALmEShWIOPk+ldV7mQ==
X-CSE-MsgGUID: 81lcsU9gR4eXkmbHnKdRyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62897850"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62897850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 08:14:48 -0700
X-CSE-ConnectionGUID: UCyVU7XHTQ2KRIlUWfq4qw==
X-CSE-MsgGUID: rJTQu5K7SLi7zmjPxEhaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183458387"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2025 08:14:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA8do-0008Mc-35;
	Sat, 18 Oct 2025 15:14:44 +0000
Date: Sat, 18 Oct 2025 23:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:401:5:
 sparse: sparse: symbol 'reliable_pagecache_max_bytes_write' was not
 declared. Should it be static?
Message-ID: <202510182359.uGdUMBQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e98deea13d81cacd6479edf0de6267118ae7c639
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [1740/1740] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251018/202510182359.uGdUMBQy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182359.uGdUMBQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182359.uGdUMBQy-lkp@intel.com/

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
