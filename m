Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC2F7485
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674142863; x=1705678863;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=peCFlv/5d84CnjrSgWcxd/zaOthwmotZELSfUn5zxMo=;
  b=b0SEmZxBi0mWUEW/amAagMWxyW0jG7pC+HDaEAvp/mBYdk2fWT8jUv2/
   r0Mi5qU38X7RPb4aMZQxl71CEJWdLtD7aplPdFS08P3quafp15/uIbcP9
   OGfM/rnZUX+yXjQvqEDciGtWoqEZEFLVqayA6CyhXSd46ZfZcrLTIy38d
   3awlHnVwVpVcyl06fuPTikggJ67cU04b5HqQLg1yx7wcUbA5TtYnHhdQ5
   2Yn56VyksvOwhBw36sza124+vNSwsF0sn974h6URuD8QAsh7kCIkK4aYf
   q649JhSHC7klvNbnAtAH3Jil5e24AdO8ZS2a/LKLjFiEFa9SxvZAAcoKc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="308892041"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="308892041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 07:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834011462"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="834011462"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 07:41:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIX28-0001a9-2X;
	Thu, 19 Jan 2023 15:40:56 +0000
Date: Thu, 19 Jan 2023 23:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2 1/1] drivers/pci/hotplug/../pci.h:336:1:
 error: non-void function does not return a value in all control paths
Message-ID: <202301192344.kEw4xecL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/l1k/linux pciehp_deadlock_v2
head:   0f8e04529ef9871b4a970ea689d3899e06440bb9
commit: d62bc4ae9ed6744873aea71d1d90ef7fd3d583f0 [1/1] PCI: hotplug: Allow marking devices as disconnected during bind/unbind
config: riscv-buildonly-randconfig-r002-20230119 (https://download.01.org/0day-ci/archive/20230119/202301192344.kEw4xecL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/l1k/linux/commit/d62bc4ae9ed6744873aea71d1d90ef7fd3d583f0
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k pciehp_deadlock_v2
        git checkout d62bc4ae9ed6744873aea71d1d90ef7fd3d583f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/pci/hotplug/pci_hotplug_core.c:32:
>> drivers/pci/hotplug/../pci.h:336:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.
--
   In file included from drivers/pci/controller/pci-ftpci100.c:31:
>> drivers/pci/controller/../pci.h:336:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.
--
   In file included from drivers/pci/controller/pcie-microchip-host.c:20:
>> drivers/pci/controller/../pci.h:336:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   drivers/pci/controller/pcie-microchip-host.c:866:32: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
           devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/pci/controller/cadence/pci-j721e.c:22:
>> drivers/pci/controller/cadence/../../pci.h:336:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.
--
   In file included from drivers/pci/controller/dwc/pcie-designware.c:22:
>> drivers/pci/controller/dwc/../../pci.h:336:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.
--
   In file included from drivers/pci/controller/mobiveil/pcie-mobiveil.c:18:
   In file included from drivers/pci/controller/mobiveil/pcie-mobiveil.h:18:
>> drivers/pci/controller/mobiveil/../../pci.h:336:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +336 drivers/pci/hotplug/../pci.h

d1b054da8f5999 Yu Zhao              2009-03-20  306  
a6bd101b8f84f9 Keith Busch          2018-09-20  307  /**
a6bd101b8f84f9 Keith Busch          2018-09-20  308   * pci_dev_set_io_state - Set the new error state if possible.
a6bd101b8f84f9 Keith Busch          2018-09-20  309   *
347269c113f10f Krzysztof Wilczyński 2021-07-03  310   * @dev: PCI device to set new error_state
347269c113f10f Krzysztof Wilczyński 2021-07-03  311   * @new: the state we want dev to be in
a6bd101b8f84f9 Keith Busch          2018-09-20  312   *
d62bc4ae9ed674 Lukas Wunner         2023-01-18  313   * If the device is experiencing perm_failure, it has to remain in that state.
d62bc4ae9ed674 Lukas Wunner         2023-01-18  314   * Any other transition is allowed.
a6bd101b8f84f9 Keith Busch          2018-09-20  315   *
a6bd101b8f84f9 Keith Busch          2018-09-20  316   * Returns true if state has been changed to the requested state.
a6bd101b8f84f9 Keith Busch          2018-09-20  317   */
a6bd101b8f84f9 Keith Busch          2018-09-20  318  static inline bool pci_dev_set_io_state(struct pci_dev *dev,
a6bd101b8f84f9 Keith Busch          2018-09-20  319  					pci_channel_state_t new)
a6bd101b8f84f9 Keith Busch          2018-09-20  320  {
d62bc4ae9ed674 Lukas Wunner         2023-01-18  321  	pci_channel_state_t old;
a6bd101b8f84f9 Keith Busch          2018-09-20  322  
a6bd101b8f84f9 Keith Busch          2018-09-20  323  	switch (new) {
a6bd101b8f84f9 Keith Busch          2018-09-20  324  	case pci_channel_io_perm_failure:
d62bc4ae9ed674 Lukas Wunner         2023-01-18  325  		xchg(&dev->error_state, pci_channel_io_perm_failure);
d62bc4ae9ed674 Lukas Wunner         2023-01-18  326  		return true;
a6bd101b8f84f9 Keith Busch          2018-09-20  327  	case pci_channel_io_frozen:
d62bc4ae9ed674 Lukas Wunner         2023-01-18  328  		old = cmpxchg(&dev->error_state, pci_channel_io_normal,
d62bc4ae9ed674 Lukas Wunner         2023-01-18  329  			      pci_channel_io_frozen);
d62bc4ae9ed674 Lukas Wunner         2023-01-18  330  		return old != pci_channel_io_perm_failure;
a6bd101b8f84f9 Keith Busch          2018-09-20  331  	case pci_channel_io_normal:
d62bc4ae9ed674 Lukas Wunner         2023-01-18  332  		old = cmpxchg(&dev->error_state, pci_channel_io_frozen,
d62bc4ae9ed674 Lukas Wunner         2023-01-18  333  			      pci_channel_io_normal);
d62bc4ae9ed674 Lukas Wunner         2023-01-18  334  		return old != pci_channel_io_perm_failure;
a6bd101b8f84f9 Keith Busch          2018-09-20  335  	}
a6bd101b8f84f9 Keith Busch          2018-09-20 @336  }
89ee9f7680031d Keith Busch          2017-03-29  337  

:::::: The code at line 336 was first introduced by commit
:::::: a6bd101b8f84f9b98768e9ab1e418c239e2e669f PCI: Unify device inaccessible

:::::: TO: Keith Busch <keith.busch@intel.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
