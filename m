Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D917D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 05:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695964525; x=1727500525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3sMrwkmX8QJJMLmVCYAN5+ZbVsGUOzDs56HnDkoTKE=;
  b=Cmr3YOgIrTnrydDlFWppt6wWlIrYqapmplKd8P/5TjnAoN3ZyPeibq+h
   N5PLTnmS5P4oy6e/8O7en/XHBxSC0heeNVp4OyXrlybMMsTpAsPHTGJnw
   BNiZvsiIiwj42SXs6+qSVx7bLBQg5Q0znYI9GXhxckvEO80hk4DZCzFfH
   nSua1kYSHHCe8FEC5pBe1kfVRncgghUysP1pACViMhYt9paRWSTwyGCik
   Y/TfsJ09biLE6PUUlRR7Hr8RGwE9+xKtnzafg+49zW2aA7x4NfyEWtzy/
   pL2nO7RntE900EtKfOcXirlbuCl502XYX1TlFFIsFjZEzAdftYz//aOZf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840960"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="840960"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 22:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726491817"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="726491817"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2023 22:15:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5qP-0002VI-1J;
	Fri, 29 Sep 2023 05:15:17 +0000
Date: Fri, 29 Sep 2023 13:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: powerpc-linux-ld: warning: orphan section `.init.plt' from
 `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
Message-ID: <202309291312.df4pP6Zb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9ed22ae6be817d7a3f5c15ca22cbc9d3963b481d
commit: 66aac8ea0a6c79729f99087b1c5a596938e5d838 dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL in fsl-edma-common.c
date:   5 weeks ago
config: powerpc-randconfig-001-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291312.df4pP6Zb-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291312.df4pP6Zb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291312.df4pP6Zb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
