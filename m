Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391FF23B605
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 06:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966281; cv=none; b=mo1Dm/fp2TSAbbL4sUj0VA/nDCa37Te5y+U/vJS7LwhWZKqIzYpBGUCYk/ualaKKz+gaPL5IBEYr7RTpqR5rHrGRDiaToSgAJC1HWtOGI2hwsFtTtUAPgn3HPhwZlzbuJ644N0dT+dxlUiC/xkeQzi3O9vA7SzfvFaGW3Td0Zp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966281; c=relaxed/simple;
	bh=7AqzS5YSjWL+1qHpHHzlHyhboSWQw9/u4WBTkGQsGDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQTx49YjDuu3OqSI0OERwOM1/bncZyjinJx6jIN181EGxciaANUTF4mBu8jqAGuKEC9ytIpCcywye+4i/Y/8HKIeZx51vL9Ug5YkLpXqouDKFgeqNuh7e94GFJGB1AkTzRKx6wzSBQq9e8HA5S9XErqkkvrbTY1w8Injo8kgMLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrhJwDjl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrhJwDjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756966280; x=1788502280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7AqzS5YSjWL+1qHpHHzlHyhboSWQw9/u4WBTkGQsGDE=;
  b=hrhJwDjllX4KZ679/PMRxC2nS9FfQDQGOdBcxfyh/J7NJdLFe6cJ7zMf
   SjB6Nsx1Is3eYCW08jtOY7QDkySDHZ3qJS+t3SNDhtZYI0Aytq21iE9VC
   0zHLwz5vU43JfKkL8WTXsokqUTzs3xd0VQsOoTKodwDYkT9Sso0mx4qGw
   zNu3ODwxiiOnpp/UleTyaLzrFMR29Gj9O2AMBwCujRsxN+MNvg71ff7+v
   OIYBiN3vA1yebBfe61oAbmthz67KE79SFDkJOC36CT/a3BaaNVdDASUtj
   gBqtH4P6IsR7eYzWEj5pUsTxH33mElAgeDaU52ovBvhntlr+suWq1pbfB
   A==;
X-CSE-ConnectionGUID: Lv0aUCP0TkelMtBjKqi/1g==
X-CSE-MsgGUID: 9o4kDpCRRMSo9c+9f2ySAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70722049"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="70722049"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 23:11:19 -0700
X-CSE-ConnectionGUID: oCsz4yY+R9S60ub0bmGDow==
X-CSE-MsgGUID: BT238nY3QFS1qy25xdKINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="172627414"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 23:11:17 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu3Bi-0004qj-2G;
	Thu, 04 Sep 2025 06:11:14 +0000
Date: Thu, 4 Sep 2025 14:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2846/2846] mm/page_cache_limit.c:103:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202509041301.Q6WCrlvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a51e89910d963542ae989c5e4e70cbc0f79ef193
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [2846/2846] mm: support pagecache limit
config: arm64-randconfig-r121-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041301.Q6WCrlvW-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250904/202509041301.Q6WCrlvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041301.Q6WCrlvW-lkp@intel.com/

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
