Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3618BC0F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734071996; cv=none; b=HrKutCimQiAltYG7GUHv75inkSC1xvZb6jYYSqzHgd5Mm4JPwszd1Qhb3K46sJHgBT6paSCysLiHokI63vN7njQ2Ah6so0P8dKKNvNE4J1BsDbc9SjLIvPNIBPjUC/OGCHXITtT2imGC/iK41UeYHQUExS1UnXbJYcRl9lLDnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734071996; c=relaxed/simple;
	bh=UzJcv4F1Cci8B56vYb1jipJ4AwIwFFVxQXF/Zxz+pjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7gqHzshUHWvbVgyMt+CRiK98cdVIsJU/Uvsp9DF1/KFhCignj7Pk0mxmTyYlsWlfWhShl9Jtf3JKHAXdzlb2OhBvVxP58rOjhQYLjeyjUCl75Ia6ugNFWSJUFYhKn56sJYFKGTk7SisKMyzef/kfAs+pTEzB103pgu59xOoIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBtI61DU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBtI61DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734071993; x=1765607993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzJcv4F1Cci8B56vYb1jipJ4AwIwFFVxQXF/Zxz+pjs=;
  b=GBtI61DUYzll61e3fjrZoB1pewPcQ29HW6DzTy5zTeqiZodL31mbVsM/
   x+muSzxc5Zk6Um9pbrEwuArSv2vKto5OiLrWjpKQ+u7CRMapHA103bli1
   bYfIqqaCDA1tAJh01SkS29+yq2NRZjHmzC6ye81XKgLAinZ+yRijYWumJ
   UVUpeSOZO5cprCKY1PoKdLnY4WIm9AO3JFOkyRLVgbKDBQAOutz6gX9bG
   +yH2Pld+Y5e8TdpL2IuuG0zGOT1vos5X7X2NBnChtZbi7MLC4udzKL1MR
   VyWykJ3YnMH2eawsaD5iaYfXv/aeKj70K6affYCruAoEHCDA+oLv+byQm
   A==;
X-CSE-ConnectionGUID: FynWUU33QjCzron800jGiA==
X-CSE-MsgGUID: rR9tv2iYSMqOHig7aPeHig==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34649891"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34649891"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 22:39:52 -0800
X-CSE-ConnectionGUID: P83nRjrXSziJwOa2DXelJA==
X-CSE-MsgGUID: hczMV4ckQ5CcZyhVLNBoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="96216292"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2024 22:39:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLzL2-000BlF-1q;
	Fri, 13 Dec 2024 06:39:48 +0000
Date: Fri, 13 Dec 2024 14:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] mm/share_pool.c:4380:12: warning:
 'proc_usage_show' defined but not used
Message-ID: <202412131415.6NF7Ybi7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: f30182b3728f06123932e314f3cb413fbe66d681 [2579/2579] mm: sharepool: use built-in-statistics
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241213/202412131415.6NF7Ybi7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131415.6NF7Ybi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131415.6NF7Ybi7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c:832:23: warning: no previous prototype for 'find_spg_node_by_spg' [-Wmissing-prototypes]
     832 | struct sp_group_node *find_spg_node_by_spg(struct mm_struct *mm,
         |                       ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'mg_sp_group_id_by_pid':
   mm/share_pool.c:1068:29: warning: ordered comparison of pointer with integer zero [-Wextra]
    1068 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_compact_nodes':
   mm/share_pool.c:2103:9: error: implicit declaration of function 'sysctl_compaction_handler' [-Werror=implicit-function-declaration]
    2103 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3278:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3278 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3278:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:3673:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    3673 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: At top level:
   mm/share_pool.c:4185:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    4185 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:4273:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    4273 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:4482:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4482 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:4495:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4495 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:4517:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4517 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:4519:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4519 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: At top level:
>> mm/share_pool.c:4380:12: warning: 'proc_usage_show' defined but not used [-Wunused-function]
    4380 | static int proc_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~
>> mm/share_pool.c:4358:12: warning: 'proc_group_usage_show' defined but not used [-Wunused-function]
    4358 | static int proc_group_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4298:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    4298 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/proc_usage_show +4380 mm/share_pool.c

  4357	
> 4358	static int proc_group_usage_show(struct seq_file *seq, void *offset)
  4359	{
  4360		spg_overview_show(seq);
  4361		spa_overview_show(seq);
  4362	
  4363		/* print the file header */
  4364		seq_printf(seq, "%-8s %-8s %-9s %-9s %-9s %-10s %-10s %-8s %-7s %-7s %-10s %-4s\n",
  4365				"PID", "Group_ID", "SP_ALLOC", "SP_K2U", "SP_RES", "SP_RES_T",
  4366				"Non-SP_RES", "VIRT", "RES", "Shm", "Non-SP_Shm", "PROT");
  4367		/* print kthread buff_module_guard_work */
  4368		seq_printf(seq, "%-8s %-8s %-9lld %-9lld\n",
  4369				"guard", "-",
  4370				byte2kb(atomic64_read(&kthread_stat.alloc_size)),
  4371				byte2kb(atomic64_read(&kthread_stat.k2u_size)));
  4372	
  4373		down_read(&sp_group_sem);
  4374		idr_for_each(&sp_group_idr, proc_usage_by_group, seq);
  4375		up_read(&sp_group_sem);
  4376	
  4377		return 0;
  4378	}
  4379	
> 4380	static int proc_usage_show(struct seq_file *seq, void *offset)
  4381	{
  4382		struct sp_group_master *master = NULL;
  4383		unsigned long anon, file, shmem, total_rss;
  4384		long sp_res, sp_res_nsize, non_sp_res, non_sp_shm;
  4385		struct sp_proc_stat *proc_stat;
  4386	
  4387		seq_printf(seq, "%-8s %-16s %-9s %-9s %-9s %-10s %-10s %-8s\n",
  4388				"PID", "COMM", "SP_ALLOC", "SP_K2U", "SP_RES", "Non-SP_RES",
  4389				"Non-SP_Shm", "VIRT");
  4390	
  4391		mutex_lock(&master_list_lock);
  4392		list_for_each_entry(master, &master_list, list_node) {
  4393			proc_stat = &master->instat;
  4394			get_mm_rss_info(master->mm, &anon, &file, &shmem, &total_rss);
  4395			get_process_sp_res(&master->instat, &sp_res, &sp_res_nsize);
  4396			get_process_non_sp_res(total_rss, shmem, sp_res_nsize,
  4397					&non_sp_res, &non_sp_shm);
  4398			seq_printf(seq, "%-8d %-16s %-9ld %-9ld %-9ld %-10ld %-10ld %-8ld\n",
  4399					proc_stat->tgid, proc_stat->comm,
  4400					get_proc_alloc(proc_stat),
  4401					get_proc_k2u(proc_stat),
  4402					sp_res, non_sp_res, non_sp_shm,
  4403					page2kb(master->mm->total_vm));
  4404		}
  4405		mutex_unlock(&master_list_lock);
  4406	
  4407		return 0;
  4408	}
  4409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
