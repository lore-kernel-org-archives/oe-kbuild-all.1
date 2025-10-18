Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF022FE0D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806049; cv=none; b=Ov3LeqUOXOCaAz0eVYxmvUZOv5OTtSq2n4DEap40c9YDmQoJoQ1gscqXJvZ8X0j6uF+THPnZgR4Tk4f/BQq9/EioC2w2jhokrn5tEMFx/t1YZSslTVlctAHRDOvgEpTMa5vUbzgCfeNzGpfK3OX3XHv+sslNpXipzlJy0abcJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806049; c=relaxed/simple;
	bh=bpXSCzDz6SPgX2FPjgxSh2xMuPJpDGhXg5DHlilFfZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwzYY7A8BRQVQ7wnF73OKLDV33aGcWcRs7UFT3dJFRbg/33Xuta3HD0WHDVe93J94EJtB3axaH8MyqjrdZEHrFL+CjPZi577Zhe+7io1R9kmZwgVsXKnZ8dImS3+qRdV5C9yp5jbxrTU3x+6KqwiMfisOUdLNFS0BIC5+WA8EKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tb6nPjYy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tb6nPjYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760806047; x=1792342047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpXSCzDz6SPgX2FPjgxSh2xMuPJpDGhXg5DHlilFfZU=;
  b=Tb6nPjYyFErGuuPeGG2WhAkkn1pLvwrVsPrIRDXjwdHvE4Mm57+UkeHR
   TmAVZ2f8BHCPUo0RKNqj1Om/o7zIjFGM6+6cDajnPx5KU1uWL/XseS5uI
   YGm0egzkIwmcqVO4CE1BPtg7DyLUCOoFoY4PCG/efdexwjPZk/vEMIIrS
   9zhSQYfx5xgjZ5jfg+VIENoXZRWAJCxNt3AafvEC79wCuKVHUUdh2STEh
   hUwGwp5Aub/wQ8zWmz5+neU9nXaRBKuT45fUmNeOzdGS/mdpJmrxU/Pgc
   uN94FUFCJURMYfJcWso/ipk0/ktlhkgNp+HJw22cJC4mu5DtZq88nK6s7
   g==;
X-CSE-ConnectionGUID: mwFmPI0RSkW/u7tn4f6hHw==
X-CSE-MsgGUID: OVr1nm4zRYmQOS/sBmlVqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66827785"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66827785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 09:47:27 -0700
X-CSE-ConnectionGUID: XCAbmvysTDm18iKI3tGTlw==
X-CSE-MsgGUID: jYzmLzaUSzuMkLjxsuAtZw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2025 09:47:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAA5U-0008QT-0Y;
	Sat, 18 Oct 2025 16:47:24 +0000
Date: Sun, 19 Oct 2025 00:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 125/141]
 drivers/net/phy/as21xxx.c:703:12: warning: 'aeon_dpc_ra_enable' defined but
 not used
Message-ID: <202510190052.bQCymV8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   5d732cef797deb3381111da0d4e1aec0921adfa4
commit: b323ef91cc6a2146182ab5616b9f648847025bd4 [125/141] disable the dcp_ra call
config: i386-buildonly-randconfig-001-20251018 (https://download.01.org/0day-ci/archive/20251019/202510190052.bQCymV8O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190052.bQCymV8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190052.bQCymV8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xxx.c: In function 'aeon_set_default_value':
   drivers/net/phy/as21xxx.c:432:27: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     432 |         int pos = 0, val, ret = 0, remaining;
         |                           ^~~
   drivers/net/phy/as21xxx.c: At top level:
   drivers/net/phy/as21xxx.c:1331:35: warning: initialized field overwritten [-Woverride-init]
    1331 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1331:35: note: (near initialization for 'as21xxx_drivers[2].read_status')
   drivers/net/phy/as21xxx.c:1348:35: warning: initialized field overwritten [-Woverride-init]
    1348 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1348:35: note: (near initialization for 'as21xxx_drivers[3].read_status')
   drivers/net/phy/as21xxx.c:1365:35: warning: initialized field overwritten [-Woverride-init]
    1365 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1365:35: note: (near initialization for 'as21xxx_drivers[4].read_status')
   drivers/net/phy/as21xxx.c:1382:35: warning: initialized field overwritten [-Woverride-init]
    1382 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1382:35: note: (near initialization for 'as21xxx_drivers[5].read_status')
   drivers/net/phy/as21xxx.c:1399:35: warning: initialized field overwritten [-Woverride-init]
    1399 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1399:35: note: (near initialization for 'as21xxx_drivers[6].read_status')
   drivers/net/phy/as21xxx.c:1416:35: warning: initialized field overwritten [-Woverride-init]
    1416 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1416:35: note: (near initialization for 'as21xxx_drivers[7].read_status')
   drivers/net/phy/as21xxx.c:1433:35: warning: initialized field overwritten [-Woverride-init]
    1433 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1433:35: note: (near initialization for 'as21xxx_drivers[8].read_status')
   drivers/net/phy/as21xxx.c:1450:35: warning: initialized field overwritten [-Woverride-init]
    1450 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1450:35: note: (near initialization for 'as21xxx_drivers[9].read_status')
   drivers/net/phy/as21xxx.c:1467:35: warning: initialized field overwritten [-Woverride-init]
    1467 |                 .read_status    = as21xxx_read_status,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1467:35: note: (near initialization for 'as21xxx_drivers[10].read_status')
>> drivers/net/phy/as21xxx.c:703:12: warning: 'aeon_dpc_ra_enable' defined but not used [-Wunused-function]
     703 | static int aeon_dpc_ra_enable(struct phy_device *phydev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/aeon_dpc_ra_enable +703 drivers/net/phy/as21xxx.c

830877d89edcd83 Christian Marangi 2025-05-17  702  
830877d89edcd83 Christian Marangi 2025-05-17 @703  static int aeon_dpc_ra_enable(struct phy_device *phydev)
830877d89edcd83 Christian Marangi 2025-05-17  704  {
830877d89edcd83 Christian Marangi 2025-05-17  705  	u16 data[2];
669b18537969268 Frank Wunderlich  2025-10-11  706  	u16 ret_sts;
830877d89edcd83 Christian Marangi 2025-05-17  707  	data[0] = IPC_CFG_PARAM_DIRECT;
830877d89edcd83 Christian Marangi 2025-05-17  708  	data[1] = IPC_CFG_PARAM_DIRECT_DPC_RA;
830877d89edcd83 Christian Marangi 2025-05-17  709  
669b18537969268 Frank Wunderlich  2025-10-11  710  	return aeon_ipc_send_msg(phydev, IPC_CMD_CFG_PARAM, data,
669b18537969268 Frank Wunderlich  2025-10-11  711  				 sizeof(data), &ret_sts);
669b18537969268 Frank Wunderlich  2025-10-11  712  }
669b18537969268 Frank Wunderlich  2025-10-11  713  

:::::: The code at line 703 was first introduced by commit
:::::: 830877d89edcd834e4b4d0fcc021ff619d89505e net: phy: Add support for Aeonsemi AS21xxx PHYs

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
