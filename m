Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D462EF64F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 23:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766533677; cv=none; b=A9Kmxy6xaVPGd2wnEYYinJ19ba622KUNR7AYGURgJypjVXO7I/2mzO+rTWwKbAhFpn9os1jfMwzF7U9zi9mnioCpnGCVvyCuclpjQfRQUX6FnkdFHVQxky6wvi19Dl/+k9DiTvJGMkl1AsjzxIM3UDtHZhmX5cGl2tgeuWSmQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766533677; c=relaxed/simple;
	bh=B6fe9G0qCVyEd0eBe9V/oKd5OKFLASmZ28MjPyOOze4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hLpX5IrW3DtZLujFxc7xbjABUt1qKbOg9glq+O+d9axqvRB7ZpwZEjnndE08vveTNZl42BkN+wa/ksoEPi9FnwVXO5bXPCQ73QKyVX+oKbplHUGOR2n4hUy5PXbg4Z5vRbjQ4qUIAnTg5YTnv4VBAZbdt5IxPXMZL6Fa8qOr76M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKXmZOYJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKXmZOYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766533675; x=1798069675;
  h=date:from:to:cc:subject:message-id;
  bh=B6fe9G0qCVyEd0eBe9V/oKd5OKFLASmZ28MjPyOOze4=;
  b=YKXmZOYJboBXs/yzGTDX4pYVIU3Ybj9lnxgd2B4cUZmwyWcmlWlalBxm
   oRgcgmON2zN+OR2s3qVdHgcOq7bi+lWR4xrt/l+MOLAFZxbFC/jhgr6RU
   hCnsxdrz79zPlKzJ5WUy+2xKZ7Ql2/jqkIVcJIhh95qPleQEAAjRJ9502
   apvUNWjSzVOYH0bXIcEVu3N6aJ1kuhkc+MuigRbct6J+5hZSZH4pFxQ0+
   wA1jgWSoJ8kaQZqYGCAeRo7SWYKhI8giT8h0VNcHcnAB/NoHpLaT9X+1P
   AHC8vrsjdx40dfNrO/MqHtohwVDrTtOOlu18C9P56fWw3BmahCVLFfwhD
   A==;
X-CSE-ConnectionGUID: YOMVPksBS+S3FPvaX8XBhA==
X-CSE-MsgGUID: /FU3BuQxQaS63RyJ4T9ZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85799921"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="85799921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:47:55 -0800
X-CSE-ConnectionGUID: VXnQfKfcQ8y3TUiGcbuhuA==
X-CSE-MsgGUID: je4AWXWUSMyM3k2UigFXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230548059"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 15:47:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYC6X-000000002UH-3Qme;
	Tue, 23 Dec 2025 23:47:49 +0000
Date: Wed, 24 Dec 2025 07:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit
 declaration of function '__raw_readb'
Message-ID: <202512240750.hdBj5TCs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 243ce64b2b371cdf2cbc39c9422cb3047cab6de7 backlight: Do not include <linux/fb.h> in header file
date:   9 weeks ago
config: sh-randconfig-r073-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240750.hdBj5TCs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240750.hdBj5TCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240750.hdBj5TCs-lkp@intel.com/

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
