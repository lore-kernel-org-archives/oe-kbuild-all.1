Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C9D286D4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 23:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761953530; cv=none; b=vGM5xNPqAIAtkFyc9OwmwNGojeP/1IFLzGeErvhoEhSFa1vu/Pp11QwrCFKxFl9R1Cg4fD55y7zhunUqR4wEuFUIVPYpM80oNHspDfayPypUIB7l3C3/TuAtb3uSMrSDTcz1EyYEeTQZUuwUCOUSccJwrJYF4bHC/eQO1ceDsbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761953530; c=relaxed/simple;
	bh=xbK108OcOozUrl1A8I3RAWFDy/4iNT1iX5823vRmbWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srQrqDNTmBLmJYRCcfOLWixCr42+nUeQ6nboNvWryq8OjaAMlnQd3m0CXwYh2ErX30uQXcBymXrwoFR6OKOjJ5W/ybLMfit6HJmb+3suhjFNRJwCkFqfa2xuA91LZE1uW2JsOCADcF/qjWoEBVzjCIxWD1y+qcQV3WJRJXSnA/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/lqqZW+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/lqqZW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761953528; x=1793489528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbK108OcOozUrl1A8I3RAWFDy/4iNT1iX5823vRmbWA=;
  b=A/lqqZW+4/2yhQW0y8OumMaFKCUR0479GohUovUtNLcw1fTUMp8Hz2E7
   DAk/0e31KSpmLkAHHc0QzCfchW8s9vJF3HL4mrU2D/+hILhS17Nxr8lIo
   l5qkLs/WwhJ7cJnhidn+GWTub5W9L84VjGuj8YuDT5LRe10WTSBJz4OtD
   Jw7X4Ic1HOOY8t8bYZeNSwQ5R7ospghDLIMTYH6hWrIIqNsd2bjWtUfAo
   qknobzzdCNzQzD8wHMcl/giqVWN4qPFBC4SXFGjdEX1EYmb5r9yrKamzb
   9JTw1+nBmeHURUwJu5ceoAFHub/wUbdlLzl57UwPgEaE8Ro/iTJk2lZYU
   w==;
X-CSE-ConnectionGUID: iuDr+Y5+QvCCg5YbIeTDFA==
X-CSE-MsgGUID: BeK0/PN4Q7eJH9kWlQ6RaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64218569"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="64218569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 16:32:07 -0700
X-CSE-ConnectionGUID: ehSpNNezQIaVqoSwOmDcRQ==
X-CSE-MsgGUID: 6xi4xNodT9G4fkwlNuQQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="186809758"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2025 16:32:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEybE-000Nin-2W;
	Fri, 31 Oct 2025 23:32:04 +0000
Date: Sat, 1 Nov 2025 07:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 146/146] drivers/net/phy/sfp.c:469:13:
 warning: 'sfp_quirk_oem_2_5g' defined but not used
Message-ID: <202511010722.asG6oSSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   1e8435613fb892baea36da409b796579e1e33fd9
commit: 1e8435613fb892baea36da409b796579e1e33fd9 [146/146] net: sfp: Fixup for OEM SFP-2.5G-T(-R-RM) module
config: arc-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010722.asG6oSSO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010722.asG6oSSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010722.asG6oSSO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/sfp.c:469:13: warning: 'sfp_quirk_oem_2_5g' defined but not used [-Wunused-function]
    static void sfp_quirk_oem_2_5g(const struct sfp_eeprom_id *id,
                ^~~~~~~~~~~~~~~~~~


vim +/sfp_quirk_oem_2_5g +469 drivers/net/phy/sfp.c

50e96acbe11667 Russell King (Oracle  2023-03-21  468) 
50e96acbe11667 Russell King (Oracle  2023-03-21 @469) static void sfp_quirk_oem_2_5g(const struct sfp_eeprom_id *id,
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  470) 			       struct sfp_module_caps *caps)
50e96acbe11667 Russell King (Oracle  2023-03-21  471) {
50e96acbe11667 Russell King (Oracle  2023-03-21  472) 	/* Copper 2.5G SFP */
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  473) 	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  474) 			 caps->link_modes);
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  475) 	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  476) 	sfp_quirk_disable_autoneg(id, caps);
50e96acbe11667 Russell King (Oracle  2023-03-21  477) }
50e96acbe11667 Russell King (Oracle  2023-03-21  478) 

:::::: The code at line 469 was first introduced by commit
:::::: 50e96acbe11667b6fe9d99e1348c6c224b2f11dd net: sfp: add quirk for 2.5G copper SFP

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
