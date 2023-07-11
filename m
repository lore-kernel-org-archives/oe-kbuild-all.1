Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3CF168C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689079144; x=1720615144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69586cAf5F/pk8sdvMBbSWJgWGxQn5YnSygl/8gb8jU=;
  b=m3VSo6Dsphef8J8Qnw5WFyVYQFzZODaMiT0Z2zVjgMwx0oWHYzOAgEmw
   jn4Qa42Wk6CsPytoT6ESWviamL5LiO4FZnkIv0/inOKRxcTUteVfHJozq
   HrXSZvAawC0MOoR6MSntYHX2gAmL6kjCY0Qp4wXSR+oP8YOsJYb5xa8Ve
   GO5BiRl5sbCPYQ030Kpr8GYq+6ns+SuitQ06P2abFjOGAlQ67zRKeeyNq
   vERoQg8TRfvyKyvLcM+LW1vhS6ZVwyoFz1fIHNIP3m2PyC3b7GtThBbkO
   dQtjWoeo62W2iT7OEmW0tJWGm8VVV4cgIG2yFEemSg2ABvAT8Q3vWevGp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354468323"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="354468323"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 05:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721076757"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="721076757"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 05:39:02 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJCdy-0004nx-0P;
	Tue, 11 Jul 2023 12:39:02 +0000
Date: Tue, 11 Jul 2023 20:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 4/15]
 arch/arm/mach-imx/mach-imx7d-cm4.c:16:20: error: 'armv7m_restart' undeclared
 here (not in a function)
Message-ID: <202307112056.2Gp7gIYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   92a0590e6af4168d400aa0d285a1160122f54c1c
commit: 6a346040edd54e36e425ae185738fcefae8e604f [4/15] ARM: imx: Drop unnecessary includes
config: arm-randconfig-r046-20230710 (https://download.01.org/0day-ci/archive/20230711/202307112056.2Gp7gIYN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112056.2Gp7gIYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112056.2Gp7gIYN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-imx/mach-imx7d-cm4.c:16:20: error: 'armv7m_restart' undeclared here (not in a function)
      16 |         .restart = armv7m_restart,
         |                    ^~~~~~~~~~~~~~


vim +/armv7m_restart +16 arch/arm/mach-imx/mach-imx7d-cm4.c

1a1f919eb52ea1 Oleksij Rempel 2018-07-03  13  
1a1f919eb52ea1 Oleksij Rempel 2018-07-03  14  DT_MACHINE_START(IMX7D, "Freescale i.MX7 Dual Cortex-M4 (Device Tree)")
1a1f919eb52ea1 Oleksij Rempel 2018-07-03  15  	.dt_compat = imx7d_cm4_dt_compat,
1a1f919eb52ea1 Oleksij Rempel 2018-07-03 @16  	.restart = armv7m_restart,

:::::: The code at line 16 was first introduced by commit
:::::: 1a1f919eb52ea1e63e135a478c5762b3d8b0935b ARM: imx: Provide support for NXP i.MX7D Cortex-M4

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
