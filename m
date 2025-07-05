Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC624A079
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 05:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751693367; cv=none; b=kw80U7rlXwrrW384lrX6S1Z3lMJNEKLY7zh4Tl5OJUEfVgfb6BybdK85l60rtkaeugvXVcnI+vfTIEC4y75DZmka0GVT1zdlO5SBrzMybcJKa+QcihTqlKHtFmm/tTK9DYDtD5vlqo+MJz8kKMdDHzHN90JAonerqh9kC93t0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751693367; c=relaxed/simple;
	bh=fz7lCI+y2cLychk2owH0f/Eo2QO4Xq0j30BnrFpJ64Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e7T+OLsLkrToOBc5IheOSIbXt+ZRZqQKWJmb24RzsknPOHvd54lBwPoj71E0WRK6jirMj75wnfoy8qnN/8/lMV8LdSkwuEQohC1EWLD5ERvGYgHkWmw0spjqJbN0BgicxrXfMVY18XInbqFwpaP+TmmysRdfZZFGxpv+nYl44pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEI1/DlH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEI1/DlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751693365; x=1783229365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fz7lCI+y2cLychk2owH0f/Eo2QO4Xq0j30BnrFpJ64Y=;
  b=OEI1/DlHePB6wmbNjy565d2BSKoFG/I5iYlPw6mH/T6V2dPuuSUlkn3m
   jG+6ZMVw3jZuWMI9srmYGAaTGgH22FOMxsAeMPdB37ufXibVtVI/lbnWc
   uqaHgmdOKcefYXOOgTcBSf+WIfoZ+ibCfWABlxr+e8mY20D/OKeW73nr6
   HKhJLjt6eA4blPXLaEVthTifXGwJtKj1/vciymFcNqcDTElN031it+RZE
   Fmk/rwLktQ5FcQb0kacrRbcURU5cheqxILcD/flFbI6N1r7rM2sIPWM/k
   JxRjK341rFfWBUwGiDIV5ttqN0UAD8K65I55WSzbJX2tsJWGbSi16/Rcm
   w==;
X-CSE-ConnectionGUID: 3jVn70SQSY+uCtPy7gJELA==
X-CSE-MsgGUID: tMoysaXQQIqZSgaRUahkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71578470"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="71578470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 22:29:24 -0700
X-CSE-ConnectionGUID: 6yu3q4ruR5+XKlOHLxgu9g==
X-CSE-MsgGUID: Ki26QVAnQc2YKZetgB1wKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="154185604"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2025 22:29:23 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXvSi-0004JP-1d;
	Sat, 05 Jul 2025 05:29:20 +0000
Date: Sat, 5 Jul 2025 13:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464] mm/share_pool.c:3305:12: warning:
 'proc_usage_show' defined but not used
Message-ID: <202507051355.RXfpqQVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   91eec2cd9a8fcf4a923543680deda4e604bc6943
commit: df165ba49e6e4ce8b4f6076aded3b92e19918b03 [2464/2464] mm/sharepool: Add proc interfaces to show sp info
config: arm64-randconfig-r121-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051355.RXfpqQVb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507051355.RXfpqQVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051355.RXfpqQVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:2584:14: error: implicit declaration of function 'huge_ptep_get'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
     pte_t pte = huge_ptep_get(ptep);
                 ^~~~~~~~~~~~~
                 huge_pte_lock
   mm/share_pool.c:2584:14: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:2796:7: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
     bool is_hugepage = true;
          ^~~~~~~~~~~
   At top level:
>> mm/share_pool.c:3305:12: warning: 'proc_usage_show' defined but not used [-Wunused-function]
    static int proc_usage_show(struct seq_file *seq, void *offset)
               ^~~~~~~~~~~~~~~
>> mm/share_pool.c:3285:12: warning: 'proc_group_usage_show' defined but not used [-Wunused-function]
    static int proc_group_usage_show(struct seq_file *seq, void *offset)
               ^~~~~~~~~~~~~~~~~~~~~
>> mm/share_pool.c:3234:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    static int spa_stat_show(struct seq_file *seq, void *offset)
               ^~~~~~~~~~~~~
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
