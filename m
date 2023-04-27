Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181028827
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 20:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682629168; x=1714165168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7hAgMzT8MYGe9TCOm3NVBXNRiG/MeAU5B5HCqomt9w=;
  b=NmZ6hyZGRsARMlC1OFTj/ONJJi/6SDMgQYGqfLWvDBm5pn7jRrQ2nfVX
   fEsDIYrin8vGPQ//vkNLa0eVF5biLDNqlN0Id5Z5bue9iIHg0cbMPPlWU
   gWtp2/o41/B7x4jkK27dpstZZ1KGh5Ic946EpyZeY/OiaMBxuNcOk3YMk
   AI/XaF+Ah2dOMlL/PnO/iran9fdeWjIygaF98KxTbNPMiGt5E94TmS1RB
   BmIQ07yO8tsJnnTgECFUWh968VZVXI1DWSpgNrcE9/GlhtcXJvhTptFVd
   G6zqIjmzLmSGoOJhcIfCjYSxJZCwLrq59WbhZiFoKTteL3LDYC/aNFYfG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327896789"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="327896789"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 13:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="671915834"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="671915834"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 13:59:26 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps8i5-000073-2S;
	Thu, 27 Apr 2023 20:59:25 +0000
Date: Fri, 28 Apr 2023 04:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/631 8858/21337] arch/arm/mach-imx/src.c:91:6:
 warning: no previous prototype for 'imx_gpcv2_set_m_core_pgc'
Message-ID: <202304280442.MPkIQO4X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/631
head:   afb712b0103808b4d0e37f526b6c7b228df74148
commit: ae0ee2e5c5fbb23eadc2fa87b629bdfca3da7f57 [8858/21337] ARM: imx: add smp support for imx7d
config: arm-randconfig-r046-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280442.MPkIQO4X-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ae0ee2e5c5fbb23eadc2fa87b629bdfca3da7f57
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/631
        git checkout ae0ee2e5c5fbb23eadc2fa87b629bdfca3da7f57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280442.MPkIQO4X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/src.c:91:6: warning: no previous prototype for 'imx_gpcv2_set_m_core_pgc' [-Wmissing-prototypes]
      91 | void imx_gpcv2_set_m_core_pgc(bool enable, u32 offset)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/src.c:96:6: warning: no previous prototype for 'imx_gpcv2_set_core1_pdn_pup_by_software' [-Wmissing-prototypes]
      96 | void imx_gpcv2_set_core1_pdn_pup_by_software(bool pdn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/src.c:14:
   arch/arm/mach-imx/common.h:119:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     119 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~


vim +/imx_gpcv2_set_m_core_pgc +91 arch/arm/mach-imx/src.c

    90	
  > 91	void imx_gpcv2_set_m_core_pgc(bool enable, u32 offset)
    92	{
    93		writel_relaxed(enable, gpc_base + offset);
    94	}
    95	
  > 96	void imx_gpcv2_set_core1_pdn_pup_by_software(bool pdn)
    97	{
    98		u32 reg = pdn ? GPC_CPU_PGC_SW_PDN_REQ : GPC_CPU_PGC_SW_PUP_REQ;
    99		u32 val;
   100	
   101		val = readl_relaxed(gpc_base + reg);
   102		imx_gpcv2_set_m_core_pgc(true, GPC_PGC_C1);
   103		val |= BM_CPU_PGC_SW_PDN_PUP_REQ_CORE1_A7;
   104		writel_relaxed(val, gpc_base + reg);
   105	
   106		while (readl_relaxed(gpc_base + reg) & BM_CPU_PGC_SW_PDN_PUP_REQ_CORE1_A7)
   107			;
   108	
   109		imx_gpcv2_set_m_core_pgc(false, GPC_PGC_C1);
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
