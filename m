Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FA3205
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 22:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680476013; x=1712012013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2UONLO15B3Stu4+rDT9oAUu4OAZCnrUbPs74ldIswU=;
  b=F0BHznzwiwPKmP4YIfKHTLlLHlCdnfuO9saT/Zo/2/mPL4pnrgHkuqy6
   lFWRl8NLCNheIIWvXAKD+l0lbtM8BhTEbvnb7aOXmggRLTQFLFA3fkaBi
   TDe7dOWH8snjasbXKwmUz5+6PKoVFyDeG54Kv5OWrIK0/4ht7C4OE50Ud
   6UemoAlCawz95qB0QgVmAqPynoUsIHehqXM/kcdWnCVAu1zq0bY6w4FEN
   xSE9Y/COoHKxeqCtIx4aq8vw2NOYZiuxqQTXi1qn5IwlV5NiXuFI92Gdd
   e6ALWoFwAosFjVs8KEniVWJLtzh1K8CbD8oXTcZRsBu6DD2f6fALwiqa3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="330342591"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="330342591"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 15:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="774969603"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="774969603"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Apr 2023 15:53:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj6Zm-000Nlx-0C;
	Sun, 02 Apr 2023 22:53:30 +0000
Date: Mon, 3 Apr 2023 06:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2225/8375]
 drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified
 bound 32 equals destination size
Message-ID: <202304030646.HKFxS2Cl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalle,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec [2225/8375] wifi: move raycs, wl3501 and rndis_wlan to legacy directory
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230403/202304030646.HKFxS2Cl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/wireless/legacy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030646.HKFxS2Cl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'init_startup_params',
       inlined from 'ray_init' at drivers/net/wireless/legacy/ray_cs.c:506:2:
>> drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
     628 |                 strncpy(local->sparm.b4.a_current_ess_id, essid, ESSID_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +628 drivers/net/wireless/legacy/ray_cs.c

141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  568  
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  569  /*===========================================================================*/
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  570  static void init_startup_params(ray_dev_t *local)
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  571  {
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  572  	int i;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  573  
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  574  	if (country > JAPAN_TEST)
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  575  		country = USA;
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  576  	else if (country < USA)
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  577  		country = USA;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  578  	/* structure for hop time and beacon period is defined here using
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  579  	 * New 802.11D6.1 format.  Card firmware is still using old format
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  580  	 * until version 6.
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  581  	 *    Before                    After
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  582  	 *    a_hop_time ms byte        a_hop_time ms byte
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  583  	 *    a_hop_time 2s byte        a_hop_time ls byte
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  584  	 *    a_hop_time ls byte        a_beacon_period ms byte
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  585  	 *    a_beacon_period           a_beacon_period ls byte
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  586  	 *
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  587  	 *    a_hop_time = uS           a_hop_time = KuS
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  588  	 *    a_beacon_period = hops    a_beacon_period = KuS
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  589  	 *//* 64ms = 010000 */
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  590  	if (local->fw_ver == 0x55) {
e48d661eb13f2f drivers/net/wireless/ray_cs.c Kees Cook      2017-05-05  591  		memcpy(&local->sparm.b4, b4_default_startup_parms,
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  592  		       sizeof(struct b4_startup_params));
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  593  		/* Translate sane kus input values to old build 4/5 format */
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  594  		/* i = hop time in uS truncated to 3 bytes */
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  595  		i = (hop_dwell * 1024) & 0xffffff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  596  		local->sparm.b4.a_hop_time[0] = (i >> 16) & 0xff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  597  		local->sparm.b4.a_hop_time[1] = (i >> 8) & 0xff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  598  		local->sparm.b4.a_beacon_period[0] = 0;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  599  		local->sparm.b4.a_beacon_period[1] =
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  600  		    ((beacon_period / hop_dwell) - 1) & 0xff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  601  		local->sparm.b4.a_curr_country_code = country;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  602  		local->sparm.b4.a_hop_pattern_length =
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  603  		    hop_pattern_length[(int)country] - 1;
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  604  		if (bc) {
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  605  			local->sparm.b4.a_ack_timeout = 0x50;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  606  			local->sparm.b4.a_sifs = 0x3f;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  607  		}
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  608  	} else { /* Version 5 uses real kus values */
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  609  		memcpy((UCHAR *) &local->sparm.b5, b5_default_startup_parms,
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  610  		       sizeof(struct b5_startup_params));
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  611  
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  612  		local->sparm.b5.a_hop_time[0] = (hop_dwell >> 8) & 0xff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  613  		local->sparm.b5.a_hop_time[1] = hop_dwell & 0xff;
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  614  		local->sparm.b5.a_beacon_period[0] =
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  615  		    (beacon_period >> 8) & 0xff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  616  		local->sparm.b5.a_beacon_period[1] = beacon_period & 0xff;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  617  		if (psm)
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  618  			local->sparm.b5.a_power_mgt_state = 1;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  619  		local->sparm.b5.a_curr_country_code = country;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  620  		local->sparm.b5.a_hop_pattern_length =
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  621  		    hop_pattern_length[(int)country];
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  622  	}
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  623  
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  624  	local->sparm.b4.a_network_type = net_type & 0x01;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  625  	local->sparm.b4.a_acting_as_ap_status = TYPE_STA;
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  626  
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  627  	if (essid != NULL)
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16 @628  		strncpy(local->sparm.b4.a_current_ess_id, essid, ESSID_SIZE);
^1da177e4c3f41 drivers/net/wireless/ray_cs.c Linus Torvalds 2005-04-16  629  } /* init_startup_params */
141fa61f10c419 drivers/net/wireless/ray_cs.c John Daiker    2009-03-10  630  

:::::: The code at line 628 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
