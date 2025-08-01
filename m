Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60D1E990E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754029655; cv=none; b=qQoOQeBo68NFwnO/HsEjk0LM8Ne+lGPj9FpIRMlX0MuSfOl2k78uyHA1j9tA5Y7QXH2uPwJLvGA6wanERKncwUf2CqEkJq3WWmN8AW/tXhkBAtePi497sUFrOhWSzUntJU8BfDoKsdU/o3QuvErWbJKJBGKtr/B7RHe301Lc0Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754029655; c=relaxed/simple;
	bh=MI1AsEYHSlbVWY0+p5/TPeJfUNFveVRpeflzxnTvLWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IC8Irtzu4LvMuaf68p9o/8Llqs3COug+/OglOKUnRbybD71GxRrGIvbbPmSdTwZkQ7SX+xZK/RLXIxxbcgXQOWPk+BJ9FRDsR1obJVS03s2kPGcLC7aZzusSO6/aDacuwLU+xg31zsQm3jVkEmxzIBmym6gIAk/17XzqbDTPGB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqCY/hrI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqCY/hrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754029654; x=1785565654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MI1AsEYHSlbVWY0+p5/TPeJfUNFveVRpeflzxnTvLWk=;
  b=TqCY/hrIY69x3LfHYEpYW3KwOuNbYmSHdcGDJoL4hDafjREwTsfb1vOM
   Lrq1v19fV9Sr2uCzk58xv/T21s8cfRhrB14ok0kBW6VGRsVoZPetcSUUb
   NIPJe99dBhnsrEMxR+h8ag3I+iTSe3CDFho/l4Cl3LeLN6CM24lnOvmPQ
   sINuLevjGE/jk/ydb1r3Jvkl98Va0UizQTBgaMPtrkNxh936L1S6cMAEh
   dh/3En8Ox1epNHM7TvCET6uAE6UUwqTUmVXqXpZ01x+ZWt5cP0gn4dsob
   SDfIN2MibycWy2QREcClixeM6J/KHV5xjFhGWQ/1sLpWIs9n2zTq5IUAs
   g==;
X-CSE-ConnectionGUID: ri0BdvYqQHqCrWp2l0wkkA==
X-CSE-MsgGUID: 4LlB71E2Q2Wl0Boji+pYew==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="78915900"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="78915900"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 23:27:33 -0700
X-CSE-ConnectionGUID: S52PwXkzSd61t3mswaQo9A==
X-CSE-MsgGUID: t5FEAU3RQMKtQagidzH8Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="168869385"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2025 23:27:32 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhjEm-0004Oe-3D;
	Fri, 01 Aug 2025 06:27:29 +0000
Date: Fri, 1 Aug 2025 14:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:401:5:
 sparse: sparse: symbol 'reliable_pagecache_max_bytes_write' was not
 declared. Should it be static?
Message-ID: <202508011420.p4KE9Bax-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   50f79538c3031890b9ca9755ccf596a73ecb0a0a
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [1740/1740] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250801/202508011420.p4KE9Bax-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508011420.p4KE9Bax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011420.p4KE9Bax-lkp@intel.com/

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
