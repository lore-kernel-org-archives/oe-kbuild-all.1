Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFDE7DA6C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733051140; cv=none; b=eVU/ZCbwr2NwlWqmTx4eMdRBBF4Pw/o6moyX2KBquTUwkBLzrrnU3gdaU/kgMaFMfmqvGp5ntPx/GoTm7XrlhtvzTMvOWX/Kc9fhwmTJTrhc1htKeba8oo4KGMEm0j1429t8Uf0LI4Zfgn7B25b3KpNCIGZA0SP1r1SYt6GPDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733051140; c=relaxed/simple;
	bh=PUxecbSS5EInyBb68/iQiBj5NiMlrlwcuRB6hu9BPm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVm3zcfdpaWoDIEF9G/6r874NxG0veTWAhe86aVfCcebfbqzhIPBeGBcx3wWk1pD93ej9df7GpdstHchFzQerKoDBvj4pofguKf2yA7+5SVkY4HLv4mZn5Fjw4BR9H+L0lhi7B3fpxpmENg6UYgCBvZUxNSV71YaUdxkH3aum5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9zkob0h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9zkob0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733051139; x=1764587139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PUxecbSS5EInyBb68/iQiBj5NiMlrlwcuRB6hu9BPm8=;
  b=M9zkob0hMK+gVtTASnMedhhqRn1o/B6T+8gBs7am6pYqnWMKn79k7zp/
   XTsIvMwqcbk3w/VLSVIQ7LCMBhMbEkIeLfCc+uuz7hsvm6bOHAjU2fUQn
   nNCkSXho05gUbl0TivcznjcoJjYEoec+2Oijjih5Fe3fON4hVgOsrueuH
   9yZpbJiOHF6/OfyLgjXnR/TNK0RfTn3YqQsWdGYq04hxjU096NZkMO9zs
   3fAlpc1r/cOm+RMDI4/7WgxSgGlmhk4eN5gX68BIW+hSOsAvTsM2FG2NG
   jSEMBwQlqfpop04IGirktBihb27S6uVsMxf62S9qjkE36xevF4LAPl9nt
   A==;
X-CSE-ConnectionGUID: 1d+eKtAZSEqZAJuBBxqVlg==
X-CSE-MsgGUID: nxDbAHwwT1SncMX7h1n7YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33155069"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33155069"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 03:05:38 -0800
X-CSE-ConnectionGUID: 0cYNjfQOQNWVfNA2tXtkiw==
X-CSE-MsgGUID: Acrrhqp9TreEg3JZjtZo8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="116113916"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2024 03:05:37 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHhle-0001Tl-18;
	Sun, 01 Dec 2024 11:05:34 +0000
Date: Sun, 1 Dec 2024 19:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298]
 drivers/i2c/busses/i2c-qcom-geni.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202412011940.QJsnBEa8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 37692de5d5235304835f4fdd5b3e5d5bae72fc16 [1298/1298] i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011940.QJsnBEa8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011940.QJsnBEa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011940.QJsnBEa8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-qcom-geni.c:10:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'geni_i2c_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1558:1: note: in expansion of macro 'module_exit'
    1558 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:670:1: note: in expansion of macro 'module_platform_driver'
     670 | module_platform_driver(geni_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/dma-mapping.h:7,
                    from drivers/i2c/busses/i2c-qcom-geni.c:5:
   drivers/i2c/busses/i2c-qcom-geni.c:670:24: note: 'cleanup_module' target declared here
     670 | module_platform_driver(geni_i2c_driver);
         |                        ^~~~~~~~~~~~~~~
   include/linux/device.h:1554:20: note: in definition of macro 'module_driver'
    1554 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:670:1: note: in expansion of macro 'module_platform_driver'
     670 | module_platform_driver(geni_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'geni_i2c_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1553:1: note: in expansion of macro 'module_init'
    1553 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:670:1: note: in expansion of macro 'module_platform_driver'
     670 | module_platform_driver(geni_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:670:24: note: 'init_module' target declared here
     670 | module_platform_driver(geni_i2c_driver);
         |                        ^~~~~~~~~~~~~~~
   include/linux/device.h:1549:19: note: in definition of macro 'module_driver'
    1549 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:670:1: note: in expansion of macro 'module_platform_driver'
     670 | module_platform_driver(geni_i2c_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
