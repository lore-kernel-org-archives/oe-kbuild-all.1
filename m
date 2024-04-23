Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613475B1E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903467; cv=none; b=YwGixjgyv6Ej2lEV40GAELJyrYRDBU/FhuOka9MjwE4ZzIESEOk7b2T/DP6ovrM2nD/LwFiiANxShg7DNGH9d3i6l9/96Rh6BUDlmr2+PPPcb04c8IziH/WG/POvTnMcV6xGQncBfrifOT7Q8Z6O9rmi/b3BE6YJLXU407lXR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903467; c=relaxed/simple;
	bh=kMIWvITdihmvE+qf/zDKcB3zjAIspbKVdkiHr48EwzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7Mm+vp+4O0eZD7Qm4/zz69Nq4kBTm7RtBZHHq9V7OCL8mYKvXUH5y7BOdtTl+yJ272wjnyHGpzhI4oehVNZhep0BCmL11EbJEiFlCcyHdI/bEj3UBV7BuPUAgmnA1+NLYzkzL8sWrpMH5hgKOaLBbdr8/CdNzBjvecMQoqV/6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmtVkD9R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmtVkD9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713903466; x=1745439466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMIWvITdihmvE+qf/zDKcB3zjAIspbKVdkiHr48EwzQ=;
  b=fmtVkD9RTFjmf2VbTGZlSc+pRKZn84dZ29f2QtrICr/sWRj4JAV746Rk
   74Cn0eJ24VERYgX7NKqMTnmPDgp2Pc+12eRXMfW0MPoxZt5ott81ANhOe
   P7NIB4+XUINiUeDHVxdoXNMUE2I5ViYcbh97Sdg9/Uzg4ehySHEB7E1N0
   2re+HyxEtbGRKW8CXysmkn/n3SDVVnnYCB/87ZodmZtyLRVwNAdqK2vnh
   QgQIk2nZKMAq7oE1s+9ixteBg0e+/E6NuH7U6F5LSSoQqZ6NE7Dl1Gp6Y
   KGyRxvbOWNQ3A9oIMBIC4Uyyg2LJrW2mbCMpvXWYczosnZ8nJDKL0UmIo
   g==;
X-CSE-ConnectionGUID: 8D8+G5RvS4ejcwJTtPbknA==
X-CSE-MsgGUID: fE2ttcHvR8mENLDi1uNO2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9433756"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9433756"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:17:45 -0700
X-CSE-ConnectionGUID: 1dzjkfMgRcKnwh2kJQX14Q==
X-CSE-MsgGUID: cvhQU8jyTbmcpZZPu+he7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24478849"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2024 13:17:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzMaD-0000Uy-0d;
	Tue, 23 Apr 2024 20:17:41 +0000
Date: Wed, 24 Apr 2024 04:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 6/6] drivers/spi/spi-microchip-core-qspi.c:287:13:
 error: invalid storage class for function 'mchp_coreqspi_enable_ints'
Message-ID: <202404240405.4TGmciOz-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404240405.4TGmciOz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240405.4TGmciOz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240405.4TGmciOz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-microchip-core-qspi.c: In function 'mchp_coreqspi_write_read_op':
>> drivers/spi/spi-microchip-core-qspi.c:287:13: error: invalid storage class for function 'mchp_coreqspi_enable_ints'
     287 | static void mchp_coreqspi_enable_ints(struct mchp_coreqspi *qspi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:296:13: error: invalid storage class for function 'mchp_coreqspi_disable_ints'
     296 | static void mchp_coreqspi_disable_ints(struct mchp_coreqspi *qspi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:301:20: error: invalid storage class for function 'mchp_coreqspi_isr'
     301 | static irqreturn_t mchp_coreqspi_isr(int irq, void *dev_id)
         |                    ^~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:330:12: error: invalid storage class for function 'mchp_coreqspi_setup_clock'
     330 | static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_device *spi)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:362:12: error: invalid storage class for function 'mchp_coreqspi_setup_op'
     362 | static int mchp_coreqspi_setup_op(struct spi_device *spi_dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:375:20: error: invalid storage class for function 'mchp_coreqspi_config_op'
     375 | static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:430:12: error: invalid storage class for function 'mchp_coreqspi_wait_for_ready'
     430 | static int mchp_coreqspi_wait_for_ready(struct spi_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:449:12: error: invalid storage class for function 'mchp_coreqspi_exec_op'
     449 | static int mchp_coreqspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:519:13: error: invalid storage class for function 'mchp_coreqspi_supports_op'
     519 | static bool mchp_coreqspi_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:546:12: error: invalid storage class for function 'mchp_coreqspi_adjust_op_size'
     546 | static int mchp_coreqspi_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:557:27: error: initializer element is not constant
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
>> drivers/spi/spi-microchip-core-qspi.c:563:13: error: invalid storage class for function 'mchp_coreqspi_activate_cs'
     563 | static void mchp_coreqspi_activate_cs(struct spi_device *spi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:569:13: error: invalid storage class for function 'mchp_coreqspi_deactivate_cs'
     569 | static void mchp_coreqspi_deactivate_cs(struct spi_device *spi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:575:12: error: invalid storage class for function 'mchp_coreqspi_transfer_one_message'
     575 | static int mchp_coreqspi_transfer_one_message(struct spi_controller *ctlr,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:704:12: error: invalid storage class for function 'mchp_coreqspi_probe'
     704 | static int mchp_coreqspi_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:762:13: error: invalid storage class for function 'mchp_coreqspi_remove'
     762 | static void mchp_coreqspi_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~~~~~~
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
>> drivers/spi/spi-microchip-core-qspi.c:786:24: error: invalid storage class for function 'mchp_coreqspi_driver_init'
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:258:19: note: in definition of macro 'module_driver'
     258 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:31,
                    from include/linux/clk.h:13,
                    from drivers/spi/spi-microchip-core-qspi.c:11:
   drivers/spi/spi-microchip-core-qspi.c:786:24: error: initializer element is not constant
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:41: note: in expansion of macro '__define_initcall'
     311 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
     316 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:25: note: in expansion of macro '__initcall'
      88 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:303:9: note: in expansion of macro 'module_driver'
     303 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:786:24: error: invalid storage class for function 'mchp_coreqspi_driver_exit'
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:263:20: note: in definition of macro 'module_driver'
     263 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:24: error: initializer element is not constant
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:319:57: note: in definition of macro '__exitcall'
     319 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                                                         ^~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:303:9: note: in expansion of macro 'module_driver'
     303 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:790:1: error: expected declaration or statement at end of input
     790 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:227:13: warning: unused variable 'frames' [-Wunused-variable]
     227 |         u32 frames, control, data;
         |             ^~~~~~


vim +/mchp_coreqspi_enable_ints +287 drivers/spi/spi-microchip-core-qspi.c

51610d6a78f7de Jamie Gibbons          2023-11-29  285  
51610d6a78f7de Jamie Gibbons          2023-11-29  286  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @287  static void mchp_coreqspi_enable_ints(struct mchp_coreqspi *qspi)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  288  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  289  	u32 mask = IEN_TXDONE |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  290  		   IEN_RXDONE |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  291  		   IEN_RXAVAILABLE;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  292  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  293  	writel_relaxed(mask, qspi->regs + REG_IEN);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  294  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  295  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @296  static void mchp_coreqspi_disable_ints(struct mchp_coreqspi *qspi)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  297  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  298  	writel_relaxed(0, qspi->regs + REG_IEN);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  299  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  300  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @301  static irqreturn_t mchp_coreqspi_isr(int irq, void *dev_id)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  302  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  303  	struct mchp_coreqspi *qspi = (struct mchp_coreqspi *)dev_id;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  304  	irqreturn_t ret = IRQ_NONE;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  305  	int intfield = readl_relaxed(qspi->regs + REG_STATUS) & STATUS_MASK;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  306  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  307  	if (intfield == 0)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  308  		return ret;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  309  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  310  	if (intfield & IEN_TXDONE) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  311  		writel_relaxed(IEN_TXDONE, qspi->regs + REG_STATUS);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  312  		ret = IRQ_HANDLED;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  313  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  314  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  315  	if (intfield & IEN_RXAVAILABLE) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  316  		writel_relaxed(IEN_RXAVAILABLE, qspi->regs + REG_STATUS);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  317  		mchp_coreqspi_read_op(qspi);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  318  		ret = IRQ_HANDLED;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  319  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  320  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  321  	if (intfield & IEN_RXDONE) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  322  		writel_relaxed(IEN_RXDONE, qspi->regs + REG_STATUS);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  323  		complete(&qspi->data_completion);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  324  		ret = IRQ_HANDLED;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  325  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  326  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  327  	return ret;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  328  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  329  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @330  static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_device *spi)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  331  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  332  	unsigned long clk_hz;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  333  	u32 control, baud_rate_val = 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  334  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  335  	clk_hz = clk_get_rate(qspi->clk);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  336  	if (!clk_hz)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  337  		return -EINVAL;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  338  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  339  	baud_rate_val = DIV_ROUND_UP(clk_hz, 2 * spi->max_speed_hz);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  340  	if (baud_rate_val > MAX_DIVIDER || baud_rate_val < MIN_DIVIDER) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  341  		dev_err(&spi->dev,
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  342  			"could not configure the clock for spi clock %d Hz & system clock %ld Hz\n",
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  343  			spi->max_speed_hz, clk_hz);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  344  		return -EINVAL;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  345  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  346  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  347  	control = readl_relaxed(qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  348  	control |= baud_rate_val << CONTROL_CLKRATE_SHIFT;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  349  	writel_relaxed(control, qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  350  	control = readl_relaxed(qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  351  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  352  	if ((spi->mode & SPI_CPOL) && (spi->mode & SPI_CPHA))
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  353  		control |= CONTROL_CLKIDLE;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  354  	else
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  355  		control &= ~CONTROL_CLKIDLE;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  356  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  357  	writel_relaxed(control, qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  358  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  359  	return 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  360  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  361  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @362  static int mchp_coreqspi_setup_op(struct spi_device *spi_dev)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  363  {
5d97a3abbb5e24 Yang Yingliang         2023-08-23  364  	struct spi_controller *ctlr = spi_dev->controller;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  365  	struct mchp_coreqspi *qspi = spi_controller_get_devdata(ctlr);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  366  	u32 control = readl_relaxed(qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  367  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  368  	control |= (CONTROL_MASTER | CONTROL_ENABLE);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  369  	control &= ~CONTROL_CLKIDLE;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  370  	writel_relaxed(control, qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  371  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  372  	return 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  373  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  374  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @375  static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  376  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  377  	u32 idle_cycles = 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  378  	int total_bytes, cmd_bytes, frames, ctrl;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  379  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  380  	cmd_bytes = op->cmd.nbytes + op->addr.nbytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  381  	total_bytes = cmd_bytes + op->data.nbytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  382  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  383  	/*
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  384  	 * As per the coreQSPI IP spec,the number of command and data bytes are
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  385  	 * controlled by the frames register for each SPI sequence. This supports
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  386  	 * the SPI flash memory read and writes sequences as below. so configure
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  387  	 * the cmd and total bytes accordingly.
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  388  	 * ---------------------------------------------------------------------
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  389  	 * TOTAL BYTES  |  CMD BYTES | What happens                             |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  390  	 * ______________________________________________________________________
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  391  	 *              |            |                                          |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  392  	 *     1        |   1        | The SPI core will transmit a single byte |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  393  	 *              |            | and receive data is discarded            |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  394  	 *              |            |                                          |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  395  	 *     1        |   0        | The SPI core will transmit a single byte |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  396  	 *              |            | and return a single byte                 |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  397  	 *              |            |                                          |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  398  	 *     10       |   4        | The SPI core will transmit 4 command     |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  399  	 *              |            | bytes discarding the receive data and    |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  400  	 *              |            | transmits 6 dummy bytes returning the 6  |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  401  	 *              |            | received bytes and return a single byte  |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  402  	 *              |            |                                          |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  403  	 *     10       |   10       | The SPI core will transmit 10 command    |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  404  	 *              |            |                                          |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  405  	 *     10       |    0       | The SPI core will transmit 10 command    |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  406  	 *              |            | bytes and returning 10 received bytes    |
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  407  	 * ______________________________________________________________________
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  408  	 */
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  409  	if (!(op->data.dir == SPI_MEM_DATA_IN))
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  410  		cmd_bytes = total_bytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  411  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  412  	frames = total_bytes & BYTESUPPER_MASK;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  413  	writel_relaxed(frames, qspi->regs + REG_FRAMESUP);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  414  	frames = total_bytes & BYTESLOWER_MASK;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  415  	frames |= cmd_bytes << FRAMES_CMDBYTES_SHIFT;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  416  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  417  	if (op->dummy.buswidth)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  418  		idle_cycles = op->dummy.nbytes * 8 / op->dummy.buswidth;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  419  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  420  	frames |= idle_cycles << FRAMES_IDLE_SHIFT;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  421  	ctrl = readl_relaxed(qspi->regs + REG_CONTROL);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  422  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  423  	if (ctrl & CONTROL_MODE12_MASK)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  424  		frames |= (1 << FRAMES_SHIFT);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  425  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  426  	frames |= FRAMES_FLAGWORD;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  427  	writel_relaxed(frames, qspi->regs + REG_FRAMES);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  428  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  429  
7995b661ffa614 Conor Dooley           2024-04-23 @430  static int mchp_coreqspi_wait_for_ready(struct spi_mem *mem)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  431  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  432  	struct mchp_coreqspi *qspi = spi_controller_get_devdata
5d97a3abbb5e24 Yang Yingliang         2023-08-23  433  				    (mem->spi->controller);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  434  	u32 status;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  435  	int ret;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  436  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  437  	ret = readl_poll_timeout(qspi->regs + REG_STATUS, status,
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  438  				 (status & STATUS_READY), 0,
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  439  				 TIMEOUT_MS);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  440  	if (ret) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  441  		dev_err(&mem->spi->dev,
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  442  			"Timeout waiting on QSPI ready.\n");
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  443  		return -ETIMEDOUT;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  444  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  445  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  446  	return ret;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  447  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  448  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08 @449  static int mchp_coreqspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  450  {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  451  	struct mchp_coreqspi *qspi = spi_controller_get_devdata
5d97a3abbb5e24 Yang Yingliang         2023-08-23  452  				    (mem->spi->controller);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  453  	u32 address = op->addr.val;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  454  	u8 opcode = op->cmd.opcode;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  455  	u8 opaddr[5];
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  456  	int err, i;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  457  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  458  	mutex_lock(&qspi->op_lock);
7995b661ffa614 Conor Dooley           2024-04-23  459  	err = mchp_coreqspi_wait_for_ready(mem);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  460  	if (err)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  461  		goto error;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  462  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  463  	err = mchp_coreqspi_setup_clock(qspi, mem->spi);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  464  	if (err)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  465  		goto error;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  466  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  467  	err = mchp_coreqspi_set_mode(qspi, op);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  468  	if (err)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  469  		goto error;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  470  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  471  	reinit_completion(&qspi->data_completion);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  472  	mchp_coreqspi_config_op(qspi, op);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  473  	if (op->cmd.opcode) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  474  		qspi->txbuf = &opcode;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  475  		qspi->rxbuf = NULL;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  476  		qspi->tx_len = op->cmd.nbytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  477  		qspi->rx_len = 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  478  		mchp_coreqspi_write_op(qspi, false);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  479  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  480  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  481  	qspi->txbuf = &opaddr[0];
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  482  	if (op->addr.nbytes) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  483  		for (i = 0; i < op->addr.nbytes; i++)
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  484  			qspi->txbuf[i] = address >> (8 * (op->addr.nbytes - i - 1));
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  485  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  486  		qspi->rxbuf = NULL;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  487  		qspi->tx_len = op->addr.nbytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  488  		qspi->rx_len = 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  489  		mchp_coreqspi_write_op(qspi, false);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  490  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  491  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  492  	if (op->data.nbytes) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  493  		if (op->data.dir == SPI_MEM_DATA_OUT) {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  494  			qspi->txbuf = (u8 *)op->data.buf.out;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  495  			qspi->rxbuf = NULL;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  496  			qspi->rx_len = 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  497  			qspi->tx_len = op->data.nbytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  498  			mchp_coreqspi_write_op(qspi, true);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  499  		} else {
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  500  			qspi->txbuf = NULL;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  501  			qspi->rxbuf = (u8 *)op->data.buf.in;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  502  			qspi->rx_len = op->data.nbytes;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  503  			qspi->tx_len = 0;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  504  		}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  505  	}
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  506  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  507  	mchp_coreqspi_enable_ints(qspi);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  508  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  509  	if (!wait_for_completion_timeout(&qspi->data_completion, msecs_to_jiffies(1000)))
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  510  		err = -ETIMEDOUT;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  511  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  512  error:
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  513  	mutex_unlock(&qspi->op_lock);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  514  	mchp_coreqspi_disable_ints(qspi);
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  515  
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  516  	return err;
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  517  }
8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  518  

:::::: The code at line 287 was first introduced by commit
:::::: 8596124c4c1bc7561454cee0463c16eca70b5d25 spi: microchip-core-qspi: Add support for microchip fpga qspi controllers

:::::: TO: Naga Sureshkumar Relli <nagasuresh.relli@microchip.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
