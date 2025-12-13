Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81AA3B8D75
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765648032; cv=none; b=WpKDyMT+9tEQzzqw/HHRU618eMKysoDjyaX2OcOUkxhwAZZW3s/ZyJuDng/TfO9kC0q9ks5qdaVyeXeZrGeyVRrpXkFNfDJ7AcuI6xsznu+HPPpPAZnYX4ntfZXNmpJ/TIFlUPvt1nCvjFXKqZ5q2yugv/f6OwIZss+Ly3m2GyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765648032; c=relaxed/simple;
	bh=Uj9AyFBzyOvvSHkYBZOjXzlUKKVxCSFPb/GDdSWvGOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdUoKOo6OPZsUBTOefm6nMk/bzp1vykS8a6q+SCroPns/alS5ILO2Tb1UMIk5BdwxCqa+0TWjtaATLPAlXOSpPCT9gLjdpaTs5HAvHNQHf1bhoEJ2AXVuQ2cwnFoR2sfhelViuoIdzEkesRaC+CwAud2qOHeeeTqjMaimcr09e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsjhVV83; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsjhVV83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765648031; x=1797184031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uj9AyFBzyOvvSHkYBZOjXzlUKKVxCSFPb/GDdSWvGOY=;
  b=JsjhVV83QO090VDu29q6vV3H/xLfaTI720q3wOJhdmAbX8ZUoQ9FAPFQ
   muXIBeODgif6Jv/aeVpByVIC4HMgOovFAyiHfPoqz56ytH5EoM47IJlLZ
   ETfElKktPYg5AO39dYpLfZKMOmxM0MXSYlzCqGLynEVPxUZ45xeTI27z1
   Rj9y0vZTImI2LGLl2FDcxekwow2ccKR9bCzZ+IS0E9e099/x+ttt0HVeM
   zq/u6nE2ZEwUCl4v7ICnMmkLb0aW/zVOmjGa1B7+ZdfweO+tY0JIEaqHg
   FbOu29PDjQDDCGKkob73Eo6VBlyYfsmGzPxgLhNISDAmG2kh5vqr4omOP
   g==;
X-CSE-ConnectionGUID: +18X9dubS12ZJqGQg+UOCg==
X-CSE-MsgGUID: 7sxcb/OrSY2w2u7KMGUmmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66605769"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66605769"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:47:09 -0800
X-CSE-ConnectionGUID: nffadiH3RLCYXuffEiMVQw==
X-CSE-MsgGUID: nZDSm/KFRkG8Btn8fyDuCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="234739990"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 09:47:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUThx-0000000080n-3uw9;
	Sat, 13 Dec 2025 17:47:05 +0000
Date: Sun, 14 Dec 2025 01:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 drivers/irqchip/irq-gic-v3.c:1426:12: warning: 'gic_v3_suspend' defined but
 not used
Message-ID: <202512140139.PzB5pj8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nagireddy,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6f1c2f8fd8c80fa50c9be0270d8474d6fa7412f2
commit: 275c8705e576de90245e23a3f8cf45c872d4e724 [2/2] ANDROID: irqchip/irq-gic-v3: Add vendor hook for gic suspend
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512140139.PzB5pj8V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140139.PzB5pj8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140139.PzB5pj8V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1426:12: warning: 'gic_v3_suspend' defined but not used [-Wunused-function]
    1426 | static int gic_v3_suspend(void) { return 0; }
         |            ^~~~~~~~~~~~~~


vim +/gic_v3_suspend +1426 drivers/irqchip/irq-gic-v3.c

  1422	
  1423	#else
  1424	static inline void gic_syscore_init(void) { }
  1425	void gic_v3_resume(void) { }
> 1426	static int gic_v3_suspend(void) { return 0; }
  1427	#endif
  1428	
  1429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
