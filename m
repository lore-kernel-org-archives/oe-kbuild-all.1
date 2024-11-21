Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859910A3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209870; cv=none; b=UstLGXSSCxdQkwoGvSbumow6DDbS2mqywCDXtbLzqDHXANi5B+5UmD6NlOQZMIKqpUdoQsQrseIcnwQJGvOpYLOVxcIzFlkkwVXV6v0H+XSyhsvOozsDI4+nNS3zFXV9Wej+YBY7sBYuo6zbZzQKRYyjx1TIA9/fbqdLMdooasY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209870; c=relaxed/simple;
	bh=Zx3mvTeYTR+jdyOwIMwTRYd9tNLML61F8mN+yTs8kIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ety7Rus9b/wLlG8JZnffMM0I2jgJFvKbkARkaE5mUDwHPkfzFAkQNuHY/u3VX6QzwObxxJbXdww83QbXwOPyr9yS5ng4GJzAiQ70asSfHXmcVCGK0tUDeiVu6cy8++k2OxYEoubuLwsSDXIHH/o+0IMpuAEEXQSJoFRygGM5/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8iHU9dX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8iHU9dX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732209869; x=1763745869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zx3mvTeYTR+jdyOwIMwTRYd9tNLML61F8mN+yTs8kIU=;
  b=L8iHU9dXqxsjtdURFV6wZ5nVCF/FV8R5uUgL9mGrA7M3fmbTBbZerFms
   3XWhn9lJi1CbotlOy67gCfxXfq+XUXY6+8+F2vxTFRIM3WvlOm+1H8ynP
   hy1feJhbxwZChM93DhKpeyp2xlBEIepkyT9pZJnN2WS7gASCZ4W1eQ2LZ
   l4vo4IeUzteGGck2ETyAaIWdKKB17g3tw0U2stc+LyMMJCq/lDck8gCfX
   gzoQY6gCs0uzoxkc4t206JkNiFokehD64LEgQ3sugo2OOk83ui+Gsbs3E
   yVVexjCKGQTZ+SbIWSd/5ENM+WqkO7Y4657UhjkEZwO+x5SFjAYS5pFGQ
   Q==;
X-CSE-ConnectionGUID: Yd5G2bgJTY+GMBeK23K16g==
X-CSE-MsgGUID: fjyFKFT9SH+DWLGKl724Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31697092"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="31697092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:24:29 -0800
X-CSE-ConnectionGUID: ku/l9CHOSGmDSgGn8VzQEQ==
X-CSE-MsgGUID: y0gqlLX7ThSTsuopt04xWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="91123544"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Nov 2024 09:24:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEAun-0003Cl-0S;
	Thu, 21 Nov 2024 17:24:25 +0000
Date: Fri, 22 Nov 2024 01:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/watchdog/menz69_wdt.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202411220134.YWoog3yH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 81ceed41d0c2b2c9300de7bc30c1451680257f52 [1297/1297] watchdog: add driver for the MEN 16z069 IP-Core
config: x86_64-buildonly-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241122/202411220134.YWoog3yH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220134.YWoog3yH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220134.YWoog3yH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/watchdog/menz69_wdt.c:10:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'men_z069_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1558:1: note: in expansion of macro 'module_exit'
    1558 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/mcb.h:126:9: note: in expansion of macro 'module_driver'
     126 |         module_driver(__mcb_driver, mcb_register_driver, mcb_unregister_driver);
         |         ^~~~~~~~~~~~~
   drivers/watchdog/menz69_wdt.c:166:1: note: in expansion of macro 'module_mcb_driver'
     166 | module_mcb_driver(men_z069_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/mcb.h:15,
                    from drivers/watchdog/menz69_wdt.c:9:
   drivers/watchdog/menz69_wdt.c:166:19: note: 'cleanup_module' target declared here
     166 | module_mcb_driver(men_z069_driver);
         |                   ^~~~~~~~~~~~~~~
   include/linux/device.h:1554:20: note: in definition of macro 'module_driver'
    1554 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/watchdog/menz69_wdt.c:166:1: note: in expansion of macro 'module_mcb_driver'
     166 | module_mcb_driver(men_z069_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'men_z069_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1553:1: note: in expansion of macro 'module_init'
    1553 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/mcb.h:126:9: note: in expansion of macro 'module_driver'
     126 |         module_driver(__mcb_driver, mcb_register_driver, mcb_unregister_driver);
         |         ^~~~~~~~~~~~~
   drivers/watchdog/menz69_wdt.c:166:1: note: in expansion of macro 'module_mcb_driver'
     166 | module_mcb_driver(men_z069_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/watchdog/menz69_wdt.c:166:19: note: 'init_module' target declared here
     166 | module_mcb_driver(men_z069_driver);
         |                   ^~~~~~~~~~~~~~~
   include/linux/device.h:1549:19: note: in definition of macro 'module_driver'
    1549 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/watchdog/menz69_wdt.c:166:1: note: in expansion of macro 'module_mcb_driver'
     166 | module_mcb_driver(men_z069_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/watchdog/menz69_wdt.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
