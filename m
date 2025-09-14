Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F13211F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 02:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757816737; cv=none; b=jtM+FFjMikqmUtOKUqcR416/OYO9iZf6vWuFGz35tx6e4z0FvJ4G4hOfFNfjNfNSYKICWX/NazVO//2/EzYkrdvmrRCSyEZus4CD65oONrKNAHSCCC8dSIqxK5gG5/x7DD4zmkU+Mt23psIhSsrntQvcr3WhQF4HEUGz+kbVPWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757816737; c=relaxed/simple;
	bh=4QvOZf+j1Pkr5FdnmtKM45SdJm396/uca+NxshukJW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHoKn9xOpS703YSgujQSWP+UQ7Ybjy8QNmzisHvLFtcf9uH6u3v3emDxZ8n4qkgplmMEGyxTmNJ6JUAfzKHisipjaFBvd2eTJ6qMY4yCqOZwtmx+Oym3QqdNgxDXn+nLoyRRtzTnZROqmjPzTsEU9Dv7HbvVrKF0qtqHeFRgsyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc0AS05u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc0AS05u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757816735; x=1789352735;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4QvOZf+j1Pkr5FdnmtKM45SdJm396/uca+NxshukJW0=;
  b=Zc0AS05uStGtuHKazQzgTNrPS7o1TXF4irzJZJsRslLQsIoIth+8CY4n
   i0KJPv3ObEn+hKJVHorE+3ahHeRQmHVsmVqy8BDI2rDLRHZTYG3ppM85t
   rNQyQvZBqt8gyv6dnH7NxOInvwRKkjggjx1CvtOvGfVEfBQT6piqiv4uq
   e+H+ylc/kTABnLEcmHz07HXafNnpQR5W+7HPzjpYnEcslWP2gnrPcT6Cq
   LpOPu51C6QoGABt/T9PusNM38MxRlINTyKJNGQpmxUaMrXJaC6pZBrVLi
   vDALvEmGfk19GbrE4cqoJe02MfqAUGH0YjLRYvy+SkvrD8hckz9/YCOfN
   Q==;
X-CSE-ConnectionGUID: BAKZiF9yQreW1cnk5+4Mhg==
X-CSE-MsgGUID: T8fnoEYuQ+CHZE+0aLVxQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="62741657"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="62741657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 19:25:34 -0700
X-CSE-ConnectionGUID: wg3PZICURieZne35g7PuYw==
X-CSE-MsgGUID: mN2drkujR5qmtBDAemakcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="178672707"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2025 19:25:32 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxcQf-00022G-19;
	Sun, 14 Sep 2025 02:25:28 +0000
Date: Sun, 14 Sep 2025 10:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_first_size 31/38]
 drivers/pci/controller/dwc/pci-dra7xx.c:617:1: warning: 'alias' attribute
 ignored
Message-ID: <202509141052.oDk828Lq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/norov/linux find_first_size
head:   19fff28fbf729956258aeb0cd260f8dc1186952f
commit: 6096b790f1e896e0add2679630eba8bb0659022e [31/38] PCI: dra7xx: switch dra7xx_pcie_handle_msi() to using for_each()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250914/202509141052.oDk828Lq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141052.oDk828Lq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141052.oDk828Lq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_handle_msi':
   drivers/pci/controller/dwc/pci-dra7xx.c:223:13: error: invalid storage class for function 'dra7xx_pcie_handle_msi_irq'
     223 | static void dra7xx_pcie_handle_msi_irq(struct dw_pcie_rp *pp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:250:13: error: invalid storage class for function 'dra7xx_pcie_msi_irq_handler'
     250 | static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:284:20: error: invalid storage class for function 'dra7xx_pcie_irq_handler'
     284 | static irqreturn_t dra7xx_pcie_irq_handler(int irq, void *arg)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:343:12: error: invalid storage class for function 'dra7xx_pcie_init_irq_domain'
     343 | static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp *pp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:373:13: error: invalid storage class for function 'dra7xx_pcie_ep_init'
     373 | static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:385:13: error: invalid storage class for function 'dra7xx_pcie_raise_intx_irq'
     385 | static void dra7xx_pcie_raise_intx_irq(struct dra7xx_pcie *dra7xx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:392:13: error: invalid storage class for function 'dra7xx_pcie_raise_msi_irq'
     392 | static void dra7xx_pcie_raise_msi_irq(struct dra7xx_pcie *dra7xx,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:402:12: error: invalid storage class for function 'dra7xx_pcie_raise_irq'
     402 | static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:429:1: error: invalid storage class for function 'dra7xx_pcie_get_features'
     429 | dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:435:17: error: initializer element is not constant
     435 |         .init = dra7xx_pcie_ep_init,
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:435:17: note: (near initialization for 'pcie_ep_ops.init')
   drivers/pci/controller/dwc/pci-dra7xx.c:436:22: error: initializer element is not constant
     436 |         .raise_irq = dra7xx_pcie_raise_irq,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:436:22: note: (near initialization for 'pcie_ep_ops.raise_irq')
   drivers/pci/controller/dwc/pci-dra7xx.c:437:25: error: initializer element is not constant
     437 |         .get_features = dra7xx_pcie_get_features,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:437:25: note: (near initialization for 'pcie_ep_ops.get_features')
   drivers/pci/controller/dwc/pci-dra7xx.c:440:12: error: invalid storage class for function 'dra7xx_add_pcie_ep'
     440 | static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:478:12: error: invalid storage class for function 'dra7xx_add_pcie_port'
     478 | static int dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:519:13: error: invalid storage class for function 'dra7xx_pcie_disable_phy'
     519 | static void dra7xx_pcie_disable_phy(struct dra7xx_pcie *dra7xx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:529:12: error: invalid storage class for function 'dra7xx_pcie_enable_phy'
     529 | static int dra7xx_pcie_enable_phy(struct dra7xx_pcie *dra7xx)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:617:1: warning: 'alias' attribute ignored [-Wattributes]
     617 | MODULE_DEVICE_TABLE(of, of_dra7xx_pcie_match);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:630:12: error: invalid storage class for function 'dra7xx_pcie_unaligned_memaccess'
     630 | static int dra7xx_pcie_unaligned_memaccess(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:651:12: error: invalid storage class for function 'dra7xx_pcie_configure_two_lane'
     651 | static int dra7xx_pcie_configure_two_lane(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:674:12: error: invalid storage class for function 'dra7xx_pcie_probe'
     674 | static int dra7xx_pcie_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:862:12: error: invalid storage class for function 'dra7xx_pcie_suspend'
     862 | static int dra7xx_pcie_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:879:12: error: invalid storage class for function 'dra7xx_pcie_resume'
     879 | static int dra7xx_pcie_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:896:12: error: invalid storage class for function 'dra7xx_pcie_suspend_noirq'
     896 | static int dra7xx_pcie_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:905:12: error: invalid storage class for function 'dra7xx_pcie_resume_noirq'
     905 | static int dra7xx_pcie_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:919:13: error: invalid storage class for function 'dra7xx_pcie_shutdown'
     919 | static void dra7xx_pcie_shutdown(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:36,
                    from include/linux/clk.h:13,
                    from drivers/pci/controller/dwc/pci-dra7xx.c:10:
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:314:20: note: in expansion of macro 'pm_sleep_ptr'
     314 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                    ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.suspend')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:314:20: note: in expansion of macro 'pm_sleep_ptr'
     314 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                    ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:315:19: note: in expansion of macro 'pm_sleep_ptr'
     315 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.resume')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:315:19: note: in expansion of macro 'pm_sleep_ptr'
     315 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |                   ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.freeze')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |                   ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:317:17: note: in expansion of macro 'pm_sleep_ptr'
     317 |         .thaw = pm_sleep_ptr(resume_fn), \
         |                 ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.thaw')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:317:17: note: in expansion of macro 'pm_sleep_ptr'
     317 |         .thaw = pm_sleep_ptr(resume_fn), \
         |                 ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:318:21: note: in expansion of macro 'pm_sleep_ptr'
     318 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |                     ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.poweroff')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:318:21: note: in expansion of macro 'pm_sleep_ptr'
     318 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |                     ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:319:20: note: in expansion of macro 'pm_sleep_ptr'
     319 |         .restore = pm_sleep_ptr(resume_fn),
         |                    ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.restore')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:319:20: note: in expansion of macro 'pm_sleep_ptr'
     319 |         .restore = pm_sleep_ptr(resume_fn),
         |                    ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:938:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     938 |         SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:330:26: note: in expansion of macro 'pm_sleep_ptr'
     330 |         .suspend_noirq = pm_sleep_ptr(suspend_fn), \
         |                          ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.suspend_noirq')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:330:26: note: in expansion of macro 'pm_sleep_ptr'
     330 |         .suspend_noirq = pm_sleep_ptr(suspend_fn), \
         |                          ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:331:25: note: in expansion of macro 'pm_sleep_ptr'
     331 |         .resume_noirq = pm_sleep_ptr(resume_fn), \
         |                         ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.resume_noirq')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:331:25: note: in expansion of macro 'pm_sleep_ptr'
     331 |         .resume_noirq = pm_sleep_ptr(resume_fn), \
         |                         ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:332:25: note: in expansion of macro 'pm_sleep_ptr'
     332 |         .freeze_noirq = pm_sleep_ptr(suspend_fn), \
         |                         ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.freeze_noirq')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:332:25: note: in expansion of macro 'pm_sleep_ptr'
     332 |         .freeze_noirq = pm_sleep_ptr(suspend_fn), \
         |                         ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:333:23: note: in expansion of macro 'pm_sleep_ptr'
     333 |         .thaw_noirq = pm_sleep_ptr(resume_fn), \
         |                       ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.thaw_noirq')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:333:23: note: in expansion of macro 'pm_sleep_ptr'
     333 |         .thaw_noirq = pm_sleep_ptr(resume_fn), \
         |                       ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:334:27: note: in expansion of macro 'pm_sleep_ptr'
     334 |         .poweroff_noirq = pm_sleep_ptr(suspend_fn), \
         |                           ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.poweroff_noirq')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:334:27: note: in expansion of macro 'pm_sleep_ptr'
     334 |         .poweroff_noirq = pm_sleep_ptr(suspend_fn), \
         |                           ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/util_macros.h:136:33: error: initializer element is not constant
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:335:26: note: in expansion of macro 'pm_sleep_ptr'
     335 |         .restore_noirq = pm_sleep_ptr(resume_fn),
         |                          ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:33: note: (near initialization for 'dra7xx_pcie_pm_ops.restore_noirq')
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:473:28: note: in expansion of macro 'PTR_IF'
     473 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:335:26: note: in expansion of macro 'pm_sleep_ptr'
     335 |         .restore_noirq = pm_sleep_ptr(resume_fn),
         |                          ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:939:9: note: in expansion of macro 'NOIRQ_SYSTEM_SLEEP_PM_OPS'
     939 |         NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:944:18: error: initializer element is not constant
     944 |         .probe = dra7xx_pcie_probe,
         |                  ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:944:18: note: (near initialization for 'dra7xx_pcie_driver.probe')
   drivers/pci/controller/dwc/pci-dra7xx.c:951:21: error: initializer element is not constant
     951 |         .shutdown = dra7xx_pcie_shutdown,
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:951:21: note: (near initialization for 'dra7xx_pcie_driver.shutdown')
   In file included from include/linux/device.h:32,
                    from drivers/pci/controller/dwc/pci-dra7xx.c:12:
   drivers/pci/controller/dwc/pci-dra7xx.c:953:24: error: invalid storage class for function 'dra7xx_pcie_driver_init'
     953 | module_platform_driver(dra7xx_pcie_driver);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:258:19: note: in definition of macro 'module_driver'
     258 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device/driver.h:21:
>> include/linux/module.h:132:49: error: invalid storage class for function '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: warning: 'alias' attribute ignored [-Wattributes]
   drivers/pci/controller/dwc/pci-dra7xx.c:953:24: error: invalid storage class for function 'dra7xx_pcie_driver_exit'
     953 | module_platform_driver(dra7xx_pcie_driver);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:263:20: note: in definition of macro 'module_driver'
     263 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:140:49: error: invalid storage class for function '__exittest'
     140 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: warning: 'alias' attribute ignored [-Wattributes]
   drivers/pci/controller/dwc/pci-dra7xx.c:957:1: error: expected declaration or statement at end of input
     957 | MODULE_LICENSE("GPL v2");
         | ^~~~~~~~~~~~~~
..


vim +/alias +617 drivers/pci/controller/dwc/pci-dra7xx.c

608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  477  
e259c2926c016d drivers/pci/controller/dwc/pci-dra7xx.c Tony Lindgren          2021-03-10 @478  static int dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  479  				struct platform_device *pdev)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  480  {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  481  	int ret;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  482  	struct dw_pcie *pci = dra7xx->pci;
60b3c27fb9b92b drivers/pci/controller/dwc/pci-dra7xx.c Serge Semin            2022-06-24  483  	struct dw_pcie_rp *pp = &pci->pp;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  484  	struct device *dev = pci->dev;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  485  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  486  	pp->irq = platform_get_irq(pdev, 1);
caecb05c800081 drivers/pci/controller/dwc/pci-dra7xx.c Krzysztof Wilczyński   2020-08-02  487  	if (pp->irq < 0)
2f3ec75245ee9c drivers/pci/dwc/pci-dra7xx.c            Fabio Estevam          2017-08-31  488  		return pp->irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  489  
5bcb1757e637a4 drivers/pci/controller/dwc/pci-dra7xx.c Rob Herring            2020-11-05  490  	/* MSI IRQ is muxed */
db388348acffe9 drivers/pci/controller/dwc/pci-dra7xx.c Dmitry Baryshkov       2022-07-22  491  	pp->msi_irq[0] = -ENODEV;
5bcb1757e637a4 drivers/pci/controller/dwc/pci-dra7xx.c Rob Herring            2020-11-05  492  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  493  	ret = dra7xx_pcie_init_irq_domain(pp);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  494  	if (ret < 0)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  495  		return ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  496  
936fa5cd7b8e3e drivers/pci/controller/dwc/pci-dra7xx.c Dejin Zheng            2020-07-09  497  	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "rc_dbics");
011cb23c40e99e drivers/pci/dwc/pci-dra7xx.c            Gustavo Pimentel       2018-05-14  498  	if (IS_ERR(pci->dbi_base))
011cb23c40e99e drivers/pci/dwc/pci-dra7xx.c            Gustavo Pimentel       2018-05-14  499  		return PTR_ERR(pci->dbi_base);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  500  
71890ea0a0b563 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  501  	pp->ops = &dra7xx_pcie_host_ops;
71890ea0a0b563 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  502  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  503  	ret = dw_pcie_host_init(pp);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  504  	if (ret) {
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  505  		dev_err(dev, "failed to initialize host\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  506  		return ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  507  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  508  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  509  	return 0;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  510  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  511  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  512  static const struct dw_pcie_ops dw_pcie_ops = {
2ed6cc71e6f726 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-13  513  	.cpu_addr_fixup = dra7xx_pcie_cpu_addr_fixup,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  514  	.start_link = dra7xx_pcie_establish_link,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  515  	.stop_link = dra7xx_pcie_stop_link,
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  516  	.link_up = dra7xx_pcie_link_up,
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  517  };
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  518  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  519  static void dra7xx_pcie_disable_phy(struct dra7xx_pcie *dra7xx)
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  520  {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  521  	int phy_count = dra7xx->phy_count;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  522  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  523  	while (phy_count--) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  524  		phy_power_off(dra7xx->phy[phy_count]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  525  		phy_exit(dra7xx->phy[phy_count]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  526  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  527  }
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  528  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  529  static int dra7xx_pcie_enable_phy(struct dra7xx_pcie *dra7xx)
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  530  {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  531  	int phy_count = dra7xx->phy_count;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  532  	int ret;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  533  	int i;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  534  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  535  	for (i = 0; i < phy_count; i++) {
65c839a134e6af drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  536  		ret = phy_set_mode(dra7xx->phy[i], PHY_MODE_PCIE);
65c839a134e6af drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  537  		if (ret < 0)
65c839a134e6af drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  538  			goto err_phy;
65c839a134e6af drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  539  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  540  		ret = phy_init(dra7xx->phy[i]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  541  		if (ret < 0)
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  542  			goto err_phy;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  543  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  544  		ret = phy_power_on(dra7xx->phy[i]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  545  		if (ret < 0) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  546  			phy_exit(dra7xx->phy[i]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  547  			goto err_phy;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  548  		}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  549  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  550  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  551  	return 0;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  552  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  553  err_phy:
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  554  	while (--i >= 0) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  555  		phy_power_off(dra7xx->phy[i]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  556  		phy_exit(dra7xx->phy[i]);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  557  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  558  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  559  	return ret;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  560  }
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  561  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  562  static const struct dra7xx_pcie_of_data dra7xx_pcie_rc_of_data = {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  563  	.mode = DW_PCIE_RC_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  564  };
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  565  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  566  static const struct dra7xx_pcie_of_data dra7xx_pcie_ep_of_data = {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  567  	.mode = DW_PCIE_EP_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  568  };
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  569  
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  570  static const struct dra7xx_pcie_of_data dra746_pcie_rc_of_data = {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  571  	.b1co_mode_sel_mask = BIT(2),
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  572  	.mode = DW_PCIE_RC_TYPE,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  573  };
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  574  
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  575  static const struct dra7xx_pcie_of_data dra726_pcie_rc_of_data = {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  576  	.b1co_mode_sel_mask = GENMASK(3, 2),
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  577  	.mode = DW_PCIE_RC_TYPE,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  578  };
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  579  
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  580  static const struct dra7xx_pcie_of_data dra746_pcie_ep_of_data = {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  581  	.b1co_mode_sel_mask = BIT(2),
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  582  	.mode = DW_PCIE_EP_TYPE,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  583  };
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  584  
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  585  static const struct dra7xx_pcie_of_data dra726_pcie_ep_of_data = {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  586  	.b1co_mode_sel_mask = GENMASK(3, 2),
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  587  	.mode = DW_PCIE_EP_TYPE,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  588  };
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  589  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  590  static const struct of_device_id of_dra7xx_pcie_match[] = {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  591  	{
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  592  		.compatible = "ti,dra7-pcie",
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  593  		.data = &dra7xx_pcie_rc_of_data,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  594  	},
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  595  	{
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  596  		.compatible = "ti,dra7-pcie-ep",
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  597  		.data = &dra7xx_pcie_ep_of_data,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  598  	},
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  599  	{
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  600  		.compatible = "ti,dra746-pcie-rc",
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  601  		.data = &dra746_pcie_rc_of_data,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  602  	},
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  603  	{
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  604  		.compatible = "ti,dra726-pcie-rc",
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  605  		.data = &dra726_pcie_rc_of_data,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  606  	},
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  607  	{
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  608  		.compatible = "ti,dra746-pcie-ep",
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  609  		.data = &dra746_pcie_ep_of_data,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  610  	},
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  611  	{
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  612  		.compatible = "ti,dra726-pcie-ep",
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  613  		.data = &dra726_pcie_ep_of_data,
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  614  	},
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  615  	{},
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  616  };
3b868d150efd3c drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31 @617  MODULE_DEVICE_TABLE(of, of_dra7xx_pcie_match);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  618  

:::::: The code at line 617 was first introduced by commit
:::::: 3b868d150efd3c586762cee4410cfc75f46d2a07 PCI: dra7xx: Make it a kernel module

:::::: TO: Luca Ceresoli <luca@lucaceresoli.net>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
