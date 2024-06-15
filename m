Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92249634
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718465968; cv=none; b=F4fEpICrr6l7su/0BPU1Ya2haTFOLCO2gEMH8nO9RR7Jf5x4zN8PH3MQgOOtXwuxVB+uu335+EOuKoK5p2F8giaQR/gPrPd/yYOYHZ4a+AttTbJV+eR4GS5D0K+ftgCmrIsc6BqefHxWZTIMTLYR93SnJT1yPOqdZ0YZi/vRszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718465968; c=relaxed/simple;
	bh=kNxmjEZgNyuhUX8IC9hITG1w6X9PWaST1xAe7gOTmhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shzSunCQdmMyK+cZvE/fp2/SRNeVllNT7+IANUzqK6aYafRb88eF9ZGTmhuzdR3qZV9a7xWdg15NrbP//C9lEuSJjeF8lv/6eYJgsDGvG22tGAVIiKdViPJMzfCp68lv4Ldkb5aY67jN7AAUHl+8LLnxLCZahkROPt4YrqcnCIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYVyQB1+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYVyQB1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718465966; x=1750001966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNxmjEZgNyuhUX8IC9hITG1w6X9PWaST1xAe7gOTmhE=;
  b=OYVyQB1+Y3RaYIoKA+XER9+aSua5Vgap6EmElMmhNiX7GNBvpiHvWNZR
   PJaQJPKx1y96Db1ZrlZ7m4WjP0Q2bHP2hXMjXtOfLtK4tFjB4/ZbXb/22
   fb0in3/b/GRv/aoimntHnNA1CKOQLLwZGR0xHyFay6L9zj69teM2U74A3
   IlcMG3hoA4weBjDhon0vACyMVqpRSkTWifNqfDFR70nCcytNJ6l83mGTC
   Cs9MCxwMhPqamoQz5is1MKl9yp9W5OhB3APyhnBH7z4r2kUuUOr44Z15r
   VNWA55ZHoDLbZJWUrHr7pn0mjSiSNUqtr43iTq0oifQLSJW+NHWKhRSjg
   A==;
X-CSE-ConnectionGUID: EJJGB94OSxiXUCC4Jom9dg==
X-CSE-MsgGUID: eFVbuYY9TquqeUC7LYvWGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15222857"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15222857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 08:39:25 -0700
X-CSE-ConnectionGUID: i21fyRTRRzS9iwxKR1YRWw==
X-CSE-MsgGUID: UEM4cMECStSUG9WNc7TuJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45319812"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2024 08:39:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIVUw-0000BS-0H;
	Sat, 15 Jun 2024 15:39:22 +0000
Date: Sat, 15 Jun 2024 23:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_table_reclaim 10/10]
 mm/pgtable_reclaim.c:437:25: error: 'root_mem_cgroup' undeclared; did you
 mean 'parent_mem_cgroup'?
Message-ID: <202406152339.CvfHVAym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_table_reclaim
head:   fba6b89e0737bc078c6e7ace5a0c8718e097464d
commit: fba6b89e0737bc078c6e7ace5a0c8718e097464d [10/10] mm: page table reclaim
config: i386-buildonly-randconfig-003-20240615 (https://download.01.org/0day-ci/archive/20240615/202406152339.CvfHVAym-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152339.CvfHVAym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152339.CvfHVAym-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/pgtable_reclaim.c: In function 'try_reclaim_pmd_table':
>> mm/pgtable_reclaim.c:175:9: warning: variable 'pmd' set but not used [-Wunused-but-set-variable]
     pmd_t *pmd;
            ^~~
   mm/pgtable_reclaim.c: In function 'mm_reclaim_pgtables':
>> mm/pgtable_reclaim.c:395:20: warning: unused variable 'tlb' [-Wunused-variable]
     struct mmu_gather tlb;
                       ^~~
   mm/pgtable_reclaim.c: In function 'memcg_reclaim_pgtables':
>> mm/pgtable_reclaim.c:437:25: error: 'root_mem_cgroup' undeclared (first use in this function); did you mean 'parent_mem_cgroup'?
     if (!memcg || memcg == root_mem_cgroup)
                            ^~~~~~~~~~~~~~~
                            parent_mem_cgroup
   mm/pgtable_reclaim.c:437:25: note: each undeclared identifier is reported only once for each function it appears in
   mm/pgtable_reclaim.c: In function 'zap_zero_pages_show':
>> mm/pgtable_reclaim.c:482:33: error: 'zap_zero_pages' undeclared (first use in this function); did you mean 'zap_zero_pages_show'?
     return sysfs_emit(buf, "%d\n", zap_zero_pages);
                                    ^~~~~~~~~~~~~~
                                    zap_zero_pages_show
   mm/pgtable_reclaim.c: In function 'zap_zero_pages_store':
   mm/pgtable_reclaim.c:498:2: error: 'zap_zero_pages' undeclared (first use in this function); did you mean 'zap_zero_pages_show'?
     zap_zero_pages = value;
     ^~~~~~~~~~~~~~
     zap_zero_pages_show
   mm/pgtable_reclaim.c: In function 'zap_zero_pages_show':
>> mm/pgtable_reclaim.c:483:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +437 mm/pgtable_reclaim.c

   386	
   387	/*
   388	 * Zap page table entries that might help reclaiming page tables from a MM
   389	 * context and reclaim page tables.
   390	 *
   391	 * Note: must not be called with the mm_lock held.
   392	 */
   393	void mm_reclaim_pgtables(struct mm_struct *mm)
   394	{
 > 395		struct mmu_gather tlb;
   396		printk("Reclaiming: %p\n", mm);
   397	
   398		/*
   399		 * Scan and remove completely empty page tables.
   400		 */
   401		__mm_reclaim_pgtables(mm);
   402	}
   403	
   404	/*
   405	 * Reclaim page tables from a process. Called under get_task_struct().
   406	 *
   407	 * Note: must not be called with the mm_lock held.
   408	 */
   409	void task_reclaim_pgtables(struct task_struct *p)
   410	{
   411		if (unlikely(!p || !p->mm))
   412			return;
   413	
   414		/*
   415		 * TODO: We'd like to avoid a mmget and instad use mmgrab ...
   416		 * but it's difficult racing with exit_mmap(). We could only
   417		 * mmgrab here and do an mmget_not_zero() everytime we do another
   418		 * iteration of page table freeing (where we drop all locks either way)/
   419		 */
   420		if (!mmget_not_zero(p->mm)) {
   421			return;
   422		}
   423		mm_reclaim_pgtables(p->mm);
   424		mmput(p->mm);
   425	}
   426	
   427	static int __memcg_reclaim_pgtables(struct task_struct *p, void *opaque)
   428	{
   429		task_reclaim_pgtables(p);
   430		if (unlikely(fatal_signal_pending(current)))
   431			return -EINTR;
   432		return 0;
   433	}
   434	
   435	void memcg_reclaim_pgtables(struct mem_cgroup *memcg)
   436	{
 > 437		if (!memcg || memcg == root_mem_cgroup)
   438			reclaim_pgtables();
   439		else
   440			mem_cgroup_scan_tasks(memcg, __memcg_reclaim_pgtables, NULL);
   441	}
   442	
   443	/*
   444	 * Try to reclaim page tables from all present processes.
   445	 *
   446	 * Note: must not be called with any mm_lock held.
   447	 */
   448	void reclaim_pgtables(void)
   449	{
   450		struct task_struct *p, *next_p;
   451	
   452		p = &init_task;
   453		get_task_struct(p);
   454		task_reclaim_pgtables(p);
   455	
   456		while (true) {
   457			rcu_read_lock();
   458			next_p = next_task(p);
   459			put_task_struct(p);
   460			p = next_p;
   461			get_task_struct(p);
   462			rcu_read_unlock();
   463	
   464			if (p == &init_task)
   465				break;
   466	
   467			task_reclaim_pgtables(p);
   468	
   469			if (unlikely(fatal_signal_pending(current)))
   470				break;
   471			cond_resched();
   472		}
   473	
   474		put_task_struct(p);
   475	}
   476	
   477	#ifdef CONFIG_SYSFS
   478	
   479	static ssize_t zap_zero_pages_show(struct kobject *kobj,
   480					      struct kobj_attribute *attr, char *buf)
   481	{
 > 482		return sysfs_emit(buf, "%d\n", zap_zero_pages);
 > 483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
