Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297688817
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695138206; x=1726674206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MtdPFd1p84EdoUOTatQzzzr0Kflr97zaiKeWuf9kWo=;
  b=QDgVkfpP5U6cxMwiTGjQypEGxNZx8ab62aMJi7wNsVJidG0krcvXax7l
   SwDYM8Xe9uwBPKxMKWxL8iMf4p9Zm/djFUls/KSTTtMHwF9TX/SpxaUvD
   v2EEXO1idDL/Tut6kosZXU0mtnIl2nV7UeuaneCTmFOsYQdzkN1HkdiNu
   TqSbrtjWIrND+wtO3Qc0m6zQkAYMSS7/T3JUNIfSmboFqVkiB3cYVNyv3
   JZkbY6p3j8OFhnpZ7u9OOqUqXDKfW3uw0BYUdcC00qoQyl/pp4q2pZcJQ
   knwbOdNqhW07uDYFoPKpXip5MYfqmIiPEJq/UGGU9YDuetMBgmNU6yhs9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370290171"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370290171"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739762232"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="739762232"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 08:40:24 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qicpp-0007ZI-2r;
	Tue, 19 Sep 2023 15:40:21 +0000
Date: Tue, 19 Sep 2023 23:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:clearfog 26/105]
 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning:
 '_mv88e6xxx_pvt_read' defined but not used
Message-ID: <202309192307.NTFS0rIK-lkp@intel.com>
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
head:   6a8f16d1a35202e04d77cbeb140e15cf46bb7c8a
commit: aaddf3b26b9bcd02de7114caa68cfd4fd81370d9 [26/105] net: dsa: mv88e6xxx: debugfs hacks to fix the compile
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309192307.NTFS0rIK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192307.NTFS0rIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192307.NTFS0rIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/mv88e6xxx/chip.c:3937:
>> drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning: '_mv88e6xxx_pvt_read' defined but not used [-Wunused-function]
      52 | static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/_mv88e6xxx_pvt_read +52 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

2b0fab59f65520 Vivien Didelot 2015-10-22  51  
2b0fab59f65520 Vivien Didelot 2015-10-22 @52  static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
2b0fab59f65520 Vivien Didelot 2015-10-22  53  			       int src_port, u16 *data)
2b0fab59f65520 Vivien Didelot 2015-10-22  54  {
2b0fab59f65520 Vivien Didelot 2015-10-22  55  	int ret;
2b0fab59f65520 Vivien Didelot 2015-10-22  56  
2b0fab59f65520 Vivien Didelot 2015-10-22  57  	ret = _mv88e6xxx_pvt_wait(chip);
2b0fab59f65520 Vivien Didelot 2015-10-22  58  	if (ret < 0)
2b0fab59f65520 Vivien Didelot 2015-10-22  59  		return ret;
2b0fab59f65520 Vivien Didelot 2015-10-22  60  
2b0fab59f65520 Vivien Didelot 2015-10-22  61  	ret = _mv88e6xxx_pvt_cmd(chip, src_dev, src_port,
2b0fab59f65520 Vivien Didelot 2015-10-22  62  				GLOBAL2_PVT_ADDR_OP_READ);
2b0fab59f65520 Vivien Didelot 2015-10-22  63  	if (ret < 0)
2b0fab59f65520 Vivien Didelot 2015-10-22  64  		return ret;
2b0fab59f65520 Vivien Didelot 2015-10-22  65  
2b0fab59f65520 Vivien Didelot 2015-10-22  66  	return mv88e6xxx_g2_read(chip, GLOBAL2_PVT_DATA, data);
2b0fab59f65520 Vivien Didelot 2015-10-22  67  }
2b0fab59f65520 Vivien Didelot 2015-10-22  68  

:::::: The code at line 52 was first introduced by commit
:::::: 2b0fab59f65520a11659622331b6e386f517b3bd net: dsa: mv88e6xxx: add debugfs interface

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
