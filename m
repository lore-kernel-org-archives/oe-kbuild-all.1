Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B106FD5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733043555; cv=none; b=Ld6UGJRPCELKJ8+ZRzsjLme5V/8OusqVioqDW5OyAjJY9OkMjJopz1ZGAFtx0OhcZ/dTlFgtmE1jK0Iz6FWgwfjkj+4/NV8UKcap8dJIxcQFEIWu3jLo8iTbt8bSMuv/wpQYpY8D0KjM0lNZ88joe9PrU+l6pBbheJQOb6n6kDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733043555; c=relaxed/simple;
	bh=w2MuB8UTaFcrNfbe9YjMGtfppvQFnRP4DSbh+Ls+KdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGFrSmXAF3RSulvQJJs6CEjwVQHJhffzAY9CdchR4ulP/PUHEsF/M2gjjv9jyS1Y4vqZuBnx3yuDJXMCsh1gnIcu2ZAOB3kmoWPfNxOcNOasAPSL39ElkPUwpJXq+GMQrEMtsKeaR1rH5HN4J6ce1zXtzK2HURADEFIRzRPVYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaM9wleb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaM9wleb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733043554; x=1764579554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w2MuB8UTaFcrNfbe9YjMGtfppvQFnRP4DSbh+Ls+KdA=;
  b=gaM9wlebbDPET1/kQBKZ2BychaaqLrHEFrl174+TXzE0mpZPqwJPJDrZ
   yVV+rBAuFKzAQPoSS9JEQRhQvm5zUV7fOUAkamyO8bYpHfbldeZwoLKOg
   g8v3VIcpQ6OFCP3ahzuABRKGH5erhHwprO9ZvLxU8f1ApNJFwUk0C1+Df
   ZecQLFUrhUfnQXDMqev5AEbNObpeGnq75EI6w7HzLvwQF7hGi8Aijf+1h
   n39Mc/507iPkKrMhLjLVlkBG+EmIv+xWMjqgvgb0rm/yWZY+QXzBRIvHK
   u5xa3sx2IupXtg9u+IVqDLgcvg9bLRS+KR/zFy86PHWdf43SVnisFYmet
   A==;
X-CSE-ConnectionGUID: w3NSIW7JSvi/HlFhFVFqTg==
X-CSE-MsgGUID: JZ2zVPWETTaVcGJH/iA85g==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44597762"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="44597762"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 00:59:13 -0800
X-CSE-ConnectionGUID: hkywZ82pR7ajW98giqiVNA==
X-CSE-MsgGUID: +Vk6Mvv4R1mNDu+5pVDSEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="93295932"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2024 00:59:12 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHfnC-0001Ot-1a;
	Sun, 01 Dec 2024 08:59:04 +0000
Date: Sun, 1 Dec 2024 16:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298]
 drivers/hid/intel-ish-hid/ipc/pci-ish.o: warning: objtool: missing symbol
 for section .exit.text
Message-ID: <202412011608.l2EWWbUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: c3bc8fd637a9623f5c507bd18f9677effbddf584 [1298/1298] tracing: Centralize preemptirq tracepoints and unify their usage
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011608.l2EWWbUS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011608.l2EWWbUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011608.l2EWWbUS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/intel-ish-hid/ipc/pci-ish.c: In function 'ish_resume_handler':
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:227:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     227 |         int ret;
         |             ^~~
   In file included from drivers/hid/intel-ish-hid/ipc/pci-ish.c:16:
   drivers/hid/intel-ish-hid/ipc/pci-ish.c: At top level:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'ish_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1558:1: note: in expansion of macro 'module_exit'
    1558 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/pci.h:1279:9: note: in expansion of macro 'module_driver'
    1279 |         module_driver(__pci_driver, pci_register_driver, pci_unregister_driver)
         |         ^~~~~~~~~~~~~
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:323:1: note: in expansion of macro 'module_pci_driver'
     323 | module_pci_driver(ish_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/hid/intel-ish-hid/ipc/pci-ish.c:19:
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:323:19: note: 'cleanup_module' target declared here
     323 | module_pci_driver(ish_driver);
         |                   ^~~~~~~~~~
   include/linux/device.h:1554:20: note: in definition of macro 'module_driver'
    1554 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:323:1: note: in expansion of macro 'module_pci_driver'
     323 | module_pci_driver(ish_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'ish_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1553:1: note: in expansion of macro 'module_init'
    1553 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/pci.h:1279:9: note: in expansion of macro 'module_driver'
    1279 |         module_driver(__pci_driver, pci_register_driver, pci_unregister_driver)
         |         ^~~~~~~~~~~~~
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:323:1: note: in expansion of macro 'module_pci_driver'
     323 | module_pci_driver(ish_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:323:19: note: 'init_module' target declared here
     323 | module_pci_driver(ish_driver);
         |                   ^~~~~~~~~~
   include/linux/device.h:1549:19: note: in definition of macro 'module_driver'
    1549 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:323:1: note: in expansion of macro 'module_pci_driver'
     323 | module_pci_driver(ish_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:54: warning: Function parameter or member '2' not described in '__printf'
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:54: warning: Function parameter or member '3' not described in '__printf'
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:54: warning: Excess function parameter 'dev' description in '__printf'
   drivers/hid/intel-ish-hid/ipc/pci-ish.c:54: warning: Excess function parameter 'format' description in '__printf'
>> drivers/hid/intel-ish-hid/ipc/pci-ish.o: warning: objtool: missing symbol for section .exit.text
--
   In file included from drivers/mmc/core/core.c:13:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'mmc_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/module.h:115:41: note: in expansion of macro 'module_init'
     115 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/mmc/core/core.c:2871:1: note: in expansion of macro 'subsys_initcall'
    2871 | subsys_initcall(mmc_init);
         | ^~~~~~~~~~~~~~~
   drivers/mmc/core/core.c:2839:19: note: 'init_module' target declared here
    2839 | static int __init mmc_init(void)
         |                   ^~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'mmc_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/mmc/core/core.c:2872:1: note: in expansion of macro 'module_exit'
    2872 | module_exit(mmc_exit);
         | ^~~~~~~~~~~
   drivers/mmc/core/core.c:2864:20: note: 'cleanup_module' target declared here
    2864 | static void __exit mmc_exit(void)
         |                    ^~~~~~~~
   drivers/mmc/core/core.c:1343: warning: Function parameter or member 'mmc' not described in 'mmc_regulator_set_vqmmc'
   drivers/mmc/core/core.c:1343: warning: Function parameter or member 'ios' not described in 'mmc_regulator_set_vqmmc'
   drivers/mmc/core/core.o: warning: objtool: mmc_hw_reset()+0xf9: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/core.o: warning: objtool: mmc_sw_reset()+0xf9: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/core.o: warning: objtool: mmc_wait_for_req_done()+0x13b: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/core.o: warning: objtool: mmc_do_erase()+0xe8: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/core.o: warning: objtool: mmc_of_parse_voltage()+0x60: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/core.o: warning: objtool: mmc_execute_tuning()+0x79: sibling call from callable instruction with modified stack frame
   drivers/mmc/core/core.o: warning: objtool: mmc_set_uhs_voltage()+0x41: sibling call from callable instruction with modified stack frame
>> drivers/mmc/core/core.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
