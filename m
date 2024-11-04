Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217A800
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730678466; cv=none; b=pKjzHacxyiKjh3tFXxE+DYK4ChI/IciQw4khYtNor60XNiD4fLNSr45vDoMSk1d0f5POi52zkW31oHe415LgxQoaTTn2rOUeGU5hVT0gPWBF2xlp3yqu/MbPWE0zM7IGr/vUTTRSAP+x9e+8fMrZu4vOyHMSw2UCcwE4/HBrmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730678466; c=relaxed/simple;
	bh=6sp4OTLTEz7BLcRwRVxQc07c6S75RRRkQ0nhWMvkGTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4JEXW92wQE8t8sL8NvEmbhRxvNeweD02g80MmIFzpz5a5Rqpe2vtKZ4fHcUkhaMtkcmApn6KRF7k8ijDdILjdUxH/1t2oR0OOpHjFAzMrsttqAkwx7WGBFe1KAIuGz5QzQ/PVzgn3aKCsnNwtvPy3xuUq7K/GBtya99e0Pynos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaLlzQiq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaLlzQiq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730678462; x=1762214462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sp4OTLTEz7BLcRwRVxQc07c6S75RRRkQ0nhWMvkGTk=;
  b=ZaLlzQiqkrP35rphJWag5oPwvIvy07qFh1kCTMnZQspQgXONLF+3Xwnd
   Rq9lU4CNmagM5L4hp+3ZRPyQH1ASSqoKEh+fgYyC++rMkULWB0Rgjz7nY
   2e3oItfbJVc3NZabjIffnRvjE6OLgZVNePcRVn/06goi5C1ZDI/WLyhTj
   SzEaPhoieSMyoPvvCWkLLB7LR7BSE/rhJB1SbcFteQ9cCP/yTp9gsic6+
   fEoBj3IhfcMOWeuFigXoJztDa9zyA9hHCbPQ0py2G2p8NmW32GEqt3Smb
   BpTTtyyWxgJQ7D1u3ttSsLfGehozjGdwX1RWd09m7Ruu++ZTx6JQfSRpe
   w==;
X-CSE-ConnectionGUID: SiSuxCiVQCCptb2OZ7Cmpw==
X-CSE-MsgGUID: RrnrksfARheEM+Rb7KPKdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30582990"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30582990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 16:01:01 -0800
X-CSE-ConnectionGUID: gNbL9iH+SWSY5qIJH62wpg==
X-CSE-MsgGUID: T/5bpXKOQk+M3ehPyqe05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114282596"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Nov 2024 16:01:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7kWf-000kIX-0s;
	Mon, 04 Nov 2024 00:00:57 +0000
Date: Mon, 4 Nov 2024 08:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jassi Brar <jaswinder.singh@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 drivers/mailbox/.tmp_imx-mailbox.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411040741.i4aXeK6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleksij,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 2bb7005696e2246baa88772341ca032ff09a63cb [1231/1231] mailbox: Add support for i.MX messaging unit
config: x86_64-buildonly-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241104/202411040741.i4aXeK6b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040741.i4aXeK6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040741.i4aXeK6b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/imx-mailbox.c:11:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'imx_mu_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1558:1: note: in expansion of macro 'module_exit'
    1558 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:354:1: note: in expansion of macro 'module_platform_driver'
     354 | module_platform_driver(imx_mu_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mailbox_controller.h:13,
                    from drivers/mailbox/imx-mailbox.c:10:
   drivers/mailbox/imx-mailbox.c:354:24: note: 'cleanup_module' target declared here
     354 | module_platform_driver(imx_mu_driver);
         |                        ^~~~~~~~~~~~~
   include/linux/device.h:1554:20: note: in definition of macro 'module_driver'
    1554 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/mailbox/imx-mailbox.c:354:1: note: in expansion of macro 'module_platform_driver'
     354 | module_platform_driver(imx_mu_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'imx_mu_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1553:1: note: in expansion of macro 'module_init'
    1553 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:354:1: note: in expansion of macro 'module_platform_driver'
     354 | module_platform_driver(imx_mu_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:354:24: note: 'init_module' target declared here
     354 | module_platform_driver(imx_mu_driver);
         |                        ^~~~~~~~~~~~~
   include/linux/device.h:1549:19: note: in definition of macro 'module_driver'
    1549 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/mailbox/imx-mailbox.c:354:1: note: in expansion of macro 'module_platform_driver'
     354 | module_platform_driver(imx_mu_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/.tmp_imx-mailbox.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
