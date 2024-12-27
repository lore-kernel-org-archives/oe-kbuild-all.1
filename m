Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A872572
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 01:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735261733; cv=none; b=mo6Mch48ixJcJ5ixcoqe2i4/6huRv/7d2nsykUCTg3z9to0HxE0Av0QwLVQql79mw350ZDNy07IK2NDGglYoGk7Vdw67DTVTiixwDbrA4jiPkoOga5AxJGP5UjqG7O4o9OuQgGQPOJO7k9fJh3lAG13dsmONZ29NngtacKhvJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735261733; c=relaxed/simple;
	bh=NQk9UujUiIPsfLcDjj5RAw3vUBhTl6duDlK5k1lPSSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOQKxwIEsRtFrX1sNOhB1gMff7lV85BdCjx3bPPLl3h2ztJg/sXVXG8JUnbV1DoOkGstCvDnUOJGbXcYIAKhG0gkapX6aTleQwA3Ut42YOlBhtpgkUXhbyc00mmBK1E59aNUwC5vfKndWkcj9z4GzjM7aD0r9y5hd2UucgnrgQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBk4uxbi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBk4uxbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735261731; x=1766797731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQk9UujUiIPsfLcDjj5RAw3vUBhTl6duDlK5k1lPSSk=;
  b=DBk4uxbilk6TUgNr+oi2S5BlgFVoE+IjJrwzcYFMptSr75qQeqw08F0o
   gBoWcqBBN4fg5w5tsfLEBCDnWp+3vktpGoGjMAHsEOAZFsUy8kxUuLIGO
   2vxWH+SwyWyr3JQ/3aZPXihEC+84ZqWJ7yABpcF/XFCjnE9+V1vrJmPhK
   MacvpWxEzUJq/DVF//BaKfpAcYX2xYwvLtK++8+gMT+lMDro6tCIRNI4i
   90Ow6KgPtD/7ojOrpAOfJCrLYDgx4Q7G24lk4VDF9DtxRM37fvFmTekzJ
   PsUz9ynV9fkrw+TmTU67xDZdSpkt0tFKkRnvMBxgtw0mgbVmbXgQt7qLi
   g==;
X-CSE-ConnectionGUID: fTvKxgvpSGmA9kV45f6Z8w==
X-CSE-MsgGUID: gEDYHsCvQbCQLSYuxQaQGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="47048466"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="47048466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 17:08:50 -0800
X-CSE-ConnectionGUID: UeR0SqZiQQq7P3aV8zHmJg==
X-CSE-MsgGUID: j4PMOPTFT6Kn2uznWAaJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="100552824"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Dec 2024 17:08:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQyqN-0002tE-1E;
	Fri, 27 Dec 2024 01:08:47 +0000
Date: Fri, 27 Dec 2024 09:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667] mm/page_cache_limit.c:103:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202412270823.5Ug5pZtv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [1667/1667] mm: support pagecache limit
config: loongarch-randconfig-r121-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270823.5Ug5pZtv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412270823.5Ug5pZtv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270823.5Ug5pZtv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_cache_limit.c:61:5: sparse: sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be static?
   mm/page_cache_limit.c:77:5: sparse: sparse: symbol 'cache_reclaim_sysctl_handler' was not declared. Should it be static?
>> mm/page_cache_limit.c:103:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/page_cache_limit.c:103:52: sparse:     expected void *
   mm/page_cache_limit.c:103:52: sparse:     got void [noderef] __user *buffer
>> mm/page_cache_limit.c:94:5: sparse: sparse: symbol 'cache_limit_mbytes_sysctl_handler' was not declared. Should it be static?
>> mm/page_cache_limit.c:187:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/page_cache_limit.c:187:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/page_cache_limit.c:187:35: sparse:     got int ( * )( ... )

vim +103 mm/page_cache_limit.c

    93	
  > 94	int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
    95			void __user *buffer, size_t *length, loff_t *ppos)
    96	{
    97		int ret;
    98		unsigned long vm_cache_limit_mbytes_max;
    99		unsigned long origin_mbytes = vm_cache_limit_mbytes;
   100		int nr_retries = MAX_RECLAIM_RETRIES;
   101	
   102		vm_cache_limit_mbytes_max = totalram_pages() >> (20 - PAGE_SHIFT);
 > 103		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   104		if (ret || !write)
   105			return ret;
   106	
   107		if (vm_cache_limit_mbytes > vm_cache_limit_mbytes_max) {
   108			vm_cache_limit_mbytes = origin_mbytes;
   109			return -EINVAL;
   110		}
   111	
   112		if (write) {
   113			while (should_reclaim_page_cache() && page_cache_over_limit() &&
   114					nr_retries--) {
   115				if (signal_pending(current))
   116					return -EINTR;
   117	
   118				shrink_memory(node_reclaim_num(), false);
   119			}
   120		}
   121	
   122		return 0;
   123	}
   124	
   125	static void shrink_shepherd(struct work_struct *w)
   126	{
   127		int node;
   128	
   129		if (!should_periodical_reclaim())
   130			return;
   131	
   132		for_each_online_node(node) {
   133			if (!work_pending(&vmscan_works[node]))
   134				queue_work_node(node, system_unbound_wq, &vmscan_works[node]);
   135		}
   136	
   137		queue_delayed_work(system_unbound_wq, &shepherd,
   138			round_jiffies_relative((unsigned long)vm_cache_reclaim_s * HZ));
   139	}
   140	
   141	static void shrink_page_work(struct work_struct *w)
   142	{
   143		shrink_memory(node_reclaim_num(), true);
   144	}
   145	
   146	static void shrink_shepherd_timer(void)
   147	{
   148		int i;
   149	
   150		for (i = 0; i < MAX_NUMNODES; i++)
   151			INIT_WORK(&vmscan_works[i], shrink_page_work);
   152	}
   153	
   154	static struct ctl_table page_cache_limit_table[] = {
   155		{
   156			.procname	= "cache_reclaim_s",
   157			.data		= &vm_cache_reclaim_s,
   158			.maxlen		= sizeof(vm_cache_reclaim_s),
   159			.mode		= 0644,
   160			.proc_handler	= cache_reclaim_sysctl_handler,
   161			.extra1		= SYSCTL_ZERO,
   162			.extra2		= &vm_cache_reclaim_s_max,
   163		},
   164		{
   165			.procname	= "cache_reclaim_weight",
   166			.data		= &vm_cache_reclaim_weight,
   167			.maxlen		= sizeof(vm_cache_reclaim_weight),
   168			.mode		= 0644,
   169			.proc_handler	= proc_dointvec_minmax,
   170			.extra1		= SYSCTL_ONE,
   171			.extra2		= &vm_cache_reclaim_weight_max,
   172		},
   173		{
   174			.procname	= "cache_reclaim_enable",
   175			.data		= &vm_cache_reclaim_enable,
   176			.maxlen		= sizeof(vm_cache_reclaim_enable),
   177			.mode		= 0644,
   178			.proc_handler	= cache_reclaim_enable_handler,
   179			.extra1		= SYSCTL_ZERO,
   180			.extra2		= SYSCTL_ONE,
   181		},
   182		{
   183			.procname	= "cache_limit_mbytes",
   184			.data		= &vm_cache_limit_mbytes,
   185			.maxlen		= sizeof(vm_cache_limit_mbytes),
   186			.mode		= 0644,
 > 187			.proc_handler	= cache_limit_mbytes_sysctl_handler,
   188		},
   189	};
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
