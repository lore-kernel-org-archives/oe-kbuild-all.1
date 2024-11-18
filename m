Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D8017C224
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731921590; cv=none; b=nlbysJzsWg/b8gi9a95gq1Pjx2tWb6vxAeF94ShoJLcCmylE/HAEghUe1sLT4XxBuLhym4I456bJ1WtXAb2ekQqUP0qwUupU/53aNxXePiisACwj6uskJc6u3tZuBwNruRxY8U1MoXlRGCUIWUPwx1ZLeM3MF3w8yrgv4tq1ey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731921590; c=relaxed/simple;
	bh=cO4kplhuesKkuExFUO2uetqqj5+B5sW+2M5mXM0H1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOxtK4oqOcjFfaGi8XQr9WfSaN7TBXWhJui+iPyLnHyG9Jlgk2f3nVBUgcB+kuNkQAqikkcB9cTvGr7jZkXv06yf8b+yKuELQOJEySIExkeabhiDB7FkHMHa6K+S3jQeAMi4UUZcc3nYVKZjghP6XR+lp3/7CUf9ZODrgIwZb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNM8Qtjq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNM8Qtjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731921589; x=1763457589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cO4kplhuesKkuExFUO2uetqqj5+B5sW+2M5mXM0H1oI=;
  b=cNM8QtjqsRPrSYddsNhttKcfjnw2VIpvTrNzYE4lFc81VsS8S0spTRTz
   bq+JM2BlPbx3USfk7vfDQOu6kxG4O4JHB1vbl5e0jXF8Nlw5mCtz5Rbp6
   4upsJZWz4sZP0ZXIFd7ZuC2m9SvjTXSZ1GjOyAQEajR4TIBlMwOFMwQRT
   I86FRptv5TGILtSAGX+Oa+sglxAi7uFTcYIevEGgyCyp99SV/yi7Kx1mX
   q+Rt7x9wimtBTNbjzCl53uM9EHeC6oMdcLVR9jTrtU/L+UBFGDZdKrp0g
   dv913vVfK7VmbpRR/OXlJSWlPhofemhkZt5TFsQ5sJEgjY+9raI7uKH6Q
   g==;
X-CSE-ConnectionGUID: eeF3yYVLQo2joju0+5TUaw==
X-CSE-MsgGUID: vukt7wivSUW9x3zfGgV0cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49403632"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49403632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:19:48 -0800
X-CSE-ConnectionGUID: BXYs+GBnTbWCThNEffDnwg==
X-CSE-MsgGUID: vr1AZwsaT7qWgWENSXjSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120105264"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 01:19:47 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCxv6-0002LR-1R;
	Mon, 18 Nov 2024 09:19:44 +0000
Date: Mon, 18 Nov 2024 17:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/170-atcphy 4/17] drivers/phy/apple/atc.c:1571:13:
 warning: variable 'ret' set but not used
Message-ID: <202411181731.KU5zf9AI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   58c27a2b420c2f6e49fdef1ce8b065e01a10f00c
commit: 44d2e75b8057a2d871fb6b76134828645f25df45 [4/17] WIP: phy: apple: Add Apple Type-C PHY
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411181731.KU5zf9AI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181731.KU5zf9AI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181731.KU5zf9AI-lkp@intel.com/

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
