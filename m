Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818C17983
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n35kQZrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699268259; x=1730804259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUNdbl/cJoRFsX3R5fF+1UA9ljZzGY5qbVudDzeHcUE=;
  b=n35kQZrkqHd6/rBjTdQRWMytxs1Za0dFu00jCGPJNGU5zpHY8iZzwE8D
   5E1CkwJGqWqckWGAIXMKrH6xQ6QB/Nafjp5igOFT9tiEQ3C51jKbvFamb
   /iOlaSIYBHksvv0oNZSsNpEk+FCP4t8ELNMpsD+JnzWDVm/cAq9G7LUuR
   k3hf9DKDihPXs36WwysjSzpuViZSg2+TMQoDF2X7B0vWsznQxF0Q2BX+m
   E/eZaK/bFEKhl2zp/rccKEa22cTqt5yfLkNoUuA3A9L7arLgLQxBbgMzS
   Hdu0GWH57EzEY5qb72qfmO7PBGvEI1B2eEQeGsW65BlgLeku0wDjDLXYl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2240990"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2240990"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852950891"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="852950891"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2023 02:57:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzxIU-0006Lw-2s;
	Mon, 06 Nov 2023 10:57:34 +0000
Date: Mon, 6 Nov 2023 18:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1571:13:
 warning: variable 'ret' set but not used
Message-ID: <202311061859.GO329lGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   f8c3c0e5dd031c0578dbe1ddd203fa5bb0020eec
commit: 3b2571b8e8064a73eca2cec23cf86cfe7f7050f5 [3/4] WIP: phy: apple: Add Apple Type-C PHY
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061859.GO329lGM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061859.GO329lGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061859.GO329lGM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/apple/atc.c: In function 'atcphy_usb3_power_on':
>> drivers/phy/apple/atc.c:1571:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1571 |         int ret = 0;
         |             ^~~


vim +/ret +1571 drivers/phy/apple/atc.c

  1566	
  1567	static int atcphy_usb3_power_on(struct phy *phy)
  1568	{
  1569		struct apple_atcphy *atcphy = phy_get_drvdata(phy);
  1570		enum atcphy_pipehandler_state state;
> 1571		int ret = 0;
  1572	
  1573		/*
  1574		 * Both usb role switch and mux set work will be running concurrently.
  1575		 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
  1576		 * trying to switch dwc3 to the correct PHY.
  1577		 */
  1578		mutex_lock(&atcphy->lock);
  1579		if (atcphy->mode != atcphy->target_mode) {
  1580			reinit_completion(&atcphy->atcphy_online_event);
  1581			mutex_unlock(&atcphy->lock);
  1582			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1583						msecs_to_jiffies(1000));
  1584			mutex_lock(&atcphy->lock);
  1585		}
  1586	
  1587		if (atcphy->mode != atcphy->target_mode) {
  1588			dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
  1589			return -EINVAL;
  1590		}
  1591	
  1592		atcphy->dwc3_online = true;
  1593		state = atcphy_modes[atcphy->mode].pipehandler_state;
  1594		switch (state) {
  1595		case ATCPHY_PIPEHANDLER_STATE_USB2:
  1596		case ATCPHY_PIPEHANDLER_STATE_USB3:
  1597			ret = atcphy_configure_pipehandler(atcphy, state);
  1598			break;
  1599	
  1600		case ATCPHY_PIPEHANDLER_STATE_INVALID:
  1601		default:
  1602			dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
  1603				 state);
  1604			ret = -EINVAL;
  1605		}
  1606	
  1607		mutex_unlock(&atcphy->lock);
  1608	
  1609		return 0;
  1610	}
  1611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
