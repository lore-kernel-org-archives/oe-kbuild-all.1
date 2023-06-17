Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AE4C8D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686998914; x=1718534914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mputCp1f/vMHKUQTXuq8SgDllpSAqQ/xxY2SdXlzO3w=;
  b=bXFezZ2ZEto3ZXdXyetqZc7Q9Hqy1RpPHCgnf0V1jXKkIVFcys37qdvD
   viE/ilYxLIp2eqqtXuD0BowWTWJZ2eVSWScZn2T0vTQnHBRmGziA64Ghz
   F4fOFeKShtnlwk4oftPm7BUdl9bS/P4MYH+xOlYrDw/fyruo7T5iX37F6
   an4c3YBb3kVIKx3iquVw7Ya8Th/tr4GvHNtQNHPvRDYykpVFy1rrMeqsT
   gDP8BD3pUFFLuiV70AmvO3x5dD25bb1WXQWZZSxpmTaEbHnoy5jqomUqq
   gjWJi7HTi/vae26FBKXOsSlbszst61CZ3c9mC7WJfU4GZNb4sBnI7ct1F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344119423"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="344119423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 03:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="803106208"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="803106208"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2023 03:48:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qATTp-0002gC-1y;
	Sat, 17 Jun 2023 10:48:29 +0000
Date: Sat, 17 Jun 2023 18:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Achal Verma <a-verma1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 9/52]
 drivers/pci/controller/cadence/pci-j721e.c:197:5: warning: no previous
 prototype for function 'j721e_pcie_setup_link_interrupts'
Message-ID: <202306171858.9ct1Wbqv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   8476579d4c83c9641aca432fd4eb964999b63f54
commit: 89f24ccfd3529c9fbc7b92c3bb47e37426bcada1 [9/52] PCI: j721e: Add support to build pci-j721e as a kernel module
config: arm64-randconfig-r023-20230617 (https://download.01.org/0day-ci/archive/20230617/202306171858.9ct1Wbqv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171858.9ct1Wbqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171858.9ct1Wbqv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pci-j721e.c:197:5: warning: no previous prototype for function 'j721e_pcie_setup_link_interrupts' [-Wmissing-prototypes]
     197 | int j721e_pcie_setup_link_interrupts(struct j721e_pcie *pcie)
         |     ^
   drivers/pci/controller/cadence/pci-j721e.c:197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     197 | int j721e_pcie_setup_link_interrupts(struct j721e_pcie *pcie)
         | ^
         | static 
   1 warning generated.


vim +/j721e_pcie_setup_link_interrupts +197 drivers/pci/controller/cadence/pci-j721e.c

   196	
 > 197	int j721e_pcie_setup_link_interrupts(struct j721e_pcie *pcie)
   198	{
   199		struct device *dev = pcie->cdns_pcie->dev;
   200		struct platform_device *pdev = to_platform_device(dev);
   201		int ret;
   202	
   203		ret = platform_get_irq_byname(pdev, "link_state");
   204		if (ret < 0)
   205			return ret;
   206		ret = devm_request_irq(dev, ret, j721e_pcie_link_irq_handler, 0,
   207				       "j721e-pcie-link-down-irq", pcie);
   208		if (ret < 0) {
   209			dev_err(dev, "failed to request link state IRQ %d\n", ret);
   210			return ret;
   211		}
   212	
   213		j721e_pcie_config_link_irq(pcie);
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
