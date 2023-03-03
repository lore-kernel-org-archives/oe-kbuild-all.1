Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979643222
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677878907; x=1709414907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mt3BpVSPcRjxMUVLzFoE8KjI9y8dYfGm+w1tzZxjHww=;
  b=QOgH3THWpa6cPmrsnFO6nGonI7nvq0LcBh5NJzzfl6sABV3L25bowAmy
   6Dkog18Vv1XDtBfQM1JkPgxsj/LSrqZ0NLAurKlDIA8/2280KvmsiLXJ+
   tjRL/6PSkMKBmroDEwp62m1P+t9p43x35QcDUluYSSWAJiIjqN8uQxzgO
   J7FBVhQiFByGQFJkkIDIf3GxjPDggg9lSTmXaeGkbZo3/6NzsT0+/EYBc
   /EuliurwXxFw1l7egHDYpke0vx+mpmMytIv7eWUyYtBPPvUZ9GCQ3Y8s/
   Y1deeM4LeDyn1yQx6880qEGRj4PLKmOa8lhDe1sXkBiXPGnm0vQTYYT8g
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323460479"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="323460479"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 13:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="921248499"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="921248499"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Mar 2023 13:28:26 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYCwz-0001fY-1z;
	Fri, 03 Mar 2023 21:28:25 +0000
Date: Sat, 4 Mar 2023 05:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:net-queue 14/71] drivers/net/phy/sfp.c:2656:9: error: too
 many arguments to function 'sfp_set_state'
Message-ID: <202303040515.NxKrJ2Ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm net-queue
head:   e61867cdc3bb4a8980784f3cafaa6c877ab6af0d
commit: 9e4f66979a9751beb8ac23f928fe25a7a4617573 [14/71] net: sfp: add support for rate selection
config: loongarch-randconfig-r025-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040515.NxKrJ2Ft-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm net-queue
        git checkout 9e4f66979a9751beb8ac23f928fe25a7a4617573
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040515.NxKrJ2Ft-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/sfp.c: In function 'sfp_set_signal_rate':
>> drivers/net/phy/sfp.c:2656:9: error: too many arguments to function 'sfp_set_state'
    2656 |         sfp_set_state(sfp, SFP_F_RS0 | SFP_F_RS1, set);
         |         ^~~~~~~~~~~~~
   drivers/net/phy/sfp.c:762:13: note: declared here
     762 | static void sfp_set_state(struct sfp *sfp, unsigned int state)
         |             ^~~~~~~~~~~~~


vim +/sfp_set_state +2656 drivers/net/phy/sfp.c

  2644	
  2645	static void sfp_set_signal_rate(struct sfp *sfp, unsigned int rate_kbd)
  2646	{
  2647		unsigned int set;
  2648	
  2649		sfp->rate_kbd = rate_kbd;
  2650	
  2651		if (rate_kbd > sfp->rs_threshold_kbd)
  2652			set = sfp->rs_state_mask;
  2653		else
  2654			set = 0;
  2655	
> 2656		sfp_set_state(sfp, SFP_F_RS0 | SFP_F_RS1, set);
  2657	}
  2658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
