Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9657FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686997591; x=1718533591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cA+U05x24xkJQX26ac1tXeX5loZP/CE4vZuzA7IhXoY=;
  b=X93CSqR/hn8k9mDT/P1deeCETEPNfuBtzzPMIp+RBtg6CgIw5/z4EQqH
   ZuNyRUSYR29D7Vp9clBT0cpsKLaeeyC02vgfbclEq5WHTQe/uzir2kT3m
   Indy1KNs54SHPseEbv/ylP9lKEKj/gIxsAqlPf0HT7DxDVGEAUFlVy56y
   je57fg1C/48mm8ZG3mJV9G/cJ+6VWyeAQ73TcRntZHcTMfXJGX46nZhKo
   RdKss+EA0iQZt4Zh88bj89uCCsPGefa2JNNxAT9op13f3OXmi8zzMTsyJ
   Tgxm+8VH/VmbaN0rLdTxAW9U1nuGw42rHDQVCS4mS15jIaqmlHfLaFUi8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="423035871"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="423035871"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 03:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="887385050"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="887385050"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Jun 2023 03:26:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAT8W-0002ew-3C;
	Sat, 17 Jun 2023 10:26:28 +0000
Date: Sat, 17 Jun 2023 18:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Achal Verma <a-verma1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 9/52]
 drivers/pci/controller/cadence/pci-j721e.c:197:5: warning: no previous
 prototype for 'j721e_pcie_setup_link_interrupts'
Message-ID: <202306171833.Bj8L4Xu2-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230617/202306171833.Bj8L4Xu2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 89f24ccfd3529c9fbc7b92c3bb47e37426bcada1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/pci/controller/cadence/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171833.Bj8L4Xu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pci-j721e.c:197:5: warning: no previous prototype for 'j721e_pcie_setup_link_interrupts' [-Wmissing-prototypes]
     197 | int j721e_pcie_setup_link_interrupts(struct j721e_pcie *pcie)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
