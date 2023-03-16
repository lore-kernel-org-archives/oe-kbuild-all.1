Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE037C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678936529; x=1710472529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7zP0fnKZDWTB6+Lh8ydVZUl//a+b2Hi6xGAT73/wJo=;
  b=ZzTUzZzx4G8qQ97Aw9ZumrqoJrSMCxTkwTcXH8Jc5XDn5sD6JjXJHm6N
   iipzlL6jHmz8vP7LiwH4Iczr+iBSOCtlQJqUI1aoA1lKcblEXpUOuSGDK
   Rpxup9wAHO32q1DIzCMQX3Aommocs8RzwAcJ8lL8KDXY2B1l31IrG3/PO
   7UIbiuqBP1ZgMKRy9nG4yjHSYh/a32yzM3btNX1db65SA6XFy01Y96puj
   M9i5ksWqv7m+BvwFPFO65WmdHs1zR96489ZhiOLwLBWfOeq9bVmNbePFv
   DD+ir4tOP898iiiyBlTy887dvJntALU9wjV/3Rofp2LU12GJ0Tgv4UHAI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365564618"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="365564618"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 20:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="672972724"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="672972724"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2023 20:15:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pce5G-0008HD-2n;
	Thu, 16 Mar 2023 03:15:18 +0000
Date: Thu, 16 Mar 2023 11:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Wertenbroek <rick.wertenbroek@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-rockchip-ep.c:302:13: error: 'mmc'
 undeclared
Message-ID: <202303161101.V2flmDMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Damien-Le-Moal/PCI-endpoint-Automatically-create-a-function-specific-attributes-group/20230308-170657
head:   7b6ed26025e4f5d5c353ad7f4f06e1c58643ceb1
commit: f87a7257008e97aba171ff131f59060d9b7f7e87 PCI: rockchip: Add parameter check for RK3399 PCIe endpoint core set_msi()
date:   8 days ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230316/202303161101.V2flmDMS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f87a7257008e97aba171ff131f59060d9b7f7e87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Damien-Le-Moal/PCI-endpoint-Automatically-create-a-function-specific-attributes-group/20230308-170657
        git checkout f87a7257008e97aba171ff131f59060d9b7f7e87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161101.V2flmDMS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-rockchip-ep.c: In function 'rockchip_pcie_ep_set_msi':
>> drivers/pci/controller/pcie-rockchip-ep.c:302:13: error: 'mmc' undeclared (first use in this function)
     302 |         if (mmc > 0x5) {
         |             ^~~
   drivers/pci/controller/pcie-rockchip-ep.c:302:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pci/controller/pcie-rockchip-ep.c: In function 'rockchip_pcie_ep_probe':
   drivers/pci/controller/pcie-rockchip-ep.c:543:13: warning: unused variable 'cfg' [-Wunused-variable]
     543 |         u32 cfg;
         |             ^~~


vim +/mmc +302 drivers/pci/controller/pcie-rockchip-ep.c

   289	
   290	static int rockchip_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
   291					    u8 multi_msg_cap)
   292	{
   293		struct rockchip_pcie_ep *ep = epc_get_drvdata(epc);
   294		struct rockchip_pcie *rockchip = &ep->rockchip;
   295		u32 flags;
   296	
   297		if (fn) {
   298			dev_err(&epc->dev, "This endpoint controller only supports a single physical function\n");
   299			return -EINVAL;
   300		}
   301	
 > 302		if (mmc > 0x5) {
   303			dev_err(&epc->dev, "Number of MSI IRQs cannot be more than 32\n");
   304			return -EINVAL;
   305		}
   306	
   307		flags = rockchip_pcie_read(rockchip,
   308					   ROCKCHIP_PCIE_EP_FUNC_BASE(fn) +
   309					   ROCKCHIP_PCIE_EP_MSI_CTRL_REG);
   310		flags &= ~ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_MASK;
   311		flags |=
   312		   (multi_msg_cap << ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_OFFSET) |
   313		   (PCI_MSI_FLAGS_64BIT << ROCKCHIP_PCIE_EP_MSI_FLAGS_OFFSET);
   314		flags &= ~ROCKCHIP_PCIE_EP_MSI_CTRL_MASK_MSI_CAP;
   315		rockchip_pcie_write(rockchip, flags,
   316				    ROCKCHIP_PCIE_EP_FUNC_BASE(fn) +
   317				    ROCKCHIP_PCIE_EP_MSI_CTRL_REG);
   318		return 0;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
