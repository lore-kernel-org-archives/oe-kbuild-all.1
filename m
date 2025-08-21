Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC843C17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755752454; cv=none; b=aIBZcz46fK+fzsAPXCbZib8Dlb+2Vh2+G1OMU3CuAuwof7rWK5olcQEGItAbZr4GVhdIacO70TctV/WpeNrADLwpkx9w/bEhOV62cBGn5ThIji74Zq6kTfhRQMNHMhKTxmb63QORxvi0d4MWDXAUqCsd1w28HtO3fgdrwJAcLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755752454; c=relaxed/simple;
	bh=cWhnw62WP38tH+1PF8K5L1uDSUdMNl18Osce/X8RZu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rGWSB4GQXgqRPaYQARKRE3nDuQh8uuRAo1RHrM0D0PzwtE1jdKK1CfHl+1shLHaUiQmjrwNV3a46yPDpL9xdtRzQGW7CejMI6qNl3Tz+wUnmaP/ntn5THJWk7vPOwkSplpP25/OxtwO+v66osOE2u5+fkSITOqHB3+iK5i1dcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwtQSyIe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwtQSyIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755752452; x=1787288452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cWhnw62WP38tH+1PF8K5L1uDSUdMNl18Osce/X8RZu4=;
  b=AwtQSyIeLaEskyYjxD73VwWXPlxm2CRgHJxoxOzPacbJlpNi781bzvqT
   1coRc0odVq0h9KI4F3YsSZpgoWy6a07Xr1PSRVdD8gTp+d2E2bgmzQZPb
   8NK9hj3d3NWImqYSYFyqjP3Q5oaRUuBlXxbyEJD6AsYoFsyrx7J6NQX+G
   YxSAzB9ACQ5qJmBtwvwp5mtXyAIvF9odovkppwh5Hh0L2EMg9N0bxvMVh
   uCuVVLitEgoWHv8CYCxfbnkLToLzIuGOTBjnHWWdyy1WEiOCE8USNSeFQ
   MRCKJ4//4Q5UPytkKVGRKrTzOfarYQpvNI1r8T/tRMv9B3pa5RdH1OCfh
   g==;
X-CSE-ConnectionGUID: pISDfOURR4eM+0whYr/oIg==
X-CSE-MsgGUID: JeJkFTHPSMeEhUG//nFP3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69132111"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69132111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 22:00:52 -0700
X-CSE-ConnectionGUID: jtLMste3T4+Z4lKva+OzjA==
X-CSE-MsgGUID: +EOn5gCvToqLeZkb0qeMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172731007"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Aug 2025 22:00:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoxPT-000Jwl-0p;
	Thu, 21 Aug 2025 05:00:31 +0000
Date: Thu, 21 Aug 2025 13:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2697/2697]
 kernel/dma/phytium/pswiotlb-mapping.c:400:30: warning: no previous prototype
 for function 'pswiotlb_clone_orig_dma_ops'
Message-ID: <202508211208.pMTZ4FXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   86390838db4d0ee205e00d4069a8fdb3e6f0d1d1
commit: b0023ec2484f4561c552979b944b208422ba75ea [2697/2697] dma: pswiotlb: Move pswiotlb dma functions behind dma_map_ops
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250821/202508211208.pMTZ4FXY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211208.pMTZ4FXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211208.pMTZ4FXY-lkp@intel.com/

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
