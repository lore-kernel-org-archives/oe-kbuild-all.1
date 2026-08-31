Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982F470EB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190578; cv=none; b=KU6cMQ2tf/2WNHHlL3kmLyMU7grR12XUFAkyBVeBAcE8jzL0GYKDg769hvC5iFKynq1AN8Z+XxJDc2YRUAR+MO8/NuiWcb6e9n++Quo1tA9qA/6NgixCeRT3Px8o3GIebj8/f4K2kCKzyy3FeRHSIQ+XGfxpX1dDauYjvDPGNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190578; c=relaxed/simple;
	bh=//xSodeS8j8lTBCVQbgpiygDd7fC714+cZ1nYN34qk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=povQT/3xArNMNdU1Tfk66qR63zFdm9hjNDkXHTCoDaGLQBakgx/U6dZBmzAsT5w5+jEYT/F7L/OaBoKjFoN2zeQ49HE9RYklcvUm3I+dEBP8IoqQSvUyfQn49CfLZiN1OAUfWs56FQJET+WS/tB6/f1o3CNlqDbn22oZ4pGLPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfsaP2h6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfsaP2h6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788190575; x=1819726575;
  h=date:from:to:cc:subject:message-id;
  bh=//xSodeS8j8lTBCVQbgpiygDd7fC714+cZ1nYN34qk0=;
  b=JfsaP2h6JLrHNjbdMXpLmJ/X3x4FkKgb6nBR2bl9dFeoyVQL5Z+WBNE3
   /Sl5WkOnFZxgeT1rkmvORrEak9HGwXBCmDElAjKPR+UyFvL+ux+3pCHSv
   OGkzPxZoo2WFdnyvwLW412QKDu4m5A/ldzFLsPSCTO86vZabFd1VSG5X/
   q2u9m7XTAeXcpm2cYkRM0PXaTHgoyeqfFeRSBugkJrILXFPfD2dJkS4Lz
   qifjeFEY6UaFchax3VRBEsEdUyPkwo3CXQ6y63O64vM7ucaifnnYlfKf0
   XuHtW6DexjKidWANJ4GyJALfaYJmfmwjsgHiUDUJ+RkvOt/yhGAryt4OL
   w==;
X-CSE-ConnectionGUID: UyOZsbl9T+eyj7pNJUCfUg==
X-CSE-MsgGUID: Ze5OJXvCRCOH6LN3alntRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99203229"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99203229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:36:15 -0700
X-CSE-ConnectionGUID: 7UzcHv6cSP2pbuBbkZ++GA==
X-CSE-MsgGUID: IfPRtTfqT8u2M5ms0L6y7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="298733438"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2026 08:36:13 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x143P-000000000nZ-2VD3;
	Mon, 31 Aug 2026 15:36:11 +0000
Date: Mon, 31 Aug 2026 23:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 4/22] ld:
 include/linux/interrupt_rc.h:32:undefined reference to
 `local_interrupt_disable_state'
Message-ID: <202608312324.L3sXF11o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   ec3ae38eecb47043e2e2d2138e35ee22dedfced4
commit: e4ad033b57310ea8804a2fb5a32a23fdd93e4329 [4/22] movestuff
config: x86_64-randconfig-013-20260831 (https://download.01.org/0day-ci/archive/20260831/202608312324.L3sXF11o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312324.L3sXF11o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608312324.L3sXF11o-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__local_interrupt_enable':
   include/linux/interrupt_rc.h:30:(.text+0x3801fe): undefined reference to `local_interrupt_disable_state'
>> ld: include/linux/interrupt_rc.h:32:(.text+0x38021c): undefined reference to `local_interrupt_disable_state'
   ld: vmlinux.o: in function `__local_interrupt_save_state':
   include/linux/interrupt_rc.h:25:(.text+0x380252): undefined reference to `local_interrupt_disable_state'
   ld: include/linux/interrupt_rc.h:25:(.text+0x380271): undefined reference to `local_interrupt_disable_state'
   ld: vmlinux.o: in function `__local_interrupt_enable':
   include/linux/interrupt_rc.h:30:(.text+0x3802da): undefined reference to `local_interrupt_disable_state'
   ld: vmlinux.o:include/linux/interrupt_rc.h:25: more undefined references to `local_interrupt_disable_state' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
