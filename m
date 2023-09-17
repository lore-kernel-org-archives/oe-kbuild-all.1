Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5647C1847
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 00:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694908890; x=1726444890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvZbXevKavQ7OJima9BvXmljRACpz7iDwmx9kKPWdM8=;
  b=HyeOloNJotCb84W5xeBOFfHX8GELEZ1mLSGGbb6yhde1b7fXgdLCyyiP
   KT4W/JWItUeGlLkALxBby575cBtGyeH8PvZwT7jDAtNjHM53boGlMudFY
   7b9uUbpTYnp764zeSi/zz2/Ku2dYVNYJG5Zz0Gjw2clftEb0CnMpTzjFO
   vrXIdCdeJ/P8PbztEM0xzs02TzV/vvsj89X36CeDY3eGac7+0+Bu8k03u
   b5wh2fz+t1wu5rLadMnJVHGEzLsYw+ULA2TdRSDxsqYG3Ov2gbWclsoCR
   VezD4hetdzBat2+kbH7nEZZAqYqnJJY19T4yHWOHUw9lOtozK2ZVmeTz5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="369782315"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="369782315"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 17:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="992289789"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="992289789"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2023 17:01:28 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhfE6-0004mC-0t;
	Sun, 17 Sep 2023 00:01:26 +0000
Date: Sun, 17 Sep 2023 08:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-lvts 8/11]
 drivers/thermal/mediatek/lvts_thermal.c:1408:10: error: 'const struct
 lvts_data' has no member named 'coeff'
Message-ID: <202309170757.8oY3JN7Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-lvts
head:   771dcd29de5f3975d62ec0b42584937975238fe9
commit: 223a91373d2c99569e4fdb6ff8bfe3bc0c0ac0bb [8/11] lvts: change coeff.a to temp_factor and coeff.b to temp_offset
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230917/202309170757.8oY3JN7Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170757.8oY3JN7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170757.8oY3JN7Z-lkp@intel.com/

Note: the frank-w-bpi-r2-4.14/6.6-lvts HEAD 771dcd29de5f3975d62ec0b42584937975238fe9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/thermal/mediatek/lvts_thermal.c:1408:10: error: 'const struct lvts_data' has no member named 'coeff'
    1408 |         .coeff = {
         |          ^~~~~
   drivers/thermal/mediatek/lvts_thermal.c:1408:9: warning: braces around scalar initializer
    1408 |         .coeff = {
         |         ^
   drivers/thermal/mediatek/lvts_thermal.c:1408:9: note: (near initialization for 'mt7988_lvts_ap_data.temp_factor')
>> drivers/thermal/mediatek/lvts_thermal.c:1409:17: error: field name not in record or union initializer
    1409 |                 .a = LVTS_COEFF_A_MT7988,
         |                 ^
   drivers/thermal/mediatek/lvts_thermal.c:1409:17: note: (near initialization for 'mt7988_lvts_ap_data.temp_factor')
   drivers/thermal/mediatek/lvts_thermal.c:1410:17: error: field name not in record or union initializer
    1410 |                 .b = LVTS_COEFF_B_MT7988,
         |                 ^
   drivers/thermal/mediatek/lvts_thermal.c:1410:17: note: (near initialization for 'mt7988_lvts_ap_data.temp_factor')
   drivers/thermal/mediatek/lvts_thermal.c:86:49: warning: excess elements in scalar initializer
      86 | #define LVTS_COEFF_B_MT7988                     204650
         |                                                 ^~~~~~
   drivers/thermal/mediatek/lvts_thermal.c:1410:22: note: in expansion of macro 'LVTS_COEFF_B_MT7988'
    1410 |                 .b = LVTS_COEFF_B_MT7988,
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/thermal/mediatek/lvts_thermal.c:86:49: note: (near initialization for 'mt7988_lvts_ap_data.temp_factor')
      86 | #define LVTS_COEFF_B_MT7988                     204650
         |                                                 ^~~~~~
   drivers/thermal/mediatek/lvts_thermal.c:1410:22: note: in expansion of macro 'LVTS_COEFF_B_MT7988'
    1410 |                 .b = LVTS_COEFF_B_MT7988,
         |                      ^~~~~~~~~~~~~~~~~~~


vim +1408 drivers/thermal/mediatek/lvts_thermal.c

561538f770a362 Balsam CHIHI     2023-03-07  1404  
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1405  static const struct lvts_data mt7988_lvts_ap_data = {
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1406  	.lvts_ctrl	= mt7988_lvts_ap_data_ctrl,
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1407  	.num_lvts_ctrl	= ARRAY_SIZE(mt7988_lvts_ap_data_ctrl),
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09 @1408  	.coeff = {
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09 @1409  		.a = LVTS_COEFF_A_MT7988,
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1410  		.b = LVTS_COEFF_B_MT7988,
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1411  	},
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1412  };
1bf3c9d4ca4bb8 Frank Wunderlich 2023-09-09  1413  

:::::: The code at line 1408 was first introduced by commit
:::::: 1bf3c9d4ca4bb8b1668be8cf0967faf6f86c02bc thermal/drivers/mediatek/lvts_thermal: add mt7988 support

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
