Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAA7485
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674141770; x=1705677770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1J1zCXrZSIkAL4qNuf9XlNjl6qhUPIKMi5OP+exNQww=;
  b=bUW7xdpqM4xdYaJci0eD1sYX/YekHkMirpdXtiO4nWwpXdbxbKkXGuJG
   mYuGKJSyoio39I4+CPlDeXeRxCdOYY0NrU3E6jsnUkDBjvtK8Ua3z34o0
   Lp/Tlb6DUkrIbCFZ/WSeOzNOG2Z2cUqwFrRUMn/pTp0fCbCimH5KGXKkN
   +KQJtYTMtRg4qq6A72h7dpDUqVpK5k6ZV8m36Dl2PhJd4p2Q9n2PIJUIp
   HY0faluJQGCIyehV81NKYrB10Bf8g97qv0SkMsmpBKTV20y74O8J/D15y
   LqKwkCm1b/Z3d89inTiiggpKFZS65ZCP4w6qve9Cr/igfAu4N/i8RShJg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="322999674"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="322999674"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 07:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905560261"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="905560261"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2023 07:19:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIWho-0001ZX-19;
	Thu, 19 Jan 2023 15:19:56 +0000
Date: Thu, 19 Jan 2023 23:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [krzk-github:wip/qcom-rt 85/380]
 drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202301192348.JYHqRRcu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/qcom-rt
head:   6880445158dd6376c96b5898fa41a7a3f8898b7d
commit: 3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a [85/380] PCI: dwc: Add DW eDMA engine support
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230119/202301192348.JYHqRRcu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/krzk/linux/commit/3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/qcom-rt
        git checkout 3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
   drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse:     expected void [noderef] __iomem *vaddr
   drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse:     got void *
   drivers/pci/controller/dwc/pcie-designware.c:744:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
   drivers/pci/controller/dwc/pcie-designware.c:744:27: sparse:     expected void [noderef] __iomem *vaddr
   drivers/pci/controller/dwc/pcie-designware.c:744:27: sparse:     got void *

vim +733 drivers/pci/controller/dwc/pcie-designware.c

   723	
   724	static int dw_pcie_edma_ll_alloc(struct dw_pcie *pci)
   725	{
   726		struct dw_edma_region *ll;
   727		dma_addr_t paddr;
   728		int i;
   729	
   730		for (i = 0; i < pci->edma.ll_wr_cnt; i++) {
   731			ll = &pci->edma.ll_region_wr[i];
   732			ll->sz = DMA_LLP_MEM_SIZE;
 > 733			ll->vaddr = dmam_alloc_coherent(pci->dev, ll->sz,
   734							&paddr, GFP_KERNEL);
   735			if (!ll->vaddr)
   736				return -ENOMEM;
   737	
   738			ll->paddr = paddr;
   739		}
   740	
   741		for (i = 0; i < pci->edma.ll_rd_cnt; i++) {
   742			ll = &pci->edma.ll_region_rd[i];
   743			ll->sz = DMA_LLP_MEM_SIZE;
   744			ll->vaddr = dmam_alloc_coherent(pci->dev, ll->sz,
   745							&paddr, GFP_KERNEL);
   746			if (!ll->vaddr)
   747				return -ENOMEM;
   748	
   749			ll->paddr = paddr;
   750		}
   751	
   752		return 0;
   753	}
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
