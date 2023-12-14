Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E3610B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 04:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyAH1cMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702529993; x=1734065993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=51cQSf7POeAMU3iqW4I00VpFJ1/lHzi2g3blKR5lKCI=;
  b=CyAH1cMATCd/HAPQjq/Q0NZ5XdlvpWr/WbUcxHOPbIwQh1G53lMFBwuA
   DlfiQrPUc+Y/vQWvw90KhqyAHWBM3vh/AEQfjsMa0D4e3d2Wb+/wnfvjf
   t1rulk7jlH/0llK6+3QqbDKTwbX2nIHbi3K5S6NZZp1F5oVfKpdk90A+U
   cr47s2MyWOjGwURHPSgb/ToF5rR5hUqf5GKeSgThAD0dfNfyXNBDsfuC/
   e8hdKipOjSzo6ChijNq4rirvW+DVNJWJ4bqrFiEVyKp/iVS4jnNGkokB5
   5yHdZs4G0lGw3ivHsQ3KWTuuq0XVk8Sus3hnw9YDSHN7Eo2eeAQOLlF5s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2223418"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="2223418"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 20:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947444480"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="947444480"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 20:59:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDdp6-000LYt-0d;
	Thu, 14 Dec 2023 04:59:48 +0000
Date: Thu, 14 Dec 2023 12:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan McClelland <rymcclel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jiri Kosina <jkosina@suse.com>,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [linux-next:master 6722/7300] drivers/hid/hid-nintendo.c:371:13:
 error: initializer element is not constant
Message-ID: <202312141227.C2h1IzfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 94f18bb19945915fcdfd1903841020ef1b6af44a [6722/7300] HID: nintendo: add support for nso controllers
config: x86_64-randconfig-016-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141227.C2h1IzfI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141227.C2h1IzfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-nintendo.c:371:13: error: initializer element is not constant
     { BTN_TL,  JC_BTN_L, },
                ^~~~~~~~
   drivers/hid/hid-nintendo.c:371:13: note: (near initialization for 'left_joycon_button_mappings[0].bit')
   drivers/hid/hid-nintendo.c:372:14: error: initializer element is not constant
     { BTN_TL2,  JC_BTN_ZL, },
                 ^~~~~~~~~
   drivers/hid/hid-nintendo.c:372:14: note: (near initialization for 'left_joycon_button_mappings[1].bit')
   drivers/hid/hid-nintendo.c:373:17: error: initializer element is not constant
     { BTN_SELECT,  JC_BTN_MINUS, },
                    ^~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:373:17: note: (near initialization for 'left_joycon_button_mappings[2].bit')
   drivers/hid/hid-nintendo.c:374:17: error: initializer element is not constant
     { BTN_THUMBL,  JC_BTN_LSTICK, },
                    ^~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:374:17: note: (near initialization for 'left_joycon_button_mappings[3].bit')
   drivers/hid/hid-nintendo.c:375:18: error: initializer element is not constant
     { BTN_DPAD_UP,  JC_BTN_UP, },
                     ^~~~~~~~~
   drivers/hid/hid-nintendo.c:375:18: note: (near initialization for 'left_joycon_button_mappings[4].bit')
   drivers/hid/hid-nintendo.c:376:19: error: initializer element is not constant
     { BTN_DPAD_DOWN, JC_BTN_DOWN, },
                      ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:376:19: note: (near initialization for 'left_joycon_button_mappings[5].bit')
   drivers/hid/hid-nintendo.c:377:19: error: initializer element is not constant
     { BTN_DPAD_LEFT, JC_BTN_LEFT, },
                      ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:377:19: note: (near initialization for 'left_joycon_button_mappings[6].bit')
   drivers/hid/hid-nintendo.c:378:20: error: initializer element is not constant
     { BTN_DPAD_RIGHT, JC_BTN_RIGHT, },
                       ^~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:378:20: note: (near initialization for 'left_joycon_button_mappings[7].bit')
   drivers/hid/hid-nintendo.c:379:12: error: initializer element is not constant
     { BTN_Z,  JC_BTN_CAP, },
               ^~~~~~~~~~
   drivers/hid/hid-nintendo.c:379:12: note: (near initialization for 'left_joycon_button_mappings[8].bit')
   drivers/hid/hid-nintendo.c:388:12: error: initializer element is not constant
     { BTN_TR, JC_BTN_SL_L, },
               ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:388:12: note: (near initialization for 'left_joycon_s_button_mappings[0].bit')
   drivers/hid/hid-nintendo.c:389:13: error: initializer element is not constant
     { BTN_TR2, JC_BTN_SR_L, },
                ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:389:13: note: (near initialization for 'left_joycon_s_button_mappings[1].bit')
   drivers/hid/hid-nintendo.c:394:14: error: initializer element is not constant
     { BTN_EAST, JC_BTN_A, },
                 ^~~~~~~~
   drivers/hid/hid-nintendo.c:394:14: note: (near initialization for 'right_joycon_button_mappings[0].bit')
   drivers/hid/hid-nintendo.c:395:15: error: initializer element is not constant
     { BTN_SOUTH, JC_BTN_B, },
                  ^~~~~~~~
   drivers/hid/hid-nintendo.c:395:15: note: (near initialization for 'right_joycon_button_mappings[1].bit')
   drivers/hid/hid-nintendo.c:396:15: error: initializer element is not constant
     { BTN_NORTH, JC_BTN_X, },
                  ^~~~~~~~
   drivers/hid/hid-nintendo.c:396:15: note: (near initialization for 'right_joycon_button_mappings[2].bit')
   drivers/hid/hid-nintendo.c:397:14: error: initializer element is not constant
     { BTN_WEST, JC_BTN_Y, },
                 ^~~~~~~~
   drivers/hid/hid-nintendo.c:397:14: note: (near initialization for 'right_joycon_button_mappings[3].bit')
   drivers/hid/hid-nintendo.c:398:12: error: initializer element is not constant
     { BTN_TR, JC_BTN_R, },
               ^~~~~~~~
   drivers/hid/hid-nintendo.c:398:12: note: (near initialization for 'right_joycon_button_mappings[4].bit')
   drivers/hid/hid-nintendo.c:399:13: error: initializer element is not constant
     { BTN_TR2, JC_BTN_ZR, },
                ^~~~~~~~~
   drivers/hid/hid-nintendo.c:399:13: note: (near initialization for 'right_joycon_button_mappings[5].bit')
   drivers/hid/hid-nintendo.c:400:15: error: initializer element is not constant
     { BTN_START, JC_BTN_PLUS, },
                  ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:400:15: note: (near initialization for 'right_joycon_button_mappings[6].bit')
   drivers/hid/hid-nintendo.c:401:16: error: initializer element is not constant
     { BTN_THUMBR, JC_BTN_RSTICK, },
                   ^~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:401:16: note: (near initialization for 'right_joycon_button_mappings[7].bit')
   drivers/hid/hid-nintendo.c:402:14: error: initializer element is not constant
     { BTN_MODE, JC_BTN_HOME, },
                 ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:402:14: note: (near initialization for 'right_joycon_button_mappings[8].bit')
   drivers/hid/hid-nintendo.c:411:12: error: initializer element is not constant
     { BTN_TL, JC_BTN_SL_R, },
               ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:411:12: note: (near initialization for 'right_joycon_s_button_mappings[0].bit')
   drivers/hid/hid-nintendo.c:412:13: error: initializer element is not constant
     { BTN_TL2, JC_BTN_SR_R, },
                ^~~~~~~~~~~
   drivers/hid/hid-nintendo.c:412:13: note: (near initialization for 'right_joycon_s_button_mappings[1].bit')
   drivers/hid/hid-nintendo.c:417:14: error: initializer element is not constant
     { BTN_EAST, JC_BTN_A, },
                 ^~~~~~~~
   drivers/hid/hid-nintendo.c:417:14: note: (near initialization for 'procon_button_mappings[0].bit')
   drivers/hid/hid-nintendo.c:418:15: error: initializer element is not constant
     { BTN_SOUTH, JC_BTN_B, },
                  ^~~~~~~~
   drivers/hid/hid-nintendo.c:418:15: note: (near initialization for 'procon_button_mappings[1].bit')
   drivers/hid/hid-nintendo.c:419:15: error: initializer element is not constant
     { BTN_NORTH, JC_BTN_X, },
                  ^~~~~~~~
   drivers/hid/hid-nintendo.c:419:15: note: (near initialization for 'procon_button_mappings[2].bit')
   drivers/hid/hid-nintendo.c:420:14: error: initializer element is not constant


vim +371 drivers/hid/hid-nintendo.c

   366	
   367	/*
   368	 * D-pad is configured as buttons for the left Joy-Con only!
   369	 */
   370	static const struct joycon_ctlr_button_mapping left_joycon_button_mappings[] = {
 > 371		{ BTN_TL,		JC_BTN_L,	},
   372		{ BTN_TL2,		JC_BTN_ZL,	},
   373		{ BTN_SELECT,		JC_BTN_MINUS,	},
   374		{ BTN_THUMBL,		JC_BTN_LSTICK,	},
   375		{ BTN_DPAD_UP,		JC_BTN_UP,	},
   376		{ BTN_DPAD_DOWN,	JC_BTN_DOWN,	},
   377		{ BTN_DPAD_LEFT,	JC_BTN_LEFT,	},
   378		{ BTN_DPAD_RIGHT,	JC_BTN_RIGHT,	},
   379		{ BTN_Z,		JC_BTN_CAP,	},
   380		{ /* sentinel */ },
   381	};
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
