Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF6EAD23
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733114920; cv=none; b=jVBA7WEBZVYqotG1VgA9oX+eJ2OO4GEVPto9uqOSMLhpl/s2l02KUchcDcM/byHNJJSp/oK6W3GYetINEbFQqbLI2GMXqPG40ycu/PcxM/Z7sImR0lYPi27YZ8Gstu9yk67sZErK72nMYrJDyPoZbvLDHTRnSV6wx7qrkOXlado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733114920; c=relaxed/simple;
	bh=/3quIypfpXIFv2KjhjBXhxJ/8mMaKpOnCeF4EuXGTqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TpmPF3OwZXMRA6JQc2f+zFtyEq7oH6jdsV5prV0iwzZMfs9IPQvkr/6z5O7Dm/h+DullyMJOeu5QM8iizHm/B1to3O4tEvNp5T606eO+0r6YvX6PAymYgaNh84BjPfZe4guyRZwr//3lxGIhY2fgp8vCfo79ltViwg5JWJFyyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RckCYm77; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RckCYm77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733114918; x=1764650918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3quIypfpXIFv2KjhjBXhxJ/8mMaKpOnCeF4EuXGTqs=;
  b=RckCYm77QxAx0Cpgn+QcvW/C9KMtuhjzGQUWTj7+JoRULtrAFm6JQRYF
   JKkwLo/X23gW4Bghd8zldmLk1kemVb62PVBTYtRjoWRgzIW8rX48EK/Vg
   tji7Iw0mPETcvB3STzh8CLahC01IYi12Sv6HwQvY/1UVIhrIq7NGkIcKY
   sJWKva4GneqG2QDpxTU1RR1eUFq2g03JVZ6qN80MgfokF8zq8nPoeJNSC
   K7FE0gi0xQzOEgeY8/UGiv3Ku+EQP0asQEi8A/dvTBy/G1ac+xg7Dowhh
   +TX0Wf3Vh3dX7+B36GetmA0nr5xk+liiCyQczWDFGYewpZH3bT8CTVBsg
   Q==;
X-CSE-ConnectionGUID: hyMSsWwiS0CQnNJ52d3UKg==
X-CSE-MsgGUID: 2a4fmQUCSV2mSzsXiMM45w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="37207891"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="37207891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 20:48:37 -0800
X-CSE-ConnectionGUID: fwyp9l2cRwmRN73XclcPrg==
X-CSE-MsgGUID: CmKTD5mLTLWnWL4pW+fx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98025582"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2024 20:48:36 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHyML-00025R-2R;
	Mon, 02 Dec 2024 04:48:33 +0000
Date: Mon, 2 Dec 2024 12:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 37/48]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:189:21: error: no member named
 'gather' in 'struct iommu_dirty_bitmap'
Message-ID: <202412021217.H2bUonJK-lkp@intel.com>
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
commit: 838a3c8a7a15f56fba4d46a6eee00c5d6694979e [37/48] WIP invalidation sketch
config: powerpc64-randconfig-r051-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021217.H2bUonJK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021217.H2bUonJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021217.H2bUonJK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:179:20: error: no member named 'bitmap' in 'struct iommu_dirty_bitmap'
           if (dirty->dirty->bitmap)
               ~~~~~~~~~~~~  ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:180:33: error: no member named 'bitmap' in 'struct iommu_dirty_bitmap'
                   iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
                                   ~~~~~~~~~~~~  ^
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:189:21: error: no member named 'gather' in 'struct iommu_dirty_bitmap'
                   if (dirty->dirty->gather)
                       ~~~~~~~~~~~~  ^
   3 errors generated.


vim +189 drivers/iommu/generic_pt/fmt/../iommu_pt.h

551663ac0da3f3 Jason Gunthorpe 2024-07-18  159  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  160  static void record_dirty(struct pt_state *pts,
551663ac0da3f3 Jason Gunthorpe 2024-07-18  161  			 struct pt_iommu_dirty_args *dirty,
551663ac0da3f3 Jason Gunthorpe 2024-07-18  162  			 unsigned int num_contig_lg2)
551663ac0da3f3 Jason Gunthorpe 2024-07-18  163  {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  164  	pt_vaddr_t dirty_len;
551663ac0da3f3 Jason Gunthorpe 2024-07-18  165  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  166  	if (num_contig_lg2 != ilog2(1)) {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  167  		unsigned int index = pts->index;
551663ac0da3f3 Jason Gunthorpe 2024-07-18  168  		unsigned int end_index = log2_set_mod_max_t(
551663ac0da3f3 Jason Gunthorpe 2024-07-18  169  			unsigned int, pts->index, num_contig_lg2);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  170  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  171  		/* Adjust for being contained inside a contiguous page */
551663ac0da3f3 Jason Gunthorpe 2024-07-18  172  		end_index = min(end_index, pts->end_index);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  173  		dirty_len = (end_index - index) *
551663ac0da3f3 Jason Gunthorpe 2024-07-18  174  				log2_to_int(pt_table_item_lg2sz(pts));
551663ac0da3f3 Jason Gunthorpe 2024-07-18  175  	} else {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  176  		dirty_len = log2_to_int(pt_table_item_lg2sz(pts));
551663ac0da3f3 Jason Gunthorpe 2024-07-18  177  	}
551663ac0da3f3 Jason Gunthorpe 2024-07-18  178  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  179  	if (dirty->dirty->bitmap)
551663ac0da3f3 Jason Gunthorpe 2024-07-18  180  		iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
551663ac0da3f3 Jason Gunthorpe 2024-07-18  181  				dirty_len);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  182  
551663ac0da3f3 Jason Gunthorpe 2024-07-18  183  	if (!(dirty->flags & IOMMU_DIRTY_NO_CLEAR)) {
551663ac0da3f3 Jason Gunthorpe 2024-07-18  184  		/*
551663ac0da3f3 Jason Gunthorpe 2024-07-18  185  		 * No write log required because DMA incoherence and atomic
551663ac0da3f3 Jason Gunthorpe 2024-07-18  186  		 * dirty tracking bits can't work together
551663ac0da3f3 Jason Gunthorpe 2024-07-18  187  		 */
551663ac0da3f3 Jason Gunthorpe 2024-07-18  188  		pt_entry_set_write_clean(pts);
551663ac0da3f3 Jason Gunthorpe 2024-07-18 @189  		if (dirty->dirty->gather)
838a3c8a7a15f5 Jason Gunthorpe 2024-10-21  190  			record_invalidate(pts, gather, DIRTY_CHANGE);
551663ac0da3f3 Jason Gunthorpe 2024-07-18  191  	}
551663ac0da3f3 Jason Gunthorpe 2024-07-18  192  }
551663ac0da3f3 Jason Gunthorpe 2024-07-18  193  

:::::: The code at line 189 was first introduced by commit
:::::: 551663ac0da3f3bd931f2a54ab989113811361a2 iommupt: Add read_and_clear_dirty op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
