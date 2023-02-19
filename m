Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C3C7FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676787690; x=1708323690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZ0FhrdjsbvgAOrQX6wmraFWuYRjwzgsFC95s7S/ISg=;
  b=VnxAIrmF+ymOTeNsm3UyK3IMbcI3k9je/AwkIXBsiw9ODf9GV0olXXZk
   tdHbkG1+VUEQ+fwJ2/04/y/XzUK3NTa3wl4oA4lCfn5KmWWTth1XpeXF5
   hE4Qrd+HOolc49sgcDB47uG/dS5ZK2JHOnSgJc2DPrBGDMazv3KzJvTeB
   lApF2BCoSmQa3cK4/LCdx8BaXWohI+3GvVq3C7nz6IihIomvag8DpBdUV
   xAZSAQex23GSEB/rbLE1vy3tJBPhHQwT5AKFHtAYjvA80Nmo8bLcMGvSU
   JUZ5uceD/AglIrLEKzPHOgo0rE0R2V8ISudQIjJcb7u43pvEgx/yYdLXS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="320342603"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="320342603"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 22:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="759841119"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="759841119"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Feb 2023 22:21:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTd4h-000D6D-1D;
	Sun, 19 Feb 2023 06:21:27 +0000
Date: Sun, 19 Feb 2023 14:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 174/614]
 drivers/pci/controller/dwc/pcie-designware.c:895:27: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202302191453.yfNXsXCd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   ab3b1a5e70c27be92944b0001d5432866887ccc0
commit: bd02af3b08bb2461727a50b38ea4fcd0f337a795 [174/614] PCI: dwc: Add DW eDMA engine support
config: arm64-randconfig-s042-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191453.yfNXsXCd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/krzk/linux/commit/bd02af3b08bb2461727a50b38ea4fcd0f337a795
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout bd02af3b08bb2461727a50b38ea4fcd0f337a795
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302191453.yfNXsXCd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-designware.c:895:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
   drivers/pci/controller/dwc/pcie-designware.c:895:27: sparse:     expected void [noderef] __iomem *vaddr
   drivers/pci/controller/dwc/pcie-designware.c:895:27: sparse:     got void *
   drivers/pci/controller/dwc/pcie-designware.c:906:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
   drivers/pci/controller/dwc/pcie-designware.c:906:27: sparse:     expected void [noderef] __iomem *vaddr
   drivers/pci/controller/dwc/pcie-designware.c:906:27: sparse:     got void *

vim +895 drivers/pci/controller/dwc/pcie-designware.c

   885	
   886	static int dw_pcie_edma_ll_alloc(struct dw_pcie *pci)
   887	{
   888		struct dw_edma_region *ll;
   889		dma_addr_t paddr;
   890		int i;
   891	
   892		for (i = 0; i < pci->edma.ll_wr_cnt; i++) {
   893			ll = &pci->edma.ll_region_wr[i];
   894			ll->sz = DMA_LLP_MEM_SIZE;
 > 895			ll->vaddr = dmam_alloc_coherent(pci->dev, ll->sz,
   896							&paddr, GFP_KERNEL);
   897			if (!ll->vaddr)
   898				return -ENOMEM;
   899	
   900			ll->paddr = paddr;
   901		}
   902	
   903		for (i = 0; i < pci->edma.ll_rd_cnt; i++) {
   904			ll = &pci->edma.ll_region_rd[i];
   905			ll->sz = DMA_LLP_MEM_SIZE;
   906			ll->vaddr = dmam_alloc_coherent(pci->dev, ll->sz,
   907							&paddr, GFP_KERNEL);
   908			if (!ll->vaddr)
   909				return -ENOMEM;
   910	
   911			ll->paddr = paddr;
   912		}
   913	
   914		return 0;
   915	}
   916	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
