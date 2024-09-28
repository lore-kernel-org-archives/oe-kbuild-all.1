Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CB15A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727514429; cv=none; b=UYzKXTRyujzcpMIFGphddhaX+yQxFbN765mn6Ql54jt623srvSDIBikq0Gtfw67QFXBHnzHKtpvfA2fgyFTYaco8SAPqTpmMg7c+B3XnSY9nvcp1QhJq5RtNQrzCsDESBeKXzgIXJFubJvH7eqBULu6WTltpE1H34G9IE90Blzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727514429; c=relaxed/simple;
	bh=DenAvL7vYvq0AKHVs7bx+5/NZeLxoxqWLrU34ARh9GI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnDAaLv61+Mj9fQSI5hfxQ8UYJrTm4A2uz/7ANRntQMTQo5SUjigMuP/jRxVyFBo3IUPyKJwkwUx4C6Ghi6ZTgUYlRm0PgRnl+DSvtNjlc6cob6YyhFkjroVYwdQS5UQYrsinHefRMJGZPG6F4T1uTbxROml/JvyJTYEGiipmS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0w7esjt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0w7esjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727514429; x=1759050429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DenAvL7vYvq0AKHVs7bx+5/NZeLxoxqWLrU34ARh9GI=;
  b=b0w7esjtX5Fx7dDsCBE7NjYB/zDqdWEeGGAjFtWtPGazYIRmn+VPvifG
   ziPP5oyB+A7ZP/H09rL1NfhDbcpvLQ6ax4d/bReEA4a9mmhQ+Tjw2ePp0
   T8LCZXz0kcI+9WYMMgJgQCQ3KG5IEXGWDuyCev6sMyMKF852sYZwZejx5
   0fekw0vgI6J/eSQzYTSzjH0NlHVv+D3eFA2mlPb90iz3i3TXFKIdli7eP
   FWkir0yJnCFXh9a7kOkyTL9VOHOibGUkGTVcLASpSQlunvaoAd9uLB3MU
   Wh1E7OtwWSnm5A+eRIidCk8ZeN1yG6bY7pyBFR0GMIPkLlP2bG3KebyZm
   w==;
X-CSE-ConnectionGUID: BTRjC1nGRwyBJ3U13Jy2Cg==
X-CSE-MsgGUID: ffO4xz26RpaGwmClkvg2kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26608793"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26608793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:07:08 -0700
X-CSE-ConnectionGUID: 9XQ4J46bSSy2JgbyzSKsVQ==
X-CSE-MsgGUID: 2pAA5hz2Q/yJRcX5RnjLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72840870"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 02:07:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suTPs-000N4r-0r;
	Sat, 28 Sep 2024 09:07:04 +0000
Date: Sat, 28 Sep 2024 17:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18309/23799] mm/share_pool.c:3736:12:
 warning: 'proc_overview_show' defined but not used
Message-ID: <202409281617.XJYO7emb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 1cfc25ccec44c17c19c892bd31d00d8f6fb23f9b [18309/23799] share_pool: Add proc node to show process overview info
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281617.XJYO7emb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281617.XJYO7emb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281617.XJYO7emb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_group_id_by_pid':
   mm/share_pool.c:840:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     840 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_compact_nodes':
   mm/share_pool.c:1689:9: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'sysctl_memcg_qos_handler'? [-Werror=implicit-function-declaration]
    1689 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         sysctl_memcg_qos_handler
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:2688:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    2688 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:2688:21: error: invalid initializer
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:3824:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    3824 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:3837:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    3837 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:3859:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    3859 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:3861:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    3861 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c:3797:13: warning: variable 'node_id' set but not used [-Wunused-but-set-variable]
    3797 |         int node_id;
         |             ^~~~~~~
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:4018:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    4018 |                 page = hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
   mm/share_pool.c:4018:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    4018 |                 page = hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:4018:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c: At top level:
>> mm/share_pool.c:3736:12: warning: 'proc_overview_show' defined but not used [-Wunused-function]
    3736 | static int proc_overview_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:3693:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    3693 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:3635:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    3635 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/proc_overview_show +3736 mm/share_pool.c

  3735	
> 3736	static int proc_overview_show(struct seq_file *seq, void *offset)
  3737	{
  3738		seq_printf(seq, "%-8s %-16s %-9s %-9s %-9s %-10s %-10s %-8s\n",
  3739			   "PID", "COMM", "SP_ALLOC", "SP_K2U", "SP_RES", "Non-SP_RES",
  3740			   "Non-SP_Shm", "VIRT");
  3741	
  3742		down_read(&sp_proc_stat_sem);
  3743		idr_for_each(&sp_proc_stat_idr, idr_proc_overview_cb, seq);
  3744		up_read(&sp_proc_stat_sem);
  3745		return 0;
  3746	}
  3747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
