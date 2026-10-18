Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E93D9667
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335788; cv=none; b=g8hFtpBqv5FqVzze483JDUiX1ndV8Rih69zFxgQQtyttcnEzDe50y1+8yfIBp3pcDucQL8O7mZvwuof94HKHYBVDVRtv5b8JO3suDACPnkG8UISmj9lt7kf7cwK5WC4o0fgGgfVpLkCr9TEHEau+k5QvucBM82Mm4LIOFaT4pUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335788; c=relaxed/simple;
	bh=/QyUwCU3bDno0nM+2Ny3IRIxq5PZI7xaONqCco5syys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G0YpTV/xiUoGjtlX9KQJMDJP6rZKI+b01B/eu4497y5HTP8uZcnCooPt1j0zM9L9iCXP0L2c0SHNkMsQQt+ZPicJoOtoJzgQX99x2U91A0F3cSrE/OqHZ+IwOIk+2Q0WQ2eIq4aC5/Qg85FuEVgEjLkBMKuZxNZYk8SleiBYSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZq5nNaj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZq5nNaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792335787; x=1823871787;
  h=date:from:to:cc:subject:message-id;
  bh=/QyUwCU3bDno0nM+2Ny3IRIxq5PZI7xaONqCco5syys=;
  b=YZq5nNajNtjzD4PcDC06IHWELzepx9b/aBAgPARaybcHWbk9cAdKnhTX
   X18Zu8Bnz4nD4nzkNwAp6IUxbu5Zg0xAbJK4WLg0oHTfKHM5zFKLxd1T1
   r/sk8erMNCQv9QHkj3yz8sUmSaVRb2vHbTjsm+xZG+wS5AwtW87g0Q08n
   Q/KLsnjmsUpDnsalbRV/uz1o7L5F4vEVuEhokXRuJMamhlCIHyKVB/jyP
   sjVHIIZH3J3Usy+63QHoLpn4IHQvnWSfCWHzg8gpVikqhG2zabrrCPtvZ
   8trFFFAWSLCxz5tIpBr0m1QqIgBqyTg3nZ24PjLkk1e+qnKOtMRZfEDRQ
   w==;
X-CSE-ConnectionGUID: eEJdNTHoRTOdV5TSfKPaew==
X-CSE-MsgGUID: A+HvGzsySJCYjEBVBDAMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="924126"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="924126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 08:03:05 -0700
X-CSE-ConnectionGUID: aaub17RxTASdXsb9zp4SYw==
X-CSE-MsgGUID: eWBg23QZRNC9i5cDFMGWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2420695"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Oct 2026 08:03:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xISPc-00000000KVY-3Pwf;
	Sun, 18 Oct 2026 15:03:00 +0000
Date: Sun, 18 Oct 2026 23:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 148/343]
 drivers/pci/tsm/core.c:188:9: error: no member named 'ide_cap' in 'struct
 pci_dev'; did you mean 'devcap'?
Message-ID: <202610182257.NlPHwBaG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dan,

First bad commit (maybe != root cause):

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-backend
head:   6bdc5a1448b75f784490ac2061dc32ee4bd3b5a4
commit: 3ce3bac6a3b4fe37fd7c88a0b8227e6cc0e55f9a [148/343] samples/devsec: Introduce a PCI device-security bus + endpoint sample
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261018/202610182257.NlPHwBaG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182257.NlPHwBaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182257.NlPHwBaG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/tsm/core.c:15:
   include/linux/pci-tsm.h:258:13: error: no member named 'ide_cap' in 'struct pci_dev'; did you mean 'devcap'?
     258 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                           ^~~~~~~
         |                           devcap
   include/linux/pci.h:381:7: note: 'devcap' declared here
     381 |         u32             devcap;         /* PCIe Device Capabilities */
         |                         ^
>> drivers/pci/tsm/core.c:188:9: error: no member named 'ide_cap' in 'struct pci_dev'; did you mean 'devcap'?
     188 |                 pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
         |                       ^~~~~~~
         |                       devcap
   include/linux/pci.h:2934:65: note: expanded from macro 'pci_dbg'
    2934 | #define pci_dbg(pdev, fmt, arg...)      dev_dbg(&(pdev)->dev, fmt, ##arg)
         |                                                                      ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^
   include/linux/pci.h:381:7: note: 'devcap' declared here
     381 |         u32             devcap;         /* PCIe Device Capabilities */
         |                         ^
   drivers/pci/tsm/core.c:188:37: error: no member named 'ide_cap' in 'struct pci_dev'; did you mean 'devcap'?
     188 |                 pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
         |                                                   ^~~~~~~
         |                                                   devcap
   include/linux/pci.h:2934:65: note: expanded from macro 'pci_dbg'
    2934 | #define pci_dbg(pdev, fmt, arg...)      dev_dbg(&(pdev)->dev, fmt, ##arg)
         |                                                                      ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^
   include/linux/pci.h:381:7: note: 'devcap' declared here
     381 |         u32             devcap;         /* PCIe Device Capabilities */
         |                         ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_TSM
   Depends on [n]: PCI [=y] && ARCH_HAS_CC_PLATFORM [=n]
   Selected by [m]:
   - SAMPLE_DEVSEC [=m] && SAMPLES [=y] && m [=m] && MODULES [=y] && PCI [=y] && VIRT_DRIVERS [=y] && PCI_DOMAINS [=y]


vim +188 drivers/pci/tsm/core.c

f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  181  
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  182  static void link_sysfs_enable(struct pci_dev *pdev)
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  183  {
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  184  	bool tee = has_tee(pdev);
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  185  
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  186  	pci_dbg(pdev, "%s Security Manager detected (%s%s%s)\n",
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  187  		pdev->tsm ? "Device" : "Platform TEE",
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12 @188  		pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  189  		tee ? "TEE" : "");
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  190  
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  191  	sysfs_update_group(&pdev->dev.kobj, &pci_tsm_auth_attr_group);
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  192  	sysfs_update_group(&pdev->dev.kobj, &pci_tsm_attr_group);
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  193  }
f7ae6d4ec6520a drivers/pci/tsm.c Dan Williams 2025-11-12  194  

:::::: The code at line 188 was first introduced by commit
:::::: f7ae6d4ec6520a901787cbab273983e96d8516da PCI/TSM: Add 'dsm' and 'bound' attributes for dependent functions

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
