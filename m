Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481F25765
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737894393; cv=none; b=AkZWr425b4n279tpXXvmO2cWPixutw2nDfH5evxThxGw3JrwUnBaHMTK++ASSX8r5wtldlJSF8bkX1llsePnUF2ODsS7wOYpFn8o9ddctkJyeLIDLeXEjmYOQFGBywDzYGbF1T/0xP8eQ0RVTV+TcGTIYvPNkhTRDaR1Ut94xKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737894393; c=relaxed/simple;
	bh=oLPG594PFIEsR+E/hlfwXyhqFX+QnfKLxyVmKlUGCJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2edCH+bwHSGJt+I/Oja4n3s+mO8MvY60I37CvbiGyTgfRaXucgaDLnZ5ivhilcoas/c00tOzPxnTrVJ/FrBWLUaXPBswTB3C1Gn85tLApfBGshZ684IMDoO+ai6X34laX9aWO/d7/tldh95Mn01zKMnTKHSbymnpNCNn5LV6D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJysUtlT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJysUtlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737894390; x=1769430390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLPG594PFIEsR+E/hlfwXyhqFX+QnfKLxyVmKlUGCJk=;
  b=gJysUtlTmM1Ihmn0gFJE6scE0xndbYbBWrlhQiQpSfXiON41t6dJD8al
   XGZVaDPuK+21QCtG/F5cDZPpqPvhVtvBI8EKANYdO8VhWWsSRtpUvsmsF
   wcITN6TY2KSB5bmflPD34vbwzzJq7rW9WO+5LZWCR+EhpuOsbZiZHhiQQ
   PSnpJD6uxmopwNnYPb2SVOuNmnsB/JLIFspD6sOAksuLR0vEVswxAxqml
   KvpctCAbausYy7Nxkmvhe1QTGvjG6iCN8fpAjuDcNj98ysKD65LoT+66c
   D2umPFkWmMtzUQEUJoh+G7P3N9JGgK3yxwedX0WpwX6mFvuOBHQ05MDLn
   A==;
X-CSE-ConnectionGUID: ah//MUaiQWa3uHHxgJu6zA==
X-CSE-MsgGUID: EM4YWNoxTkm6bq2iw92bbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38260339"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="38260339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 04:26:30 -0800
X-CSE-ConnectionGUID: nYkZwD/+SoyIk0ay9YRGew==
X-CSE-MsgGUID: tXvpZApPTs6/9XR64yfXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="113178471"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jan 2025 04:26:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc1id-000fLH-05;
	Sun, 26 Jan 2025 12:26:27 +0000
Date: Sun, 26 Jan 2025 20:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 0/1] mm/mempolicy.c:499:22: warning:
 variable 'mapped_pte' set but not used
Message-ID: <202501262022.K1QalLEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shijie,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   49530c73f82d0377a960e70d167621ca922d4d59
commit: c1f729c7dec0df04d62550d981af849f970a660d [0/1] mm: mempolicy: fix potential pte_unmap_unlock pte error
config: i386-randconfig-063-20250126 (https://download.01.org/0day-ci/archive/20250126/202501262022.K1QalLEn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501262022.K1QalLEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501262022.K1QalLEn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'queue_pages_pte_range':
>> mm/mempolicy.c:499:22: warning: variable 'mapped_pte' set but not used [-Wunused-but-set-variable]
     499 |         pte_t *pte, *mapped_pte;
         |                      ^~~~~~~~~~


vim +/mapped_pte +499 mm/mempolicy.c

   478	
   479	/*
   480	 * Scan through pages checking if pages follow certain conditions,
   481	 * and move them to the pagelist if they do.
   482	 *
   483	 * queue_pages_pte_range() has three possible return values:
   484	 * 0 - pages are placed on the right node or queued successfully.
   485	 * 1 - there is unmovable page, and MPOL_MF_MOVE* & MPOL_MF_STRICT were
   486	 *     specified.
   487	 * -EIO - only MPOL_MF_STRICT was specified and an existing page was already
   488	 *        on a node that does not follow the policy.
   489	 */
   490	static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
   491				unsigned long end, struct mm_walk *walk)
   492	{
   493		struct vm_area_struct *vma = walk->vma;
   494		struct page *page;
   495		struct queue_pages *qp = walk->private;
   496		unsigned long flags = qp->flags;
   497		int ret;
   498		bool has_unmovable = false;
 > 499		pte_t *pte, *mapped_pte;
   500		spinlock_t *ptl;
   501	
   502		ptl = pmd_trans_huge_lock(pmd, vma);
   503		if (ptl) {
   504			ret = queue_pages_pmd(pmd, ptl, addr, end, walk);
   505			if (ret != 2)
   506				return ret;
   507		}
   508		/* THP was split, fall through to pte walk */
   509	
   510		if (pmd_trans_unstable(pmd))
   511			return 0;
   512	
   513		mapped_pte = pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
   514		for (; addr != end; pte++, addr += PAGE_SIZE) {
   515			if (!pte_present(*pte))
   516				continue;
   517			page = vm_normal_page(vma, addr, *pte);
   518			if (!page)
   519				continue;
   520			/*
   521			 * vm_normal_page() filters out zero pages, but there might
   522			 * still be PageReserved pages to skip, perhaps in a VDSO.
   523			 */
   524			if (PageReserved(page))
   525				continue;
   526			if (!queue_pages_required(page, qp))
   527				continue;
   528			if (flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) {
   529				/* MPOL_MF_STRICT must be specified if we get here */
   530				if (!vma_migratable(vma)) {
   531					has_unmovable = true;
   532					break;
   533				}
   534	
   535				/*
   536				 * Do not abort immediately since there may be
   537				 * temporary off LRU pages in the range.  Still
   538				 * need migrate other LRU pages.
   539				 */
   540				if (migrate_page_add(page, qp->pagelist, flags))
   541					has_unmovable = true;
   542			} else
   543				break;
   544		}
   545		pte_unmap_unlock(mapped_pte, ptl);
   546		cond_resched();
   547	
   548		if (has_unmovable)
   549			return 1;
   550	
   551		return addr != end ? -EIO : 0;
   552	}
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
