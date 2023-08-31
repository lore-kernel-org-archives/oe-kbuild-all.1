Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654019BBB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 19:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693510865; x=1725046865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxQynQbxqooxNPXRqpIfIQKdRGkqFgVuKJnaIdzdQZY=;
  b=EqpIp5xRB02Rh0DDX9wf78UA1KAeoR5ohRzQVVTh1K4bzzZRgVrvYqkw
   1fiJQ9yEhSpIsVVnu5CHGxdryMcSnmOQuJ1kmGXyNRBK0QwIeXyQMWliQ
   efuXWZ/jH8jRw9j3mXZigWp1xn1/vcTDV15Ws+3l0dMo0ZbqzUkXk980L
   DR967rKEGv5rtYYfeWNgljFten3KAfeQXdEmkVymiYdKMHSx3oW7t7Zaa
   MD+mLCTNsneESVJboc+e+bU7AHEldeSG7/Bj26CjlGmamfzjsm9zmN7zb
   HZSDI5sYuc7SbXvIx3/wnfRYI0qbXir3CWqWKDlzZ8/b1ZOwDif0rL1hW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440032182"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="440032182"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 12:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863262309"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863262309"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 12:41:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbnXK-0000Ue-0p;
	Thu, 31 Aug 2023 19:41:02 +0000
Date: Fri, 1 Sep 2023 03:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6157/24603]
 drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous declaration for
 'check_m4_enabled'
Message-ID: <202309010309.c1Elh2nK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: afbf4e009ee7f83d492eabf1144fed73e9112a42 [6157/24603] Merge branch 'clock/next' into next
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010309.c1Elh2nK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010309.c1Elh2nK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010309.c1Elh2nK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous declaration for 'check_m4_enabled' [-Wmissing-declarations]
    int check_m4_enabled(void)
        ^~~~~~~~~~~~~~~~


vim +/check_m4_enabled +279 drivers/soc/imx/soc-imx8m.c

d1e806347e888e Dong Aisheng 2019-04-19  278  
d1e806347e888e Dong Aisheng 2019-04-19 @279  int check_m4_enabled(void)

:::::: The code at line 279 was first introduced by commit
:::::: d1e806347e888e13d6fdddb28275dbce7fd9f780 soc: imx: fix build error of missing imx_src_is_m4_enabled

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
