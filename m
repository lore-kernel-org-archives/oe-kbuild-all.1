Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD94205E17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208607; cv=none; b=lntsZtAJvvtMQYB2AFUP/p6rZnRr9f6cE+qTfOg9wIwgexrdRgHN4eK4UiXUm7RkjGg54rUwTs7BzVYAzNlIVlEtIEaUOfRMaQlJGW3fir+eV3sZdTSL0MzzFvdmsuDBfTbvL4h/0LPw8MUWwvbXBxEpBUcrPYu8qIT1Eek+IyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208607; c=relaxed/simple;
	bh=qNJl2IVeUlc5NtF1gE7rTgMHREGW9x9INiAAorBfskU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZ7fYCd4KK+/h8UQx8IVHoWVmkV+yGlU4WCIU9WwPVyapbGC50XVxb8F+OCC4ZX92EDQrh4QR1mRvRhLC+yXOv8/Jh1LlgfIAReLzGEFrrAio/JBAfR2RJfFnhD9/SS0Ik2ddlCZY9vUnXVEWO3lKuxsgiAjC2rtkSBWAQAqfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S98hZO6U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S98hZO6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730208605; x=1761744605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNJl2IVeUlc5NtF1gE7rTgMHREGW9x9INiAAorBfskU=;
  b=S98hZO6UAa4w7CV9iv4yNOTmTdX65ws1mtj4c3dRGEmMXBGPJA7LQ64D
   Gr0FKHL1zsqDoTItBUfJiiWexyYWnAOJjG0u6xq6wBnlqkHTQFAhkm2KU
   2+OphzBxQpsKlFmc2R2lMghLUZF6A4CeFHcJo+9AQCj6NsCqbVgCmJtcm
   bDFDACuRFdBIhpUHC7xOpeQrqs+5y3hrCsG3T1wiG9QZ/ZpMju81VlcXT
   3/xEuG8P9aM/0tXxOTo1O0f9JZxPmzrq12/40h+2I2kKc6IbkA1jKL6tk
   xBD/wz/HT5gXWFTC/nQ/ozhS2yUJEHlKWqGSj1KLvpo5iRzOGIMUz/xE0
   g==;
X-CSE-ConnectionGUID: TAj0DZfuSeyifmqB3uJO0Q==
X-CSE-MsgGUID: 1ZTYMzLiR1eyD7FFonTwxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40945544"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40945544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 06:30:05 -0700
X-CSE-ConnectionGUID: vIV2u99OTKSAvGQkP5Ye+w==
X-CSE-MsgGUID: mETn6cgIQsezEtSA0f+GMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86719385"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2024 06:30:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5mII-000dhQ-2R;
	Tue, 29 Oct 2024 13:29:58 +0000
Date: Tue, 29 Oct 2024 21:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10799/13046]
 arch/x86/kernel/zhaoxin_kh40000.c:320:26: sparse: sparse: symbol
 'kh40000_dma_iommu_ops' was not declared. Should it be static?
Message-ID: <202410292105.pGeWjpHf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 4660502422ff4f7e39f046cf452584165531c5ae [10799/13046] Add kh40000_iommu_dma_ops for KH-40000 platform
config: x86_64-randconfig-121-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292105.pGeWjpHf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292105.pGeWjpHf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292105.pGeWjpHf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/zhaoxin_kh40000.c:33:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?
>> arch/x86/kernel/zhaoxin_kh40000.c:320:26: sparse: sparse: symbol 'kh40000_dma_iommu_ops' was not declared. Should it be static?

vim +/kh40000_dma_iommu_ops +320 arch/x86/kernel/zhaoxin_kh40000.c

   319	
 > 320	const struct dma_map_ops kh40000_dma_iommu_ops = {
   321		.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
   322		.alloc			= kh40000_iommu_dma_alloc,
   323		.free			= kh40000_iommu_dma_free,
   324		.unmap_page		= kh40000_iommu_dma_unmap_page,
   325		.alloc_pages		= kh40000_dma_common_alloc_pages,
   326		.free_pages		= kh40000_dma_common_free_pages,
   327		.alloc_noncontiguous	= kh40000_iommu_dma_alloc_noncontiguous,
   328		.free_noncontiguous	= kh40000_iommu_dma_free_noncontiguous,
   329		.mmap			= kh40000_iommu_dma_mmap,
   330		.get_sgtable		= kh40000_iommu_dma_get_sgtable,
   331		.map_page		= kh40000_iommu_dma_map_page,
   332		.map_sg			= kh40000_iommu_dma_map_sg,
   333		.unmap_sg		= kh40000_iommu_dma_unmap_sg,
   334		.sync_single_for_cpu	= kh40000_iommu_dma_sync_single_for_cpu,
   335		.sync_single_for_device	= kh40000_iommu_dma_sync_single_for_device,
   336		.sync_sg_for_cpu	= kh40000_iommu_dma_sync_sg_for_cpu,
   337		.sync_sg_for_device	= kh40000_iommu_dma_sync_sg_for_device,
   338		.map_resource		= kh40000_iommu_dma_map_resource,
   339		.unmap_resource		= kh40000_iommu_dma_unmap_resource,
   340		.get_merge_boundary	= kh40000_iommu_dma_get_merge_boundary,
   341		.opt_mapping_size	= kh40000_iommu_dma_opt_mapping_size,
   342	};
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
