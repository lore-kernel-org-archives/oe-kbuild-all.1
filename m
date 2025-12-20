Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD258246BC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241975; cv=none; b=PXsWI/pVDLF8V7M9u3glxiX0kvqaFMy4h77KN+jP/BTaa3eAVFxFxL2if76qevwu8QX1Bhr/K/+h5nRkHfS8BmD7+kK+UT5FiXLk+FTX46joFBQO2LoMQ2pkwkfMI2K4t+vpkePbmkEGO1CFz5Klw+3mTJ+gXJ47QVU4gZvjpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241975; c=relaxed/simple;
	bh=WDRMXVeStxGhOud8NoqDdNo9dM7dqIiEJYAzLJ454hA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=De+OOsrRPLhtLKiA8nqvF+1bcXQ44/6VPqFP7wgDoo/i0otcgYaDtApAaEsFM2fm1f/jY3mZ6D9TsE/rDIRdz54YAA0XbH5SBIeSnhZDWNdKE6l1w952zIMSmRliy2MOBXYeTMDzL+HyQ37UwD9/rYxhZhW2sfnNI1O8/eKsbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHkZvo+Q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHkZvo+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241974; x=1797777974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDRMXVeStxGhOud8NoqDdNo9dM7dqIiEJYAzLJ454hA=;
  b=XHkZvo+Q3P4N/r2KtlQtQRvBankL4YriLpdi/EWfvjFq2XH5WvDNx+1A
   0toFeL5ehKDlClGP5hoBm6GiP/CV8bE2FQDsUi0tcL5DToNDEh8/gKENf
   1QD6JM/bTrkxOowOpqvE4JfqGd4q4YIqTtVJj2wLn5xITjPcTpbkfvj6o
   8YhPyswX0DAjUsj0LC5M3n+qpIVubfrwh/X5eYDj2ZtNWl729C5V9CsYo
   JonU7AXyfb8AjawaeK0uWeCqdCGIbK2NbxoBUq4eC8CNZD7/dTOmGVM3+
   g/uO3BuSBe1R03szie44pWg6EWJlPNYfVx+/Zi8wd+0Ktab+zLNQ3Ny4n
   w==;
X-CSE-ConnectionGUID: Uo2gPj+yS8+mJO7e3oPdOw==
X-CSE-MsgGUID: 0B/WT6zTQ6W9rzYDuGTfYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294956"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: 1ITthvjnRgCWNlILIPlRhg==
X-CSE-MsgGUID: b60Gt4TGSB6VXWSP9sq16Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986990"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004g1-1y4d;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 51/109]
 drivers/net/phy/as21xxx.c:432:27: warning: variable 'ret' set but not used
Message-ID: <202512202204.etmMDLu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 2a3cf4947bd4995558a9fd1b4df4556bf94f06b3 [51/109] net: phy: as21: try the driver from mtk-sdk
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202204.etmMDLu9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202204.etmMDLu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202204.etmMDLu9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xxx.c:432:27: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
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


vim +/ret +432 drivers/net/phy/as21xxx.c

   424	
   425	static int aeon_set_default_value(struct phy_device *phydev)
   426	{
   427		static const unsigned char base_data[] = {0x32, 0x30, 0x32, 0x33, 0x30, 0x37, 0x31, 0x34};
   428		unsigned char bytebuf[16];
   429		unsigned short *wdata;
   430		unsigned int mask;
   431		int byte_count, wdata_count = 0;
 > 432		int pos = 0, val, ret = 0, remaining;
   433		unsigned char padded_bytes[MEM_WORD_SIZE] = {0};
   434		mask = param1 | 14;
   435		memcpy(bytebuf, base_data, sizeof(base_data));
   436		bytebuf[8] = mask & 0xff;
   437		bytebuf[9] = (mask >> 8) & 0xff;
   438		byte_count = 10;
   439		wdata = kmalloc(MAX_WDATA_SIZE * sizeof(unsigned short), GFP_KERNEL);
   440		if (!wdata) {
   441			pr_err("Failed to allocate wdata array\n");
   442			return -ENOMEM;
   443		}
   444		while (pos + MEM_WORD_SIZE <= byte_count) {
   445			if (wdata_count + 2 > MAX_WDATA_SIZE) {
   446				pr_err("wdata array overflow\n");
   447				ret = -ENOSPC;
   448				goto cleanup;
   449			}
   450			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos]);
   451			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos + 2]);
   452			pos += MEM_WORD_SIZE;
   453		}
   454		remaining = byte_count - pos;
   455		if (remaining > 0) {
   456			if (wdata_count + 2 <= MAX_WDATA_SIZE) {
   457				// Here we just need padded_bytes once, otherwise we need to read from mem
   458				memcpy(padded_bytes, &bytebuf[pos], remaining);
   459				wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[0]);
   460				wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[2]);
   461			}
   462		}
   463		val = aeon_cl45_read(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
   464		val |= 0x12;
   465		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
   466		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_FW_START_ADDR,
   467				(u16)(AEON_MEM_DEFAULT_ADDR & 0xFFFF));
   468		phy_modify_mmd(phydev, MDIO_MMD_VEND1,
   469				VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD,
   470				0x3ffc, 0xc000);
   471		aeon_cl45_write_burst(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_LOAD,
   472				(unsigned char *)wdata, wdata_count*2);
   473		val = aeon_cl45_read(phydev, MDIO_MMD_VEND1,
   474				VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD); //GLB_REG_MDIO_INDIRECT_ADDRCMD
   475		val &= 0x3FFF;
   476		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD, val);
   477		val = aeon_cl45_read(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
   478		val &= 0xFFED;
   479		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
   480	cleanup:
   481		kfree(wdata);
   482		return 0;
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
