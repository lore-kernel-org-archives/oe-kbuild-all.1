Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E43B18593A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 22:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733093512; cv=none; b=GgV/sN0iHQGayKizYz/a1sFylMqfQNcrddDpdWt8gKSQXGNZWMtMSXkDejYDwV/2M1q3r+R2wZadm8Eszxhpp+FbbpyhRubmx//wUxX+tEyZBlATaVpo9L1hPETZYerM+ENukYJc/Jt2EFRpJ8a0zPl5CCrw/62CU0UtAU7bWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733093512; c=relaxed/simple;
	bh=Be1CdargI1EEMYBP2WTOGfjpcRiMoBGpF8qXOuhzVDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOAhU4oZ10RVAVgboyRFoi+B8JXaxlnLoL25tW7wD3CRloy1N1WraBeuNVZMMSZEGPvLZ9RdHwZI/guGsjGB6BwP2qhssAXpyquXMNArjo369GP2barxY2XzOJbpTUR5ylMeBghdhd893A6M3G5WlyyDWw3CaiNne60DMsANaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DReqb4mz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DReqb4mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733093509; x=1764629509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Be1CdargI1EEMYBP2WTOGfjpcRiMoBGpF8qXOuhzVDQ=;
  b=DReqb4mzJKXLlIi5ba3M3p0MiHezjzPFK0R1lomCY7uy59Va1lHu59s8
   8NY25jedc8oYWUoDU7BTCaNzTAObL3Zf38mvn9u+6oIwof/fAfVX7VDFk
   zFMlI3JVwJLwWfpy4VIsv0KjLETLHG0RLj9wfDTq7LSPY5fhFji2qXP/Z
   FU1tNyshaXpTwtD0cRS8oHyv0dZQHYStuarN+ZgoCFjX7ZO+IyrvT1X7s
   oQOnKnSp7+MXHPApfnVmvCBFfAm/rnwm19kxt34Su7wP8CRlepkfouT50
   s31OJPK58y3QhLV66TT91Eo6BN3ZlJqkZWIYHml+smY4jTQRZSo9jERIW
   Q==;
X-CSE-ConnectionGUID: BFvQBNhiS0GUngDSuWz9YA==
X-CSE-MsgGUID: tk3hQvnRTtmUlYHxlRCaEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="55740268"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="55740268"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 14:51:49 -0800
X-CSE-ConnectionGUID: SidCzUY9RuaqRr0hUsJbpA==
X-CSE-MsgGUID: rfiHf9x6SIKA+Q6S5W1qUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="98065406"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2024 14:51:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHsn3-0001u5-2H;
	Sun, 01 Dec 2024 22:51:45 +0000
Date: Mon, 2 Dec 2024 06:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 29/48]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:157:20: error: no member named
 'bitmap' in 'struct iommu_dirty_bitmap'
Message-ID: <202412020622.jHBD00oh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   87e70b0c76695339b0163fde25b260773b0720c2
commit: 3203d9625915912d06fcf248ae426d3e37af51d4 [29/48] iommupt: Add the 32 bit ARMv7s page table format
config: powerpc64-randconfig-r051-20241202 (https://download.01.org/0day-ci/archive/20241202/202412020622.jHBD00oh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020622.jHBD00oh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020622.jHBD00oh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:157:20: error: no member named 'bitmap' in 'struct iommu_dirty_bitmap'
           if (dirty->dirty->bitmap)
               ~~~~~~~~~~~~  ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:158:33: error: no member named 'bitmap' in 'struct iommu_dirty_bitmap'
                   iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
                                   ~~~~~~~~~~~~  ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:1144:10: error: no member named 'iommupt' in 'struct iommu_domain'
           domain->iommupt = iommu_table;
           ~~~~~~  ^
   3 errors generated.


vim +157 drivers/iommu/generic_pt/fmt/../iommu_pt.h

551663ac0da3f3 Jason Gunthorpe 2024-07-18  137  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  138  static void record_dirty(struct pt_state *pts,
551663ac0da3f3 Jason Gunthorpe 2024-07-18  139  			 struct pt_iommu_dirty_args *dirty,
551663ac0da3f3 Jason Gunthorpe 2024-07-18  140  			 unsigned int num_contig_lg2)
551663ac0da3f3 Jason Gunthorpe 2024-07-18  141  {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  142  	pt_vaddr_t dirty_len;
551663ac0da3f3 Jason Gunthorpe 2024-07-18  143  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  144  	if (num_contig_lg2 != ilog2(1)) {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  145  		unsigned int index = pts->index;
551663ac0da3f3 Jason Gunthorpe 2024-07-18  146  		unsigned int end_index = log2_set_mod_max_t(
551663ac0da3f3 Jason Gunthorpe 2024-07-18  147  			unsigned int, pts->index, num_contig_lg2);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  148  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  149  		/* Adjust for being contained inside a contiguous page */
551663ac0da3f3 Jason Gunthorpe 2024-07-18  150  		end_index = min(end_index, pts->end_index);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  151  		dirty_len = (end_index - index) *
551663ac0da3f3 Jason Gunthorpe 2024-07-18  152  				log2_to_int(pt_table_item_lg2sz(pts));
551663ac0da3f3 Jason Gunthorpe 2024-07-18  153  	} else {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  154  		dirty_len = log2_to_int(pt_table_item_lg2sz(pts));
551663ac0da3f3 Jason Gunthorpe 2024-07-18  155  	}
551663ac0da3f3 Jason Gunthorpe 2024-07-18  156  
551663ac0da3f3 Jason Gunthorpe 2024-07-18 @157  	if (dirty->dirty->bitmap)
551663ac0da3f3 Jason Gunthorpe 2024-07-18  158  		iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
551663ac0da3f3 Jason Gunthorpe 2024-07-18  159  				dirty_len);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  160  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  161  	if (!(dirty->flags & IOMMU_DIRTY_NO_CLEAR)) {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  162  		/*
551663ac0da3f3 Jason Gunthorpe 2024-07-18  163  		 * No write log required because DMA incoherence and atomic
551663ac0da3f3 Jason Gunthorpe 2024-07-18  164  		 * dirty tracking bits can't work together
551663ac0da3f3 Jason Gunthorpe 2024-07-18  165  		 */
551663ac0da3f3 Jason Gunthorpe 2024-07-18  166  		pt_entry_set_write_clean(pts);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  167  		/* FIXME update the gather
551663ac0da3f3 Jason Gunthorpe 2024-07-18  168  		if (dirty->dirty->gather)
551663ac0da3f3 Jason Gunthorpe 2024-07-18  169  		*/
551663ac0da3f3 Jason Gunthorpe 2024-07-18  170  	}
551663ac0da3f3 Jason Gunthorpe 2024-07-18  171  }
551663ac0da3f3 Jason Gunthorpe 2024-07-18  172  

:::::: The code at line 157 was first introduced by commit
:::::: 551663ac0da3f3bd931f2a54ab989113811361a2 iommupt: Add read_and_clear_dirty op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
