Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59B1817
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735535899; cv=none; b=qVqkR21R+lzmf+O8b8EaNqkNGbeyC2iklYy0tgDffCc+dEZGAKg5ZDYn+Ws8fZIEP2FxS5pPPa/0jt3ICdrSoFMC0063DXR+ncNWr7E9fpsde/lmHjZcZ59RJbDiAUygJe25v3MJecX4LxIizWqrXwHQT2BfUG181Tym6/yrA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735535899; c=relaxed/simple;
	bh=bFayat1CjpIgzsAZWc1zmCCICKd1cWtxUGvdIc0bfPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6gHQBta7H4DjcJ9C2ToVfLiqqvYn8KaKRc84MZOQHtEBRWgsHL+9ZAJIjeA3OMG1esD7ZhuECKb8IreVSUp5upbRu2ykoZRX7qYn8XEql2yyUlLS9X6HjVLxAbxNWwAyXZ72vF/g90su7QqB8/zIGwNpFjMY8TzDQPvqYo+FgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg6VRknA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg6VRknA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735535898; x=1767071898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bFayat1CjpIgzsAZWc1zmCCICKd1cWtxUGvdIc0bfPU=;
  b=Zg6VRknA0SbwcjbJ9vDhbinHUdF8sPoBTny8Zkdp5q7LNiG7ZYQNQfwH
   ZRNT3Fr0D6IodpaMLvk6os9YVvwqpIKLHmlUNaoPZB3M2ynYpmmYcQJWH
   s08jVaEVZyVRuvAKCh3iD4qyUPPx9ZiRCUdlccu3NH68NEiulPZvtLW0/
   xM/17AVNOD/3ifqhi0wwg3CSWTPZ24nQ5ypC+lSgpJaoefT3uLspxUGYQ
   yDlCppal9WG7VoAto8MtJjFO2KA17DshlvGOUMigulyXNGVc/8xUkNSOX
   3KDHnRXKHWGXOdOld0SbncR28M7w8aE3jvfN4vVvBcSWlVpiHaClutq9K
   Q==;
X-CSE-ConnectionGUID: +BOKIr18RkCP96E+ZKHHbA==
X-CSE-MsgGUID: ZytxnAsqT+aVEXJZ9kg6YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="53223949"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="53223949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 21:18:18 -0800
X-CSE-ConnectionGUID: xvOYHipcQhia+XQK6jKzBA==
X-CSE-MsgGUID: 5m/SMIO2SMqCirntWumL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="100452459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Dec 2024 21:18:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS8AQ-0005NY-0r;
	Mon, 30 Dec 2024 05:18:14 +0000
Date: Mon, 30 Dec 2024 13:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/14] Makefile:47: ***
 Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux
 /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202412301345.wmZMflOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   dc2f57f443345aeea3a66a9ebf744b0217983df4
commit: 4b2842c656154e388824e16959e0981ab3bb71ac [13/14] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412301345.wmZMflOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412301345.wmZMflOi-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d527 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d527 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d527 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d527 Masahiro Yamada 2019-02-22  50  
3812b8c5c5d527 Masahiro Yamada 2019-02-22  51  # Avoid funny character set dependencies
3812b8c5c5d527 Masahiro Yamada 2019-02-22  52  unexport LC_ALL
3812b8c5c5d527 Masahiro Yamada 2019-02-22  53  LC_COLLATE=C
3812b8c5c5d527 Masahiro Yamada 2019-02-22  54  LC_NUMERIC=C
3812b8c5c5d527 Masahiro Yamada 2019-02-22  55  export LC_COLLATE LC_NUMERIC
3812b8c5c5d527 Masahiro Yamada 2019-02-22  56  
3812b8c5c5d527 Masahiro Yamada 2019-02-22  57  # Avoid interference with shell env settings
3812b8c5c5d527 Masahiro Yamada 2019-02-22  58  unexport GREP_OPTIONS
3812b8c5c5d527 Masahiro Yamada 2019-02-22  59  
066b7ed9558087 Michal Marek    2014-07-04 @60  # Beautify output
066b7ed9558087 Michal Marek    2014-07-04  61  # ---------------------------------------------------------------------------
066b7ed9558087 Michal Marek    2014-07-04  62  #
8962b6b475bddc Masahiro Yamada 2022-12-23  63  # Most of build commands in Kbuild start with "cmd_". You can optionally define
8962b6b475bddc Masahiro Yamada 2022-12-23  64  # "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
8962b6b475bddc Masahiro Yamada 2022-12-23  65  # that command is printed by default.
066b7ed9558087 Michal Marek    2014-07-04  66  #
8962b6b475bddc Masahiro Yamada 2022-12-23  67  # e.g.)
8962b6b475bddc Masahiro Yamada 2022-12-23  68  #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
8962b6b475bddc Masahiro Yamada 2022-12-23  69  #          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
066b7ed9558087 Michal Marek    2014-07-04  70  #
066b7ed9558087 Michal Marek    2014-07-04  71  # A simple variant is to prefix commands with $(Q) - that's useful
066b7ed9558087 Michal Marek    2014-07-04  72  # for commands that shall be hidden in non-verbose mode.
066b7ed9558087 Michal Marek    2014-07-04  73  #
8962b6b475bddc Masahiro Yamada 2022-12-23  74  #    $(Q)$(MAKE) $(build)=scripts/basic
066b7ed9558087 Michal Marek    2014-07-04  75  #
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  76  # If KBUILD_VERBOSE contains 1, the whole command is echoed.
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  77  # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
066b7ed9558087 Michal Marek    2014-07-04  78  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  # To put more focus on warnings, be less verbose as default
^1da177e4c3f41 Linus Torvalds  2005-04-16  80  # Use 'make V=1' to see the full commands
^1da177e4c3f41 Linus Torvalds  2005-04-16  81  

:::::: The code at line 47 was first introduced by commit
:::::: 3812b8c5c5d527239ac015f1f2c7654da7fcfbba kbuild: make -r/-R effective in top Makefile for old Make versions

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
