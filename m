Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8586FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKeX4Mgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697273924; x=1728809924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fpno9TNkHxF+a1fCvhaRrzzFziB3lhaIKjtWbbod//0=;
  b=iKeX4MgsPoDp++P2RPCxTEg0feeF9wFz/3BUkvpF/HvNq6adtyN3/Yog
   jGW3osQpn1oaHMfM45PCrBzgfCa6egzLgroRP63R6mPLGQsYNWGaid3YM
   IRiPps1ZGcI0/zOzb/YFmIKdzE0yM0gRxDgkBJu1Frw/kQV5iNoh/QtLB
   auc3pCxY3LdL/vgiEmaXhTWCa+uBDs8ur8hJeV1ds8+WlniqzG2txE4Xi
   tx7vWEG2gOfL+yZJaBjnTChEouW2wxFk2jn+U/KbLD91gn9Vvm1FLMgEP
   GWqi+SUplO64ZTsWv1iTruWs+F2wMQ+vYIuTYb6f9o+bFvc00ZeQUK7Yf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389173077"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389173077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704932955"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="704932955"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 01:58:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qraTo-0005x1-2R;
	Sat, 14 Oct 2023 08:58:40 +0000
Date: Sat, 14 Oct 2023 16:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/317 30/48]
 drivers/phy/freescale/phy-fsl-imx8-pcie.c:204:19: warning:
 'imx8_pcie_phy_fine_tune' defined but not used
Message-ID: <202310141604.tlYMnplw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/317
head:   cffe4fb95c43405f2fe3ceab81948a12c8769724
commit: b04976dacc05288848848bc7659d7a5f121ea21b [30/48] LF-3103 phy: freescale: pcie: fix the imx8mp evk ep rc link degrade issue
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141604.tlYMnplw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141604.tlYMnplw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141604.tlYMnplw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:13,
                    from drivers/phy/freescale/phy-fsl-imx8-pcie.c:8:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1248:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1248 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1234:27: note: 'mem_section' declared here
    1234 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-imx8-pcie.c: At top level:
>> drivers/phy/freescale/phy-fsl-imx8-pcie.c:204:19: warning: 'imx8_pcie_phy_fine_tune' defined but not used [-Wunused-function]
     204 | static int __init imx8_pcie_phy_fine_tune(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8_pcie_phy_fine_tune +204 drivers/phy/freescale/phy-fsl-imx8-pcie.c

   203	
 > 204	static int __init imx8_pcie_phy_fine_tune(char *str)
   205	{
   206		if (!strcmp(str, "yes")) {
   207			pr_info("i.MX PCIe PHY is fine tuned in EP/RC SYS.\n");
   208			imx8_pcie_phy_tuned = 1;
   209		}
   210		return 1;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
