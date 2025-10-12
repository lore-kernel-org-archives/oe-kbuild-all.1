Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214697261D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760248597; cv=none; b=fpAqgY11jFed4ulMmnX2dIdP+UlbjtBOzg8jLXd1Fwx2vJaIzkI1kJpyJxbvdfuh9Vb0uRuxnwBdjqhQLS8G7mAPmaNWj9LIr/lsCCs/JYoh3WtcqLyrpCYHE47ijlfruuc6l+XDtdb5GYFUcav7hFZM3ik4GLeDvn4Bm1BrmkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760248597; c=relaxed/simple;
	bh=l2nzRy5NLxFup+skwiT1b6JZ2Uomg31kzhWiriqB6rA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hA4ZxlerHN1z+EeCA7ORYE5ySbpgX+Ffj0hqevZkJ4l7Rjc8QoStuZY9LfUJJqa1Uk9a78+4m/T7CFo6dylgeRdWL+Ots0GLLABFcq1nHihOhInphMR6okAXqmgu9L/AbgJC40R/KcJVeD03bpl9Abhk+t9af4MDGj1hdWX88k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZ7kHstU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZ7kHstU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760248595; x=1791784595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2nzRy5NLxFup+skwiT1b6JZ2Uomg31kzhWiriqB6rA=;
  b=XZ7kHstUjq55jKl5xJrTqIH6fsIMmT5oYKHecd4q42DiyhL0Mi7de+wN
   J69+FwekP1w/2cIlI3xo37ybdQ4bbsr3fiRxhmttehwvFq9+chsOkmv1L
   FeP+8Z4w9avfDPiKCfZoQ0iC/KL09kMNaWxeBszPaK6nFnQGN5FQ+rDj6
   45rgw/cD8u/6rafrNtbGIckaE47BndyE/LMyElXA5QeDi+Z/YdczvEvNY
   Tu1oQnbfyj0Mcj1u1CA0f6UP2Sdo2mX0F2ou5TcXejLUEHh/JX3Xz0uHN
   x+CbyZRVpqmii9/SnUoo9YqieP4g+ClwwCC9o15dMzF7MgP5pNREbtJbo
   A==;
X-CSE-ConnectionGUID: MZ6toUzuT960nsMeMUW4bw==
X-CSE-MsgGUID: A3OP6pD+T2yQCGoyikY3gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85042741"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="85042741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 22:56:34 -0700
X-CSE-ConnectionGUID: unZk5amvQN6eBOIq7S6w7Q==
X-CSE-MsgGUID: i8GgWrwKSQaZbz4mz1MgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="185569513"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2025 22:56:33 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7p4J-0004EJ-1B;
	Sun, 12 Oct 2025 05:56:31 +0000
Date: Sun, 12 Oct 2025 13:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 110/110]
 drivers/net/phy/as21xxx.c:432:20: warning: variable 'ret' set but not used
Message-ID: <202510121325.ml2pXWd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   936e993c16c5c695eb2ce063a5a11f122a580727
commit: 936e993c16c5c695eb2ce063a5a11f122a580727 [110/110] net: phy: as21: try the driver from mtk-sdk
config: s390-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121325.ml2pXWd7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121325.ml2pXWd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121325.ml2pXWd7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xxx.c:432:20: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int pos = 0, val, ret = 0, remaining;
                       ^~~
   drivers/net/phy/as21xxx.c: At top level:
   drivers/net/phy/as21xxx.c:1333:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1333:18: note: (near initialization for 'as21xxx_drivers[2].read_status')
   drivers/net/phy/as21xxx.c:1350:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1350:18: note: (near initialization for 'as21xxx_drivers[3].read_status')
   drivers/net/phy/as21xxx.c:1367:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1367:18: note: (near initialization for 'as21xxx_drivers[4].read_status')
   drivers/net/phy/as21xxx.c:1384:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1384:18: note: (near initialization for 'as21xxx_drivers[5].read_status')
   drivers/net/phy/as21xxx.c:1401:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1401:18: note: (near initialization for 'as21xxx_drivers[6].read_status')
   drivers/net/phy/as21xxx.c:1418:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1418:18: note: (near initialization for 'as21xxx_drivers[7].read_status')
   drivers/net/phy/as21xxx.c:1435:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1435:18: note: (near initialization for 'as21xxx_drivers[8].read_status')
   drivers/net/phy/as21xxx.c:1452:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1452:18: note: (near initialization for 'as21xxx_drivers[9].read_status')
   drivers/net/phy/as21xxx.c:1469:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1469:18: note: (near initialization for 'as21xxx_drivers[10].read_status')


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
