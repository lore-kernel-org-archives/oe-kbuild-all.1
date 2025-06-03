Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11BAD23
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 02:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748917886; cv=none; b=PB6QM0qlG8STZ3eAVzvlXwgSS4pFoGqkjG+FYUuSOyRRDZF3bkM9qCDZeNYQOBdxPDvFJKd9KauGDnWgZg9mByM9Y7aD3aW9+r2nKxz4SKAgbMzELsa6osTuREYdJKxSEFUq73v5vvWJlU9Mn/w3bXQV0kNLeWOY0rkEsaIirXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748917886; c=relaxed/simple;
	bh=xHoF0IGGzkaWSsXVtMHnjJ9+9J0wofJYeve8rYakd98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdHoEq+yrl1tNQyXqTwrmR8Y1z1vfh+PAyiER0b+b0wHvIBaJ0JctRfASLSELUkkkFQQUwqmrxFH3XbhAnwV3+D16Eqef3ONWw4fDr3At6hf0d1otBfOMru/j7+0E6cVHm/C5Ciawk0BsSjFvLezSA036cc/O8oGCiLVDWJ7jTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKQDiG1P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKQDiG1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748917884; x=1780453884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xHoF0IGGzkaWSsXVtMHnjJ9+9J0wofJYeve8rYakd98=;
  b=hKQDiG1PMDHQYS1sp8llpKoDh0d00qWZbHkbranf4+Vyj3d6eBXB0sn4
   GZtA7iyKmBdnLQmhfesBSDwf/vbIqFGlbVgeSzxsOZ9dCReYspr+IezFr
   0EyPDNj6pNi6kOJaz/xIf5t2P75zhqwFGBSs8V5OlMu3RTW+4ZBy8DZmA
   xGCwo+FVc5e/IOqTOJQSE5XI+J8YeyhsvGoL+z/s+fBqfigW82EaWsJvO
   d/Gw59VlY4eSIy6vTnWoe0ncK67NC+faq1gYsW61luJQCQF5XuUipGKbD
   Carvfg57RIgKwiuL6qxax84GSw4CajgtMq/3tYgtEnIFjhBlOnRS9pN0p
   A==;
X-CSE-ConnectionGUID: Mj3DVieEQcSmrcdwMsKbHg==
X-CSE-MsgGUID: YtvWMS23QM6LtlcafypaWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61603464"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="61603464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 19:31:15 -0700
X-CSE-ConnectionGUID: bJjh6PWUTd++gHzv9eiEYw==
X-CSE-MsgGUID: WjtyP6TmRpu5aEYkJ/n9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="167893493"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 19:31:15 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMHQm-0001P0-1g;
	Tue, 03 Jun 2025 02:31:12 +0000
Date: Tue, 3 Jun 2025 10:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] kernel/sched/isolation.c:134:46:
 error: use of undeclared identifier 'setup_max_cpus'
Message-ID: <202506031046.kGeNnudq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97c2d1a4aa1430a6305c949fa1f72efe454c946d
commit: 54bee36be952f18f6a9e8303822459e89daaa336 [2195/2195] sched/isolation: Fix boot crash when maxcpus < first housekeeping CPU
config: x86_64-buildonly-randconfig-2004-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031046.kGeNnudq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031046.kGeNnudq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031046.kGeNnudq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:24:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_utility.c:105:
>> kernel/sched/isolation.c:134:46: error: use of undeclared identifier 'setup_max_cpus'
     134 |         if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
         |                                                     ^
   1 warning and 1 error generated.


vim +/setup_max_cpus +134 kernel/sched/isolation.c

   108	
   109	static int __init housekeeping_setup(char *str, unsigned long flags)
   110	{
   111		cpumask_var_t non_housekeeping_mask, housekeeping_staging;
   112		unsigned int first_cpu;
   113		int err = 0;
   114	
   115		if ((flags & HK_FLAG_TICK) && !(housekeeping.flags & HK_FLAG_TICK)) {
   116			if (!IS_ENABLED(CONFIG_NO_HZ_FULL)) {
   117				pr_warn("Housekeeping: nohz unsupported."
   118					" Build with CONFIG_NO_HZ_FULL\n");
   119				return 0;
   120			}
   121		}
   122	
   123		alloc_bootmem_cpumask_var(&non_housekeeping_mask);
   124		if (cpulist_parse(str, non_housekeeping_mask) < 0) {
   125			pr_warn("Housekeeping: nohz_full= or isolcpus= incorrect CPU range\n");
   126			goto free_non_housekeeping_mask;
   127		}
   128	
   129		alloc_bootmem_cpumask_var(&housekeeping_staging);
   130		cpumask_andnot(housekeeping_staging,
   131			       cpu_possible_mask, non_housekeeping_mask);
   132	
   133		first_cpu = cpumask_first_and(cpu_present_mask, housekeeping_staging);
 > 134		if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
   135			__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
   136			__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
   137			if (!housekeeping.flags) {
   138				pr_warn("Housekeeping: must include one present CPU, "
   139					"using boot CPU:%d\n", smp_processor_id());
   140			}
   141		}
   142	
   143		if (cpumask_empty(non_housekeeping_mask))
   144			goto free_housekeeping_staging;
   145	
   146		if (!housekeeping.flags) {
   147			/* First setup call ("nohz_full=" or "isolcpus=") */
   148			enum hk_type type;
   149	
   150			for_each_set_bit(type, &flags, HK_TYPE_MAX)
   151				housekeeping_setup_type(type, housekeeping_staging);
   152		} else {
   153			/* Second setup call ("nohz_full=" after "isolcpus=" or the reverse) */
   154			enum hk_type type;
   155			unsigned long iter_flags = flags & housekeeping.flags;
   156	
   157			for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
   158				if (!cpumask_equal(housekeeping_staging,
   159						   housekeeping.cpumasks[type])) {
   160					pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
   161					goto free_housekeeping_staging;
   162				}
   163			}
   164	
   165			iter_flags = flags & ~housekeeping.flags;
   166	
   167			for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
   168				housekeeping_setup_type(type, housekeeping_staging);
   169		}
   170	
   171		if ((flags & HK_FLAG_TICK) && !(housekeeping.flags & HK_FLAG_TICK))
   172			tick_nohz_full_setup(non_housekeeping_mask);
   173	
   174		housekeeping.flags |= flags;
   175		err = 1;
   176	
   177	free_housekeeping_staging:
   178		free_bootmem_cpumask_var(housekeeping_staging);
   179	free_non_housekeeping_mask:
   180		free_bootmem_cpumask_var(non_housekeeping_mask);
   181	
   182		return err;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
