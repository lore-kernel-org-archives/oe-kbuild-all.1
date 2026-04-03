Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BD3803F5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205846; cv=none; b=sgKrNJJoKmAy0/i6XVHm1PYmZMTP6XSCYBSLOXNvZ48MBJ+NDfpgzJUYYEbnDUEaBr6zizHZJsJ+p/4cMLyFIgOGYptje3gESYeI7NAONYY2J8Q4L1CcrnztkBCYkeiNI+aOcx688SFq2DhySSEfFRh9A4sNh7nDkI6BpV+JdqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205846; c=relaxed/simple;
	bh=dPS/JnWK23IILyfL6JCwPX4KLqqFOCYxSI+7cCFcS5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Du19VZxm0GZBARGmXq40CxKAi0M5iArYB3S4go0Hfe6dlqo/23Nj/jtRfL3UPv/4zGGILaH8sBLO3hNjIJT7BugGl0mOmDpvDDcR43M1zEXjakUCivZI0iBWWYYGb2br2n5l8AMGgVOJOV9aS6z1C7uYS4MHmKXGG4ym3+MCGfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVf3EvGa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVf3EvGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205844; x=1806741844;
  h=date:from:to:cc:subject:message-id;
  bh=dPS/JnWK23IILyfL6JCwPX4KLqqFOCYxSI+7cCFcS5A=;
  b=aVf3EvGaQJh11oVIwbl5nV5SiHk1Zo5YRXNOewRqn4UbrwNqWNIWLChY
   mmMo9zVHIPsYmntCo5/BQd2Esi8Y/TsgTOoziPoqQyZ6qtzkcadPFxElV
   raxUfOA4CQl8bYsxBFUhnLIM7sDdmh4JkwDLMJyYuysrZm317d/Woxh+C
   O7w51rA5zHfkyOk57OzV2RTQ9rHVX+lHodgztWOGXLhntAL+CigAR/xiI
   Q6vgd8TP9MWUkDIUOvIhMDSzUFWHQRKv9MsHpXV0iMUAWRH1pbVQSc2PV
   WvRhcye3mK3j701Lw7TyMEdIEMldqLpK0xA574G3iUmpAzSSr2MQ2L8OV
   Q==;
X-CSE-ConnectionGUID: gTDaRNY6QI6MCLGQiN3sbw==
X-CSE-MsgGUID: Q0UFBr/YTuOT0KVG1joPVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852252"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852252"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:44:01 -0700
X-CSE-ConnectionGUID: m2Q3p4gVRjaYa54egGPcIw==
X-CSE-MsgGUID: D6hsFoguScKcVPqTsjD8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943437"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8C-0000000014i-0ZkH;
	Fri, 03 Apr 2026 08:43:56 +0000
Date: Fri, 03 Apr 2026 16:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit
 declaration of function '__raw_readb'
Message-ID: <202604030505.CPHQZWDA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: 243ce64b2b371cdf2cbc39c9422cb3047cab6de7 backlight: Do not include <linux/fb.h> in header file
date:   5 months ago
config: sh-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030505.CPHQZWDA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030505.CPHQZWDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030505.CPHQZWDA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/backlight/hp680_bl.c:20:
   arch/sh/include/cpu-sh3/cpu/dac.h: In function 'sh_dac_enable':
>> arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit declaration of function '__raw_readb' [-Werror=implicit-function-declaration]
      21 |         v = __raw_readb(DACR);
         |             ^~~~~~~~~~~
>> arch/sh/include/cpu-sh3/cpu/dac.h:24:9: error: implicit declaration of function '__raw_writeb'; did you mean '__raw_write_lock'? [-Werror=implicit-function-declaration]
      24 |         __raw_writeb(v,DACR);
         |         ^~~~~~~~~~~~
         |         __raw_write_lock
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/__raw_readb +21 arch/sh/include/cpu-sh3/cpu/dac.h

^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  16  
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  17  
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  18  static __inline__ void sh_dac_enable(int channel)
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  19  {
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  20  	unsigned char v;
9d56dd3b083a3b arch/sh/include/cpu-sh3/cpu/dac.h Paul Mundt     2010-01-26 @21  	v = __raw_readb(DACR);
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  22  	if(channel) v |= DACR_DAOE1;
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  23  	else v |= DACR_DAOE0;
9d56dd3b083a3b arch/sh/include/cpu-sh3/cpu/dac.h Paul Mundt     2010-01-26 @24  	__raw_writeb(v,DACR);
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  25  }
^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  26  

:::::: The code at line 21 was first introduced by commit
:::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
