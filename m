Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132FC1B373E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723820467; cv=none; b=gtZKgQso1Ug82Iocobl2JS+MhtH9lK0pDYwv0Gcyprs2PGECfAKeIPbIPaRZlRISOjl0Sw+OEI1PDfyrMIWJyNWOUZ3mYJmQWXgKKQe9ioUpP5ynoEc5Hn1rnd/hk+ztzhfSb7Y83jeIeuPNV6JF0jZQLgdGfRVXyEof6bs8BKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723820467; c=relaxed/simple;
	bh=AxR24PEBwqL3VhyeDfKnEcOPX1L0suRbbb4DP67fCIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=clGlUlbG1WuZwAaUM9JhY/e7GqumJ2X7fjzxjoes5LzAjIrNzfMMAvT9pClO83C9p2ha0Wq6w73SV+ov9+ayMsazS2QCfsnEIrGx9ECS0R5gopT/983FQJ2a4PLxpG2iDvjtfUVlHIWfeCRNhoM6UgjXlYbGwhUUfcTspsQQEik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5qyCZBS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5qyCZBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723820464; x=1755356464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AxR24PEBwqL3VhyeDfKnEcOPX1L0suRbbb4DP67fCIQ=;
  b=B5qyCZBSHIADN+vrs0ZTnKbCuKKiTLogt7Es7HFqWbsEx3CD1xM4QISQ
   6XvFw0lV7jK2bFaBqAsJP5U3gtHlA6gH4G17/81gKNb0myFOIlsnyDFKp
   9FfxVO5cgFId60ZsqyVUID/pqwIUNCu24Ot1o2hE35dSvl74Flnld5Udo
   Iqeh0APZH3G1ROCswlxbIR9KXc6ZVtWTtzFpXTGCvJjPfgj3MVhFls3XQ
   7LMHBZcmyVYxVsY799f+72mptEyYzWLN7i9jMOaySB0JvRrDmvWBUfkjh
   Ujc8oM0DtDj5I3Dvf9lbxAVRDUH/SWkR4GwdCB8Vhvyd0SB6XND9C8G3g
   A==;
X-CSE-ConnectionGUID: osYGlZWZRxiUhIOM6IEKCg==
X-CSE-MsgGUID: vj9HunkVSEK2+tqb/KNnJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22278771"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22278771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 08:01:03 -0700
X-CSE-ConnectionGUID: SUlqK23cT1avG9WPS+Zi3w==
X-CSE-MsgGUID: zvPha8/YR76BqtW3/hlBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59857932"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Aug 2024 08:01:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seyRk-0006Ww-2Q;
	Fri, 16 Aug 2024 15:00:56 +0000
Date: Fri, 16 Aug 2024 23:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9901/9914]
 arch/x86/kernel/zhaoxin_kh40000.c:85:47: error: implicit declaration of
 function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'?
Message-ID: <202408162209.plx3IFBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   89747eb5eee6205fec61a18a1e76fe0c1f1d37ca
commit: ab7f82d72290046790f10ac6f2bd8b6579899498 [9901/9914] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240816/202408162209.plx3IFBI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162209.plx3IFBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162209.plx3IFBI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_sync_single_dma_for_cpu':
>> arch/x86/kernel/zhaoxin_kh40000.c:85:47: error: implicit declaration of function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'? [-Werror=implicit-function-declaration]
      85 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^~~~~~~~~~~~~~~~~~~~
         |                                               iommu_is_dma_domain
   arch/x86/kernel/zhaoxin_kh40000.c:85:47: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VFIO_MDEV
   Depends on [n]: VFIO [=n]
   Selected by [m]:
   - CRYPTO_DEV_HCT [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]


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
