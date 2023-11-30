Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7F59157
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aG49f4jL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701368135; x=1732904135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33mJ52s9KDBhQSlBr2uZfzxLBuRJ/VuJESuCBmE0kSU=;
  b=aG49f4jLyjTDC26qxXx7QLLOZOBLH3/Tg1kIG842lZ/wv/Csrn88imL2
   2o1a5puP4hWS+CPJsqRk3VS3hTlB1o/J0Gj6IRkc3cm4FG1JXPgEHAdMV
   3wnB8AgBKJt8r7vXPm8AG9oSb3y1tZT6IOQqXJ5o6BdKgx0N19+9Wx+OQ
   lxN0oyAlG9bb7y2GmCv0WpEq315/bLoC1NIA8atsRoudzo2Bpszsg9sau
   oZMVQc60h7YmQUjZxNVwAf2zGFyJAYDQEnMF0mr5bEsahzVv3ILWzGECl
   yv1+S/yN2OCW/CNGEjNCylk3y5HTZewsfVmDf7MuZG7pxG4zIWHnyzBrz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="14919407"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="14919407"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719212652"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="719212652"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 10:15:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8lZR-0002XY-09;
	Thu, 30 Nov 2023 18:15:29 +0000
Date: Fri, 1 Dec 2023 02:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: drivers/gpu/drm/tilcdc/tilcdc_regs.h:141:39: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202312010230.nBVReHCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 62a0d98a188cc4ebd8ea54b37d274ec20465e464 drm: allow to use mmuless SoC
date:   7 years ago
config: arm-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231201/202312010230.nBVReHCy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010230.nBVReHCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010230.nBVReHCy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/tilcdc/tilcdc_crtc.c: note: in included file:
>> drivers/gpu/drm/tilcdc/tilcdc_regs.h:141:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long volatile [usertype] @@     got restricted __le64 [usertype] @@
   drivers/gpu/drm/tilcdc/tilcdc_regs.h:141:39: sparse:     expected unsigned long long volatile [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_regs.h:141:39: sparse:     got restricted __le64 [usertype]

vim +141 drivers/gpu/drm/tilcdc/tilcdc_regs.h

16ea975eac671fa Rob Clark  2013-01-08  130  
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  131  static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  132  {
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  133  	struct tilcdc_drm_private *priv = dev->dev_private;
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  134  	volatile void __iomem *addr = priv->mmio + reg;
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  135  
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  136  #ifdef iowrite64
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  137  	iowrite64(data, addr);
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  138  #else
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  139  	__iowmb();
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  140  	/* This compiles to strd (=64-bit write) on ARM7 */
7eb9f069ff5dd39 Jyri Sarha 2016-08-26 @141  	*(volatile u64 __force *)addr = __cpu_to_le64(data);
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  142  #endif
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  143  }
7eb9f069ff5dd39 Jyri Sarha 2016-08-26  144  

:::::: The code at line 141 was first introduced by commit
:::::: 7eb9f069ff5dd39d44d7ecdf63eb99b429c7dad0 drm/tilcdc: Write DMA base and ceiling address with single instruction

:::::: TO: Jyri Sarha <jsarha@ti.com>
:::::: CC: Jyri Sarha <jsarha@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
