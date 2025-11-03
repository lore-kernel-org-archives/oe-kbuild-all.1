Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9103B663
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762140072; cv=none; b=MtarOJW9KP6+ZuViIT7R45H9HBiZDNBK8kB6vVaH9zeWXDtFITdSu2YNfopBKVDqw604Lps8e/JTqxzPJC7cwcv09UFUUKIB02s2JdK2ANdJq6LuwIEXjtkBNopXA7pT8fnlPlz1O8Dkq1JVzjsQ2rVej1nYji/psMwTRUz6jUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762140072; c=relaxed/simple;
	bh=tkX0JMlJoW4uCND+URIS0IuMnDhop3I/agcYFsSAeDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVbMbsmghoxCwOGDsMjf7FuLoMLTwGrj+kN99CyOTR8W0AnzfoEW+6ND6yzImZ3/8lNQvXBGRfwbN4D7HfY6+AYO/DUOsJ6TJvqNaAwhOSTTAEdyJsBImu96NViKD1+0odTu0LFoW06Db3lh+i/65TL52ZvDqWkCiBRDZ+NqUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgAOdGgh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgAOdGgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762140071; x=1793676071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkX0JMlJoW4uCND+URIS0IuMnDhop3I/agcYFsSAeDA=;
  b=BgAOdGgha+5fsKAn8rLCp2n/nEsu+9cnkVlgNzlvsCp4u3xQUfWi+NPQ
   tnMoifCd9PvrJlom/CAH34oOdktZTwlki7EMpgM2Im1recUDxAL65nNSX
   NF4EaB7cUBMQdLDecMWeHctooTt+9PdQSZYQ0QzpG83w5rBghjOfYmFUG
   Oqo62FE8rvs1anM0RZLyPjk9PSK/oTwCu0qdDw2OrGIrLdG2wps8uWhxF
   hgqu0re7B6rknObWrCrzZVfb/FgjJCxTJbIKz7F82ImD+U+5EFmoVAVdS
   NLaQXEWtjnuVjOAP3bJqeHSuY38Vkaco6Dy6jXWIOyo7807SnmwC8BYen
   Q==;
X-CSE-ConnectionGUID: 7HbMMA8RRfSCWgT62wLjoQ==
X-CSE-MsgGUID: Qu9RQH8VTWe46kGg2aJEDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75322870"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="75322870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 19:21:10 -0800
X-CSE-ConnectionGUID: g4gUSQ0GRZOjJc2h/hw/RA==
X-CSE-MsgGUID: 4otX1rVIT3OXdKeMdbRMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186708565"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2025 19:21:10 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFl77-000Pn6-1q;
	Mon, 03 Nov 2025 03:20:33 +0000
Date: Mon, 3 Nov 2025 11:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 147/148] drivers/net/phy/sfp.c:463:13:
 warning: 'sfp_quirk_disable_autoneg' defined but not used
Message-ID: <202511031107.InZkIrzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   14f53e679f62008f01f236c7e528c2d89e4b2f3d
commit: 44fe3b3b18ca6b844505d0553166d19137f308ab [147/148] net: sfp: drop unused function after changing 2.5G sfp to rollball
config: nios2-randconfig-r073-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031107.InZkIrzD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031107.InZkIrzD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031107.InZkIrzD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/sfp.c:463:13: warning: 'sfp_quirk_disable_autoneg' defined but not used [-Wunused-function]
    static void sfp_quirk_disable_autoneg(const struct sfp_eeprom_id *id,
                ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sfp_quirk_disable_autoneg +463 drivers/net/phy/sfp.c

23571c7b964374 Russell King (Oracle  2022-09-13  462) 
50e96acbe11667 Russell King (Oracle  2023-03-21 @463) static void sfp_quirk_disable_autoneg(const struct sfp_eeprom_id *id,
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  464) 				      struct sfp_module_caps *caps)
50e96acbe11667 Russell King (Oracle  2023-03-21  465) {
a7dc35a9e49b10 Russell King (Oracle  2025-09-16  466) 	linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, caps->link_modes);
50e96acbe11667 Russell King (Oracle  2023-03-21  467) }
50e96acbe11667 Russell King (Oracle  2023-03-21  468) 

:::::: The code at line 463 was first introduced by commit
:::::: 50e96acbe11667b6fe9d99e1348c6c224b2f11dd net: sfp: add quirk for 2.5G copper SFP

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
