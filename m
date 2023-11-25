Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A838C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+cLjvhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898284; x=1732434284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p76xz1C9t3xSjpITBxoHESq9AgJJ6Rgj1fhbt0dSrzc=;
  b=J+cLjvhLjU6UTYWx2cpFPtNfeKtTuhcYTtOSt707f+QVdcUfTGWBgeKn
   +3jJHLZNQ3Qev/AeG3DoJK6lnXGPUXv6qPPnKhnA0dnSjfPgmlXCMhMyh
   KrXQIq2c/FVhA9YH+UGQHIuhwwevRl6I7azgPBRiRxELUY8jl5+mO0Dq9
   NLAvUMEN7nNpYA7P/KnTCnhSU6CY+lxJaFICbNoEY07Q4qnGuRt5Nw23B
   7oQB91cQlIZKqCKMGOjjFrS4x6nEBWc0f26wVh6yMVIgHB9+kX9GY1Vr/
   kSGaLTYR+opudlgnNnaXvmFcQosCu1Pu93IVCZyL/HumCW5ySJafUSG2Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382903702"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="382903702"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:44:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767668001"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="767668001"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 23:44:43 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nLF-0003kk-0B;
	Sat, 25 Nov 2023 07:44:41 +0000
Date: Sat, 25 Nov 2023 15:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jerry Snitselaar <jsnitsel@redhat.com>
Subject: [jgunthorpe:iommu_fwspec 8/41] drivers/acpi/scan.c:1641:6: error:
 incompatible pointer to integer conversion assigning to 'int' from 'const
 struct iommu_ops *'
Message-ID: <202311251528.xTxbkGZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 58886c28edaa4d5052c7ccde93f739d553591d18 [8/41] acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
config: x86_64-randconfig-122-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251528.xTxbkGZc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251528.xTxbkGZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251528.xTxbkGZc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/scan.c:1641:6: error: incompatible pointer to integer conversion assigning to 'int' from 'const struct iommu_ops *' [-Wint-conversion]
           ret = acpi_iommu_configure_id(dev, input_id);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1641 drivers/acpi/scan.c

  1622	
  1623	/**
  1624	 * acpi_dma_configure_id - Set-up DMA configuration for the device.
  1625	 * @dev: The pointer to the device
  1626	 * @attr: device dma attributes
  1627	 * @input_id: input device id const value pointer
  1628	 */
  1629	int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
  1630				  const u32 *input_id)
  1631	{
  1632		int ret;
  1633	
  1634		if (attr == DEV_DMA_NOT_SUPPORTED) {
  1635			set_dma_ops(dev, &dma_dummy_ops);
  1636			return 0;
  1637		}
  1638	
  1639		acpi_arch_dma_setup(dev);
  1640	
> 1641		ret = acpi_iommu_configure_id(dev, input_id);
  1642		if (ret == -EPROBE_DEFER)
  1643			return -EPROBE_DEFER;
  1644	
  1645		/*
  1646		 * Historically this routine doesn't fail driver probing due to errors
  1647		 * in acpi_iommu_configure_id()
  1648		 */
  1649	
  1650		arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
  1651	
  1652		return 0;
  1653	}
  1654	EXPORT_SYMBOL_GPL(acpi_dma_configure_id);
  1655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
