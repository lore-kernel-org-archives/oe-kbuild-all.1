Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B791E5B9C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747117220; cv=none; b=kd0q1tno+LigZNLOIJ1fnEvOUBo4xlyDgd/Pv9dip2+cSXj+18iz9P6hxsA8eMdbTaIZFjIce6uPN4l53eJIzU7xTN2mZoB5VQH6vJw7l4xum/zB7ZUAc4I9JL8sApHexVbfwSVKU48M80N9FFS0iU/XCydNUHMBXb4x4dv7ZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747117220; c=relaxed/simple;
	bh=32d9/zWcsJ2o7Prq91toVIfqrVRT3Z98RsihK0RLOWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYtAznTFdRsV9B1Qf2lGeXWgky427Q3XYcg3uj7FfvFU6Z9c9RqMSA5EUR2Tj3gOIBvUdN3cN7PMjcZVtUxoXQS2uQ8fH2cVf2YNql1k/qpIzbKvzXSeCSXJOUlbVTMbd6weEt0Ew1blEc2vXnr6r+ZB/5ffiRYv5WeuHbzVLT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuwCMctq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuwCMctq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747117218; x=1778653218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32d9/zWcsJ2o7Prq91toVIfqrVRT3Z98RsihK0RLOWg=;
  b=WuwCMctqVEXVeReSCwKfRGNEyUwti9CQMspBpcfHPNTND1on8wzMyd/P
   zP/cPfjle3JnMELEZNd7jvOn4PoOvTWbc5MIS6mr2Lnk5XcrVYgsJTgUQ
   CgYUP+Sc107ZARa5BPuaVgK14Alm6xHTazQnGTkMHo1dBwvNyXMgbpwY+
   eMk0LQo9mXZYvhrDGnPrImnRqtC/skTRurgXX9Kw+wAwOh6QpPluzLvTU
   xWDG5lKJ67iA4aAIoSIJoefrJAFT6H/2l5pMJTNk7lOPs0ufF8ff6NWpS
   axDI5tuhxaD+07LJ/ukcDiFDszyjMlVPrK08YsBHJ1MwbU5UbAF/s+DZn
   Q==;
X-CSE-ConnectionGUID: G4TEVWZRTc2JDLIctr1NtA==
X-CSE-MsgGUID: 9fzAtvJ1RjmT5DQ2PI7Teg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48840558"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48840558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 23:20:17 -0700
X-CSE-ConnectionGUID: oLUpQWWvTbGMDzBLJb+y1g==
X-CSE-MsgGUID: o9PnxfQ1ReuUye7+JywI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142725427"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2025 23:20:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEizt-000Flz-10;
	Tue, 13 May 2025 06:20:13 +0000
Date: Tue, 13 May 2025 14:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220] mm/page_cache_limit.c:103:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202505131433.CYS9yklz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6774b4d00f21c00ceb15ad07eb37bea260679b5a
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [2220/2220] mm: support pagecache limit
config: x86_64-randconfig-123-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131433.CYS9yklz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131433.CYS9yklz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131433.CYS9yklz-lkp@intel.com/

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
