Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A483570AD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783283197; cv=none; b=ozEIJDebGDxyHkMANrY7XcZTRYBHS6LTwhPlagyZJuI7WQ1prg+49uq/MBcb0UvkdJ6JFkn+q4Nh7eOi/Yjwa/5XiF7u7YStf5+V+TcKONNYLdvJ9GtihIwxJ7804waz14Gd9EU02Ls+eMIOemX1fvwNq5NUSNOOfbS5Ke2CrYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783283197; c=relaxed/simple;
	bh=VxpSJ/Mo9UZv+pGIPhCepJJMB+7ffW8K1yvllLKxy/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c0muqtTS7jmoeuBM7Vtc8g/8RvfUd4m+JyvnZXZsM/0iEWBk9f2kG1brDjsckLooGb3UaIJxCg/Isr/0CZyaWUjY4ThN9EeGpf+0M9GbsjfeLOy4mbIxpoSBKPQG2xvbg1C3ArUGUOCZh54nSbiTR2Mid9t3p9UKvRkqpud4IRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6SAdySr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6SAdySr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783283194; x=1814819194;
  h=date:from:to:cc:subject:message-id;
  bh=VxpSJ/Mo9UZv+pGIPhCepJJMB+7ffW8K1yvllLKxy/M=;
  b=U6SAdySrwidA+IZNH2cozLY5NRv96LpTrdFNZ+KrYWBcv0GwDXGWd4J5
   lTMXRPWWzvJJX+7EozrdZTsfBjO1Mx2Pjte8I4zdUGn+xsWyPfzay7Buy
   g2tJYEsqb9tR/VZjxEfG3luY5PGSWYTYke8/2qxqCY2l394ycDbh8B/d+
   wFiH/STUKbWyjJPRU3gpzhT9QwQnpxeMM6SfXpq+Cdy6KCaBTyxJ8FRMo
   PE6cJ/iFjzsutpY92gemN4SFj8mkrkLTSzKUKCV2SxSSjeW7kCZgkgjGM
   xHtIV9heJCef27BpbwHMnqbob6YAX/aNbVVN3h7qb9Z6TCqqUvzkpJ5Y6
   g==;
X-CSE-ConnectionGUID: C0b3szd7QC2r5u9iQctv3w==
X-CSE-MsgGUID: eq3f0FmsSrGpAcsn8epWDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71445025"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71445025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 13:26:33 -0700
X-CSE-ConnectionGUID: F0HD6zeKSYSd42r11KZykg==
X-CSE-MsgGUID: KkJBUGUcS52CRIJOwd5QWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="252471468"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2026 13:26:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgTQ5-00000000DnP-115g;
	Sun, 05 Jul 2026 20:26:29 +0000
Date: Mon, 06 Jul 2026 04:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 120/121]
 make[8]: *** No rule to make target
 'drivers/media/platform/qcom/camss/camss-icp-hfi.o', needed by
 'drivers/media/platform/qcom/camss/qcom-camss-icp.o'.
Message-ID: <202607060402.mYFx91MW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: 782e70f1ad20204721b37ade4a33837e76ac3b86 [120/121] media: qcom: camss: Switch on ICP and BPS as make options
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260706/202607060402.mYFx91MW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060402.mYFx91MW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060402.mYFx91MW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> make[8]: *** No rule to make target 'drivers/media/platform/qcom/camss/camss-icp-hfi.o', needed by 'drivers/media/platform/qcom/camss/qcom-camss-icp.o'.
>> make[8]: *** No rule to make target 'drivers/media/platform/qcom/camss/camss-bps-cmd.o', needed by 'drivers/media/platform/qcom/camss/qcom-camss-bps.o'.
   make[8]: *** [scripts/Makefile.build:287: drivers/media/platform/qcom/camss/camss-bps.o] Error 1
   make[8]: Target 'drivers/media/platform/qcom/camss/' not remade because of errors.
--
   In file included from drivers/media/platform/qcom/camss/camss-icp.h:14,
                    from drivers/media/platform/qcom/camss/camss-icp.c:26:
>> drivers/media/platform/qcom/camss/camss-icp-hfi.h:480:36: warning: 'struct icp_ubwc_cfg' declared inside parameter list will not be visible outside of this definition or declaration
     480 |                             struct icp_ubwc_cfg *cfg);
         |                                    ^~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-icp-hfi.h:479:36: warning: 'struct icp_device' declared inside parameter list will not be visible outside of this definition or declaration
     479 | int icp_hfi_set_ubwc_config(struct icp_device *icp, u32 dev_type,
         |                                    ^~~~~~~~~~
   In file included from include/linux/printk.h:621,
                    from include/linux/kernel.h:31,
                    from include/linux/clk.h:13,
                    from drivers/media/platform/qcom/camss/camss-icp.c:7:
   drivers/media/platform/qcom/camss/camss-icp.c: In function 'icp_load_firmware':
>> drivers/media/platform/qcom/camss/camss-icp.c:150:27: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     150 |         dev_dbg(icp->dev, "FW memory: phys=0x%pa size=%llu\n",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c:150:9: note: in expansion of macro 'dev_dbg'
     150 |         dev_dbg(icp->dev, "FW memory: phys=0x%pa size=%llu\n",
         |         ^~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c:150:58: note: format string is defined here
     150 |         dev_dbg(icp->dev, "FW memory: phys=0x%pa size=%llu\n",
         |                                                       ~~~^
         |                                                          |
         |                                                          long long unsigned int
         |                                                       %u
   drivers/media/platform/qcom/camss/camss-icp.c: At top level:
>> drivers/media/platform/qcom/camss/camss-icp.c:224:6: warning: no previous prototype for 'icp_dump_gp_regs' [-Wmissing-prototypes]
     224 | void icp_dump_gp_regs(struct camss_icp *icp, const char *label)
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-icp.c:240:6: warning: no previous prototype for 'icp_hfi_latch_regs' [-Wmissing-prototypes]
     240 | void icp_hfi_latch_regs(struct camss_icp *icp)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c: In function 'icp_hfi_latch_regs':
>> drivers/media/platform/qcom/camss/camss-icp.c:243:24: warning: unused variable 'dev' [-Wunused-variable]
     243 |         struct device *dev = hfi->dev;
         |                        ^~~
   drivers/media/platform/qcom/camss/camss-icp.c: At top level:
>> drivers/media/platform/qcom/camss/camss-icp.c:578:22: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     578 |         .clk_names = x1e80100_clk_names,
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c:580:22: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     580 |         .noc_names = x1e80100_noc_names,
         |                      ^~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/qcom/camss/camss-bps.c:26:10: fatal error: camss-bps-cmd.h: No such file or directory
      26 | #include "camss-bps-cmd.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
