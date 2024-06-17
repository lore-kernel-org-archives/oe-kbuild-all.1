Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90641922D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661135; cv=none; b=pLFx3uYhhAsYpsQXAB3Nk2qZRdie+nXtSL2ZmgAccaggUummLJ0bu1h/NoC7PilN+aditFvG+stNxi0JG6UmwPn/xxhFK3rF8nmn/imFiPule5cBGEP5FCnmaHC57epLTmvYJ+5z5Cj1VyWcuXyzUlaVwyGSFFac2iP8QyHqMTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661135; c=relaxed/simple;
	bh=F4XaBSa3qkaUnHKgYWTUMWoi9PlUjVKot/bqXtUs6CU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIqVQhBYCTiUsSXEK0PAjmeuhauWKLpX2cI/9Ebn6bLINPltteig7FleBpOYdZzn2uY9qJRyZ5DLxsylwAKz7OFoKQ9XqH7vbFXa2TRxyJs5DbgTFImkxLmdl2QrfTh016oJERleDYWD6EuqCea8httkwfuHBI0rOiIWLMtvrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iszVw8At; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iszVw8At"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718661134; x=1750197134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4XaBSa3qkaUnHKgYWTUMWoi9PlUjVKot/bqXtUs6CU=;
  b=iszVw8AtFkHIlWFRD4lAzc2jfUPEkSyHXxL4A0RHrAj7Q/9dleRZ0h9L
   Q8xmGBKWbhxSUXHsK0hYujUO3PV3q7SEZgUNxrVB6ht9L3btH+y/SZm+v
   Mp1CG6AfmrbuLFVq1nWYLPilunf/HlgL71/hERsu9tyubFxW3fJgXT/kc
   eA5RAP16Xc/ZqiSy+wNoiELMmiu9WBn09DZ1w4KmM8dY87Aiu9oGQ/ZfF
   WUEDFv2rwdkb6SOCLP26A250iZfi5201aRwBa/fm3gi+ueQjG36t20/Gv
   +bzeXUJphpLDqn91+UXfmwGhypP95W8fvRKMWidJY/85vGwBYquUyJ785
   g==;
X-CSE-ConnectionGUID: pKA8yw5QRb+2x8GJ95dGZg==
X-CSE-MsgGUID: r/hRKZUhQ12Q+QJjG/boCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33047215"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="33047215"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 14:52:09 -0700
X-CSE-ConnectionGUID: dczuAVbsQNy4RvbzP61InQ==
X-CSE-MsgGUID: 3LyAkr+uT02bJ8tGJcSLKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41439882"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2024 14:52:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJKGj-0004uf-26;
	Mon, 17 Jun 2024 21:52:05 +0000
Date: Tue, 18 Jun 2024 05:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18309/22959] mm/share_pool.c:3736:12:
 warning: 'proc_overview_show' defined but not used
Message-ID: <202406180519.p1XL1enF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f79871cf083fa1da67dce06a8cc2301cdddeab1b
commit: 1cfc25ccec44c17c19c892bd31d00d8f6fb23f9b [18309/22959] share_pool: Add proc node to show process overview info
config: arm64-randconfig-001-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180519.p1XL1enF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180519.p1XL1enF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180519.p1XL1enF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_group_id_by_pid':
   mm/share_pool.c:840:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     840 |         if (!spg_ids || num <= 0)
         |                             ^~
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
