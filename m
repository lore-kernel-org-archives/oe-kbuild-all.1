Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C026178399
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850318; cv=none; b=A8fuckjR3cCat7oQIPLMTLGETWwU2itvnnE5oi06gkiaiOLk3oRf+p5tBg6BOankXlP7TfmgIRtAr4BT4C4dHYYPgE1Dldqa9BukWM2f+19Lz6zGqM++0q25jhTVMujd9MqXyq79M0oHS4sEiZUc4WTsTYdoYHfuTL1w6o76fz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850318; c=relaxed/simple;
	bh=PtJBUfwX4La9tgPucEqKJcxZh4VmKR2VYby5b688dcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GyMLAZhIBqegW006hsNkDbowdcPDW+NHTkXlEB/1dyEXyn0rVb4DCaHSqFcZyuvXljYrtuVufBLCxBK/B5srZESTjUMQdkAnAiSg/DTFJntizWhOv276WoKjuY94faLgDrn+JN3SxMGrur3DYitng1GEaxA0ZC06lhcOIT1z8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPg03vMv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPg03vMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724850318; x=1756386318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtJBUfwX4La9tgPucEqKJcxZh4VmKR2VYby5b688dcU=;
  b=cPg03vMvBbuL6CEtCALzSmXZ7PGSm41tKsGHLOL+JdCL+WximZeGPDL9
   a4QqpEcF9aC+EldImWxC6lPU3WihU/HmQrEbyGAsw5s0hs+eima7eIGs6
   J4ONbqoXXUVKuKrCLt3KqvFVOY8jv4fIs03NLLo92XcC1JnAeuJwrXIG4
   WMi1ghfk2Ofn7oBdRuB5IZGQF4WHFwiaHbsgT4evIVFe49hPmghr+iccN
   c3iZXy3A8yNWLHfh5y0JP1fw4gZ/IFoc+Itd0LAMU+0QS2aa9JoahVy4T
   nKEzsOKDaEyejbx2WMs9q1M+oOCyZUP+3LwKBheF4VUC2EDhG3hxiijCB
   A==;
X-CSE-ConnectionGUID: 8IZ7JXoDTNya53LlQquCww==
X-CSE-MsgGUID: EyI9X3paTDyrWshZt5+40Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23550198"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23550198"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:05:17 -0700
X-CSE-ConnectionGUID: ocoOU7q5R8SYj5Y0z3vGOg==
X-CSE-MsgGUID: PtTPXudLRfSysetDYdHwRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="100730395"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Aug 2024 06:05:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjIMJ-000KyY-04;
	Wed, 28 Aug 2024 13:05:11 +0000
Date: Wed, 28 Aug 2024 21:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10798/10950]
 arch/x86/kernel/zhaoxin_kh40000.c:85:33: error: call to undeclared function
 'iommu_get_dma_domain'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202408282010.pCxF77mv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: ab7f82d72290046790f10ac6f2bd8b6579899498 [10798/10950] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-randconfig-002-20240828 (https://download.01.org/0day-ci/archive/20240828/202408282010.pCxF77mv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408282010.pCxF77mv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408282010.pCxF77mv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c:45:30: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
      45 |         if (ZHAOXIN_P2CW_NODE_CHECK | zhaoxin_patch_code)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/zhaoxin_kh40000.c:85:33: error: call to undeclared function 'iommu_get_dma_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^
   arch/x86/kernel/zhaoxin_kh40000.c:85:33: note: did you mean 'iommu_is_dma_domain'?
   include/linux/iommu.h:120:20: note: 'iommu_is_dma_domain' declared here
     120 | static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
         |                    ^
>> arch/x86/kernel/zhaoxin_kh40000.c:85:24: error: incompatible integer to pointer conversion initializing 'struct iommu_domain *' with an expression of type 'int' [-Wint-conversion]
      85 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                      ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/iommu_get_dma_domain +85 arch/x86/kernel/zhaoxin_kh40000.c

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
