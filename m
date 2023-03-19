Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C97C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679264783; x=1710800783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkQKnuiNwB7WHe1lFAdnDvSnk3OQg/vHZRrVJtVvC7w=;
  b=ZTdJgN85Li1ywUVT3OxIHe2v8zbq8g1zkfxI4g9WsFTsaB3f7qLSQKec
   tBCCccx3ATaPqN06LfNYR6Ra88DMU/jTz16zV/oBW9uzRxG4JIHIERaDW
   +BUbbE1evDx1i7O5LkYCyBBnqU7o0hMZd+hNQDdTUC2BTeE0Uzz+tvEeE
   /qP5G8min64RlKyR2nbrAYMGbmcOwfxqrcqesuU8OKyvcanclXd+1vZ4F
   0uiMBTD3FedusyntaoRBvpCukpCf8Ey3Rzh5Hpm2cw6D1YkURF/xKKALe
   fnq2LnQDrqtHMf0dWf3U06F0vhWwRwuUA12rPYhiB7LM5YJ5Uw8vnQp1t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="366256246"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="366256246"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 15:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="1010275695"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="1010275695"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2023 15:26:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe1Tp-000AgY-2p;
	Sun, 19 Mar 2023 22:26:21 +0000
Date: Mon, 20 Mar 2023 06:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.3-rc2-net-next-phy-leds 4/15]
 drivers/leds/led-core.c:481:24: error: redefinition of
 'led_init_default_state_get'
Message-ID: <202303200623.IkpkNzgF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   0f7d7b9bb56b75decce502841caf57374255d526
commit: bb10f45da5b729c42a5dfd0859b1c97d8b8a57cf [4/15] leds: Provide stubs for when CLASS_LED is disabled
config: sparc64-randconfig-r035-20230319 (https://download.01.org/0day-ci/archive/20230320/202303200623.IkpkNzgF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/bb10f45da5b729c42a5dfd0859b1c97d8b8a57cf
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout bb10f45da5b729c42a5dfd0859b1c97d8b8a57cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303200623.IkpkNzgF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/led-core.c:481:24: error: redefinition of 'led_init_default_state_get'
     481 | enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/leds/led-core.c:11:
   include/linux/leds.h:89:1: note: previous definition of 'led_init_default_state_get' with type 'enum led_default_state(struct fwnode_handle *)'
      89 | led_init_default_state_get(struct fwnode_handle *fwnode)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/led_init_default_state_get +481 drivers/leds/led-core.c

791bc41163c51f Denis Osterland-Heim 2021-06-08  480  
791bc41163c51f Denis Osterland-Heim 2021-06-08 @481  enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)

:::::: The code at line 481 was first introduced by commit
:::::: 791bc41163c51f870972d6c6b82d971ce951096c leds: move default_state read from fwnode to core

:::::: TO: Denis Osterland-Heim <Denis.Osterland@diehl.com>
:::::: CC: Pavel Machek <pavel@ucw.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
