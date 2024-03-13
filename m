Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FD74CE04
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710360607; cv=none; b=BJppeC2gdurgPwj+Uhlm9zgsjdKSNl43Sr8oH8l8PqaiUGDpS+1VhJNye0f9u4YFHfE1f2yr75w07Zx6tav4GeWiBakEgnsm2Ryh8Xe7Ks+P2A07wq4m60sKhSGIFg2W0NntQCWdO0HFThTKw4+Rc45cJ1tIqfLYXwuOXUU8Evc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710360607; c=relaxed/simple;
	bh=kLW+xhPyBtmuXFHGZkRAeI5zEtEZgDnpBsTcE26iZRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqqMfjLs3OdaH6No1o+dzIP3RrB1pkxX8Q5uzdsEei/o4R16n+l7+y2erfyrE1iWy6rb0Pyz5uP+V/JMno7IiPOSVGFhEWl7aAWEfrhZ+fpuaSht+nikUQP0Mwd6moxkavaPcjFqnzGDsuC5/nfbQfoSVxfGYPvkGVg/6mTstZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPwMknNX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPwMknNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710360605; x=1741896605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLW+xhPyBtmuXFHGZkRAeI5zEtEZgDnpBsTcE26iZRQ=;
  b=kPwMknNXii4wn5stfTpOAbFva4ZGRQ6XO4MFCTSbxml4V++xaN6MtWbw
   /IpW2grpr0NuKS+ooP3IdQb4+eAmDEH0BjJ2fcZpASHhbMOZbUSgEAxEA
   SbZYt1hYWo8LqVxXhR4L8fPh1J0VpD6hOYpC86W39LUePityiaNf9PWeB
   4YvhEEzQCxaiwsibb6iEWpHYrj+Z6dNgjrANzzjhcX1zzGQSeIJT55Dp/
   olXxGTk94e4QFD3Lzh3tp/vtm2SsIsf9BPa8X8v2al8aAfOeAi4DbJmUH
   mSpdL3WX+VTOgmlzaFNiZJVdXfQyVzSHSB8aVrIHEXxyVufdQcUjOJxA3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16603252"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16603252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 13:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="12071034"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Mar 2024 13:10:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkUvI-000Cj5-0g;
	Wed, 13 Mar 2024 20:10:00 +0000
Date: Thu, 14 Mar 2024 04:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16692/30000] mm/share_pool.c:4215:63: error:
 'HUGETLB_ALLOC_NORECLAIM' undeclared
Message-ID: <202403140406.xZgDttKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   caa1ae20bcc64a80625a9449240580f5190ed3a0
commit: 107e2b7c4b1d007583efab423cc48429c87c6408 [16692/30000] mm/sharepool: Fix sharepool hugepage cgroup uncount error.
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240314/202403140406.xZgDttKV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140406.xZgDttKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140406.xZgDttKV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:864:23: warning: no previous prototype for 'find_spg_node_by_spg' [-Wmissing-prototypes]
     864 | struct sp_group_node *find_spg_node_by_spg(struct mm_struct *mm,
         |                       ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:3073:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    3073 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:3073:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_unshare_kva':
   mm/share_pool.c:3450:14: warning: variable 'is_hugepage' set but not used [-Wunused-but-set-variable]
    3450 |         bool is_hugepage = true;
         |              ^~~~~~~~~~~
   mm/share_pool.c: At top level:
   mm/share_pool.c:3942:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    3942 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:4024:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    4024 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:4215:41: error: 'HUGETLB_ALLOC_BUDDY' undeclared (first use in this function)
    4215 |                                         HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
         |                                         ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4215:41: note: each undeclared identifier is reported only once for each function it appears in
>> mm/share_pool.c:4215:63: error: 'HUGETLB_ALLOC_NORECLAIM' undeclared (first use in this function)
    4215 |                                         HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
         |                                                               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:4221:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    4221 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:4234:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    4234 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:4256:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    4256 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:4258:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    4258 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   cc1: some warnings being treated as errors


vim +/HUGETLB_ALLOC_NORECLAIM +4215 mm/share_pool.c

  4023	
> 4024	void spg_overview_show(struct seq_file *seq)
  4025	{
  4026		if (!sp_is_enabled())
  4027			return;
  4028	
  4029		if (seq != NULL) {
  4030			seq_printf(seq, "Share pool total size: %lld KB, spa total num: %d.\n",
  4031					byte2kb(atomic64_read(&sp_overall_stat.spa_total_size)),
  4032					atomic_read(&sp_overall_stat.spa_total_num));
  4033		} else {
  4034			pr_info("Share pool total size: %lld KB, spa total num: %d.\n",
  4035					byte2kb(atomic64_read(&sp_overall_stat.spa_total_size)),
  4036					atomic_read(&sp_overall_stat.spa_total_num));
  4037		}
  4038	
  4039		down_read(&sp_group_sem);
  4040		idr_for_each(&sp_group_idr, spg_info_show, seq);
  4041		up_read(&sp_group_sem);
  4042	
  4043		if (seq != NULL)
  4044			seq_puts(seq, "\n");
  4045		else
  4046			pr_info("\n");
  4047	}
  4048	
  4049	static int spa_stat_show(struct seq_file *seq, void *offset)
  4050	{
  4051		spg_overview_show(seq);
  4052		spa_overview_show(seq);
  4053		/* print the file header */
  4054		seq_printf(seq, "%-10s %-16s %-16s %-10s %-7s %-5s %-8s %-8s\n",
  4055				"Group ID", "va_start", "va_end", "Size(KB)", "Type", "Huge", "PID", "Ref");
  4056		spa_ro_stat_show(seq);
  4057		spa_normal_stat_show(seq);
  4058		spa_dvpp_stat_show(seq);
  4059		return 0;
  4060	}
  4061	
  4062	static int proc_usage_by_group(int id, void *p, void *data)
  4063	{
  4064		struct sp_group *spg = p;
  4065		struct seq_file *seq = data;
  4066		struct sp_group_node *spg_node;
  4067		struct mm_struct *mm;
  4068		struct sp_group_master *master;
  4069		int tgid;
  4070		unsigned long anon, file, shmem, total_rss;
  4071	
  4072		down_read(&spg->rw_lock);
  4073		list_for_each_entry(spg_node, &spg->procs, proc_node) {
  4074			master = spg_node->master;
  4075			mm = master->mm;
  4076			tgid = master->instat.tgid;
  4077	
  4078			get_mm_rss_info(mm, &anon, &file, &shmem, &total_rss);
  4079	
  4080			seq_printf(seq, "%-8d ", tgid);
  4081			seq_printf(seq, "%-8d ", id);
  4082			seq_printf(seq, "%-9ld %-9ld %-9ld %-8ld %-7ld %-7ld ",
  4083					get_spg_proc_alloc(spg_node),
  4084					get_spg_proc_k2u(spg_node),
  4085					get_sp_res_by_spg_proc(spg_node),
  4086					page2kb(mm->total_vm), page2kb(total_rss),
  4087					page2kb(shmem));
  4088			print_process_prot(seq, spg_node->prot);
  4089			seq_putc(seq, '\n');
  4090		}
  4091		up_read(&spg->rw_lock);
  4092		cond_resched();
  4093	
  4094		return 0;
  4095	}
  4096	
  4097	static int proc_group_usage_show(struct seq_file *seq, void *offset)
  4098	{
  4099		spg_overview_show(seq);
  4100		spa_overview_show(seq);
  4101	
  4102		/* print the file header */
  4103		seq_printf(seq, "%-8s %-8s %-9s %-9s %-9s %-8s %-7s %-7s %-4s\n",
  4104				"PID", "Group_ID", "SP_ALLOC", "SP_K2U", "SP_RES",
  4105				"VIRT", "RES", "Shm", "PROT");
  4106		/* print kthread buff_module_guard_work */
  4107		seq_printf(seq, "%-8s %-8s %-9lld %-9lld\n",
  4108				"guard", "-",
  4109				byte2kb(atomic64_read(&kthread_stat.alloc_size)),
  4110				byte2kb(atomic64_read(&kthread_stat.k2u_size)));
  4111	
  4112		down_read(&sp_group_sem);
  4113		idr_for_each(&sp_group_idr, proc_usage_by_group, seq);
  4114		up_read(&sp_group_sem);
  4115	
  4116		return 0;
  4117	}
  4118	
  4119	static int proc_usage_show(struct seq_file *seq, void *offset)
  4120	{
  4121		struct sp_group_master *master = NULL;
  4122		unsigned long anon, file, shmem, total_rss;
  4123		long sp_res, sp_res_nsize, non_sp_res, non_sp_shm;
  4124		struct sp_proc_stat *proc_stat;
  4125	
  4126		seq_printf(seq, "%-8s %-16s %-9s %-9s %-9s %-10s %-10s %-8s\n",
  4127				"PID", "COMM", "SP_ALLOC", "SP_K2U", "SP_RES", "Non-SP_RES",
  4128				"Non-SP_Shm", "VIRT");
  4129	
  4130		down_read(&sp_group_sem);
  4131		mutex_lock(&master_list_lock);
  4132		list_for_each_entry(master, &master_list, list_node) {
  4133			proc_stat = &master->instat;
  4134			get_mm_rss_info(master->mm, &anon, &file, &shmem, &total_rss);
  4135			get_process_sp_res(master, &sp_res, &sp_res_nsize);
  4136			get_process_non_sp_res(total_rss, shmem, sp_res_nsize,
  4137					&non_sp_res, &non_sp_shm);
  4138			seq_printf(seq, "%-8d %-16s %-9ld %-9ld %-9ld %-10ld %-10ld %-8ld\n",
  4139					proc_stat->tgid, proc_stat->comm,
  4140					get_proc_alloc(proc_stat),
  4141					get_proc_k2u(proc_stat),
  4142					sp_res, non_sp_res, non_sp_shm,
  4143					page2kb(master->mm->total_vm));
  4144		}
  4145		mutex_unlock(&master_list_lock);
  4146		up_read(&sp_group_sem);
  4147	
  4148		return 0;
  4149	}
  4150	
  4151	static void __init proc_sharepool_init(void)
  4152	{
  4153		if (!proc_mkdir("sharepool", NULL))
  4154			return;
  4155	
  4156		proc_create_single_data("sharepool/spa_stat", 0400, NULL, spa_stat_show, NULL);
  4157		proc_create_single_data("sharepool/proc_stat", 0400, NULL, proc_group_usage_show, NULL);
  4158		proc_create_single_data("sharepool/proc_overview", 0400, NULL, proc_usage_show, NULL);
  4159	}
  4160	
  4161	/*** End of tatistical and maintenance functions ***/
  4162	
  4163	bool sp_check_addr(unsigned long addr)
  4164	{
  4165		if (sp_is_enabled() && mg_is_sharepool_addr(addr) &&
  4166		    !check_aoscore_process(current))
  4167			return true;
  4168		else
  4169			return false;
  4170	}
  4171	
  4172	bool sp_check_mmap_addr(unsigned long addr, unsigned long flags)
  4173	{
  4174		if (sp_is_enabled() && mg_is_sharepool_addr(addr) &&
  4175		    !check_aoscore_process(current) && !(flags & MAP_SHARE_POOL))
  4176			return true;
  4177		else
  4178			return false;
  4179	}
  4180	
  4181	vm_fault_t sharepool_no_page(struct mm_struct *mm,
  4182				struct vm_area_struct *vma,
  4183				struct address_space *mapping, pgoff_t idx,
  4184				unsigned long address, pte_t *ptep, unsigned int flags)
  4185	{
  4186		struct hstate *h = hstate_vma(vma);
  4187		vm_fault_t ret = VM_FAULT_SIGBUS;
  4188		unsigned long size;
  4189		struct page *page;
  4190		pte_t new_pte;
  4191		spinlock_t *ptl;
  4192		unsigned long haddr = address & huge_page_mask(h);
  4193		bool new_page = false;
  4194		int err;
  4195		int node_id;
  4196		struct sp_area *spa;
  4197	
  4198		spa = vma->vm_private_data;
  4199		if (!spa) {
  4200			pr_err("share pool: vma is invalid, not from sp mmap\n");
  4201			return ret;
  4202		}
  4203		node_id = spa->node_id;
  4204	
  4205	retry:
  4206		page = find_lock_page(mapping, idx);
  4207		if (!page) {
  4208			size = i_size_read(mapping->host) >> huge_page_shift(h);
  4209			if (idx >= size)
  4210				goto out;
  4211	
  4212			page = alloc_huge_page(vma, haddr, 0);
  4213			if (IS_ERR(page)) {
  4214				page = hugetlb_alloc_hugepage(node_id,
> 4215						HUGETLB_ALLOC_BUDDY | HUGETLB_ALLOC_NORECLAIM);
  4216				if (!page)
  4217					page = ERR_PTR(-ENOMEM);
  4218			}
  4219			if (IS_ERR(page)) {
  4220				ptl = huge_pte_lock(h, mm, ptep);
  4221				if (!huge_pte_none(huge_ptep_get(ptep))) {
  4222					ret = 0;
  4223					spin_unlock(ptl);
  4224					goto out;
  4225				}
  4226				spin_unlock(ptl);
  4227				ret = vmf_error(PTR_ERR(page));
  4228				goto out;
  4229			}
  4230			__SetPageUptodate(page);
  4231			new_page = true;
  4232	
  4233			/* sharepool pages are all shared */
  4234			err = huge_add_to_page_cache(page, mapping, idx);
  4235			if (err) {
  4236				put_page(page);
  4237				if (err == -EEXIST)
  4238					goto retry;
  4239				goto out;
  4240			}
  4241		}
  4242	
  4243	
  4244		ptl = huge_pte_lock(h, mm, ptep);
  4245		size = i_size_read(mapping->host) >> huge_page_shift(h);
  4246		if (idx >= size)
  4247			goto backout;
  4248	
  4249		ret = 0;
  4250		if (!huge_pte_none(huge_ptep_get(ptep)))
  4251			goto backout;
  4252	
  4253		page_dup_rmap(page, true);
  4254		new_pte = make_huge_pte(vma, page, ((vma->vm_flags & VM_WRITE)
  4255					&& (vma->vm_flags & VM_SHARED)));
  4256		set_huge_pte_at(mm, haddr, ptep, new_pte);
  4257	
  4258		hugetlb_count_add(pages_per_huge_page(h), mm);
  4259	
  4260		spin_unlock(ptl);
  4261	
  4262		if (new_page) {
  4263			SetPagePrivate(&page[1]);
  4264		}
  4265	
  4266		unlock_page(page);
  4267	out:
  4268		return ret;
  4269	
  4270	backout:
  4271		spin_unlock(ptl);
  4272		unlock_page(page);
  4273		put_page(page);
  4274		goto out;
  4275	}
  4276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
