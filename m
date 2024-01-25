Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2C7464
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 01:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706147785; cv=none; b=qWv6bB7PTxMaa1O1dhkjIwcyY4qoUBRDVBiIoVRlAemGMq6DLBjZedVr8kVJkxtflK6dPh2Q+7Ukj65Srcb6tjdJJIO2Qd2vm2UJanqKlDRRjW8gS0n0jBOqGAq3R2TiXdzXrmikWYdzFFn4tVBAWiDmk9MX6xm/y5RRwRNji7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706147785; c=relaxed/simple;
	bh=leR+puY5kj2l/XER5HEY5FTe1UKSNJ3g8Oey/H4SGck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZ0MD13zlgP4KDU4BLhjUvCyUPAH4FCs4vTvs8dcgbFu1dSXKSevog991xeyOyscuW/wGeUHCBMSKdnpYyOSp6MNrL0DAw+j4LoZ3v63UL0jmjfl1NjHL77DqkamqrpuX+JSj3cCETXopGus70S+ueZoRgcpgyKGph+7ZoATPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqWo/ats; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqWo/ats"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706147784; x=1737683784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=leR+puY5kj2l/XER5HEY5FTe1UKSNJ3g8Oey/H4SGck=;
  b=OqWo/ats6OW69pWILvjpHaoD3zdpBufa5zf+PVvG5d7IgvUfVBhdvqBw
   i8rEtzSZWvCzGnMKDiTAOHhJkUw9py8OokkobXK6DSndoDIt3oHg2f4Rc
   kk+5B0TLxpougPv4S/59UAefjBT79OOt4CkAA2LLt/0mfTnlZVmmVvkjp
   9lbnuLGqikfGok5J/ahcbyS5d1nsguHLlMGPpkmZCQQkFe/QVYr5aM2Xx
   6+AZY51J1eaoJq3rYGOvxG8scYcvaD0jTZXJUHKMRK8ICaBWrLjUvqSFe
   BBY8eOsCL3ZjKW6K8IZdRKs3mURtU7x3Lfo/0T5I00A0gKBjAElMIvrod
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20584505"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20584505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 17:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856921772"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="856921772"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2024 17:56:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSoyX-0008Zd-31;
	Thu, 25 Jan 2024 01:56:17 +0000
Date: Thu, 25 Jan 2024 09:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1359/2707] mm/share_pool.c:1226:21: error:
 implicit declaration of function 'huge_ptep_get'
Message-ID: <202401250925.wptU5r3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e076c150c75c29fb99c2e7d8ae567b7ed6cce8b3
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [1359/2707] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240125/202401250925.wptU5r3b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250925.wptU5r3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250925.wptU5r3b-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
>> mm/share_pool.c:1226:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
>> mm/share_pool.c:1226:21: error: invalid initializer
   mm/share_pool.c: At top level:
   mm/share_pool.c:1005:13: warning: 'sp_area_put_locked' defined but not used [-Wunused-function]
    1005 | static void sp_area_put_locked(struct sp_area *spa)
         |             ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:944:24: warning: 'sp_area_get' defined but not used [-Wunused-function]
     944 | static struct sp_area *sp_area_get(struct sp_group *spg,
         |                        ^~~~~~~~~~~
   mm/share_pool.c:791:24: warning: 'sp_area_alloc' defined but not used [-Wunused-function]
     791 | static struct sp_area *sp_area_alloc(unsigned long size, unsigned long flags,
         |                        ^~~~~~~~~~~~~
   mm/share_pool.c:587:21: warning: 'spa_file' defined but not used [-Wunused-function]
     587 | static struct file *spa_file(struct sp_area *spa)
         |                     ^~~~~~~~
   mm/share_pool.c:582:22: warning: 'spa_size' defined but not used [-Wunused-function]
     582 | static unsigned long spa_size(struct sp_area *spa)
         |                      ^~~~~~~~
   mm/share_pool.c:497:13: warning: 'update_mem_usage_k2u' defined but not used [-Wunused-function]
     497 | static void update_mem_usage_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:485:13: warning: 'update_mem_usage_alloc' defined but not used [-Wunused-function]
     485 | static void update_mem_usage_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:438:12: warning: 'sp_group_setup_mapping_normal' defined but not used [-Wunused-function]
     438 | static int sp_group_setup_mapping_normal(struct mm_struct *mm, struct sp_group *spg)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:380:13: warning: 'sp_mapping_detach' defined but not used [-Wunused-function]
     380 | static void sp_mapping_detach(struct sp_group *spg, struct sp_mapping *spm)
         |             ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:237:13: warning: 'meminfo_init' defined but not used [-Wunused-function]
     237 | static void meminfo_init(struct sp_meminfo *meminfo)
         |             ^~~~~~~~~~~~
   In file included from mm/share_pool.c:26:
   mm/share_pool.c:76:19: warning: 'sp_group_idr' defined but not used [-Wunused-variable]
      76 | static DEFINE_IDR(sp_group_idr);
         |                   ^~~~~~~~~~~~
   include/linux/idr.h:56:44: note: in definition of macro 'DEFINE_IDR'
      56 | #define DEFINE_IDR(name)        struct idr name = IDR_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:73:12: warning: 'system_group_count' defined but not used [-Wunused-variable]
      73 | static int system_group_count;
         |            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/huge_ptep_get +1226 mm/share_pool.c

  1221	
  1222	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
  1223				    unsigned long addr, unsigned long next,
  1224				    struct mm_walk *walk)
  1225	{
> 1226		pte_t pte = huge_ptep_get(ptep);
  1227		struct page *page = pte_page(pte);
  1228		struct sp_walk_data *sp_walk_data;
  1229	
  1230		if (unlikely(!pte_present(pte))) {
  1231			pr_debug("the page of addr %lx unexpectedly not in RAM\n", (unsigned long)addr);
  1232			return -EFAULT;
  1233		}
  1234	
  1235		sp_walk_data = walk->private;
  1236		get_page(page);
  1237		sp_walk_data->pages[sp_walk_data->page_count++] = page;
  1238		return 0;
  1239	}
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
