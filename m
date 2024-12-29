Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34751537AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735480513; cv=none; b=q5i6/U83902xLpCmsy+fjddE0iURMxQ0YsLoRAATUW9TEu6Ix6n7RoTAdiDAjQwt12k0wVR5pgyN3hTjJP/smy0k2wgNt6TvCzPU6poecYnARyYxg6CGH743YS+l3BrHwJ6cG4oFLWxksDi6l8946gBcDTYpWMjx6EN08yx3120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735480513; c=relaxed/simple;
	bh=GfboKGOn7eeR5fauyUw/yTT4sV014FsrRy3RfdI55Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXlPdC0CEOAhJDnNN+UEoRsvMf7eROpqEz4cAW+ewOzjW43g61jcsdvoirLtRo6xiIWu5Dp+Xr1G4slayInw4PuC6mZBNArZ0EPvZa3Y6Lxs0RPCdxv01XyrwCIZDSjzP/OgYslXndsDGWlCXTUP12P7s3KbozPjovB46nIPnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuqKsf4t; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuqKsf4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735480511; x=1767016511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfboKGOn7eeR5fauyUw/yTT4sV014FsrRy3RfdI55Kc=;
  b=RuqKsf4tLwWEIXp4KX6e9lSzUo0oSjpUxdXFtSjJ5W9pNqnCuUcWRm+o
   a8QA4AgS4Y1XxXz/pm2lbXzom858i20NaW2c/u9B9qLv/SPvHOls6GHtB
   H0B1XAXXixY1lxt3Rpnmo40ZGrfW09VT8TyIM2+gD48nUEfftnTxdwMwu
   CLRnzCo+QmM5z4l0ufPJiyBv9cfT3YYCKTAqCirbeQGYenWqX4qwT56k+
   6bXDk/p4XxrsKsrBKogs5kbABd/b90z1rskgulFar50x9uO3a+tSwN9Le
   DkhQCrk2+VgyVhzbM4VQR4XtpxcsMaKO1fbGkThGEfULkpXR+D4HSYrge
   Q==;
X-CSE-ConnectionGUID: EfUY3NNwTB+sYnKbbUkJcg==
X-CSE-MsgGUID: SVKG5abFTweicLnNvrx0VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47212167"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="47212167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 05:55:10 -0800
X-CSE-ConnectionGUID: It/xpvKOSG2FhxGs/4wUUQ==
X-CSE-MsgGUID: nkte0N0ES2ioQ+C772+98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137913030"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2024 05:55:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRtl4-0004hP-25;
	Sun, 29 Dec 2024 13:55:06 +0000
Date: Sun, 29 Dec 2024 21:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] drivers/spi/spi-uniphier.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202412292119.3SvvfIct-lkp@intel.com>
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
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: c1acb21b32a3bb601453764c9eac9fc8fbb3a81d [1356/1356] Merge branch 'spi-4.19' into spi-next
config: x86_64-buildonly-randconfig-003-20241228 (https://download.01.org/0day-ci/archive/20241229/202412292119.3SvvfIct-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292119.3SvvfIct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412292119.3SvvfIct-lkp@intel.com/

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
