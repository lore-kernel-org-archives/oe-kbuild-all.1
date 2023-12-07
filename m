Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF9B3D0D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mExLJAwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701955067; x=1733491067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XoeTRW54b6XVGz5mYXmty6XFYq7PyubVun6OQ/Tx4fQ=;
  b=mExLJAwYZVZNz+57izovJhFWD4Rz7moti+Ii3YX9uddMfNMDKniAwbRe
   gGXs0ARmICxAWgQhxI6ZqRCfSqwm4DG/057Z9e0bkne3lPzWki/Rt9tRq
   DistIMSc8T+rozZlgXiOF7p/7Fk9QoLumuz85DPIeqRJDwrOR851XIXei
   tOqhA26bYTQ9fGxSYAtw7w+H82mssc32JcvrfSF8Po9X17b8KEuD3IvCh
   CIqyJYxX0pNiioHJrZ9GceO5Gg9JiWE0I98fo9ECRM5QVzyt91ffK31B+
   D+HqcdVD5SA/rcLf4wp3WS1T1w8XGjAw95a5vzVHEsfXc0Dg2EWCYjO67
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458550091"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="458550091"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837714416"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837714416"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2023 05:17:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBEG7-000CHM-0G;
	Thu, 07 Dec 2023 13:17:43 +0000
Date: Thu, 7 Dec 2023 21:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: ixgbe01 <yangwang@njis.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, Han Gao <gaohan@iscas.ac.cn>
Subject: [esmil:th1520 38/52] drivers/clk/thead/clk-light-mpw.c:80:42:
 warning: 'light_syspll_tbl' defined but not used
Message-ID: <202312072139.SvluntQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux th1520
head:   64731462dd62508162241c28bd319829df635524
commit: 851266b8b6ef516302144607a424a7986e950822 [38/52] add TH1520 cpu frequency driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312072139.SvluntQx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072139.SvluntQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072139.SvluntQx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/thead/clk-light-mpw.c:80:42: warning: 'light_syspll_tbl' defined but not used [-Wunused-const-variable=]
      80 | static const struct light_pll_rate_table light_syspll_tbl[] = {
         |                                          ^~~~~~~~~~~~~~~~
>> drivers/clk/thead/clk-light-mpw.c:75:42: warning: 'light_audiopll_tbl' defined but not used [-Wunused-const-variable=]
      75 | static const struct light_pll_rate_table light_audiopll_tbl[] = {
         |                                          ^~~~~~~~~~~~~~~~~~


vim +/light_syspll_tbl +80 drivers/clk/thead/clk-light-mpw.c

    74	
  > 75	static const struct light_pll_rate_table light_audiopll_tbl[] = {
    76		LIGHT_PLL_RATE(2654208000U, 147456000U, 1, 110, 9932112,  6, 3),
    77		LIGHT_PLL_RATE(884736000U,  294912000U, 1, 36,  14495600, 3, 1),
    78	};
    79	
  > 80	static const struct light_pll_rate_table light_syspll_tbl[] = {
    81		LIGHT_PLL_RATE(2438553600U, 812851200U, 1, 101, 10173704, 3, 1),
    82		LIGHT_PLL_RATE(884736000U,  294912000U, 1, 36,  14495600, 3, 1),
    83	};
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
