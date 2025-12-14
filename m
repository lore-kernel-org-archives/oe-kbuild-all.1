Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CADF6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765695899; cv=none; b=CJWFPFDoyRkl4TnGQt+cZdzIfyB5gymG4gmppUzjUTd7Tkxwn0sD5Ci62AZi3Djhky1nkoL1KJ9xfQUTaUdxPUGg5KwGpXKzSqKVB0ZkeZ9fQHc8EhZCNaQfZ23sA3RUD43PTPLpsu4go+k7KdKn7AgDjb9+O4AkgCg8gEhQ1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765695899; c=relaxed/simple;
	bh=7aG7TWvtfSABBSRDYl6tDlXW+39QOGhyj/z32dRXVHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u7hlolE0qOXy4BZpTFIADEus//qgbVOdM1xaNvvl/eUdiGeS4gvYcW+9bhxA0YmR7X4wXSQ7wLG19wjciytQ/7JBvq4gMUymCVBg36CPWQhMlKHTDcR1gs7KdtZi5BO/kQzWxFjRfmffMFwzRPTiONE2aR+b2WZzlU5jLLvM1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnmaZyPQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnmaZyPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765695897; x=1797231897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aG7TWvtfSABBSRDYl6tDlXW+39QOGhyj/z32dRXVHY=;
  b=QnmaZyPQH8VzwAtmw4IwLiR/VL6nT5HOfOwYyVEkerrwZXQLTBpMTWjR
   zyRbHZxV3H2VSM7v4eahfP3X67YW74xWaY69fc/g69P1k8Oua4givG/4H
   vQlFokGbWWioxIAsBXU/oEDbdGsOZizcv+d70mhtNBb//P/aUmDjb7X5Q
   SUz6Cail7hdOi3DAQBuK4rOv9OwrFR5NY9gGEChvhGpXgk8F23joPwVoB
   mARBKtEHWOMebemF5sD3OUFK6Unbpsf3k/Tx6SCl1yXT13+1q8BQrIYXB
   t+Xo+q2slepUaYP1Ux9NXawzQBWjSHxjZf9evnbyE78Y+tfnplRiElL6+
   g==;
X-CSE-ConnectionGUID: kNEbBT5jSXWzhvmy3lWg8Q==
X-CSE-MsgGUID: 70GTHqNqQW+K5/uxI5ZXUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70215566"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70215566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:04:56 -0800
X-CSE-ConnectionGUID: 2NyskueIQl2uoqT2yCAh+Q==
X-CSE-MsgGUID: aA58hemrSriUR4AJZCmgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228114817"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 23:04:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgA0-000000008nl-12c3;
	Sun, 14 Dec 2025 07:04:52 +0000
Date: Sun, 14 Dec 2025 15:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3540/3540]
 kernel/dma/phytium/pswiotlb-mapping.c:400:30: warning: no previous prototype
 for function 'pswiotlb_clone_orig_dma_ops'
Message-ID: <202512141445.om5m8ocb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiakun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: b0023ec2484f4561c552979b944b208422ba75ea [3540/3540] dma: pswiotlb: Move pswiotlb dma functions behind dma_map_ops
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512141445.om5m8ocb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141445.om5m8ocb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141445.om5m8ocb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/phytium/pswiotlb-mapping.c:400:30: warning: no previous prototype for function 'pswiotlb_clone_orig_dma_ops' [-Wmissing-prototypes]
     400 | struct pswiotlb_dma_map_ops *pswiotlb_clone_orig_dma_ops(struct device *dev,
         |                              ^
   kernel/dma/phytium/pswiotlb-mapping.c:400:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     400 | struct pswiotlb_dma_map_ops *pswiotlb_clone_orig_dma_ops(struct device *dev,
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_FEATURE_BYPASS
   Depends on [n]: (FAST_SYSCALL [=y] || FAST_IRQ [=y]) && !LOCKDEP [=y]
   Selected by [y]:
   - FAST_SYSCALL [=y]
   - FAST_IRQ [=y] && ARM_GIC_V3 [=y]
   WARNING: unmet direct dependencies detected for SECURITY_FEATURE_BYPASS
   Depends on [n]: !ARM64_MTE [=y] && !KASAN_HW_TAGS [=n] && (FAST_SYSCALL [=y] || FAST_IRQ [=y])
   Selected by [y]:
   - FAST_SYSCALL [=y]
   - FAST_IRQ [=y] && ARM_GIC_V3 [=y]


vim +/pswiotlb_clone_orig_dma_ops +400 kernel/dma/phytium/pswiotlb-mapping.c

   373	
   374	static const struct dma_map_ops pswiotlb_noiommu_dma_ops = {
   375		.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
   376		.alloc			= pswiotlb_dma_alloc_distribute,
   377		.free			= pswiotlb_dma_free_distribute,
   378		.alloc_pages		= pswiotlb_dma_common_alloc_pages_distribute,
   379		.free_pages		= pswiotlb_dma_common_free_pages_distribute,
   380		.alloc_noncontiguous	= pswiotlb_dma_alloc_noncontiguous_distribute,
   381		.free_noncontiguous	= pswiotlb_dma_free_noncontiguous_distribute,
   382		.mmap			= pswiotlb_dma_mmap_distribute,
   383		.get_sgtable		= pswiotlb_dma_get_sgtable_distribute,
   384		.map_page		= pswiotlb_dma_map_page_attrs_distribute,
   385		.unmap_page		= pswiotlb_dma_unmap_page_attrs_distribute,
   386		.map_sg			= pswiotlb_dma_map_sg_attrs_distribute,
   387		.unmap_sg		= pswiotlb_dma_unmap_sg_attrs_distribute,
   388		.sync_single_for_cpu	= pswiotlb_dma_sync_single_for_cpu_distribute,
   389		.sync_single_for_device	= pswiotlb_dma_sync_single_for_device_distribute,
   390		.sync_sg_for_cpu	= pswiotlb_dma_sync_sg_for_cpu_distribute,
   391		.sync_sg_for_device	= pswiotlb_dma_sync_sg_for_device_distribute,
   392		.map_resource		= pswiotlb_dma_map_resource_distribute,
   393		.unmap_resource		= NULL,
   394		.get_merge_boundary	= pswiotlb_dma_get_merge_boundary_distribute,
   395		.get_required_mask  = pswiotlb_dma_get_required_mask_distribute,
   396		.dma_supported = pswiotlb_dma_supported_distribute,
   397		.max_mapping_size   = pswiotlb_dma_max_mapping_size_distribute,
   398		.opt_mapping_size   = pswiotlb_dma_opt_mapping_size_distribute,
   399	};
 > 400	struct pswiotlb_dma_map_ops *pswiotlb_clone_orig_dma_ops(struct device *dev,
   401				const struct dma_map_ops *ops)
   402	{
   403		struct pswiotlb_dma_map_ops *new_dma_ops = kmalloc(sizeof(struct pswiotlb_dma_map_ops),
   404					GFP_KERNEL);
   405		if (!new_dma_ops)
   406			return NULL;
   407	
   408		memcpy(new_dma_ops, ops, sizeof(struct pswiotlb_dma_map_ops));
   409	
   410		return new_dma_ops;
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
