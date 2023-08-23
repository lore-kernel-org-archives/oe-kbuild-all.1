Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7761FAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 18:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692816896; x=1724352896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4de28Xg8aj9BRigvTwMKNNkpaM4P3GsxkF7T+KVdOCw=;
  b=BFdkI1sij3c1t285yAt4qDYw+mWZFSciv82f28Mzq9IjcSIrbd6fc5Uw
   FRGZx79E0Z6aXdi2zv32drSfnVmf1s0VLCA0Rf4m5FwlPmO+wJww2kgZw
   sbxMxdK42Wp71TO/GhZOjsuyDAsTHUwh1LW1KYX4bHsxFT7AfFXYgcP3Y
   1Cq3J/F1nPLr5TEGMYxZ1AzblMv58JtVv4Ei9wGmV/D+GuOqFNlh4EwK+
   AROYHyfFAfsKcmNxi7htFR0rIg+VCdEs3MyhqmuJ1/abX0tinLWxuGICl
   T+Ku0EAY7vQ7SFk74o23zLAQgBlCDhwx3zH42K2r9mATeIZMFNb1B6CJe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377999082"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377999082"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 11:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739884221"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739884221"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 11:54:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYt02-0001Qq-2b;
	Wed, 23 Aug 2023 18:54:38 +0000
Date: Thu, 24 Aug 2023 02:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Apurva Nandan <a-nandan@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 68/128]
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c:258: multiple definition
 of `ti_thermal_unregister_cpu_cooling';
 drivers/thermal/k3_j72xx_bandgap.o:drivers/thermal/k3_j72xx_bandgap.c:450:
 first defined here
Message-ID: <202308240225.BE6fPx2n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 38a145da1625c46c90e453d6e28537e6f97e2720 [68/128] thermal: k3_j72xx_bandgap: Add cooling device support
config: csky-randconfig-r021-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240225.BE6fPx2n-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240225.BE6fPx2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240225.BE6fPx2n-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/thermal/ti-soc-thermal/ti-thermal-common.o: in function `ti_thermal_unregister_cpu_cooling':
>> drivers/thermal/ti-soc-thermal/ti-thermal-common.c:258: multiple definition of `ti_thermal_unregister_cpu_cooling'; drivers/thermal/k3_j72xx_bandgap.o:drivers/thermal/k3_j72xx_bandgap.c:450: first defined here


vim +258 drivers/thermal/ti-soc-thermal/ti-thermal-common.c

445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  256  
03e859d344267c drivers/staging/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-03-19  257  int ti_thermal_unregister_cpu_cooling(struct ti_bandgap *bgp, int id)
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12 @258  {

:::::: The code at line 258 was first introduced by commit
:::::: 445eaf871bf94eb496b9b610e35b9e8c8830219f staging: omap-thermal: common code to expose driver to thermal framework

:::::: TO: Eduardo Valentin <eduardo.valentin@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
