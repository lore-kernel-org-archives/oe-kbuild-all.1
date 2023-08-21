Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F391863
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692614263; x=1724150263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfJf9cEUJe3RZBsA4NVar2E+t3lbJoPGbo2b0bYAJDU=;
  b=iQbguc7SefPrMqa5o7hfxszXcD3aEqgYMWy0neeUyMjF97oRF+DyQcef
   8LMcLkOodi+N/l28+v23zv4WEoZAqTa6QofJh3lrpWvQBRAZ7oRVNqgd8
   svdcQ+HEvilDsL3Jxsn/oBC4+QDfyJZHkOJecsja9fTsG+VZbu6QbxbvX
   ImJ4kIqGyBRdCGUKKnp1TsayBJKhEExkfMC0zcNvU6qHzw9W+s92SvUqL
   8C2CCA/Z899mlB3iARcALWKWwnFupM9ZM0vYoYGlDIWFSAKK520phgFEw
   vxXWHBDoXYuKZ416UX17UrE77KYoa4FFzdlYgAEjfseyUIBtxJyjVa2C9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="358533856"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="358533856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 03:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="735802040"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="735802040"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 03:37:40 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY2I0-0000PU-0f;
	Mon, 21 Aug 2023 10:37:40 +0000
Date: Mon, 21 Aug 2023 18:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8460/11453] drivers/watchdog/stm32_iwdg.c:215:34:
 warning: 'stm32_iwdg_of_match' defined but not used
Message-ID: <202308211837.4VBSUAtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: f1a43aadb5a690e141a3b6700e2a40c1d4dbe088 [8460/11453] watchdog: Enable COMPILE_TEST for more drivers
config: parisc-randconfig-r036-20230821 (https://download.01.org/0day-ci/archive/20230821/202308211837.4VBSUAtZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308211837.4VBSUAtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308211837.4VBSUAtZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/stm32_iwdg.c:215:34: warning: 'stm32_iwdg_of_match' defined but not used [-Wunused-const-variable=]
     215 | static const struct of_device_id stm32_iwdg_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/stm32_iwdg_of_match +215 drivers/watchdog/stm32_iwdg.c

4332d113c66a6e Yannick Fertre 2017-04-06  214  
c2cf466cca87e2 Ludovic Barre  2018-06-25 @215  static const struct of_device_id stm32_iwdg_of_match[] = {
e9974166a53acc Ludovic Barre  2019-05-03  216  	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
e9974166a53acc Ludovic Barre  2019-05-03  217  	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
c2cf466cca87e2 Ludovic Barre  2018-06-25  218  	{ /* end node */ }
c2cf466cca87e2 Ludovic Barre  2018-06-25  219  };
c2cf466cca87e2 Ludovic Barre  2018-06-25  220  MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
c2cf466cca87e2 Ludovic Barre  2018-06-25  221  

:::::: The code at line 215 was first introduced by commit
:::::: c2cf466cca87e2072bd6616f751f4c385c2ab71e watchdog: stm32: add pclk feature for stm32mp1

:::::: TO: Ludovic Barre <ludovic.barre@st.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
