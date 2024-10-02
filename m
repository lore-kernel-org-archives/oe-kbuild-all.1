Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AA17C79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867837; cv=none; b=uR5CcI7d3ZWAKLqxaYdMOPE/I14XI99e5sBvWu15np2B8uWWn+qGDV8IeZSl5TjoHaLKhWgdouAiWhBf6p0MVUHhP1do8XQ6q/XOp02UNduM5SUHUNVy8BCVnw4JkVzzqWTzM5DW0ZSgHoyIsLLTPpqDNRYl91UgXL5/nYkupzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867837; c=relaxed/simple;
	bh=hc1SIxuii7HtX+Vgsw/Cl0k5TeOgd3Oz0PuDMR92m9U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=kWocaCr3gsyd/2iWlKBm9lVCkZanANec1bctH1a1HuLaBcWk/uFZ46B16aWGLTEZq5sGeP+R2m6W0I+4bS9Ly8tyZhamAieQucEjdysKcfNoS2CXh1RI6TZt7qXtL/et9VbQycMc4VRx7eIsE6nyP6CbPnTsAQfBJ8i296cNuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Et5ZaT+w; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Et5ZaT+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=PNQ2kxwlLhvOjuBcYZ5EjyGutO2Y48B1Hi4G4JrGRx8=;
  b=Et5ZaT+wBOww9+ltpreKP+Zqr13QNy/9XpRRN/yqH4jWAjJaavGrP32b
   YYV3OTepzPJQg3uy+u0ya5VFdggi8nTZ+Red7req9lOF6GGzqAXL28e8A
   Qpl1iQ7Zxv7zgRg2Ogc+njF0hxwLBhNzQGVNbESXZNzlRYUIfbZe704yU
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,171,1725314400"; 
   d="scan'208";a="186496924"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 13:17:13 +0200
Date: Wed, 2 Oct 2024 13:17:12 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
    oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/170-atcphy 4/16] drivers/phy/apple/atc.c:1589:2-8:
 preceding lock on line 1578 (fwd)
Message-ID: <d7cd43ec-ba4d-193d-aa8a-50172f633ea1@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check whether an unlock is needed on line 1589.

julia

---------- Forwarded message ----------
Date: Wed, 2 Oct 2024 19:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [asahilinux:bits/170-atcphy 4/16] drivers/phy/apple/atc.c:1589:2-8:
    preceding lock on line 1578

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@svenpeter.dev>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   819ac8ed6c5777d4b18f0c88fc4a5e55a9ab9fdd
commit: 4f5b8aa35e68a33a1d20b6ce62014794768af7ad [4/16] WIP: phy: apple: Add Apple Type-C PHY
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-r052-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021851.sGmBSrDd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410021851.sGmBSrDd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1578
   drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1584

vim +1589 drivers/phy/apple/atc.c

4f5b8aa35e68a3 Sven Peter 2022-11-30  1566
4f5b8aa35e68a3 Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
4f5b8aa35e68a3 Sven Peter 2022-11-30  1568  {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1571  	int ret = 0;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1572
4f5b8aa35e68a3 Sven Peter 2022-11-30  1573  	/*
4f5b8aa35e68a3 Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
4f5b8aa35e68a3 Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
4f5b8aa35e68a3 Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
4f5b8aa35e68a3 Sven Peter 2022-11-30  1577  	 */
4f5b8aa35e68a3 Sven Peter 2022-11-30 @1578  	mutex_lock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
4f5b8aa35e68a3 Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
4f5b8aa35e68a3 Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1585  	}
4f5b8aa35e68a3 Sven Peter 2022-11-30  1586
4f5b8aa35e68a3 Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
4f5b8aa35e68a3 Sven Peter 2022-11-30 @1589  		return -EINVAL;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1590  	}
4f5b8aa35e68a3 Sven Peter 2022-11-30  1591
4f5b8aa35e68a3 Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1594  	switch (state) {
4f5b8aa35e68a3 Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1598  		break;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1599
4f5b8aa35e68a3 Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1601  	default:
4f5b8aa35e68a3 Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
4f5b8aa35e68a3 Sven Peter 2022-11-30  1603  			 state);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1604  		ret = -EINVAL;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1605  	}
4f5b8aa35e68a3 Sven Peter 2022-11-30  1606
4f5b8aa35e68a3 Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
4f5b8aa35e68a3 Sven Peter 2022-11-30  1608
4f5b8aa35e68a3 Sven Peter 2022-11-30  1609  	return 0;
4f5b8aa35e68a3 Sven Peter 2022-11-30  1610  }
4f5b8aa35e68a3 Sven Peter 2022-11-30  1611

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
