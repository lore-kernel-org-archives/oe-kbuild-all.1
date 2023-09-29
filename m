Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821DC399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695961941; x=1727497941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2qxxOAVBr2BUiEESYvWzFspXQtrGIFRTilvIryY9HE=;
  b=hYjt2e87pwOFk2c5pD6/lSb0uTlxVdLh8ahJHtPdW1X/N3Cuu/WeDIUu
   Ivn0QRw/w1xN5Y+FHGfiZ1R8RdCfd+dwsq3Wi2tONRskbK3tLyge4pkH9
   o3Njum3JOUeWCcOnBkLBvXyu6acW9O+/a1u2/UU+WIwxxD6RJ+oB1SYZG
   +/111GRZlBArzqWK/U9AuCxDYNvy79ETG/DOX6PYqgv5OSj3ajY5McFpO
   coJWH2VraR5hNAWQ9kZXXxMX+BkGfsyRD1IwdZCW/b7HRNZ6HtrB3UO7c
   y7jLlDZ0TEqZRHUZavY8VX4+ck9GeDCEM4ZK9jP3HyArSF3n79zuP3iFP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386094720"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="386094720"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923501929"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="923501929"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 21:32:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5Ak-0002Tb-15;
	Fri, 29 Sep 2023 04:32:14 +0000
Date: Fri, 29 Sep 2023 12:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 85/89] powerpc-linux-ld: warning: orphan
 section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in
 section `.init.plt'
Message-ID: <202309291227.Gf2eeIXu-lkp@intel.com>
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
commit: c8fde7598064fc9b94a53264b1e0c605a140fedb [85/89] dmaengine: fsl-edma: add trace event support
config: powerpc-randconfig-001-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291227.Gf2eeIXu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291227.Gf2eeIXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291227.Gf2eeIXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-debugfs.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in section `.init.plt'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
