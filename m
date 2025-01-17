Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C551F5618
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737086326; cv=none; b=tta1R4dXtcm7dxnVgklGHz/PXvWFEWmh9r6wuv1WdZ+C7VAtMXETppA0JBq+xxNd+KClID/mCHCmz4rfpfGf47dlEkTLcXSpd0elu2hbgWgShBwawd4lJlUI1w9dh10GoODlSpnXlMTxGOe6Ret0XyZ4R003Be4cVKf0zD/7+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737086326; c=relaxed/simple;
	bh=dxeKnSYadml3z1u+MI/92hG6YquGsvsFrH8igZI2su0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2pg9dYGrbfOO3BtN2NiF4YmmBxPBFA9vRb2WpgNkvRkQ72UAnF+n3cAPALGDQcfRMTgIeasCuUxGaMChjzVmCis7/iEqlmIOYC6ENhL7Gry/O0tzY9dYFSye/LZoAfreTBNHXyV8wBtZKhmxY+sjN4foj6HGHaVv58idHTYz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj81fLvl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj81fLvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737086323; x=1768622323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dxeKnSYadml3z1u+MI/92hG6YquGsvsFrH8igZI2su0=;
  b=Dj81fLvlHGoakM1I05/4IHScCYHq0z9Q++Ly2Lv1Vb0qxRwxXDTUMSRU
   3cs7N0gSSRd8yQuuQ8xrnGNYvTUHWUszLdKem/R0iUWi8fTmzE+mpkbBL
   Eyve2wXHne+lUSZO2M3D8zHG73XNpRvwF/olhcqSuMCzm4DfVouvy/uIS
   JUp7ouW4Q2QnCw9Hvo6RzmbxKp7s0fpbT8uEThqOkhgtj1oH7u4pOjpR9
   RhSNROC6GS1APabehCvUPUrikRBaqAVtS4/NU+sV5hO0rqc7sk/HisQMa
   XeM0mPOSggQjTMs28uy4XYl+UdGJoQXeMnak74JPZTNjP/uGbkWLFSXSw
   A==;
X-CSE-ConnectionGUID: OX3yu78zT5GaDJIpG/LoMQ==
X-CSE-MsgGUID: tAb492lJR/Wgz5LAGeuc/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48901309"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="48901309"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:58:42 -0800
X-CSE-ConnectionGUID: f1KlbLIeQaCufMVC028g0g==
X-CSE-MsgGUID: 5aGLNWazRc+R1lc7NsJbjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105537063"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2025 19:58:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYdVF-000SjH-2y;
	Fri, 17 Jan 2025 03:58:37 +0000
Date: Fri, 17 Jan 2025 11:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
	david@redhat.com, osalvador@suse.de, nao.horiguchi@gmail.com,
	linmiaohe@huawei.com, mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, mawupeng1@huawei.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside
 unmap_poisoned_folio
Message-ID: <202501171300.SYkofFQ6-lkp@intel.com>
References: <20250116061657.227027-2-mawupeng1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116061657.227027-2-mawupeng1@huawei.com>

Hi Wupeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wupeng-Ma/mm-memory-failure-update-ttu-flag-inside-unmap_poisoned_folio/20250116-142614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250116061657.227027-2-mawupeng1%40huawei.com
patch subject: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside unmap_poisoned_folio
config: s390-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171300.SYkofFQ6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171300.SYkofFQ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171300.SYkofFQ6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/page_isolation.c:13:
>> mm/internal.h:1142:1: error: expected identifier or '(' before '{' token
    1142 | {
         | ^
>> mm/internal.h:1141:19: warning: 'unmap_poisoned_folio' declared 'static' but never defined [-Wunused-function]
    1141 | static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
         |                   ^~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/damon/paddr.c:19:
>> mm/damon/../internal.h:1142:1: error: expected identifier or '(' before '{' token
    1142 | {
         | ^
>> mm/damon/../internal.h:1141:19: warning: 'unmap_poisoned_folio' declared 'static' but never defined [-Wunused-function]
    1141 | static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +1142 mm/internal.h

31d3d3484f9bd2 Wu Fengguang            2009-12-16  1121  
7c116f2b0dbac4 Wu Fengguang            2009-12-16  1122  extern u32 hwpoison_filter_dev_major;
7c116f2b0dbac4 Wu Fengguang            2009-12-16  1123  extern u32 hwpoison_filter_dev_minor;
478c5ffc0b5052 Wu Fengguang            2009-12-16  1124  extern u64 hwpoison_filter_flags_mask;
478c5ffc0b5052 Wu Fengguang            2009-12-16  1125  extern u64 hwpoison_filter_flags_value;
4fd466eb46a6a9 Andi Kleen              2009-12-16  1126  extern u64 hwpoison_filter_memcg;
1bfe5febe34d2b Haicheng Li             2009-12-16  1127  extern u32 hwpoison_filter_enable;
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1128  #define MAGIC_HWPOISON	0x48575053U	/* HWPS */
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1129  void SetPageHWPoisonTakenOff(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1130  void ClearPageHWPoisonTakenOff(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1131  bool take_page_off_buddy(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1132  bool put_page_back_buddy(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1133  struct task_struct *task_early_kill(struct task_struct *tsk, int force_early);
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1134) void add_to_kill_ksm(struct task_struct *tsk, const struct page *p,
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1135  		     struct vm_area_struct *vma, struct list_head *to_kill,
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1136  		     unsigned long ksm_addr);
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1137) unsigned long page_mapped_in_vma(const struct page *page,
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1138) 		struct vm_area_struct *vma);
eb36c5873b96e8 Al Viro                 2012-05-30  1139  
16038c4fffd802 Kefeng Wang             2024-08-27  1140  #else
2b5df10a15dc74 Ma Wupeng               2025-01-16 @1141  static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
16038c4fffd802 Kefeng Wang             2024-08-27 @1142  {
2b5df10a15dc74 Ma Wupeng               2025-01-16  1143  	return -EBUSY;
16038c4fffd802 Kefeng Wang             2024-08-27  1144  }
16038c4fffd802 Kefeng Wang             2024-08-27  1145  #endif
16038c4fffd802 Kefeng Wang             2024-08-27  1146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
