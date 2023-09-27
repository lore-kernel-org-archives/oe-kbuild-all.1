Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE011CA85
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695806480; x=1727342480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTrvGAiWWvoe77pGJKgq4GVaHuSl9pP0HCD46s023sM=;
  b=kQiwwIZ/2zpFrbjwjfYRKrpJDNlCTHzFcG4MLkchUWy/lUWklB1bY8Ti
   KiFgqOUehzOUNUJ0cQ6VX3djFT6wBQiLKNXtILqVdgWFRNg3+9WLhe5MY
   OtI28LTu2Vus1cKjbhWpauvHsicJ0Y+suu5TI1i6xwQC0UKjtHbwl5+Hm
   CbJtv5MP2lnavmX4LmD5D5+gEsMsNjZmWiplyt75h0nCjSpvrWnve7zc5
   C4/jtp2OSdDdIQ/KMSzG78xR53rQXWzRlGpGV8GZbtGeCfwmcgto3Eu6q
   m1BGP4fWMdaPWmlIW0/VrFuwRZPw4BXduMEjwnZOy8WldyoxI9/J1NzLO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366839182"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="366839182"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819357233"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="819357233"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 02:21:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlQjL-00002E-2i;
	Wed, 27 Sep 2023 09:21:15 +0000
Date: Wed, 27 Sep 2023 17:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [linux-next:master 8126/8345] fs/proc/task_mmu.c:2105:3: error:
 implicit declaration of function 'pagemap_scan_backout_range'; did you mean
 'pagemap_scan_push_range'?
Message-ID: <202309271719.sXq960r2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18030226a48de1fbfabf4ae16aaa2695a484254f
commit: 9ce57107e2c4448860ac500e6080f576fabc7081 [8126/8345] fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-2
config: i386-randconfig-003-20230927 (https://download.01.org/0day-ci/archive/20230927/202309271719.sXq960r2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271719.sXq960r2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271719.sXq960r2-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'pagemap_scan_thp_entry':
>> fs/proc/task_mmu.c:2105:3: error: implicit declaration of function 'pagemap_scan_backout_range'; did you mean 'pagemap_scan_push_range'? [-Werror=implicit-function-declaration]
      pagemap_scan_backout_range(p, start, end);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      pagemap_scan_push_range
   cc1: some warnings being treated as errors


vim +2105 fs/proc/task_mmu.c

3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2068  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2069  static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2070  				  unsigned long end, struct mm_walk *walk)
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2071  {
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2072  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2073  	struct pagemap_scan_private *p = walk->private;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2074  	struct vm_area_struct *vma = walk->vma;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2075  	unsigned long categories;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2076  	spinlock_t *ptl;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2077  	int ret = 0;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2078  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2079  	ptl = pmd_trans_huge_lock(pmd, vma);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2080  	if (!ptl)
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2081  		return -ENOENT;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2082  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2083  	categories = p->cur_vma_category |
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2084  		     pagemap_thp_category(p, vma, start, *pmd);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2085  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2086  	if (!pagemap_scan_is_interesting_page(categories, p))
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2087  		goto out_unlock;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2088  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2089  	ret = pagemap_scan_output(categories, p, start, &end);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2090  	if (start == end)
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2091  		goto out_unlock;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2092  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2093  	if (~p->arg.flags & PM_SCAN_WP_MATCHING)
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2094  		goto out_unlock;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2095  	if (~categories & PAGE_IS_WRITTEN)
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2096  		goto out_unlock;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2097  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2098  	/*
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2099  	 * Break huge page into small pages if the WP operation
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2100  	 * needs to be performed on a portion of the huge page.
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2101  	 */
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2102  	if (end != start + HPAGE_SIZE) {
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2103  		spin_unlock(ptl);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2104  		split_huge_pmd(vma, pmd, start);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21 @2105  		pagemap_scan_backout_range(p, start, end);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2106  		/* Report as if there was no THP */
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2107  		return -ENOENT;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2108  	}
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2109  
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2110  	make_uffd_wp_pmd(vma, start, pmd);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2111  	flush_tlb_range(vma, start, end);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2112  out_unlock:
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2113  	spin_unlock(ptl);
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2114  	return ret;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2115  #else /* !CONFIG_TRANSPARENT_HUGEPAGE */
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2116  	return -ENOENT;
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2117  #endif
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2118  }
3fa00ae945d61a Muhammad Usama Anjum 2023-08-21  2119  

:::::: The code at line 2105 was first introduced by commit
:::::: 3fa00ae945d61a07a53f7609dc86e7c832d7c535 fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs

:::::: TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
