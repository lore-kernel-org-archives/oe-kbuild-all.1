Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4A329C6A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761661399; cv=none; b=T3xKaNlf2G+cQIkeNNFR6MV2WJ8RMKXY93a5mcYfS0NqUrdleqycjPP8MF81U83mS8uxLp9dWEyOAjrKZNu2M6/ysampaNtVjW5w7rHrrZ7KjN5O2+yOginIuW+9RshbU92PXTHJ53wX2alQd+/MqCaNsLL5GxCfcZlKpdK/M8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761661399; c=relaxed/simple;
	bh=vF3nEi2/GZ5TgmmavFlprbYJu+OTDJ79Ki522pI5NSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4EGDl5PofwxU0sIWkj+N2XYXBFwSWkf7UvX6o0TrnPe/4hAb1XBJQqoNGMP3R87Oz+KJjNvQyMLELrwZ/uA7+u/GF8wNeJH7eZFbvvXJV3dte7P0Utelq/OLXVKXE3dMxH7hGJC4RT4h+lzLk34/loIO/fhZJ5Mozyohq6Qv3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6qLwHVi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6qLwHVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761661398; x=1793197398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vF3nEi2/GZ5TgmmavFlprbYJu+OTDJ79Ki522pI5NSM=;
  b=X6qLwHViNmPySta+JYmimGGpIxM74QU9wDOoKB4CF8FSIyY53tGYB390
   yqCj/9haMQ6iLxN2AFs6Yk5ZT5wSDR9EcSq2a6Q8MromKB5bUzrtX02Ik
   dfR3OljM+8QTbyqmnl6hyhW7SriNBWBfcS5XnSgd/+soth/BpI/aMAPFb
   Ft8y8VrwDxJk0YZlC/gBrDghZdfCQHXfzCM1yh+kUJm1dp9MTnR00/poR
   xbqOCv2FMSq6VFYkqM87r8OGkJttcwe05YnPP0ujfY3zC8EzuwxQeNRfj
   7ZJqNsExfUCpmIcFQkaQuSFWMaG2X+6Phl/iU4kwM0lKErEeuFnWdI54A
   w==;
X-CSE-ConnectionGUID: /CL4/T9sRQCzp0LsPxW/rg==
X-CSE-MsgGUID: g/qR+BHGTYW+jBxMOSGDDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63798725"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63798725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:23:17 -0700
X-CSE-ConnectionGUID: IT/QVh3cSb62lXEmfmgqWA==
X-CSE-MsgGUID: IQIge+RZQNedR4S+OA2lug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185249959"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2025 07:23:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkbR-000JE3-2m;
	Tue, 28 Oct 2025 14:23:13 +0000
Date: Tue, 28 Oct 2025 22:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Daniel Thompson (RISCstar)" <danielt@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [linux-next:master 3294/4391]
 arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit declaration of
 function '__raw_readb'
Message-ID: <202510282206.wI0HrqcK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7d2388eeec24966fc4d5cf32d706f0514f29ac5
commit: 243ce64b2b371cdf2cbc39c9422cb3047cab6de7 [3294/4391] backlight: Do not include <linux/fb.h> in header file
config: sh-randconfig-r072-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282206.wI0HrqcK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282206.wI0HrqcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/backlight/hp680_bl.c:20:
   arch/sh/include/cpu-sh3/cpu/dac.h: In function 'sh_dac_enable':
>> arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit declaration of function '__raw_readb' [-Wimplicit-function-declaration]
      21 |         v = __raw_readb(DACR);
         |             ^~~~~~~~~~~
>> arch/sh/include/cpu-sh3/cpu/dac.h:24:9: error: implicit declaration of function '__raw_writeb'; did you mean '__raw_write_lock'? [-Wimplicit-function-declaration]
      24 |         __raw_writeb(v,DACR);
         |         ^~~~~~~~~~~~
         |         __raw_write_lock

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [m]:
   - GPIO_SAMA5D2_PIOBU [=m] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


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
