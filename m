Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927CC8EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690532346; x=1722068346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/7uIRQlPW+EOdwEYz9Mnj86i/Oz3Rltu5JxWi2hMQ0=;
  b=hqS2ir0i0i3EGKUWW2zfz0xhavv6Kb25O+kYFAcRPLT66CIYQ90bU2R+
   3DfzI5vIBY12kSWBrdW5SaDO6iVMmk2NeU6uKzHRr9XpUAe67YwrrXxbX
   LBHk6qsB1dK1JOnVcQSgg34jkHhouri+OuQtwwv0sqFyJTAD24nDi6omr
   767Wvm6JVVcG+sXULJAOpgFdnwF1Sx4q8B1mVbyB5wj0TaUd8aL1fXPs0
   NJdgyIA03DKPgiXbz4Pk5ll/WfR54dZBKePCFBIiw5QODQFPZI2CIXVlO
   X4NKV41G69BUKo5zAmCNGRniBnDZS8ZGKrTFDCk80GxUptOiPfU28HBCk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348140321"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="348140321"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 01:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901139134"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="901139134"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 01:19:04 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPIgi-00031j-0i;
	Fri, 28 Jul 2023 08:19:04 +0000
Date: Fri, 28 Jul 2023 16:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:clearfog 80/160]
 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning:
 '_mv88e6xxx_pvt_read' defined but not used
Message-ID: <202307281624.2IUjOCxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Russell,

First bad commit (maybe != root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   558beff41fd56fc77bb3946d9f9c238da55d61fd
commit: 1f7da4229ad7be3738e76e3e5592b27475474ed4 [80/160] net: dsa: mv88e6xxx: debugfs hacks to fix the compile
config: i386-randconfig-i015-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281624.2IUjOCxU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281624.2IUjOCxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281624.2IUjOCxU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/mv88e6xxx/chip.c:3922:
>> drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning: '_mv88e6xxx_pvt_read' defined but not used [-Wunused-function]
      52 | static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/_mv88e6xxx_pvt_read +52 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

ed98cbcc120366 Vivien Didelot 2015-10-22  51  
ed98cbcc120366 Vivien Didelot 2015-10-22 @52  static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
ed98cbcc120366 Vivien Didelot 2015-10-22  53  			       int src_port, u16 *data)
ed98cbcc120366 Vivien Didelot 2015-10-22  54  {
ed98cbcc120366 Vivien Didelot 2015-10-22  55  	int ret;
ed98cbcc120366 Vivien Didelot 2015-10-22  56  
ed98cbcc120366 Vivien Didelot 2015-10-22  57  	ret = _mv88e6xxx_pvt_wait(chip);
ed98cbcc120366 Vivien Didelot 2015-10-22  58  	if (ret < 0)
ed98cbcc120366 Vivien Didelot 2015-10-22  59  		return ret;
ed98cbcc120366 Vivien Didelot 2015-10-22  60  
ed98cbcc120366 Vivien Didelot 2015-10-22  61  	ret = _mv88e6xxx_pvt_cmd(chip, src_dev, src_port,
ed98cbcc120366 Vivien Didelot 2015-10-22  62  				GLOBAL2_PVT_ADDR_OP_READ);
ed98cbcc120366 Vivien Didelot 2015-10-22  63  	if (ret < 0)
ed98cbcc120366 Vivien Didelot 2015-10-22  64  		return ret;
ed98cbcc120366 Vivien Didelot 2015-10-22  65  
ed98cbcc120366 Vivien Didelot 2015-10-22  66  	return mv88e6xxx_g2_read(chip, GLOBAL2_PVT_DATA, data);
ed98cbcc120366 Vivien Didelot 2015-10-22  67  }
ed98cbcc120366 Vivien Didelot 2015-10-22  68  

:::::: The code at line 52 was first introduced by commit
:::::: ed98cbcc120366baaddcc70c2d9fae9abfacc790 net: dsa: mv88e6xxx: add debugfs interface

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
