Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAC2C129
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696146658; x=1727682658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsoyHeB866EgMNIu7KGOTfSoODZHbPbSow/Bo4THg24=;
  b=AH3b86SOXR3/VhiE0IA61B2LwPumkt50jLdBufik24HvbZEke0BWV0mP
   yni1DLylzxs972WYp29FxmvzBzHNTZVWX2+irUIyTcf8H63kIfJdCLfXv
   CV0CzgnBv26hJiQfmuuD6a3HONip+Q1l7cx2CQIcYxSTweDxDx0wnECen
   8DLF1YEpkx/IOZmP0BgNpSeUaPwzvTJ4gUJ03PFx6wi0a4Jc/7zxZMWgS
   hiMphNBCpXg9IGAfdCTRx/oL9DUiDZyIKFM8OHeQAphfpU1besIG4P7pR
   7R0ajJ3pv+aXuHIHN7pya9gYa887oKNDOctzCQS9vzilOrGro07b6tNct
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="361880720"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="361880720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 00:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="785492152"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="785492152"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Oct 2023 00:50:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmrE2-0004tn-2W;
	Sun, 01 Oct 2023 07:50:50 +0000
Date: Sun, 1 Oct 2023 15:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [linux-next:master 8148/8790] fs/proc/task_mmu.c:2105:17: error:
 implicit declaration of function 'pagemap_scan_backout_range'; did you mean
 'pagemap_scan_push_range'?
Message-ID: <202310011545.iHTT4Y7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
commit: 588d06cd90cfb015926def2469ab99f3c72a205d [8148/8790] fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-2
config: x86_64-randconfig-005-20231001 (https://download.01.org/0day-ci/archive/20231001/202310011545.iHTT4Y7S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011545.iHTT4Y7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011545.iHTT4Y7S-lkp@intel.com/

Note: the linux-next/master HEAD df964ce9ef9fea10cf131bf6bad8658fde7956f6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'pagemap_scan_thp_entry':
>> fs/proc/task_mmu.c:2105:17: error: implicit declaration of function 'pagemap_scan_backout_range'; did you mean 'pagemap_scan_push_range'? [-Werror=implicit-function-declaration]
    2105 |                 pagemap_scan_backout_range(p, start, end);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pagemap_scan_push_range
   cc1: some warnings being treated as errors


vim +2105 fs/proc/task_mmu.c

fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2068  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2069  static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2070  				  unsigned long end, struct mm_walk *walk)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2071  {
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2072  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2073  	struct pagemap_scan_private *p = walk->private;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2074  	struct vm_area_struct *vma = walk->vma;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2075  	unsigned long categories;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2076  	spinlock_t *ptl;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2077  	int ret = 0;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2078  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2079  	ptl = pmd_trans_huge_lock(pmd, vma);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2080  	if (!ptl)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2081  		return -ENOENT;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2082  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2083  	categories = p->cur_vma_category |
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2084  		     pagemap_thp_category(p, vma, start, *pmd);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2085  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2086  	if (!pagemap_scan_is_interesting_page(categories, p))
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2087  		goto out_unlock;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2088  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2089  	ret = pagemap_scan_output(categories, p, start, &end);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2090  	if (start == end)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2091  		goto out_unlock;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2092  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2093  	if (~p->arg.flags & PM_SCAN_WP_MATCHING)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2094  		goto out_unlock;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2095  	if (~categories & PAGE_IS_WRITTEN)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2096  		goto out_unlock;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2097  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2098  	/*
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2099  	 * Break huge page into small pages if the WP operation
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2100  	 * needs to be performed on a portion of the huge page.
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2101  	 */
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2102  	if (end != start + HPAGE_SIZE) {
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2103  		spin_unlock(ptl);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2104  		split_huge_pmd(vma, pmd, start);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21 @2105  		pagemap_scan_backout_range(p, start, end);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2106  		/* Report as if there was no THP */
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2107  		return -ENOENT;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2108  	}
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2109  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2110  	make_uffd_wp_pmd(vma, start, pmd);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2111  	flush_tlb_range(vma, start, end);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2112  out_unlock:
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2113  	spin_unlock(ptl);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2114  	return ret;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2115  #else /* !CONFIG_TRANSPARENT_HUGEPAGE */
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2116  	return -ENOENT;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2117  #endif
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2118  }
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2119  

:::::: The code at line 2105 was first introduced by commit
:::::: fef1d15288b455d957cdee6ebf8118b525872bde fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs

:::::: TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
