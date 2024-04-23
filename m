Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4722F00
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 18:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713897826; cv=none; b=PkC51onri/DLSv9A+qCN7EElg6qq7MLVZz6X5jjAv6uqqgETMpaJAwYI8eIAyAWw7Nqn/uhOKPyRURxg7ScTeTotAx3nI6NUlyFMENGwVDu2pU/soFyMkwX3cQxyRV+u63aTKb6I4FPt/KvuxRh2wyZbHWVlq/j43fr1OYVTn28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713897826; c=relaxed/simple;
	bh=oDYjBwtyk3LIBBH9n00zA2zZEg1BjM6TvImUE643dnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEL2HJyPzx2YFkZnjY0E8NWCj8GB9q2/Wp9E9tcSVy5PMQu1OfZzTa7pjdiKYMe6XWqwGjNYIknJJRYjjOP33hJem60LLD2WUyxYs+w6N5mOjl0ukS6jE3Kw1pvBJflSDZpzbDfpn16OUMzNiVvQyYdckI5H2NJnNDEdUXz8Gc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxm7PD01; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxm7PD01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713897824; x=1745433824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDYjBwtyk3LIBBH9n00zA2zZEg1BjM6TvImUE643dnc=;
  b=kxm7PD01MhlOVtNJthnlTwzjHkKbzp8z1UcZS2Nsxacn8wpfMgINfomC
   CYbNhflUHGLNrPa73RBgxcRxXDZe1/kdToRHORm+fT9qiusH+T2bj7n2v
   GfncclDyjyqCNEJTJac4KlOfE6wwJzQzY984P9VHygXEf03UuQEmf5q7C
   VZwkxjZabfvRU3pBPkFAL6d+fD0oOqGBr22BVaS+ObP3MHB8NsvGs5qWR
   EMTRy3p9g33I2X9CMX7+9o4rlrNFyFi3vuzDAjOAWCMIlikjoCCBxgSg0
   ngcxewsORufUovWT7bfftl3WuZzfaMtOrnJPLh1zpO96v6/xTvm5Vt5+s
   w==;
X-CSE-ConnectionGUID: c/JpDb9gTEyta22VPHn0nw==
X-CSE-MsgGUID: MscpnN2RRNuutc51rIbaqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20115294"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20115294"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 11:43:43 -0700
X-CSE-ConnectionGUID: bMCKnp8HSjuVYChOeXKUcQ==
X-CSE-MsgGUID: 3rQvmnB2Tr2k3aV1JzPsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29109910"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Apr 2024 11:43:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzL7D-0000Re-1d;
	Tue, 23 Apr 2024 18:43:39 +0000
Date: Wed, 24 Apr 2024 02:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 6/6] drivers/spi/spi-microchip-core-qspi.c:776:1:
 warning: 'alias' attribute ignored
Message-ID: <202404240214.FlEjHkBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   1c9b80c2e5ca502bc305922729b49e156dcdf6da
commit: 1c9b80c2e5ca502bc305922729b49e156dcdf6da [6/6] wip
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240214.FlEjHkBJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240214.FlEjHkBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240214.FlEjHkBJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/spi/spi-microchip-core-qspi.c: In function 'mchp_coreqspi_write_read_op':
   drivers/spi/spi-microchip-core-qspi.c:287:13: error: invalid storage class for function 'mchp_coreqspi_enable_ints'
     287 | static void mchp_coreqspi_enable_ints(struct mchp_coreqspi *qspi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:296:13: error: invalid storage class for function 'mchp_coreqspi_disable_ints'
     296 | static void mchp_coreqspi_disable_ints(struct mchp_coreqspi *qspi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:301:20: error: invalid storage class for function 'mchp_coreqspi_isr'
     301 | static irqreturn_t mchp_coreqspi_isr(int irq, void *dev_id)
         |                    ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:330:12: error: invalid storage class for function 'mchp_coreqspi_setup_clock'
     330 | static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_device *spi)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:362:12: error: invalid storage class for function 'mchp_coreqspi_setup_op'
     362 | static int mchp_coreqspi_setup_op(struct spi_device *spi_dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:375:20: error: invalid storage class for function 'mchp_coreqspi_config_op'
     375 | static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:430:12: error: invalid storage class for function 'mchp_coreqspi_wait_for_ready'
     430 | static int mchp_coreqspi_wait_for_ready(struct spi_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:449:12: error: invalid storage class for function 'mchp_coreqspi_exec_op'
     449 | static int mchp_coreqspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:519:13: error: invalid storage class for function 'mchp_coreqspi_supports_op'
     519 | static bool mchp_coreqspi_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:546:12: error: invalid storage class for function 'mchp_coreqspi_adjust_op_size'
     546 | static int mchp_coreqspi_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:557:27: error: initializer element is not constant
     557 |         .adjust_op_size = mchp_coreqspi_adjust_op_size,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:557:27: note: (near initialization for 'mchp_coreqspi_mem_ops.adjust_op_size')
   drivers/spi/spi-microchip-core-qspi.c:558:24: error: initializer element is not constant
     558 |         .supports_op = mchp_coreqspi_supports_op,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:558:24: note: (near initialization for 'mchp_coreqspi_mem_ops.supports_op')
   drivers/spi/spi-microchip-core-qspi.c:559:20: error: initializer element is not constant
     559 |         .exec_op = mchp_coreqspi_exec_op,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:559:20: note: (near initialization for 'mchp_coreqspi_mem_ops.exec_op')
   drivers/spi/spi-microchip-core-qspi.c:563:13: error: invalid storage class for function 'mchp_coreqspi_activate_cs'
     563 | static void mchp_coreqspi_activate_cs(struct spi_device *spi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:569:13: error: invalid storage class for function 'mchp_coreqspi_deactivate_cs'
     569 | static void mchp_coreqspi_deactivate_cs(struct spi_device *spi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:575:12: error: invalid storage class for function 'mchp_coreqspi_transfer_one_message'
     575 | static int mchp_coreqspi_transfer_one_message(struct spi_controller *ctlr,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:704:12: error: invalid storage class for function 'mchp_coreqspi_probe'
     704 | static int mchp_coreqspi_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:762:13: error: invalid storage class for function 'mchp_coreqspi_remove'
     762 | static void mchp_coreqspi_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:776:1: warning: 'alias' attribute ignored [-Wattributes]
     776 | MODULE_DEVICE_TABLE(of, mchp_coreqspi_of_match);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:779:18: error: initializer element is not constant
     779 |         .probe = mchp_coreqspi_probe,
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:779:18: note: (near initialization for 'mchp_coreqspi_driver.probe')
   drivers/spi/spi-microchip-core-qspi.c:784:23: error: initializer element is not constant
     784 |         .remove_new = mchp_coreqspi_remove,
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:784:23: note: (near initialization for 'mchp_coreqspi_driver.remove_new')
   In file included from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/spi/spi-microchip-core-qspi.c:20:
   drivers/spi/spi-microchip-core-qspi.c:786:24: error: invalid storage class for function 'mchp_coreqspi_driver_init'
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:258:19: note: in definition of macro 'module_driver'
     258 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/spi/spi-microchip-core-qspi.c:17:
>> include/linux/module.h:131:49: error: invalid storage class for function '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:303:9: note: in expansion of macro 'module_driver'
     303 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: warning: 'alias' attribute ignored [-Wattributes]
   drivers/spi/spi-microchip-core-qspi.c:786:24: error: invalid storage class for function 'mchp_coreqspi_driver_exit'
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:263:20: note: in definition of macro 'module_driver'
     263 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:139:49: error: invalid storage class for function '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:303:9: note: in expansion of macro 'module_driver'
     303 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: warning: 'alias' attribute ignored [-Wattributes]
   drivers/spi/spi-microchip-core-qspi.c:790:1: error: expected declaration or statement at end of input
     790 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:227:13: warning: unused variable 'frames' [-Wunused-variable]
     227 |         u32 frames, control, data;
         |             ^~~~~~


vim +/alias +776 drivers/spi/spi-microchip-core-qspi.c

8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  771  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  772  static const struct of_device_id mchp_coreqspi_of_match[] = {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  773  	{ .compatible = "microchip,coreqspi-rtl-v2" },
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  774  	{ /* sentinel */ }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  775  };
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @776  MODULE_DEVICE_TABLE(of, mchp_coreqspi_of_match);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  777  

:::::: The code at line 776 was first introduced by commit
:::::: 8596124c4c1bc7561454cee0463c16eca70b5d25 spi: microchip-core-qspi: Add support for microchip fpga qspi controllers

:::::: TO: Naga Sureshkumar Relli <nagasuresh.relli@microchip.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
