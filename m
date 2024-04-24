Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3F4A23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713918412; cv=none; b=X4etUzWTEA/NGj2F6AucT4t0uqv6c9UjFCuu2TKajbGkb9rLmgUuEGvo75w5ZfPlCa0RSgX5Nls1etu+fpJDluetN9Xw1VMUfyx8CtbZgX10K4gA1citcA5Zu91N+qkVo6qEDrmzU4sKVHAE3jTt/fEA2i+vcasME7bpv54JdCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713918412; c=relaxed/simple;
	bh=r/u9HDPDggKAivNCRbPi4avV0+cWabmvtjON6VYt0A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZXiqJGUU6msAM7wwkl6jCaX3+V6Rw8Qf7fEP8c/MAkXhTx474tqkG1k0tbtLBa7jfpVR2POeeTwKHJf6CDHhZrT6pnIVzxS1GG/IW4Law9ZtjXMiPrLKl/allc1oonRKs4IK1O/LVsOuIK4oornqfRzlRW57uWutf7puZtZnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deEQvKtf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deEQvKtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713918411; x=1745454411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/u9HDPDggKAivNCRbPi4avV0+cWabmvtjON6VYt0A4=;
  b=deEQvKtfAsEwljWeTEP6dnWaNlJJ1LGzgwwih0GnUyYJdit9DYlUBb1Z
   osvnkZTt6Wulr3H3/+0wVpX6Aop9EkrQZG9e6nh60QtuxZA5MciBkc0JV
   +QpuVqnhTkMYhKM3QkcVJTkgIU+5n/jjS1uA3M9jss48RdXk8ipJJ4v10
   slvY8tjvwUQ7z5wsp+EieBMMZq5ZTBzjJID9XDiOIfViegkgwhxHqSes+
   AtPath1ZkXEsgvruQHuyBI9NuxjqCeNxGL7fi9JN89/S3foJKm2AigmDS
   vySOcHRVHJeeVcispKdCsRS6JGElbujXm6KsigFgwEltd5meQvffIqLk0
   Q==;
X-CSE-ConnectionGUID: 1PHgemEnQgmcfz1QyI4twA==
X-CSE-MsgGUID: amFdjHQHRheqiR6y9MYW8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20933982"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20933982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 17:26:50 -0700
X-CSE-ConnectionGUID: 6pIIe63kT3KXG5fTlL/fZg==
X-CSE-MsgGUID: QH6iwa02T2qW/5Nx++CPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="61988562"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 17:26:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzQTG-0000f2-1k;
	Wed, 24 Apr 2024 00:26:46 +0000
Date: Wed, 24 Apr 2024 08:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 6/6] include/linux/compiler.h:221:52: error: initializer
 element is not constant
Message-ID: <202404240839.LsKq43DE-lkp@intel.com>
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
config: i386-randconfig-002-20240424 (https://download.01.org/0day-ci/archive/20240424/202404240839.LsKq43DE-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240839.LsKq43DE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240839.LsKq43DE-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   In file included from include/linux/err.h:5,
                    from include/linux/clk.h:12,
                    from drivers/spi/spi-microchip-core-qspi.c:11:
>> include/linux/compiler.h:221:52: error: initializer element is not constant
     221 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                                                    ^
   include/linux/compiler.h:223:9: note: in expansion of macro '___ADDRESSABLE'
     223 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__ADDRESSABLE'
     256 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:261:9: note: in expansion of macro '__define_initcall_stub'
     261 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:274:9: note: in expansion of macro '____define_initcall'
     274 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
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
   drivers/spi/spi-microchip-core-qspi.c:786:24: error: invalid storage class for function 'mchp_coreqspi_driver_exit'
     786 | module_platform_driver(mchp_coreqspi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:263:20: note: in definition of macro 'module_driver'
     263 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:786:1: note: in expansion of macro 'module_platform_driver'
     786 | module_platform_driver(mchp_coreqspi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:31,
                    from include/linux/clk.h:13:
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
   drivers/spi/spi-microchip-core-qspi.c:790:1: error: expected declaration or statement at end of input
     790 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~
   drivers/spi/spi-microchip-core-qspi.c:227:13: warning: unused variable 'frames' [-Wunused-variable]
     227 |         u32 frames, control, data;
         |             ^~~~~~


vim +221 include/linux/compiler.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  212  
7290d58095712a Ard Biesheuvel 2018-08-21  213  /*
7290d58095712a Ard Biesheuvel 2018-08-21  214   * Force the compiler to emit 'sym' as a symbol, so that we can reference
7290d58095712a Ard Biesheuvel 2018-08-21  215   * it from inline assembler. Necessary in case 'sym' could be inlined
7290d58095712a Ard Biesheuvel 2018-08-21  216   * otherwise, or eliminated entirely due to lack of references that are
7290d58095712a Ard Biesheuvel 2018-08-21  217   * visible to the compiler.
7290d58095712a Ard Biesheuvel 2018-08-21  218   */
92efda8eb15295 Sami Tolvanen  2022-09-08  219  #define ___ADDRESSABLE(sym, __attrs) \
92efda8eb15295 Sami Tolvanen  2022-09-08  220  	static void * __used __attrs \
ed2f752e0e0a21 Uros Bizjak    2023-10-20 @221  	__UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
92efda8eb15295 Sami Tolvanen  2022-09-08  222  #define __ADDRESSABLE(sym) \
92efda8eb15295 Sami Tolvanen  2022-09-08  223  	___ADDRESSABLE(sym, __section(".discard.addressable"))
7290d58095712a Ard Biesheuvel 2018-08-21  224  

:::::: The code at line 221 was first introduced by commit
:::::: ed2f752e0e0a21d941ca0ee539ef3d4cd576bc5e x86/percpu: Introduce const-qualified const_pcpu_hot to micro-optimize code generation

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
