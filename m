Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085D38551C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123624; cv=none; b=oBVC0Bspn/CtQffMryCUdFGuH3uBRupSlgxYiMDj3AHs2nNdTZ8QxG5naKj4+77dhJLnKHkMdE3p503oqIsnCukM0I44yJAEDy6baJQsVdS49qMBRJjS+tegsYDbzEznHp4KTCzOLt2Xensu0gQqQ/keL3fDNMyetlWS5qRe1XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123624; c=relaxed/simple;
	bh=iMGlWIjrjKOM9byoRGMO5IvTVtSTCA3fvDPyCji0eRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1Pbc4r4JeQJJ6Kb/lWt1bobj0qHUrsnvmD467uVJJ9Zj6QCCYZpA8Arj5ol/4150FAgXAsuRsrGPwvN/wprwvPjyGO6zHphzwu9rB3zABipWdiKHgHckkwcG7h8LlMMFZX6mnaJomtNlLNCmb2M0FBlGnUHAelwVRXrOvh5IUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyCBSz8k; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyCBSz8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772123622; x=1803659622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iMGlWIjrjKOM9byoRGMO5IvTVtSTCA3fvDPyCji0eRk=;
  b=AyCBSz8kNdTjEwmq9EFXhvy8mBvgBhhgg17CdHJzwykSwxVD7YFa9Ldk
   EQdH6QmBRTCOHKGS9BqQhDv4y66r983Dz5nNNmOP5hs64Di1gK8GtplcR
   iulN+G0L6hpKg1iOl/3Iy6lW0QKq1b3+W06Z+u/RrAYshfIyr/WWDTUSI
   YdiPiXraQ83s8bAH8kwAniDaGIEyjjgi+o9DqVOqNhZl8eKC8mKP0PfMy
   qfAnr7PBi92G/GgotxgdR2dk8ITLoR3jmT+LVes57fiX3BaVfuyOT50UU
   XyWC+MgaKOVVNX7J1+fHx59VAF4g2f/F2/QP54ZwhdmHT//DMSteYtcJR
   Q==;
X-CSE-ConnectionGUID: KOSoRrWUSk6RphknahvqIQ==
X-CSE-MsgGUID: Wh+Mk5TYRb+7p5PzBr0LeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73295426"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73295426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 08:33:41 -0800
X-CSE-ConnectionGUID: qJLs1G4rTiCyCwl7ayfAjg==
X-CSE-MsgGUID: +40kOeAyRsuVL8slTV+Yhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216742623"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2026 08:33:41 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vveIz-000000009eB-2UaW;
	Thu, 26 Feb 2026 16:33:37 +0000
Date: Fri, 27 Feb 2026 00:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 13/21] mm: huge_mm: Make sure all split_huge_pmd calls
 are checked
Message-ID: <202602270049.Hcnrxeen-lkp@intel.com>
References: <20260226113233.3987674-14-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226113233.3987674-14-usama.arif@linux.dev>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-thp-make-split_huge_pmd-functions-return-int-for-error-propagation/20260226-193910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260226113233.3987674-14-usama.arif%40linux.dev
patch subject: [RFC v2 13/21] mm: huge_mm: Make sure all split_huge_pmd calls are checked
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602270049.Hcnrxeen-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270049.Hcnrxeen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270049.Hcnrxeen-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'pagemap_scan_thp_entry':
>> fs/proc/task_mmu.c:2718:17: warning: ignoring return value of 'split_huge_pmd' declared with attribute 'warn_unused_result' [-Wunused-result]
    2718 |                 split_huge_pmd(vma, pmd, start);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2718 fs/proc/task_mmu.c

52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2682  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2683  static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2684  				  unsigned long end, struct mm_walk *walk)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2685  {
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2686  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2687  	struct pagemap_scan_private *p = walk->private;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2688  	struct vm_area_struct *vma = walk->vma;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2689  	unsigned long categories;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2690  	spinlock_t *ptl;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2691  	int ret = 0;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2692  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2693  	ptl = pmd_trans_huge_lock(pmd, vma);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2694  	if (!ptl)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2695  		return -ENOENT;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2696  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2697  	categories = p->cur_vma_category |
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2698  		     pagemap_thp_category(p, vma, start, *pmd);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2699  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2700  	if (!pagemap_scan_is_interesting_page(categories, p))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2701  		goto out_unlock;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2702  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2703  	ret = pagemap_scan_output(categories, p, start, &end);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2704  	if (start == end)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2705  		goto out_unlock;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2706  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2707  	if (~p->arg.flags & PM_SCAN_WP_MATCHING)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2708  		goto out_unlock;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2709  	if (~categories & PAGE_IS_WRITTEN)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2710  		goto out_unlock;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2711  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2712  	/*
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2713  	 * Break huge page into small pages if the WP operation
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2714  	 * needs to be performed on a portion of the huge page.
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2715  	 */
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2716  	if (end != start + HPAGE_SIZE) {
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2717  		spin_unlock(ptl);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21 @2718  		split_huge_pmd(vma, pmd, start);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2719  		pagemap_scan_backout_range(p, start, end);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2720  		/* Report as if there was no THP */
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2721  		return -ENOENT;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2722  	}
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2723  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2724  	make_uffd_wp_pmd(vma, start, pmd);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2725  	flush_tlb_range(vma, start, end);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2726  out_unlock:
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2727  	spin_unlock(ptl);
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2728  	return ret;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2729  #else /* !CONFIG_TRANSPARENT_HUGEPAGE */
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2730  	return -ENOENT;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2731  #endif
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2732  }
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2733  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
