Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62721D2B03
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847895; cv=none; b=ryJ+NbcbA7Sk1HpbfemTrJInDVtNTUjw59gcg0utpn0TxKTt12QplMAMUiwIB4fBCMcyTYplJmBLQlGA3+Q+r/c4sBUrjpnVVgCISkLjWcPXwNowifclW/0ituI3yqxntoVALl2HjkUUhVC4L7QbgLXtSYFn0s6MmTxFqWh9LHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847895; c=relaxed/simple;
	bh=VFZRMUHdXqQlS+gYSywfb3w0xRey+969EZ4X5N1SDnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+6DbyPDJtwu6YAPafb7O2JvWB9jeRZ12NvU5Odg/2FT4kLlV2aQs6WgZyzFdwzhlQNCOs7JZA+VM0jKvH5AzEKdsrtrwrH3i5l2CDRvKju1o4svIaXGRXIB1JJDC8uexroClfkQzaFX0pfUSeS+6otbfK4/tccGoM5EZOFTURc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNa7iHIq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNa7iHIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730847893; x=1762383893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFZRMUHdXqQlS+gYSywfb3w0xRey+969EZ4X5N1SDnk=;
  b=FNa7iHIq1l3WL7NNcsXDyQzoa3bHWI8Cd163mKCT7hMGcgo4VkLO6seY
   YPZKxZkFKufK+GIM/OTmuVMJ2gm1INmkeeUTmt5t0+w5BWY3/aRVwlo4G
   ZSuOgclxaigQyqHgzlxC3wQilRs5n1NEmonDH2hX4CFzok2xVrtOG1Syk
   y854p/Rc8UDYzUy17sBsRky1s9Gnp7zaTxUPdjhjb6EvcqmuQuoVWMPZJ
   3i7XZrvTVNHoDSmdwS3dAjhCPuUf90J5cSxMl/2QBnfbdOxCFKaYtqweo
   1OByvCyT9Pu06AyO6NtaxDWAqLG0SuFyumRr2i2ybOPn6duc3+OCM2iCJ
   Q==;
X-CSE-ConnectionGUID: WZmFCtsyS+2UXwnK/MXLcA==
X-CSE-MsgGUID: E84DdwxwSeOLsWcYqBKXaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41251404"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="41251404"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:04:52 -0800
X-CSE-ConnectionGUID: MRjoWmR5TyiA8SSsQ3cgsw==
X-CSE-MsgGUID: /YzqL+4+Q8CzSPRa0mTPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84333042"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2024 15:04:51 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8SbR-000mYh-0T;
	Tue, 05 Nov 2024 23:04:49 +0000
Date: Wed, 6 Nov 2024 07:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231] drivers/spi/spi-uniphier.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411060705.6jumqar7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: c1acb21b32a3bb601453764c9eac9fc8fbb3a81d [1231/1231] Merge branch 'spi-4.19' into spi-next
config: x86_64-buildonly-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241106/202411060705.6jumqar7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060705.6jumqar7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060705.6jumqar7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-uniphier.c:12:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'uniphier_spi_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1558:1: note: in expansion of macro 'module_exit'
    1558 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/spi/spi-uniphier.c:518:1: note: in expansion of macro 'module_platform_driver'
     518 | module_platform_driver(uniphier_spi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/platform_device.h:14,
                    from drivers/spi/spi-uniphier.c:13:
   drivers/spi/spi-uniphier.c:518:24: note: 'cleanup_module' target declared here
     518 | module_platform_driver(uniphier_spi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1554:20: note: in definition of macro 'module_driver'
    1554 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/spi/spi-uniphier.c:518:1: note: in expansion of macro 'module_platform_driver'
     518 | module_platform_driver(uniphier_spi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'uniphier_spi_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1553:1: note: in expansion of macro 'module_init'
    1553 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/spi/spi-uniphier.c:518:1: note: in expansion of macro 'module_platform_driver'
     518 | module_platform_driver(uniphier_spi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-uniphier.c:518:24: note: 'init_module' target declared here
     518 | module_platform_driver(uniphier_spi_driver);
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1549:19: note: in definition of macro 'module_driver'
    1549 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/spi/spi-uniphier.c:518:1: note: in expansion of macro 'module_platform_driver'
     518 | module_platform_driver(uniphier_spi_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-uniphier.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
