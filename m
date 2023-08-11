Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C46D22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691748701; x=1723284701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1JnMAxGK4h/ZclF6jOTF1Bvpg/TIeYF6ITuwWVjCnVg=;
  b=k20boYpX/A6YIkDEaiUdBKVAkyb4yrqZ6Hv+Xba5PZm32vc4r7zitIdr
   QCgSDb0tgNK+12E2kd2jJoGCJwOCcqMo1nZYXJeG34nYzWy3mWza3WMrn
   baGEGvDa39FHX6HWxaD6qIKAmbCrp7ulHUWzHhN6a0VCS6p9VwDZUS3Ja
   YPGPnhDnev8UJhQj1tHCX/ppCAjav+pM+cmcao7MiH89uqfiwnWgBATXX
   7w+Udb8plyNSiPDvrsloa3sNLVErpYZHMsvt/v7YUh43AKnUHwFYeAtFB
   YuZIOtFZoFCdv7BYQBohK9Q4mJLR9rc9b36mYjdKnY8lWLQK+49QJKcWQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437982092"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="437982092"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 03:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="726209917"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="726209917"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 03:11:39 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUP7K-0007h6-0q;
	Fri, 11 Aug 2023 10:11:38 +0000
Date: Fri, 11 Aug 2023 18:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: kbandi <kushal.bandi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.14/yocto/base 5042/28962]
 drivers/media/i2c/max9286.c:758:4: warning: no previous declaration for
 'get_output_link_order'
Message-ID: <202308111828.Rosp39bL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi kbandi,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.14/yocto/base
head:   65b8aaa4ae7a568d08d64eeee7b09f26f711c78f
commit: 9cef7f9b88549f0e9b46631edd29e5f619afa928 [5042/28962] media: intel-ipu: Merge IPU kernel driver into 4.14 kernel
config: i386-randconfig-i011-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111828.Rosp39bL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111828.Rosp39bL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111828.Rosp39bL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/max9286.c: In function 'max96705_write_register':
   drivers/media/i2c/max9286.c:115:11: warning: comparison is always false due to limited range of data type [-Wtype-limits]
      if (val < 0)
              ^
   drivers/media/i2c/max9286.c:108:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/media/i2c/max9286.c: At top level:
>> drivers/media/i2c/max9286.c:758:4: warning: no previous declaration for 'get_output_link_order' [-Wmissing-declarations]
    u8 get_output_link_order(struct max9286 *max)
       ^~~~~~~~~~~~~~~~~~~~~


vim +/get_output_link_order +758 drivers/media/i2c/max9286.c

   749	
   750	/*
   751	 * Get the output link order
   752	 * By default:
   753	 * bits[7:6] 11: Link 3 is 4th in the CSI-2 output order
   754	 * bits[5:4] 10: Link 2 is 3rd in the CSI-2 output order
   755	 * bits[3:2] 01: Link 1 is 2nd in the CSI-2 output order
   756	 * bits[1:0] 00: Link 0 is 1st in the CSI-2 output order
   757	 */
 > 758	u8 get_output_link_order(struct max9286 *max)
   759	{
   760		u8 val = 0xE4, i;
   761		u8 order_config[14][3] = {
   762			{1, 8, 0x27},
   763			{1, 4, 0xC6},
   764			{1, 2, 0xE1},
   765			{1, 1, 0xE4},
   766			{2, 0xC, 0x4E},
   767			{2, 0xA, 0x72},
   768			{2, 0x9, 0x78},
   769			{2, 0x6, 0xD2},
   770			{2, 0x5, 0xD8},
   771			{2, 0x3, 0xE4},
   772			{3, 0xE, 0x93},
   773			{3, 0xD, 0x9C},
   774			{3, 0xB, 0xB4},
   775			{3, 0x7, 0xE4},
   776		};
   777	
   778		if (max->total_sensor_num < 4) {
   779			for (i = 0; i < 14; i++) {
   780				if ((max->total_sensor_num == order_config[i][0])
   781					&& (max->sensor_present == order_config[i][1]))
   782					return  order_config[i][2];
   783			}
   784		}
   785	
   786		/* sensor_num = 4 will return 0xE4 */
   787		return val;
   788	}
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
