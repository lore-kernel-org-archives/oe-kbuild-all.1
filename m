Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEE26AD4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730299999; cv=none; b=V0b3BXc3QonSIoPRVhFXzC1V3o+BSEZWryeylWPeZE2vbrW241vzyVGKLq98YJ6xmVnQsl9bayycbS4tZitk4TCd+NAmFjD1+cwtrA/pYD8YWoVNuVMMlozN/9SS1MFSUeq6e3C4lfYc3Szs5EiqUBqLTZXi9ZXBhlpIrV79SMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730299999; c=relaxed/simple;
	bh=BOfFWdHycy4lC3MEzd9GvG94LTy5Wwa1YGYIKJkEDDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcpprbB3P2/f+tuEiAf/zOhlO8p8FRI5K1kmWrsuLNNNusfZxT66+ZHEutegUDE1G7bmpgY1mnKNkN3Mtl/b25If5DYnmsJtTKUbdS1g1LGU7tAvmCln1KzNcFAgkOj+2vni9aLTcCxQ2YsWx4or1F6Z7CG5g3pTctPPpWo20Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljHbaMCz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljHbaMCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730299997; x=1761835997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOfFWdHycy4lC3MEzd9GvG94LTy5Wwa1YGYIKJkEDDM=;
  b=ljHbaMCzD9Rt28PTSE2y0s9hyyVeZtosprn17dalKWh3be6z7YLWnO0W
   2ayqmUPEXV7qujeY2SahItyN1Hb7Jp8QpdePiE5rrRCAv3doe89C0Ztq6
   NbR4S4fQJW7Q7sIPqf67o2uzPmYrnVBbyKVIvCF8bIoEB4evrH7bjNaR5
   Vw4KEQXd2ddUiKexZ+vsQhsVfYG3q3aqlr8z5S4l6Gmg3uIHmL6Ov820Q
   U8/cUBwqDs08rLvuVHR2z1CDdoZFwk3NCqRtnB/Uh8AUkQ8MAg9FdWj+b
   1Vn0bEkm9AeXQA9mDAk56t3HCWctZ5xRDLLn2KGVjfMjYooye4ijvQiY3
   Q==;
X-CSE-ConnectionGUID: Fry4o7OZRDitIJNPaHx4EA==
X-CSE-MsgGUID: IUM9ZXtFQDaIBI4dEwGWKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30109184"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="30109184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:53:16 -0700
X-CSE-ConnectionGUID: XDly7K51Sti/FdULye0XRg==
X-CSE-MsgGUID: DqBgtsS7Tfu4puYqF7ifpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86890745"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2024 07:53:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6A4P-000exe-0T;
	Wed, 30 Oct 2024 14:53:13 +0000
Date: Wed, 30 Oct 2024 22:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [linux-next:master 7444/8186] kernel/dma/mapping.c:785:61: sparse:
 sparse: incorrect type in argument 5 (different base types)
Message-ID: <202410302243.1wnTlPk3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
commit: 68b6dbf1f441c4eba3b8511728a41cf9b01dca35 [7444/8186] dma-mapping: trace more error paths
config: csky-randconfig-r111-20241030 (https://download.01.org/0day-ci/archive/20241030/202410302243.1wnTlPk3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241030/202410302243.1wnTlPk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410302243.1wnTlPk3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/dma/mapping.c:785:61: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int enum dma_data_direction dir @@     got restricted gfp_t [usertype] gfp @@
   kernel/dma/mapping.c:785:61: sparse:     expected unsigned int enum dma_data_direction dir
   kernel/dma/mapping.c:785:61: sparse:     got restricted gfp_t [usertype] gfp
>> kernel/dma/mapping.c:785:66: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int enum dma_data_direction dir @@
   kernel/dma/mapping.c:785:66: sparse:     expected restricted gfp_t [usertype] flags
   kernel/dma/mapping.c:785:66: sparse:     got unsigned int enum dma_data_direction dir

vim +785 kernel/dma/mapping.c

   764	
   765	struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
   766			enum dma_data_direction dir, gfp_t gfp, unsigned long attrs)
   767	{
   768		struct sg_table *sgt;
   769	
   770		if (WARN_ON_ONCE(attrs & ~DMA_ATTR_ALLOC_SINGLE_PAGES))
   771			return NULL;
   772		if (WARN_ON_ONCE(gfp & __GFP_COMP))
   773			return NULL;
   774	
   775		if (use_dma_iommu(dev))
   776			sgt = iommu_dma_alloc_noncontiguous(dev, size, dir, gfp, attrs);
   777		else
   778			sgt = alloc_single_sgt(dev, size, dir, gfp);
   779	
   780		if (sgt) {
   781			sgt->nents = 1;
   782			trace_dma_alloc_sgt(dev, sgt, size, dir, gfp, attrs);
   783			debug_dma_map_sg(dev, sgt->sgl, sgt->orig_nents, 1, dir, attrs);
   784		} else {
 > 785			trace_dma_alloc_sgt_err(dev, NULL, 0, size, gfp, dir, attrs);
   786		}
   787		return sgt;
   788	}
   789	EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
   790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
