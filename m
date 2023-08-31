Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E52186A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693494418; x=1725030418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txOVXARYySis2VvTashivPp/9ItZH3gu20+wHXwPIA0=;
  b=AsrLaUY8vFKQrgapxzZIz9VExnNIXytQQP5wVsqeEho4jR6p+lt142H4
   C/60KtsxG8mAzKfbTxD0cy6Q51DoA8ng2yeYPlDgNWKzKNaNuX7fFHOkR
   XL8TRqphYRUWR8B3rCInIzMegjSGCD1GXGFIXKcqIVtVAbHuglW6X3cLw
   BUUR/7JFVUfnbOPiBuYM0J0K1SavrT6auZPVSPa6krZSvP2La7qnHQoLr
   DdAZl9WoBwyR52JA61GbRNyvcYEB8Be7xMJFhMpXc2wmN8LdGhuEsrgaQ
   Z2jdc5aLfFFZP5lOyufa7kyeS3W2bAhJmn0NN3hLxZhofx5pnJRsv+Q84
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374885284"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="374885284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 08:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805032892"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="805032892"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 08:06:53 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbjFz-0000Gx-2h;
	Thu, 31 Aug 2023 15:06:51 +0000
Date: Thu, 31 Aug 2023 23:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:clearfog 79/96]
 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning:
 '_mv88e6xxx_pvt_read' defined but not used
Message-ID: <202308312320.QRmQ4Ebc-lkp@intel.com>
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
head:   c65c246963ee04bc48b3ed413f4f3b7ee4234794
commit: aaddf3b26b9bcd02de7114caa68cfd4fd81370d9 [79/96] net: dsa: mv88e6xxx: debugfs hacks to fix the compile
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308312320.QRmQ4Ebc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312320.QRmQ4Ebc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312320.QRmQ4Ebc-lkp@intel.com/

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
