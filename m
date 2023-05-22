Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22435380
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684743517; x=1716279517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3NoJrl7WhI21FRzLnajGhvOlLl3copy+xOmTDcRWXY=;
  b=ESuWJcaWBvi/n7sTbyUpMLPLi722jGepOVSq9Qf7gZrg0c9pBg6BoQvw
   xLPjCtH0/G6B0lHmGIiA6lmLxk6K1sS3Zbo1AACodM6c8RuGQn7vcvBL/
   7vejFoxeMKPKp6B2ynZSwlmQ/AWKg1HpoZXmtQPtxbp+jPxki+EpMK+kV
   EODIBDvDlp2Gl6axJNKQJWMbaSL0Tcx/T3Iz45GIdR6K3bKkBbUG6ZiGT
   e6vAcUKaFP7dAp0JyTn2PzI32/aXprE4Rh+Y0yh2albtHNg6Sgz/oByr8
   oRPnCcaBqoz5fheFUaxMlszxjpFRpEZH5KP0frUo0ZYjRuHUCoMgQYRyw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="439212903"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="439212903"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 01:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="827624874"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="827624874"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 May 2023 01:18:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q10kM-000Chx-1l;
	Mon, 22 May 2023 08:18:26 +0000
Date: Mon, 22 May 2023 16:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy'
 specified bound 32 equals destination size
Message-ID: <202305221603.aB6ZY11I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalle,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44c026a73be8038f03dbdeef028b642880cf1511
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec wifi: move raycs, wl3501 and rndis_wlan to legacy directory
date:   2 months ago
config: arm64-randconfig-r015-20230521 (https://download.01.org/0day-ci/archive/20230522/202305221603.aB6ZY11I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/wireless/legacy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305221603.aB6ZY11I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/legacy/ray_cs.c: In function 'init_startup_params':
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
https://github.com/intel/lkp-tests/wiki
