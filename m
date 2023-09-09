Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D161FAB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 21:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694294091; x=1725830091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuFwduu4gdbweJz3mcPeVQgsI3hzm1OtYffmGKEv9Us=;
  b=f8t7lCvZ0NEUcqKwL3//S9cRTMz0ttSU0N/We+dtc4tcBrr6QNmhVH3C
   Gmb22Zs9tgsyhsNTIpXH50BBJ8R4XJk1JcZ4CUAW55wlzS+zh9RjS4ia+
   eMnD7R/EklQILERv+nvwV8W56x2yHrXKcVHS/ipXnelffVP1Ub3djSLKb
   mTuwZ130bImde5nZT0u4rDynpju4zXpTReYcznIzgigQ5wIRCPOz8eNJO
   RmcIFc2SczDON2HJdBsbSdIe7yhEiGsG13sHvvsBiK/pWxxgM6sebagbW
   JBoT2HGTTFoR980NsSNUgfNcBW2yk5Io9hMox3NKwwFleRVCXqj6CFk+P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441863053"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441863053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 14:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886028474"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="886028474"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 14:14:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf5Hz-0003wg-2L;
	Sat, 09 Sep 2023 21:14:47 +0000
Date: Sun, 10 Sep 2023 05:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 4049/25020]
 include/linux/irqchip/arm-gic-v3.h:602:10: fatal error: 'asm/arch_gicv3.h'
 file not found
Message-ID: <202309100524.cjE2mwkC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anson,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: b86c23dd49687dcd77b99e45dd311157c644dc14 [4049/25020] firmware: imx: scu-pd: Add IRQSTEER wakeup support
config: x86_64-buildonly-randconfig-002-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100524.cjE2mwkC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100524.cjE2mwkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100524.cjE2mwkC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/scu-pd.c:60:
>> include/linux/irqchip/arm-gic-v3.h:602:10: fatal error: 'asm/arch_gicv3.h' file not found
   #include <asm/arch_gicv3.h>
            ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +602 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e10 Andre Przywara        2014-11-12  601  
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @602  #include <asm/arch_gicv3.h>
021f653791ad17 Marc Zyngier          2014-06-30  603  

:::::: The code at line 602 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor the arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
