Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BEA53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693076947; x=1724612947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUUT9Hc9cVASB5Xqp1hacMY3cHmiLuyXHLFsjkAWXEA=;
  b=cK6iG/BoNwI5zHhd+eLdwtUeN2BEB0G3vVqRsgoAZRBVyVlRK9mE9cb6
   pX5ynqpNtaxOI7nYQ0JZ32qUxdGD6E1UvtzdzxPY2+7FqaRpWLxRQPXoE
   qtRlL642gkmDnXSENmu+UD8/u1w8hOUe8f+FRApFs28Y/E0Pik58BPrVY
   3rSEuT/CGyMKHx0z5aas+zzmVjTKk5cx4iqwBSLNDZlASng/Pm9qWlfQD
   tdjBvQKW857Yx9aBzMlmAcDNS2Q6xnTcvyBRnS+9pP0m4MzeZ0BjnX1nD
   YDmLkaTnbTLchW2svWYFsVvDHObRhpwpkTeQTmH1X5DY5bldL58L3wduR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="378676370"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="378676370"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 12:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="984447761"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="984447761"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2023 12:09:05 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZyee-00050l-1q;
	Sat, 26 Aug 2023 19:09:04 +0000
Date: Sun, 27 Aug 2023 03:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11422/11474]
 drivers/clk/mediatek/clk-mt7988-eth.c:128:25: error:
 'of_match_clk_mt7988_eth' undeclared here (not in a function); did you mean
 'of_match_clk_mt7986_eth'?
Message-ID: <202308270215.YQufemnw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   9da4af54446a9e2a6f6e734ea33cff68ce412a6c
commit: 13319393d9eb43e5959519498bb84851ea1f5f6f [11422/11474] clk: mediatek: add drivers for MT7988 SoC
config: microblaze-randconfig-r002-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270215.YQufemnw-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270215.YQufemnw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270215.YQufemnw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from include/linux/of_device.h:5,
                    from drivers/clk/mediatek/clk-mt7988-eth.c:11:
>> drivers/clk/mediatek/clk-mt7988-eth.c:128:25: error: 'of_match_clk_mt7988_eth' undeclared here (not in a function); did you mean 'of_match_clk_mt7986_eth'?
     128 | MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__of_match_clk_mt7988_eth_device_table' aliased to undefined symbol 'of_match_clk_mt7988_eth'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/clk/mediatek/clk-mt7988-eth.c:128:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     128 | MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
         | ^~~~~~~~~~~~~~~~~~~


vim +128 drivers/clk/mediatek/clk-mt7988-eth.c

   120	
   121	static const struct of_device_id of_match_clk_mt7986_eth[] = {
   122		{ .compatible = "mediatek,mt7988-ethsys", .data = &ethdma_desc },
   123		{ .compatible = "mediatek,mt7988-sgmiisys_0", .data = &sgmii0_desc },
   124		{ .compatible = "mediatek,mt7988-sgmiisys_1", .data = &sgmii1_desc },
   125		{ .compatible = "mediatek,mt7988-ethwarp", .data = &ethwarp_desc },
   126		{ /* sentinel */ }
   127	};
 > 128	MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
