Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4454646
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 00:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695947523; x=1727483523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VeIBJ2UNVkbi+mkDhpRVS2+MxRmWXeL/GlAlov5Pn/0=;
  b=ival3CKnD9cBI3QDJKCWA2Jqox2T0NrGFZYYB7xFRp+kgSstizZnEa02
   RchyXvVmxPmEaIVaXG1MTyeBKEbNh4TjC81kP6S1wTYC0kfbORnmLU3UM
   8bhuFUJUGki6mGQ4GJHyHsbbAPXWkYH7inY5+flwFGAdHVyB/Ishn34H0
   /8KBVOXN85UBVxpz+tHzC7iFY5RC/qsI56sVTbFM/Wd+I7mMPLR7w2/m0
   DV4sOpPLRQ59yNMrdFhfQmZzy50Jmb4ogaWlwp1Q4hxDhRazWEiBviYC9
   sSBijxYqTVZrgA8BO1vF7/Owq7z+BtoUP9E+02WraIV6uKdiwroTEgNLC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382110364"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="382110364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 17:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="743283012"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="743283012"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Sep 2023 17:32:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm1QE-0002CT-10;
	Fri, 29 Sep 2023 00:31:58 +0000
Date: Fri, 29 Sep 2023 08:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 84/89] powerpc-linux-ld: warning: orphan
 section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in
 section `.init.plt'
Message-ID: <202309290811.vBFXGPw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   10c060edf581fdd0d8f23cab84e6c8546c2df8fc
commit: 105c148c66fa06ca2a375edacfa3139c814af9d1 [84/89] dmaengine: fsl-emda: add debugfs support
config: powerpc-randconfig-001-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290811.vBFXGPw1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290811.vBFXGPw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290811.vBFXGPw1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in section `.init.plt'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
