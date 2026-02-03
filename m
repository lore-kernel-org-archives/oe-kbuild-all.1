Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287237F8B8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100376; cv=none; b=Qq6vF0HtDqy1pKaLvNYqXWqFKXzdRutOeQ5t6cJbdXP11PvoLNcQW/K18isbw2nZWdg9cOhaGrnwzz2JDgL0mnp9Eoes+5WHGrXU8Ab2a7rPA7NYJnG0tregAN+uaMXKT7Up9vOO16pVm+k8JWRhBP3wZ6gzbopnJ+IirM/LRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100376; c=relaxed/simple;
	bh=bbRpxtdvAN6Almr7Ilsz7KDIEVA2KjyHmdEG720mlAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6NH1QF2ZFDNdHTetNpdzE1PCrAywIKyZj5WBzt+BQ1hEyyqYnf2J7annMeKfy/+jqgM5g08PF+xqWUFU7o3p6PE1RAyzebyz4WOOgFFGiZPBwfWX4jkqaFe4DKF5/B/seqnjROTCn82kBrEE44i3+IQsTbKhkkPadDRrtzpBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kebXiWFP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kebXiWFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770100374; x=1801636374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bbRpxtdvAN6Almr7Ilsz7KDIEVA2KjyHmdEG720mlAs=;
  b=kebXiWFPoopvBLGmqnwl8NsMr9P6BuENv3RW5ReWTYYifjpRm0Q0nJlc
   uObmKBhbwYE6pBG0p4RR1TnEXeFXJGD/BwW0gGYC9qaG1Fspesqlp/wtB
   IbUXtjK2H2MsS2s4NjaDuzNXt5HXqAXx/ZRROzUGy0PNraIumGaE7ETUW
   AygRFL78O8lVEP8nZQBFhJC8Dlz//UA4UuYsY6J29RCk6toj4pvOUtgfd
   9aQcix7rcYSvH6sy0u5J4GA4dW+saGOc/+txp5M2egJwlvkLn4ZqqfZG3
   775Chg5yW3gpaDgYzfxvVD4xY9zCka6GacO/C9F81+9m0rcEM8bDDVAYT
   A==;
X-CSE-ConnectionGUID: m8FkIcpXRvify2iwlzYFKw==
X-CSE-MsgGUID: 0pFGjJqBTuK4gxf4W7ZWxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="93918122"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="93918122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 22:32:54 -0800
X-CSE-ConnectionGUID: Ye7mVCl3RIupOvhMgTD0Gg==
X-CSE-MsgGUID: fXPNwjQ5Tn6S6RGQuGTtTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214713889"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2026 22:32:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn9xw-00000000gLa-0VMZ;
	Tue, 03 Feb 2026 06:32:48 +0000
Date: Tue, 3 Feb 2026 14:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202602031458.obPf0uoY-lkp@intel.com>
References: <20260202112622.2104213-2-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202112622.2104213-2-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 18f7fcd5e69a04df57b563360b88be72471d6b62]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260202-192748
base:   18f7fcd5e69a04df57b563360b88be72471d6b62
patch link:    https://lore.kernel.org/r/20260202112622.2104213-2-mpenttil%40redhat.com
patch subject: [PATCH v4 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: x86_64-randconfig-101-20260202 (https://download.01.org/0day-ci/archive/20260203/202602031458.obPf0uoY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031458.obPf0uoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031458.obPf0uoY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/hmm.o: in function `hmm_vma_walk_pmd':
>> mm/hmm.c:1028:(.text+0x21ab): undefined reference to `hmm_vma_handle_pmd'


vim +1028 mm/hmm.c

   936	
   937	static int hmm_vma_walk_pmd(pmd_t *pmdp,
   938				    unsigned long start,
   939				    unsigned long end,
   940				    struct mm_walk *walk)
   941	{
   942		struct hmm_vma_walk *hmm_vma_walk = walk->private;
   943		struct hmm_range *range = hmm_vma_walk->range;
   944		unsigned long *hmm_pfns =
   945			&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
   946		unsigned long npages = (end - start) >> PAGE_SHIFT;
   947		struct mm_struct *mm = walk->vma->vm_mm;
   948		unsigned long addr = start;
   949		enum migrate_vma_info minfo;
   950		unsigned long i;
   951		pte_t *ptep;
   952		pmd_t pmd;
   953		int r = 0;
   954	
   955		minfo = hmm_select_migrate(range);
   956	
   957	again:
   958		hmm_vma_walk->ptelocked = false;
   959		hmm_vma_walk->pmdlocked = false;
   960	
   961		if (minfo) {
   962			hmm_vma_walk->ptl = pmd_lock(mm, pmdp);
   963			hmm_vma_walk->pmdlocked = true;
   964			pmd = pmdp_get(pmdp);
   965		} else
   966			pmd = pmdp_get_lockless(pmdp);
   967	
   968		if (pmd_none(pmd)) {
   969			r = hmm_vma_walk_hole(start, end, -1, walk);
   970	
   971			if (hmm_vma_walk->pmdlocked) {
   972				spin_unlock(hmm_vma_walk->ptl);
   973				hmm_vma_walk->pmdlocked = false;
   974			}
   975			return r;
   976		}
   977	
   978		if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
   979			if (!minfo) {
   980				if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
   981					hmm_vma_walk->last = addr;
   982					pmd_migration_entry_wait(walk->mm, pmdp);
   983					return -EBUSY;
   984				}
   985			}
   986			for (i = 0; addr < end; addr += PAGE_SIZE, i++)
   987				hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
   988	
   989			if (hmm_vma_walk->pmdlocked) {
   990				spin_unlock(hmm_vma_walk->ptl);
   991				hmm_vma_walk->pmdlocked = false;
   992			}
   993	
   994			return 0;
   995		}
   996	
   997		if (pmd_trans_huge(pmd) || !pmd_present(pmd)) {
   998	
   999			if (!pmd_present(pmd)) {
  1000				r = hmm_vma_handle_absent_pmd(walk, start, end, hmm_pfns,
  1001							      pmd);
  1002				// If not migrating we are done
  1003				if (r || !minfo) {
  1004					if (hmm_vma_walk->pmdlocked) {
  1005						spin_unlock(hmm_vma_walk->ptl);
  1006						hmm_vma_walk->pmdlocked = false;
  1007					}
  1008					return r;
  1009				}
  1010			} else {
  1011	
  1012				/*
  1013				 * No need to take pmd_lock here if not migrating,
  1014				 * even if some other thread is splitting the huge
  1015				 * pmd we will get that event through mmu_notifier callback.
  1016				 *
  1017				 * So just read pmd value and check again it's a transparent
  1018				 * huge or device mapping one and compute corresponding pfn
  1019				 * values.
  1020				 */
  1021	
  1022				if (!minfo) {
  1023					pmd = pmdp_get_lockless(pmdp);
  1024					if (!pmd_trans_huge(pmd))
  1025						goto again;
  1026				}
  1027	
> 1028				r = hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
  1029	
  1030				// If not migrating we are done
  1031				if (r || !minfo) {
  1032					if (hmm_vma_walk->pmdlocked) {
  1033						spin_unlock(hmm_vma_walk->ptl);
  1034						hmm_vma_walk->pmdlocked = false;
  1035					}
  1036					return r;
  1037				}
  1038			}
  1039	
  1040			r = hmm_vma_handle_migrate_prepare_pmd(walk, pmdp, start, end, hmm_pfns);
  1041	
  1042			if (hmm_vma_walk->pmdlocked) {
  1043				spin_unlock(hmm_vma_walk->ptl);
  1044				hmm_vma_walk->pmdlocked = false;
  1045			}
  1046	
  1047			if (r == -ENOENT) {
  1048				r = hmm_vma_walk_split(pmdp, addr, walk);
  1049				if (r) {
  1050					/* Split not successful, skip */
  1051					return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
  1052				}
  1053	
  1054				/* Split successful or "again", reloop */
  1055				hmm_vma_walk->last = addr;
  1056				return -EBUSY;
  1057			}
  1058	
  1059			return r;
  1060	
  1061		}
  1062	
  1063		if (hmm_vma_walk->pmdlocked) {
  1064			spin_unlock(hmm_vma_walk->ptl);
  1065			hmm_vma_walk->pmdlocked = false;
  1066		}
  1067	
  1068		/*
  1069		 * We have handled all the valid cases above ie either none, migration,
  1070		 * huge or transparent huge. At this point either it is a valid pmd
  1071		 * entry pointing to pte directory or it is a bad pmd that will not
  1072		 * recover.
  1073		 */
  1074		if (pmd_bad(pmd)) {
  1075			if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
  1076				return -EFAULT;
  1077			return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
  1078		}
  1079	
  1080		if (minfo) {
  1081			ptep = pte_offset_map_lock(mm, pmdp, addr, &hmm_vma_walk->ptl);
  1082			if (ptep)
  1083				hmm_vma_walk->ptelocked = true;
  1084		} else
  1085			ptep = pte_offset_map(pmdp, addr);
  1086		if (!ptep)
  1087			goto again;
  1088	
  1089		for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
  1090	
  1091			r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
  1092			if (r) {
  1093				/* hmm_vma_handle_pte() did pte_unmap() / pte_unmap_unlock */
  1094				return r;
  1095			}
  1096	
  1097			r = hmm_vma_handle_migrate_prepare(walk, pmdp, ptep, addr, hmm_pfns);
  1098			if (r == -EAGAIN) {
  1099				HMM_ASSERT_UNLOCKED(hmm_vma_walk);
  1100				goto again;
  1101			}
  1102			if (r) {
  1103				hmm_pfns_fill(addr, end, hmm_vma_walk, HMM_PFN_ERROR);
  1104				break;
  1105			}
  1106		}
  1107	
  1108		if (hmm_vma_walk->ptelocked) {
  1109			pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
  1110			hmm_vma_walk->ptelocked = false;
  1111		} else
  1112			pte_unmap(ptep - 1);
  1113	
  1114		return 0;
  1115	}
  1116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
