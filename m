Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0C7D3F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747425684; cv=none; b=YS2m7m84PcXyKXXIxdTgXIsXrNa2NfpfJ5tJW1czS2DVttqVXrF8/vUMfSfVJhuFpGWHylOFXm3jIFOsGnc9do4568IO+O7qM22MHbEXEMO4wvaulJk7Q7buV0HdCCIMvN6edmnI0b07ntEQglDMhtH9a8E/UasQyteftqzIMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747425684; c=relaxed/simple;
	bh=OuAAXRJopBrSWdcHG3N2AqJwar55pKnTa3z/hLykfe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4rmSdTENdK7QgXBgw4xXwZ1krNKThdHwlG/Y3O1qIu8ZliGkl1pl6oV5t3XRgX9k7/UXDhg+CmNMKyEV/J8pEE+/hzUhqMgLmF6qjtLxT0VXX/+tmCtI8zrBZ/kLADMyErRkRSi38J1HSSp3EkwhGhxAEZzb0RNbHP8jsCYNMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKJvP/PU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKJvP/PU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747425683; x=1778961683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OuAAXRJopBrSWdcHG3N2AqJwar55pKnTa3z/hLykfe0=;
  b=WKJvP/PUqjz1upjZEhMimxQg9CuB1PBLUffZwg99KAN7S1aKt1tF0jB2
   FoArFMOQdRtPVwZVXdeRbVLCtekF9gmg0JFOt9fOFL+rweJggvR+8RbNI
   DT2Rkl8tgNQIBsW/LpNRb7MzR60bf+y9S9wlh/TmokXensoZOmSjtVPaM
   EiI3+wqNreLW+S9+AjtHW32H49HZ+fBcA5RrcmgHuKwpwYpeyTrFxc92A
   L97wpc1bIBuoFXi8cSYgjjGJoDo1D0Ok/Si32yBEJXfNFHlU8J9f9J7aG
   qWXXHK8n/6miy1vfG1Lf4ATzRgNicUXkSm/Gn+R1DjW4lgmfgr9XcWOYm
   Q==;
X-CSE-ConnectionGUID: 4bvt7zGRTjC0qhBsqjhKrg==
X-CSE-MsgGUID: RwpCo25TTeqf2gcAAH97Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49476175"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49476175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 13:01:22 -0700
X-CSE-ConnectionGUID: hsGuXB4hRy2yds2/1XMU2g==
X-CSE-MsgGUID: ucIpnNWESF2BfWN74O05WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169820609"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 13:01:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG1F8-000JfV-31;
	Fri, 16 May 2025 20:01:18 +0000
Date: Sat, 17 May 2025 04:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1639/1639]
 drivers/mailbox/imx-mailbox.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <202505170350.gUYB1D4Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9f24885126c03082a677c4d607a2e3502781c858
commit: 2bb7005696e2246baa88772341ca032ff09a63cb [1639/1639] mailbox: Add support for i.MX messaging unit
config: x86_64-buildonly-randconfig-005-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170350.gUYB1D4Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170350.gUYB1D4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170350.gUYB1D4Y-lkp@intel.com/

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
>> drivers/mailbox/imx-mailbox.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
