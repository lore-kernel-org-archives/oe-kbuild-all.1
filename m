Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B907E549
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrKieFB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697277307; x=1728813307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0kP0E1rg3PzyClnk95hbkjPLP1hsdjaa/h6JIDHQFQ=;
  b=JrKieFB4QfMh08ykD9eEJnPZLb2KL7KlqYoGT4XUb+tPGyE7Gk3gGv+U
   9Epd80iY8LFR0vBO+6jy5D54dUFBthrLtRlR7v3sTVRmbB0uhWt9FbJnF
   J2VrWuigUhcEjiGW1J6LraNDz9HbFilRjN3rACpXel1gbZABY9zzmfmQp
   ltzqrbCmtu3HJCzuRFo/Ovu9aMs783YpPzRDTbZR73GRy7cJsVL93M2uO
   kWO+C77o3CTqLAkvOjEmZTYqPEujPO9xG6fUldF0FhPraz/tr+vZ/dauV
   vYqeV+ncjwrceaqLrfvG0HGY02e2jh0V87bPWB0470zVjQWTsSCEBgaDz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471545791"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471545791"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 02:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754999163"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="754999163"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2023 02:55:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrbMM-000625-1d;
	Sat, 14 Oct 2023 09:55:02 +0000
Date: Sat, 14 Oct 2023 17:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 1539/30000]
 drivers/clk/imx/clk-imx7ulp.c:45:18: warning: 'pcc2_uart_clk_ids' defined
 but not used
Message-ID: <202310141740.u2Dm6LXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: 754ae82cc55b7445545fc2f092a70e0f490e9c1b [1539/30000] clk: imx: enable the earlycon uart clocks by parsing from dt
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141740.u2Dm6LXB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141740.u2Dm6LXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141740.u2Dm6LXB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx7ulp.c:45:18: warning: 'pcc2_uart_clk_ids' defined but not used [-Wunused-const-variable=]
      45 | static const int pcc2_uart_clk_ids[] __initconst = {
         |                  ^~~~~~~~~~~~~~~~~


vim +/pcc2_uart_clk_ids +45 drivers/clk/imx/clk-imx7ulp.c

b1260067ac3dd5 A.s. Dong   2018-11-14  44  
b87340998a87f3 Anson Huang 2019-07-24 @45  static const int pcc2_uart_clk_ids[] __initconst = {
b87340998a87f3 Anson Huang 2019-07-24  46  	IMX7ULP_CLK_LPUART4,
b87340998a87f3 Anson Huang 2019-07-24  47  	IMX7ULP_CLK_LPUART5,
b87340998a87f3 Anson Huang 2019-07-24  48  };
b87340998a87f3 Anson Huang 2019-07-24  49  

:::::: The code at line 45 was first introduced by commit
:::::: b87340998a87f338a0e1501c25ab650ce2c6ce95 clk: imx7ulp: Make sure earlycon's clock is enabled

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
