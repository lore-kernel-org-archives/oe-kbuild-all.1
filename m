Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80A12D758
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746911846; cv=none; b=npaBtMXWFMSR9Lhep1/w4em2DTTaE7J2PWqJaDz1XT/T4NSdO1JuSHW5tNr3EuXrWz3tfa2kMig7RB5XGQQGClgwMWdoI2SISh0i0hBOkRSLzbQ0Qy+hWTlYQ8ealgpmNJ/VFUsVn2Drbva6e7pRxLRKKTCiTchpLoADfs+vkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746911846; c=relaxed/simple;
	bh=cWSbuczgoKe6TeiVHBwH5BSNTjAoeExDsCTIjD0OJpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaNuXuH3KFUW7ay3lZsTaY/1+pnfEV288cciqOz/yZ6g4E7viJLes919SWe2cK6g/Am7m+3VhLWdopRlAw2YD/SGlngwOoxgGJGx+Z1NghnQAQDerSs47qFImuBrlAg95V0CDKRwwX4L8bZMjq/WtUu9i+ZBL8s0LPJPl/alDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elBRWdMa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elBRWdMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746911845; x=1778447845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cWSbuczgoKe6TeiVHBwH5BSNTjAoeExDsCTIjD0OJpA=;
  b=elBRWdMac3MHL38bLrV67XAmjy6ImFKMUIW2pBo3dbV8nv02ND39jAWZ
   z1FF65yJIzA1Y8q73LSK2OQWHXijbl73MDqABJurm8S9JvoQ8U/xQXa8s
   J/+hPoCOGZrtkeahInAsjR33Dm6npeNhonicJlyTldmiw2eo7wCouHqWQ
   absEvRnCs99PGReJ7TRVosfuTEz6iibDQk9in8gUTGO/nRS/Os39WvFm3
   JtWvLuYZSUmZFQbzlBIrxj2tnihuFYN19xDI4s7ek8GRfUfyUvqPJsaT6
   +8ej3aeZlA6RiJlfA+dosaNaXOw+1DX1j8B9T1oYm5280tTXcQeekJe18
   A==;
X-CSE-ConnectionGUID: +qUdYpZeSBKjdsvZamX74Q==
X-CSE-MsgGUID: 28rkfBG3SYy0nVHIRg1Mtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="60067756"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="60067756"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 14:17:24 -0700
X-CSE-ConnectionGUID: 2AjmwyBJRty6oN3p8tc4RA==
X-CSE-MsgGUID: /bvD3GGdSxu7VmH3e6YxEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136969512"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 May 2025 14:17:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDrZR-000DOD-0A;
	Sat, 10 May 2025 21:17:21 +0000
Date: Sun, 11 May 2025 05:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1627/1627]
 drivers/i2c/busses/i2c-owl.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <202505110553.bsdHvTXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   191661de6f001a77246c2d23ec77d8d23fe4114a
commit: d211e62af46693f90f6386085817e22239e3fe79 [1627/1627] i2c: Add Actions Semiconductor Owl family S900 I2C driver
config: x86_64-buildonly-randconfig-005-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110553.bsdHvTXR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110553.bsdHvTXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110553.bsdHvTXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-owl.c:17:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'owl_i2c_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1558:1: note: in expansion of macro 'module_exit'
    1558 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/i2c/busses/i2c-owl.c:490:1: note: in expansion of macro 'module_platform_driver'
     490 | module_platform_driver(owl_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/i2c.h:30,
                    from drivers/i2c/busses/i2c-owl.c:14:
   drivers/i2c/busses/i2c-owl.c:490:24: note: 'cleanup_module' target declared here
     490 | module_platform_driver(owl_i2c_driver);
         |                        ^~~~~~~~~~~~~~
   include/linux/device.h:1554:20: note: in definition of macro 'module_driver'
    1554 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/i2c/busses/i2c-owl.c:490:1: note: in expansion of macro 'module_platform_driver'
     490 | module_platform_driver(owl_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'owl_i2c_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1553:1: note: in expansion of macro 'module_init'
    1553 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/i2c/busses/i2c-owl.c:490:1: note: in expansion of macro 'module_platform_driver'
     490 | module_platform_driver(owl_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-owl.c:490:24: note: 'init_module' target declared here
     490 | module_platform_driver(owl_i2c_driver);
         |                        ^~~~~~~~~~~~~~
   include/linux/device.h:1549:19: note: in definition of macro 'module_driver'
    1549 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/i2c/busses/i2c-owl.c:490:1: note: in expansion of macro 'module_platform_driver'
     490 | module_platform_driver(owl_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-owl.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
