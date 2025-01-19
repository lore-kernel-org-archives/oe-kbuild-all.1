Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C551DA3D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 23:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737330977; cv=none; b=e67CNKRVTjkN21tLxQXcSmNqIJLeY51WjqMlyCRlYS4tjrH1cqZRKq4md7oMijc9fvc9vQ8hBK9DEqgqxKjundwHWr7RZ6xMW78WElM8mRfMBgRgZpOEg7YMlILHWjoFXXumtYLGfrINv5xffi8k2WIiNodrS8ZJLWqTikQjy4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737330977; c=relaxed/simple;
	bh=ztqHtpfVtjP7Aex8h6TFf0EaCAjn7m/aNq8Tjpof7Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXTuRUUjzH0guTNxVPfP7o8hiFGmdIbmA1vZ5cZn2Lykv0lf48xpPbfblRQNNBwA/k1XKn+Tt0Nb+AIb7RxGsBrlMJsxJHL0lQrdR1Tkwi+IfBZBQnCtTtAeCOVxlk1jzZrGgmhMO97tNdKBl/DKXn3eiGM7YjIQE+TnsBeaZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eugU6ilL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eugU6ilL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737330975; x=1768866975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztqHtpfVtjP7Aex8h6TFf0EaCAjn7m/aNq8Tjpof7Mk=;
  b=eugU6ilLJExW+VLZ/BJV/cdRicwRamo5gJj3RJlq09XrnfN5T1JFsw53
   fUFd1jxndi253hBV22quuvDPblmkuau7Ri/X2NsDZg1VcO4JYbu3GSLBq
   UivrcTJmo4br3DyQbspAlu0Jnm1GcbKkf495NwPfYmR1YcIgGOFPtNxUZ
   UhqUcjgeFUDk5GgRdbD72vq+2z2GTmFfiThy/OY3xEqh1Wo3dbMCzwD+r
   lhGPUYpnlqaGBui8GgEbgj95uN4vex/5PfkFV4kA9w1qDXvKnQrqISXDz
   c6iD1UUsnTMd8fPLnPcJW5Ad6bRQHvMPyF06VoUDHJxez1KSTR2s0W+B3
   g==;
X-CSE-ConnectionGUID: nf8D2G0wRwGXSBMTENAjsA==
X-CSE-MsgGUID: D2mFVB/gRlm0b9SkGPtYdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37379245"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37379245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 15:56:14 -0800
X-CSE-ConnectionGUID: T5+QWh7vTjqMpu+nz2my8w==
X-CSE-MsgGUID: gDWOUwzFTnG0dE7ATcrWsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111300913"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2025 15:56:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZf9H-000Vxt-0m;
	Sun, 19 Jan 2025 23:56:11 +0000
Date: Mon, 20 Jan 2025 07:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1407/1407] drivers/mux/adgs1408.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202501200708.2Pf7Ia63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 8b9ce6954c05e3e4115f54444c7eaf2aa2dd5e65 [1407/1407] mux: adgs1408: new driver for Analog Devices ADGS1408/1409 mux
config: x86_64-buildonly-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250120/202501200708.2Pf7Ia63-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200708.2Pf7Ia63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200708.2Pf7Ia63-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mux/adgs1408.c:9:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'adgs1408_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1562:1: note: in expansion of macro 'module_exit'
    1562 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/spi/spi.h:293:9: note: in expansion of macro 'module_driver'
     293 |         module_driver(__spi_driver, spi_register_driver, \
         |         ^~~~~~~~~~~~~
   drivers/mux/adgs1408.c:127:1: note: in expansion of macro 'module_spi_driver'
     127 | module_spi_driver(adgs1408_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/mux/driver.h:14,
                    from drivers/mux/adgs1408.c:10:
   drivers/mux/adgs1408.c:127:19: note: 'cleanup_module' target declared here
     127 | module_spi_driver(adgs1408_driver);
         |                   ^~~~~~~~~~~~~~~
   include/linux/device.h:1558:20: note: in definition of macro 'module_driver'
    1558 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/mux/adgs1408.c:127:1: note: in expansion of macro 'module_spi_driver'
     127 | module_spi_driver(adgs1408_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'adgs1408_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1557:1: note: in expansion of macro 'module_init'
    1557 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/spi/spi.h:293:9: note: in expansion of macro 'module_driver'
     293 |         module_driver(__spi_driver, spi_register_driver, \
         |         ^~~~~~~~~~~~~
   drivers/mux/adgs1408.c:127:1: note: in expansion of macro 'module_spi_driver'
     127 | module_spi_driver(adgs1408_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/mux/adgs1408.c:127:19: note: 'init_module' target declared here
     127 | module_spi_driver(adgs1408_driver);
         |                   ^~~~~~~~~~~~~~~
   include/linux/device.h:1553:19: note: in definition of macro 'module_driver'
    1553 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/mux/adgs1408.c:127:1: note: in expansion of macro 'module_spi_driver'
     127 | module_spi_driver(adgs1408_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/mux/adgs1408.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
