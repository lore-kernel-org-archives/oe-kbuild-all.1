Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03744171D9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SX8ehGM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699016645; x=1730552645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OP6lL2wbhtz+uuw8bUERiU2OIoCo/N3cdpiO/1NRD1k=;
  b=SX8ehGM+ZVZ1iO0RhVQT13ov2AqRxB+dt+SHwxSSPgEI+bXgytrXqvdH
   faUX/Q29tEQ2P57R/fxQLKdmAS18uwnUFxsHKJ6C4zYVrzX5PMUYi7MDY
   IAra1TUPL7SxM410R6ITmeTdX9I2x+8SyhXHRU0pmUWJWHV5YGv9gUAgZ
   gYUac6gw8tiSuIzDvsRRlSH3DAx0Fznq+rtfAe91kC1m3QNBsOi890Ts8
   rBiC5koRseNlXNPfWPhxFJsGH5lEym2qG/Yk0OdqFxc0JjHiThKgnldyX
   ArgjjJ29KdOKf3RaQJkxOA4zY866NklX9aBhOoTuOuaNTUq2u+HzErIDu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="373979188"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373979188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 06:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9716940"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 06:03:38 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qytpo-0002Wc-2H;
	Fri, 03 Nov 2023 13:03:36 +0000
Date: Fri, 3 Nov 2023 21:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 2/5] kernel/sys.c:2408:12: warning: no
 previous prototype for 'arch_prctl_mem_model_get'
Message-ID: <202311032024.7UwEW81G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   1c741458c55fa5926ca4d157946248cac0772fad
commit: 7793471c5eb006cfe5b901cf9ce0e5ce4555b3ce [2/5] prctl: Introduce PR_{SET,GET}_MEM_MODEL
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20231103/202311032024.7UwEW81G-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032024.7UwEW81G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032024.7UwEW81G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2408:12: warning: no previous prototype for 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
    2408 | int __weak arch_prctl_mem_model_get(struct task_struct *t)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2413:12: warning: no previous prototype for 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
    2413 | int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_prctl_mem_model_get +2408 kernel/sys.c

  2407	
> 2408	int __weak arch_prctl_mem_model_get(struct task_struct *t)
  2409	{
  2410		return -EINVAL;
  2411	}
  2412	
> 2413	int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
  2414	{
  2415		return -EINVAL;
  2416	}
  2417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
