Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFC2B9C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727505725; cv=none; b=cHgbjRfpGJ6V71M0sC/R2HVoF3aOgybJZxV7ipUEtriWDuXxL1rkjGpPD96vEm+76XAUK1XvzSAu7F9lYl6hJKrii2dRcHm1O43hhnpSQhUrQeFP7m5Fp3KHd7E5dXi4uLsYVHdJ9N6ywKVpOwIa/gp4jZLf5Ldpt9OCSPtXwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727505725; c=relaxed/simple;
	bh=o4+AVdFT1dClL8G93ADFW5HlVETjlKg8/xxLbYVxRhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e0XWGoX6mN2zC/bS3bwI+QaXfdadwJbpZPit5O/nHV9EDFnd4/LgaCUGjb0MvcX95o0QtoWhPspaY8AYnpY5yrCaUYK4abI0X72v3oDDSHf3z43eLzJ08KWWstujSYtwv9VUVf1jmGStIoTSPvaZs2OXKOGeKneabNBWwDxVSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYQU8wUE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYQU8wUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727505724; x=1759041724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4+AVdFT1dClL8G93ADFW5HlVETjlKg8/xxLbYVxRhA=;
  b=BYQU8wUEOIvfWppYFJwvLyi//sk2NOIkFlbIe5x8Byh0CRwMva9fS2hx
   Z0t5KLFU844SuKW1+1hO0qhzGK6bWohZmiySqJdADFyygBTFafWE53qPS
   GraUg7jmesTyAMwyvG+GOQa5/A1jI4aUGSndlo7Mqg0uJDARIWuXiwp8B
   2uYFCH5EOe5tKdQkXHfOK9TUIVK8bA4m3bpC9pRQWt70mWchRzdTj1EEp
   XwgG0GEEnORV6pi3rHL00IeqysF09JBfybZCCxpX0U/3cif9RaJ7byDpN
   qxYcvP2kPWUc7b8kv2qGG/qXR/D49NcX4GIB3XooABBYC3eRub747d1NO
   A==;
X-CSE-ConnectionGUID: r/2ozoU/TjKox7t1raDZQw==
X-CSE-MsgGUID: RAxKw3KKTdqbDgAfUFbwdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26604303"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26604303"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 23:42:03 -0700
X-CSE-ConnectionGUID: OWaUMHNLSNOtLrkyIhTydg==
X-CSE-MsgGUID: I+zsTO3rREaUcy+UECg/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72729466"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Sep 2024 23:42:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suR9T-000Myj-1a;
	Sat, 28 Sep 2024 06:41:59 +0000
Date: Sat, 28 Sep 2024 14:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18200/23799] mm/share_pool.c:1043:9:
 error: implicit declaration of function 'sysctl_compaction_handler'; did you
 mean 'sysctl_memcg_qos_handler'?
Message-ID: <202409281442.EoXjS7UC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: d45b33b72c530e64219ad997947a33f6e07d339c [18200/23799] share pool: Try to compact when memory is insufficient
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281442.EoXjS7UC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281442.EoXjS7UC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281442.EoXjS7UC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_compact_nodes':
>> mm/share_pool.c:1043:9: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'sysctl_memcg_qos_handler'? [-Werror=implicit-function-declaration]
    1043 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         sysctl_memcg_qos_handler
   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1772:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1772 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:1772:21: error: invalid initializer
   mm/share_pool.c: In function 'sharepool_no_page':
   mm/share_pool.c:2524:30: error: implicit declaration of function 'huge_pte_none'; did you mean 'huge_pte_lock'? [-Werror=implicit-function-declaration]
    2524 |                         if (!huge_pte_none(huge_ptep_get(ptep))) {
         |                              ^~~~~~~~~~~~~
         |                              huge_pte_lock
   mm/share_pool.c:2537:23: error: implicit declaration of function 'huge_add_to_page_cache'; did you mean 'add_to_page_cache'? [-Werror=implicit-function-declaration]
    2537 |                 err = huge_add_to_page_cache(page, mapping, idx);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       add_to_page_cache
   mm/share_pool.c:2559:9: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
    2559 |         set_huge_pte_at(mm, haddr, ptep, new_pte);
         |         ^~~~~~~~~~~~~~~
         |         set_huge_swap_pte_at
   mm/share_pool.c:2561:9: error: implicit declaration of function 'hugetlb_count_add'; did you mean 'hugetlb_count_sub'? [-Werror=implicit-function-declaration]
    2561 |         hugetlb_count_add(pages_per_huge_page(h), mm);
         |         ^~~~~~~~~~~~~~~~~
         |         hugetlb_count_sub
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:2597:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    2597 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
   mm/share_pool.c:2597:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    2597 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:2597:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2600:1: warning: control reaches end of non-void function [-Wreturn-type]
    2600 | }
         | ^
   mm/share_pool.c: At top level:
   mm/share_pool.c:2482:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2482 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   mm/share_pool.c:2363:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2363 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1043 mm/share_pool.c

  1039	
  1040	static unsigned long last_jiffies;
  1041	static void sp_compact_nodes(struct work_struct *work)
  1042	{
> 1043		sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
  1044	
  1045		kfree(work);
  1046	}
  1047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
