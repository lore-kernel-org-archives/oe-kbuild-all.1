Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE015E97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731793036; cv=none; b=ckHBjDRao+zs/fM8SNGpCPb1m+onFjoOxboXUHBLKM0r4qTqWe3G7UpZdk1oY9lwNvex1+AZjg6ODpjjKsn3zhp6OlMBG1f6iCMC2p6F+opl+Y7yS/VYvlON0oPPONQ88qJCWJFUzvJ6QLKAxTtWOJkmCIdLYCTffqkpjCVSkoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731793036; c=relaxed/simple;
	bh=5yNykdXucoWEQ8C1ixN2HHBHYK2m9nkQqF8QFXY5Dok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLjarjyf6SBBdeIWKZTyENd+YOCMjTASrZUUGBrxPN0JTSr8lb7W63/bJvELqVrDrFrtgR3aDy8dkzkCy1uLRKHn/CQxtxsezNBvXhpNEGpnsAX9ASNJWFLIBvz0DEOHJmqmLY2M6CurmlwZrsKGPn2bwy6gO1YmJ0jrfZuJdVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShB6ru7U; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShB6ru7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731793034; x=1763329034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yNykdXucoWEQ8C1ixN2HHBHYK2m9nkQqF8QFXY5Dok=;
  b=ShB6ru7UYd4uk1jcByhqgp0gFJj8OrVgPBsrf3ctIrp+XO0gcHG0oD7o
   rYeBnWKpR5pF5tq12L/ka3jdy141jqWmWvo7sHcb5ZzYqeFESONhDK2CY
   IPO/bD/EOPl5hMQ5u88fbCxHkC6kLV0ZLclGK0U9y/hsGgIKebPCkbeOi
   qYcQO9kXteazTYGoQBMi3K+DM8k/Y2zUYAetCpg3z6nRkVnjicnrRwX1W
   +wFD/7vABG4O45Zx7T6qTN3hYI7x7x3FxiD3hKXVnAaHK1pTNGtSING3E
   bI3dOqYlNQ0JQ9x3am0chYoHymqbLwybj7mD9MarPvK0Wc2fHHmzvbHr4
   A==;
X-CSE-ConnectionGUID: MygJ7emWQrq8GvqIEfOMMg==
X-CSE-MsgGUID: cLi+V3QdRMSUiRVPy6/lqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="19385231"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="19385231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 13:37:12 -0800
X-CSE-ConnectionGUID: YbCC0/flQOiJOH3scUcYqA==
X-CSE-MsgGUID: zsRf8g/fQ0ejzmADYFJR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89638205"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2024 13:37:12 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCQTc-00018F-1q;
	Sat, 16 Nov 2024 21:37:08 +0000
Date: Sun, 17 Nov 2024 05:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] mm/share_pool.c:2235:12:
 warning: 'spa_stat_show' defined but not used
Message-ID: <202411170503.vMx47JY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [1297/1297] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170503.vMx47JY5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170503.vMx47JY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170503.vMx47JY5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/share_pool.c:2235:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2235 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
>> mm/share_pool.c:2121:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2121 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:1069: warning: Function parameter or member 'size' not described in 'sp_alloc'
   mm/share_pool.c:1069: warning: Function parameter or member 'sp_flags' not described in 'sp_alloc'
   mm/share_pool.c:1069: warning: Function parameter or member 'spg_id' not described in 'sp_alloc'
   mm/share_pool.c:1582: warning: Function parameter or member 'uva' not described in '__sp_walk_page_range'
   mm/share_pool.c:1582: warning: Function parameter or member 'size' not described in '__sp_walk_page_range'
   mm/share_pool.c:1582: warning: Function parameter or member 'tsk' not described in '__sp_walk_page_range'
   mm/share_pool.c:1582: warning: Function parameter or member 'sp_walk_data' not described in '__sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'uva' not described in 'sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'size' not described in 'sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'tsk' not described in 'sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'sp_walk_data' not described in 'sp_walk_page_range'


vim +/spa_stat_show +2235 mm/share_pool.c

  2120	
> 2121	static int proc_stat_show(struct seq_file *seq, void *offset)
  2122	{
  2123		/* print the file header */
  2124		seq_printf(seq, "%-12s %-10s %-18s\n",
  2125			   "Process ID", "Group ID", "Aligned Apply(KB)");
  2126		/* print kthread buff_module_guard_work */
  2127		seq_printf(seq, "%-12s %-10s %-18ld\n",
  2128			   "guard", "-", byte2kb(kthread_stat.amount));
  2129		idr_for_each(&sp_stat_idr, idr_proc_stat_cb, seq);
  2130		return 0;
  2131	}
  2132	
  2133	static void rb_spa_stat_show(struct seq_file *seq)
  2134	{
  2135		struct rb_node *node;
  2136		struct sp_area *spa;
  2137	
  2138		spin_lock(&sp_area_lock);
  2139	
  2140		for (node = rb_first(&sp_area_root); node; node = rb_next(node)) {
  2141			spa = rb_entry(node, struct sp_area, rb_node);
  2142			atomic_inc(&spa->use_count);
  2143			spin_unlock(&sp_area_lock);
  2144	
  2145			mutex_lock(&sp_mutex);
  2146			if (spg_valid(spa->spg))
  2147				seq_printf(seq, "%-10d ", spa->spg->id);
  2148			else /* k2u for task or spg is dead */
  2149				seq_printf(seq, "%-10s ", "None");
  2150			mutex_unlock(&sp_mutex);
  2151	
  2152			seq_printf(seq, "%2s%-14lx %2s%-14lx %-13ld ",
  2153				   "0x", spa->va_start,
  2154				   "0x", spa->va_end,
  2155				   byte2kb(spa->real_size));
  2156	
  2157			switch (spa->type) {
  2158			case SPA_TYPE_ALLOC:
  2159				seq_printf(seq, "%-7s ", "ALLOC");
  2160				break;
  2161			case SPA_TYPE_K2TASK:
  2162				seq_printf(seq, "%-7s ", "TASK");
  2163				break;
  2164			case SPA_TYPE_K2SPG:
  2165				seq_printf(seq, "%-7s ", "SPG");
  2166				break;
  2167			default:
  2168				/* usually impossible, perhaps a developer's mistake */
  2169				break;
  2170			}
  2171	
  2172			if (spa->is_hugepage)
  2173				seq_printf(seq, "%-5s ", "Y");
  2174			else
  2175				seq_printf(seq, "%-5s ", "N");
  2176	
  2177			seq_printf(seq, "%-10d\n", atomic_read(&spa->use_count));
  2178	
  2179			spin_lock(&sp_area_lock);
  2180			__sp_area_drop_locked(spa);
  2181		}
  2182	
  2183		spin_unlock(&sp_area_lock);
  2184	}
  2185	
  2186	static void spa_overview_show(struct seq_file *seq)
  2187	{
  2188		unsigned int total_num, alloc_num, k2u_task_num, k2u_spg_num;
  2189		unsigned long total_size, alloc_size, k2u_task_size, k2u_spg_size;
  2190	
  2191		spin_lock(&sp_area_lock);
  2192		total_num     = spa_stat.total_num;
  2193		alloc_num     = spa_stat.alloc_num;
  2194		k2u_task_num  = spa_stat.k2u_task_num;
  2195		k2u_spg_num   = spa_stat.k2u_spg_num;
  2196		total_size    = spa_stat.total_size;
  2197		alloc_size    = spa_stat.alloc_size;
  2198		k2u_task_size = spa_stat.k2u_task_size;
  2199		k2u_spg_size  = spa_stat.k2u_spg_size;
  2200		spin_unlock(&sp_area_lock);
  2201	
  2202		seq_printf(seq, "Spa total num %u.\n", total_num);
  2203		seq_printf(seq, "Spa alloc num %u, k2u(task) num %u, k2u(spg) num %u.\n",
  2204			   alloc_num, k2u_task_num, k2u_spg_num);
  2205		seq_printf(seq, "Spa total size:     %13lu KB\n", byte2kb(total_size));
  2206		seq_printf(seq, "Spa alloc size:     %13lu KB\n", byte2kb(alloc_size));
  2207		seq_printf(seq, "Spa k2u(task) size: %13lu KB\n", byte2kb(k2u_task_size));
  2208		seq_printf(seq, "Spa k2u(spg) size:  %13lu KB\n", byte2kb(k2u_spg_size));
  2209		seq_printf(seq, "\n");
  2210	}
  2211	
  2212	/* the caller must hold sp_mutex */
  2213	static int idr_spg_stat_cb(int id, void *p, void *data)
  2214	{
  2215		struct sp_group *spg = p;
  2216		struct seq_file *seq = data;
  2217	
  2218		seq_printf(seq, "Group %-10d size: %13d KB, spa num: %d.\n",
  2219			   id, byte2kb(atomic_read(&spg->size)),
  2220			   atomic_read(&spg->spa_num));
  2221	
  2222		return 0;
  2223	}
  2224	
  2225	static void spg_overview_show(struct seq_file *seq)
  2226	{
  2227		mutex_lock(&sp_mutex);
  2228		idr_for_each(&sp_group_idr, idr_spg_stat_cb, seq);
  2229		mutex_unlock(&sp_mutex);
  2230		seq_printf(seq, "Share pool total size: %13d KB, spa total num: %d.\n\n",
  2231			   byte2kb(atomic_read(&spg_stat.spa_total_size)),
  2232			   atomic_read(&spg_stat.spa_total_num));
  2233	}
  2234	
> 2235	static int spa_stat_show(struct seq_file *seq, void *offset)
  2236	{
  2237		spg_overview_show(seq);
  2238		spa_overview_show(seq);
  2239		/* print the file header */
  2240		seq_printf(seq, "%-10s %-16s %-16s %-13s %-7s %-5s %-10s\n",
  2241			   "Group ID", "va_start", "va_end", "Aligned KB", "Type", "Huge", "Ref");
  2242		rb_spa_stat_show(seq);
  2243		return 0;
  2244	}
  2245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
