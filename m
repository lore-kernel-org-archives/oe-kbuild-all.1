Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBCA59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681539858; x=1713075858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=onKZYJNHs6bL9hJZcCXcZrbK01EI2Dy08yzbnKjIXKo=;
  b=ezXFAinLL1CNU7DxkUOvw86wCDvaxbsz4sK5yLnHqgR+1Q+BeGgKFJ+O
   0iGOWyY5KDBFsFYFtKOin3LVhE2nITJ25coxKVvaB1/9pYVWkr61c4214
   EAPg8m8TyJkSMbf8mySFPXSAjdqX45XR7rnlJ6/pLCKlchsPDS3Sb69BC
   Lj7cJD40aT3KNK4Y75zVSAz0JLcz1qtUHDi/ReqJ3h/cFNSsKdvYphgDC
   +u+ruowwevlUBOL4cFuj/XrJtCTwtLyS4B1ZH6JhrtwJ8K+yfViDG1k4b
   PQ8R6VUcCotsB0zDOyeo/hvs8wS0weP6xXr137j8mRItd2MqKmJbNhAoT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346463895"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346463895"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="683586403"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="683586403"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2023 23:24:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZKZ-000aaR-2g;
	Sat, 15 Apr 2023 06:24:15 +0000
Date: Sat, 15 Apr 2023 14:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 9/16]
 drivers/net/phy/marvell.c:2887 m88e1318_led_blink_set() warn: inconsistent
 indenting
Message-ID: <202304151419.fqWr5I7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   885b4a813cb9f8cdfbdc3f86cc46babcf13dc3d9
commit: 36933adac480ae28d6c79de0d886000500c95da2 [9/16] net: phy: marvell: Implement led_blink_set()
config: csky-randconfig-m041-20230409 (https://download.01.org/0day-ci/archive/20230415/202304151419.fqWr5I7p-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151419.fqWr5I7p-lkp@intel.com/

smatch warnings:
drivers/net/phy/marvell.c:2887 m88e1318_led_blink_set() warn: inconsistent indenting

vim +2887 drivers/net/phy/marvell.c

  2866	
  2867	static int m88e1318_led_blink_set(struct phy_device *phydev, u8 index,
  2868					  unsigned long *delay_on,
  2869					  unsigned long *delay_off)
  2870	{
  2871		int reg;
  2872	
  2873		reg = phy_read_paged(phydev, MII_MARVELL_LED_PAGE,
  2874				     MII_88E1318S_PHY_LED_FUNC);
  2875		if (reg < 0)
  2876			return reg;
  2877	
  2878		switch (index) {
  2879		case 0:
  2880		case 1:
  2881		case 2:
  2882			reg &= ~(0xf << (4 * index));
  2883				reg |= MII_88E1318S_PHY_LED_FUNC_BLINK << (4 * index);
  2884				/* Reset default is 84ms */
  2885				*delay_on = 84 / 2;
  2886				*delay_off = 84 / 2;
> 2887			break;
  2888		default:
  2889			return -EINVAL;
  2890		}
  2891	
  2892		return phy_write_paged(phydev, MII_MARVELL_LED_PAGE,
  2893				       MII_88E1318S_PHY_LED_FUNC, reg);
  2894	}
  2895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
