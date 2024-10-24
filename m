Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989817F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731093; cv=none; b=kYRkCkzmQTjsDamjemtnMPHO1qEvx1k2jRMjWE1n51DncNFX9Mv17eOAfT96MfrVqvp3spo7njWYKfoexijL4SrvYwThODrI84BRjBdNR+Gyst75AGxZElP+rpSbqHuQ+8NA/TKlU141adjbf1I80uVvY4exjhDwTeqxnr4GIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731093; c=relaxed/simple;
	bh=rDOAttP6qS9qM0tXylI+153ubthed6pV4g0Ltopx8YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l73APgxxHXzKVfo+BhebvGl1lfa0mjIKFwiHyjF+G9WnYlIWM+g81VsFvuN77VSIwumnFc1wiHgnWr/GEHv7h8gcUB+VkPN+Hb+ct7GoMjt5yUMwm8oIkEcMsDrKna+bKQ0wgJWG7sRVJ9bKks89CnfKZgNT+B90tFyI0WlYz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkDeR0L1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkDeR0L1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729731091; x=1761267091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDOAttP6qS9qM0tXylI+153ubthed6pV4g0Ltopx8YQ=;
  b=CkDeR0L1yM+8BFM394bQtTIZuQmBpEsQZayegLTvkb+86bp/nXK1fiqn
   aBbO+CECi1N+oeQ6rGUfxB0Mtqkwx7o/J4bUdbjhgeoECad5vxbGBdytC
   hPvUaeKMziE2wD63uijrqIZzEwFtimJTQ4K7WqbukqvhiE6WO6cBuScUW
   SGxFPztIqllQuEBKklctTYNDKmrCnrhKgdYxX3eveXfUn40w691G9cmxK
   VkHsjVr15N/iNnRe7VZQLy4Dg9gq2b6C9VRHOs1P1+kM+4ILU3huwoeAE
   4ifKEEa0cheo2zmZgEzba++L2Zm1q98s0USFxzyYwblsV0LwSqhec5Avr
   A==;
X-CSE-ConnectionGUID: aZitpOE6SeSozaY7H/Zolw==
X-CSE-MsgGUID: iqPEG30aSaGLEBW3I8JHVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28806837"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="28806837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:51:31 -0700
X-CSE-ConnectionGUID: z5q4BqowQxCytGXliGN03w==
X-CSE-MsgGUID: g+xlCLrDQW6BjXHqOduxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="85039793"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2024 17:51:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3m4T-000VlV-1w;
	Thu, 24 Oct 2024 00:51:25 +0000
Date: Thu, 24 Oct 2024 08:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10798/13046]
 arch/x86/kernel/zhaoxin_kh40000.c:85:47: error: implicit declaration of
 function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'?
Message-ID: <202410240830.v0KVhmlJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: ab7f82d72290046790f10ac6f2bd8b6579899498 [10798/13046] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240830.v0KVhmlJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240830.v0KVhmlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240830.v0KVhmlJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_sync_single_dma_for_cpu':
>> arch/x86/kernel/zhaoxin_kh40000.c:85:47: error: implicit declaration of function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'? [-Werror=implicit-function-declaration]
      85 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^~~~~~~~~~~~~~~~~~~~
         |                                               iommu_is_dma_domain
   arch/x86/kernel/zhaoxin_kh40000.c:85:47: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +85 arch/x86/kernel/zhaoxin_kh40000.c

    62	
    63	static void kh40000_sync_single_dma_for_cpu(struct device *dev, dma_addr_t paddr,
    64			enum dma_data_direction dir, bool is_iommu)
    65	{
    66		u8 vid;
    67		struct pci_dev *pci;
    68		u64 dma_mask = *dev->dma_mask;
    69	
    70		/* check direction */
    71		if ((dir != DMA_FROM_DEVICE) && (dir != DMA_BIDIRECTIONAL))
    72			return;
    73	
    74		/* check dma capability */
    75		if (dma_mask <= DMA_BIT_MASK(32))
    76			return;
    77	
    78		/* check device type */
    79		pci = kh40000_get_pci_dev(dev);
    80		if (pci == NULL)
    81			return;
    82	
    83		/* get real physical address */
    84		if (is_iommu) {
  > 85			struct iommu_domain *domain = iommu_get_dma_domain(dev);
    86	
    87			paddr = iommu_iova_to_phys(domain, paddr);
    88			if (!paddr)
    89				return;
    90		}
    91	
    92		/* check node or not */
    93		if ((zhaoxin_patch_code & ZHAOXIN_P2CW_NODE_CHECK)
    94		   && pfn_to_nid(PFN_DOWN(paddr)) == dev_to_node(dev))
    95			return;
    96	
    97		/* flush data by one pci read cycle */
    98		pci_read_config_byte(pci, PCI_VENDOR_ID, &vid);
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
