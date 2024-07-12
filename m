Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF7143732
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772479; cv=none; b=IvoBGmmUDZRwr9d3XUGIWreDMqga+SoXkTa9Q+SLVacahTAbgymZR/0jN/Bnq+lq4137j5Sz4GEvlvZTo3o59tiORfWZDZXXqLwNyanIDgTg+ZG46qzlpgxjIqSSAWMmpERCzxhTngBg9ZoeoUGSgRey1DW5mnlYH2fUUBLnuhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772479; c=relaxed/simple;
	bh=e7bAqjpWH906OS9GXV2Mz91UQ80x6nSraLBIZlWmuyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmnNAAvdNlpSGUwW03Wfvczm/5omBcApVsfLQjV4HawnZGLkUnZF4ZFZjUGFRs7+3ILRQ1pWnnvpsYgwGo6bC/D8ZxMFBoouaz1u6rSzH0TekZbDcbdxvBbkqvrtSvteMlR7KZgQVQ6jPwVdIM/z8jDCLIUXYCRmKOX3qT3fCHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSmcbEcC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSmcbEcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720772478; x=1752308478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7bAqjpWH906OS9GXV2Mz91UQ80x6nSraLBIZlWmuyw=;
  b=iSmcbEcCgBGZAjlIqbLiTw4+UqLWRDPxUNCWCKPtt2J3rr4Du4NhmC7X
   rilEOsFW/aTlz8PqtodotmnB+RK5OUnu38STel7hjtC6YgDa7HYPE7L7Q
   ep/o2Qu1gFZzGzwyYnQf+dsyCGvvaLRugt1MYJwV4VtLJ7zJ3mAY/MXYM
   nhZ+MdMADHFN1N0pxZuxDxCKdzE9LaXuMiFqH03d2dB9xVQ66SBjnUTw6
   kjrumRxrkl53UjYOhNEhye3+o41/BzqkuEv5x1dgmzBX+XsHnPw+oIb3e
   EY/yhCRJumSwhbrWc3awFqgez/0NMSXyaHqpQct1D8VAMeppX8a3qlXGh
   Q==;
X-CSE-ConnectionGUID: mPHruxNeSwSgO8di7XwtFw==
X-CSE-MsgGUID: cX6w5dd8QM2ca3NCmf6MEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22018809"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="22018809"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:21:17 -0700
X-CSE-ConnectionGUID: j6i0UYhRS6WmPs0GaUDQKA==
X-CSE-MsgGUID: JfYX2BiiTP2FlExGKUxuKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48941775"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2024 01:21:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSBWi-000aXK-2a;
	Fri, 12 Jul 2024 08:21:12 +0000
Date: Fri, 12 Jul 2024 16:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 9539/12880]
 drivers/iommu/io-pgtable-arm.c:772:50: error: 'IOMMU_DIRTY_NO_CLEAR'
 undeclared
Message-ID: <202407121602.HL9ih1it-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 4fe88fd8b4aecb7f9680bf898811db76b94095a9 [9539/12880] iommu/io-pgtable-arm: Add read_and_clear_dirty() support
config: arm-buildonly-randconfig-r005-20220402 (https://download.01.org/0day-ci/archive/20240712/202407121602.HL9ih1it-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121602.HL9ih1it-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121602.HL9ih1it-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm.c: In function 'io_pgtable_visit_dirty':
>> drivers/iommu/io-pgtable-arm.c:772:50: error: 'IOMMU_DIRTY_NO_CLEAR' undeclared (first use in this function)
     772 |                         if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
         |                                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/io-pgtable-arm.c:772:50: note: each undeclared identifier is reported only once for each function it appears in


vim +/IOMMU_DIRTY_NO_CLEAR +772 drivers/iommu/io-pgtable-arm.c

   753	
   754	static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
   755					       struct io_pgtable_walk_data *walk_data,
   756					       arm_lpae_iopte *ptep,
   757					       int lvl);
   758	
   759	static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
   760					  struct io_pgtable_walk_data *walk_data,
   761					  arm_lpae_iopte *ptep, int lvl)
   762	{
   763		struct io_pgtable *iop = &data->iop;
   764		arm_lpae_iopte pte = READ_ONCE(*ptep);
   765	
   766		if (iopte_leaf(pte, lvl, iop->fmt)) {
   767			size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
   768	
   769			if (iopte_writeable_dirty(pte)) {
   770				iommu_dirty_bitmap_record(walk_data->dirty,
   771							  walk_data->addr, size);
 > 772				if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
   773					iopte_set_writeable_clean(ptep);
   774			}
   775			walk_data->addr += size;
   776			return 0;
   777		}
   778	
   779		if (WARN_ON(!iopte_table(pte, lvl)))
   780			return -EINVAL;
   781	
   782		ptep = iopte_deref(pte, data);
   783		return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
   784	}
   785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
