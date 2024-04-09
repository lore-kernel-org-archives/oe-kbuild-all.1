Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F9A2EAE5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712673399; cv=none; b=YQ6IqzIYOgiq997j7BpE0zOHyewCeFKk7vimzZDfl3jAJfdCSCXKkRY1tL/DH3S8aP/SsibSzBJy6abCn13MMoMnPypwxh3iXlhGAWzw2Y24n5RmfnCH/0hCFXC/FiHVQ7Q3tuJ8jSnEPM5Gr8+0rkEH/skqMp9xDgPhLdzDIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712673399; c=relaxed/simple;
	bh=OVMBu1VPS8mWcfyrVnifl1D9yznhEWRGJ+UUkJGg4xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAjTdsT7+1nChhMplSnk/2Mbr5nBwDUlHg00RJmPQkt1/4ohQNqTsW5liG4gfbZ42FZwJ4rvkCFamb7ILIWC6GElAk/0FnM83GV/5P7CqPmuqjMwlh0gDv+4q2OdwORHUQl6GJFIkEfLF1/4Jocl2xgz0uJXwsTjAMn0bsWAYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwB5qxV8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwB5qxV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712673398; x=1744209398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OVMBu1VPS8mWcfyrVnifl1D9yznhEWRGJ+UUkJGg4xg=;
  b=IwB5qxV8jmJsYY52NN1LHpgciizULGhxSSBQARTpUBsfOfkfUa3iNAyp
   s2NCbsVwoB+PPf6L6+EuYkboZj8qq9i0F9x/alF0EQX59SFTmXpct7TO/
   PyqrEdrWh6hoTFbHE11u74juEQ8PlKhnoQ3ZhBA/1/8w57O8wtATatMJT
   cjW/zNLs/GbmREIj2cMyLAJ11QGrW1t3K6nWdAJWbO8NoldCyJ4LGOipQ
   2ig8XH959TgQFOyk2UVsHMOHQQtyGkDRkvYGbRRnXrtdTsWqm/UTuG0wl
   vTxVejSfxKCGnRwc0aGFAFFpYGqiaawqQ9+H5luAX46RFcHu8HhxoHuKD
   A==;
X-CSE-ConnectionGUID: Zaww9hiSThKtZIqmucUL+w==
X-CSE-MsgGUID: u5VUDrPLTgK1FTPH2VrjFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="10960816"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="10960816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 07:36:36 -0700
X-CSE-ConnectionGUID: GSDGXX/qQ3CZGgTbP+xdhw==
X-CSE-MsgGUID: 4PQLpqVTQSuhK0BTq5RLAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="57699623"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 07:36:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruCaN-0006CQ-2K;
	Tue, 09 Apr 2024 14:36:31 +0000
Date: Tue, 9 Apr 2024 22:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13866/30000] mm/page_cache_limit.c:39:50:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202404092240.lrAGVAyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5c90c8c1e78b11cba596b4cf0756220759f4ebae
commit: 581a69b81673ae3cecd41af71338af42855964e2 [13866/30000] mm: support periodical memory reclaim
config: x86_64-randconfig-r132-20240409 (https://download.01.org/0day-ci/archive/20240409/202404092240.lrAGVAyn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404092240.lrAGVAyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404092240.lrAGVAyn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_cache_limit.c:39:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/page_cache_limit.c:39:50: sparse:     expected void *
   mm/page_cache_limit.c:39:50: sparse:     got void [noderef] __user *buffer
   mm/page_cache_limit.c:55:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/page_cache_limit.c:55:50: sparse:     expected void *
   mm/page_cache_limit.c:55:50: sparse:     got void [noderef] __user *buffer
>> mm/page_cache_limit.c:73:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/page_cache_limit.c:73:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/page_cache_limit.c:73:35: sparse:     got int ( * )( ... )
   mm/page_cache_limit.c:91:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/page_cache_limit.c:91:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/page_cache_limit.c:91:35: sparse:     got int ( * )( ... )

vim +39 mm/page_cache_limit.c

    33	
    34	static int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    35				void __user *buffer, size_t *length, loff_t *ppos)
    36	{
    37		int ret;
    38	
  > 39		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    40		if (ret || !write)
    41			return ret;
    42	
    43		if (should_periodical_reclaim())
    44			schedule_delayed_work(&shepherd, round_jiffies_relative(
    45				(unsigned long)vm_cache_reclaim_s * HZ));
    46	
    47		return 0;
    48	}
    49	
    50	static int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    51			void __user *buffer, size_t *length, loff_t *ppos)
    52	{
    53		int ret;
    54	
    55		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    56		if (ret || !write)
    57			return ret;
    58	
    59		if (should_periodical_reclaim())
    60			mod_delayed_work(system_unbound_wq, &shepherd,
    61					round_jiffies_relative(
    62					(unsigned long)vm_cache_reclaim_s * HZ));
    63	
    64		return ret;
    65	}
    66	
    67	static struct ctl_table ctl_table[] = {
    68		{
    69			.procname       = "cache_reclaim_s",
    70			.data           = &vm_cache_reclaim_s,
    71			.maxlen         = sizeof(vm_cache_reclaim_s),
    72			.mode           = 0644,
  > 73			.proc_handler   = cache_reclaim_sysctl_handler,
    74			.extra1         = SYSCTL_ZERO,
    75			.extra2         = &vm_cache_reclaim_s_max,
    76		},
    77		{
    78			.procname       = "cache_reclaim_weight",
    79			.data           = &vm_cache_reclaim_weight,
    80			.maxlen         = sizeof(vm_cache_reclaim_weight),
    81			.mode           = 0644,
    82			.proc_handler   = proc_dointvec_minmax,
    83			.extra1         = SYSCTL_ONE,
    84			.extra2         = &vm_cache_reclaim_weight_max,
    85		},
    86		{
    87			.procname	= "cache_reclaim_enable",
    88			.data		= &vm_cache_reclaim_enable,
    89			.maxlen		= sizeof(vm_cache_reclaim_enable),
    90			.mode		= 0644,
    91			.proc_handler	= cache_reclaim_enable_handler,
    92			.extra1		= SYSCTL_ZERO,
    93			.extra2		= SYSCTL_ONE,
    94		},
    95		{}
    96	};
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
