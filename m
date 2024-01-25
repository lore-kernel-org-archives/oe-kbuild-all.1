Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7CE10A05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 06:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706163152; cv=none; b=oSxLpQy/sPjk3j88KYzhDRgYMFDsq87NZqDSDII2dULMwCYZRcwn1xTjl84oNgr4qE3EDZ5Fm1Z6pmmmJKE4aYi287FqsYQeBoU5ev/D5H85k+R6jhYkwtgo0D+O+Wg1V8c2ZcgRb3J+SL43qAxAI+oV6Vn4VYGZzWFfaYrvX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706163152; c=relaxed/simple;
	bh=1uNANVS94SIc6sNZqRyrnvo7AAGE0efemorxGwSlWVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgt5TqPa4oAClf7a3X5yZs0tPH+enc9BcF+ze9tzPwwU1lapm8UYQIOLqS7CJEJiJSnBZIu7NLeZqlMaHbTarrsdgviAV3P7Ch2X/b35Y9wr5rxOBNLvZqWqhAreYoSa8TxzpgsGeqQCTJkVMmjX/PQZvBI0mY5+JHmoyQ+fyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nf3oi7KX; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nf3oi7KX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706163149; x=1737699149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uNANVS94SIc6sNZqRyrnvo7AAGE0efemorxGwSlWVM=;
  b=nf3oi7KX6UMZ8a5BeABYRl80gQv4pT23Z/MXJ9OE1tyWGHt75GRwuncU
   r57ZsBxo7hWJC6cKa+kX4beA1XYP3GmHXta6FXgBV6cU9lMaWW6FysPht
   6UYfL6yh50nSN3XueE8yFH3stFlXPFSNx3J2mANI6ca7ca4KGU6hOTrD3
   LmuiU9beAawawZsyEcH2Kfj0aeB1D8vy8BMfaWL+AGoVVP/dkRCj2a3lk
   ECZ0hMnUhd7lcSm1nX1/D6N9pJTdzdsuf7Q0IRKyDZDByATM3dpgEFxvK
   90NJjhw5/EvQPAhyK83c+CsB6FOKvg/coLxXneI4wxZ/KzX4EIix3+ipi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433224085"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="433224085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786660042"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786660042"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jan 2024 22:12:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSsyO-0008lN-28;
	Thu, 25 Jan 2024 06:12:24 +0000
Date: Thu, 25 Jan 2024 14:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1369/2731] mm/share_pool.c:3305:12: warning:
 'proc_usage_show' defined but not used
Message-ID: <202401251418.DXCkpV5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   901db4752b1cced0e23423a24a60e47b42e4b96b
commit: df165ba49e6e4ce8b4f6076aded3b92e19918b03 [1369/2731] mm/sharepool: Add proc interfaces to show sp info
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251418.DXCkpV5X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251418.DXCkpV5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251418.DXCkpV5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:2584:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    2584 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:2584:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:2796:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    2796 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: At top level:
>> mm/share_pool.c:3305:12: warning: 'proc_usage_show' defined but not used [-Wunused-function]
    3305 | static int proc_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~
>> mm/share_pool.c:3285:12: warning: 'proc_group_usage_show' defined but not used [-Wunused-function]
    3285 | static int proc_group_usage_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> mm/share_pool.c:3234:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    3234 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/proc_usage_show +3305 mm/share_pool.c

  3233	
> 3234	static int spa_stat_show(struct seq_file *seq, void *offset)
  3235	{
  3236		if (!should_show_statistics())
  3237			return -EPERM;
  3238	
  3239		spg_overview_show(seq);
  3240		spa_overview_show(seq);
  3241		/* print the file header */
  3242		seq_printf(seq, "%-10s %-16s %-16s %-10s %-7s %-5s %-8s %-8s\n",
  3243				"Group ID", "va_start", "va_end", "Size(KB)", "Type", "Huge", "PID", "Ref");
  3244		spa_ro_stat_show(seq);
  3245		spa_normal_stat_show(seq);
  3246		spa_dvpp_stat_show(seq);
  3247		return 0;
  3248	}
  3249	
  3250	static int proc_usage_by_group(int id, void *p, void *data)
  3251	{
  3252		struct sp_group *spg = p;
  3253		struct seq_file *seq = data;
  3254		struct sp_group_node *spg_node;
  3255		struct mm_struct *mm;
  3256		struct sp_group_master *master;
  3257		int tgid;
  3258		unsigned long anon, file, shmem, total_rss;
  3259	
  3260		down_read(&spg->rw_lock);
  3261		list_for_each_entry(spg_node, &spg->proc_head, proc_node) {
  3262			master = spg_node->master;
  3263			mm = master->mm;
  3264			tgid = master->tgid;
  3265	
  3266			get_mm_rss_info(mm, &anon, &file, &shmem, &total_rss);
  3267	
  3268			seq_printf(seq, "%-8d ", tgid);
  3269			seq_printf(seq, "%-8d ", id);
  3270			seq_printf(seq, "%-9ld %-9ld %-9ld %-8ld %-7ld %-7ld ",
  3271					meminfo_alloc_sum_byKB(&spg_node->meminfo),
  3272					meminfo_k2u_size(&spg_node->meminfo),
  3273					meminfo_alloc_sum_byKB(&spg_node->spg->meminfo),
  3274					page2kb(mm->total_vm), page2kb(total_rss),
  3275					page2kb(shmem));
  3276			print_process_prot(seq, spg_node->prot);
  3277			seq_putc(seq, '\n');
  3278		}
  3279		up_read(&spg->rw_lock);
  3280		cond_resched();
  3281	
  3282		return 0;
  3283	}
  3284	
> 3285	static int proc_group_usage_show(struct seq_file *seq, void *offset)
  3286	{
  3287		if (!should_show_statistics())
  3288			return -EPERM;
  3289	
  3290		spg_overview_show(seq);
  3291		spa_overview_show(seq);
  3292	
  3293		/* print the file header */
  3294		seq_printf(seq, "%-8s %-8s %-9s %-9s %-9s %-8s %-7s %-7s %-4s\n",
  3295				"PID", "Group_ID", "SP_ALLOC", "SP_K2U", "SP_RES",
  3296				"VIRT", "RES", "Shm", "PROT");
  3297	
  3298		down_read(&sp_global_sem);
  3299		idr_for_each(&sp_group_idr, proc_usage_by_group, seq);
  3300		up_read(&sp_global_sem);
  3301	
  3302		return 0;
  3303	}
  3304	
> 3305	static int proc_usage_show(struct seq_file *seq, void *offset)
  3306	{
  3307		struct sp_group_master *master = NULL;
  3308		unsigned long anon, file, shmem, total_rss;
  3309		long sp_res, sp_res_nsize, non_sp_res, non_sp_shm;
  3310		struct sp_meminfo *meminfo;
  3311	
  3312		if (!should_show_statistics())
  3313			return -EPERM;
  3314	
  3315		seq_printf(seq, "%-8s %-16s %-9s %-9s %-9s %-10s %-10s %-8s\n",
  3316				"PID", "COMM", "SP_ALLOC", "SP_K2U", "SP_RES", "Non-SP_RES",
  3317				"Non-SP_Shm", "VIRT");
  3318	
  3319		down_read(&sp_global_sem);
  3320		mutex_lock(&master_list_lock);
  3321		list_for_each_entry(master, &master_list, list_node) {
  3322			meminfo = &master->meminfo;
  3323			get_mm_rss_info(master->mm, &anon, &file, &shmem, &total_rss);
  3324			get_process_sp_res(master, &sp_res, &sp_res_nsize);
  3325			get_process_non_sp_res(total_rss, shmem, sp_res_nsize,
  3326					&non_sp_res, &non_sp_shm);
  3327			seq_printf(seq, "%-8d %-16s %-9ld %-9ld %-9ld %-10ld %-10ld %-8ld\n",
  3328					master->tgid, master->comm,
  3329					meminfo_alloc_sum_byKB(meminfo),
  3330					meminfo_k2u_size(meminfo),
  3331					sp_res, non_sp_res, non_sp_shm,
  3332					page2kb(master->mm->total_vm));
  3333		}
  3334		mutex_unlock(&master_list_lock);
  3335		up_read(&sp_global_sem);
  3336	
  3337		return 0;
  3338	}
  3339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
