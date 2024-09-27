Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591F1C1AA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727466284; cv=none; b=JkBfIlWgcE8pWa9uH+42h2cG/KNTjtqgr+J9ze7e49W1rfxzuoMUxDb5xo/J9tZzP/ihzOiRpeiOc4PuMBdRGNnCglrexgSwGKmIN8TYjGUHtOKof2iYKAbmCkrLkJ+THr/S5mxuhdKmvDg72QFh5KqIjWVb8WTcuTFaExYN2JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727466284; c=relaxed/simple;
	bh=Gc0+QPJl1FXV3TxwCC1Px1ljBfmTq4efNM5PHcGyA7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4CXGtNgGlsi3BRykGf2OPWR83kvdd5pQnCpor2YfRW4QD9HX3A7fkBCoRzx2k8P10VziieBpjc+GORispRyM0i5e1Q8cE+gfT9flgGqS4K0Vk6HOa+Vs6yjEYhmZLqXXXyqti9K/Fqgbjhcql9tRG/G0GV97MWNCMP4mLdDb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVzMyzdI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVzMyzdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727466282; x=1759002282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gc0+QPJl1FXV3TxwCC1Px1ljBfmTq4efNM5PHcGyA7A=;
  b=GVzMyzdIdzzIIgSDKDSmfqlBL3LsuAub7e5hgHdTlb1eDaIIG+LsMQQX
   VqEhDp2cJVbE3CsLf8Koi3gzNa+Vx8bjIKh2NUIrZ1YvDk7Txve6mtTwO
   7vGOQv3t2ui65vG94nynnRK4gaJzoaDZ4z6TuRMWS2a3vNARzxQ6VOeTF
   tdbBHIJf6XgwXi77ZCI+c9VZUDyg1xXyAnDNoF5GVK7HtuAWxbD0oV8sp
   n4u5FuMoAAydnbK5CG+Y9CVYrGs7i61tU0XXxWcUqtmkTgg+EcOVFu0MH
   kd2fCmqILt0zglUnXqG/pWX3BuGhvWXDsSnbg477TTCxt7XA51s2IygKo
   g==;
X-CSE-ConnectionGUID: kgggVGIPSJGkU9mbz6fbtA==
X-CSE-MsgGUID: mT+KG0noTj+hK3geBcbAcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52038921"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="52038921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 12:44:41 -0700
X-CSE-ConnectionGUID: MoqqpO3MRXK/orqQR8iQBg==
X-CSE-MsgGUID: xBW/owsJRPOCf4mXaPRsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="103411901"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2024 12:44:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suGtJ-000MXv-2N;
	Fri, 27 Sep 2024 19:44:37 +0000
Date: Sat, 28 Sep 2024 03:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1369/14216] mm/share_pool.c:3305:12: warning:
 'proc_usage_show' defined but not used
Message-ID: <202409280347.fIsKo3PM-lkp@intel.com>
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
head:   c9fe32fed709da98069e8215f6ecf39ea63f5355
commit: df165ba49e6e4ce8b4f6076aded3b92e19918b03 [1369/14216] mm/sharepool: Add proc interfaces to show sp info
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280347.fIsKo3PM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280347.fIsKo3PM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280347.fIsKo3PM-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   mm/share_pool.c:3234:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    3234 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~


vim +/proc_usage_show +3305 mm/share_pool.c

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
