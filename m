Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96B83F9CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551873; cv=none; b=p9vG5sfdTItTbCYIIl4LQJREh+EyNmcODMaPiQfOYCAmQ63p6w8TXNlWxn+P4hfEEVN1n0qyOF1E79mtr/fLscfOTwwGmVk+WGyKDiF/DphRS5aga0e8kTbhdlF5rabPJJHkXMn/kQIaIAf0m+92o8QxmdHrtrzuXuQAQ1QrxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551873; c=relaxed/simple;
	bh=HM6MiyKmkjTdjDu8c4zvC5JOGlpZZLVNR2Qp7nXUhAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqoBoS6lnFFg6bK95qL9PB28bY4LgaADIgzf/N+ixjBp/gfM9kqz7pl5SQQ6Yh+Jj9jwJ78vspkz2h0077Vb20zsn8x0tixAB7DQgVsk0rmxo8FmmSBqXjKROwI0HgG8svITLu0HsQViUpx+zfOB3rF4IGLqcf47A+bk1XI63w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZNuGJMC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZNuGJMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706551870; x=1738087870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HM6MiyKmkjTdjDu8c4zvC5JOGlpZZLVNR2Qp7nXUhAU=;
  b=PZNuGJMCzyWkTz5GsTNDVKUjMR6YiKJ/TMcloQTmodb1RBZpphNLOGjX
   UTbHeFn6+Oxlu/FuDTzfzIVqF/oVlxPmdUXtuzTBCdizifxm26sAZaESn
   FGMn6RoRzhoQQ2Sr2DBvIapf5CjGDq/Wnvm21zw1UeDDCfniVWOk4Dowg
   mAzZTpmcbvGsNd3+X9079V5uLYUMg4EPJbJDD1sGj9jHbkKHNQekzwx1Z
   zWqpNBdZ2YAzTTFW1+RVmCpyifwxc0ghYlM/1xqDZsaZGlecO3jtZ+2Or
   PCPmez/caXR5LcLVoMdqp+IUZ3GcKMsk6WYh2rUgtk0uV6Whq8ju+fikg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9710158"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9710158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29873473"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2024 10:08:06 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUW39-0004WA-2d;
	Mon, 29 Jan 2024 18:08:03 +0000
Date: Tue, 30 Jan 2024 02:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 36/38]
 drivers/net/phy/air_en8811h.c:875:5: warning: no previous prototype for
 'en8811h_c45_read_link'
Message-ID: <202401300201.NigFJicG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   f12289a86ee1065020c63b267d26e56e925159f2
commit: 17407eca103b21c749055291d45d3db7c7e391f6 [36/38] net: phy: airoha: Add the Airoha EN8811H PHY driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240130/202401300201.NigFJicG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300201.NigFJicG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300201.NigFJicG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/air_en8811h.c:875:5: warning: no previous prototype for 'en8811h_c45_read_link' [-Wmissing-prototypes]
     875 | int en8811h_c45_read_link(struct phy_device *phydev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/air_en8811h.c:1012:12: warning: no previous prototype for 'en8811h_phy_driver_register' [-Wmissing-prototypes]
    1012 | int __init en8811h_phy_driver_register(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/air_en8811h.c:1024:13: warning: no previous prototype for 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
    1024 | void __exit en8811h_phy_driver_unregister(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/en8811h_c45_read_link +875 drivers/net/phy/air_en8811h.c

   874	
 > 875	int en8811h_c45_read_link(struct phy_device *phydev)
   876	{
   877		int val;
   878	
   879		/* Read link state from known reliable register (latched) */
   880	
   881		if (!phy_polling_mode(phydev) || !phydev->link) {
   882			val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_STAT1);
   883			if (val < 0)
   884				return val;
   885			phydev->link = !!(val & MDIO_STAT1_LSTATUS);
   886	
   887			if (phydev->link)
   888				return 0;
   889		}
   890	
   891		val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_STAT1);
   892		if (val < 0)
   893			return val;
   894		phydev->link = !!(val & MDIO_STAT1_LSTATUS);
   895	
   896		return 0;
   897	}
   898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
