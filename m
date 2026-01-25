Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7121765B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769332500; cv=none; b=qon7ym5OPd1S90PJAn8YiVpBtI2ITB/tkCeQrRZUTsdyul5S4ee8RGMt8gzFimHWV8ERmr6Z5xL9eEoZWjxstEMHA+OO/69SguFkT412bQBxHXsYul0ETHyX0md4CAkPIfqqpF6zMSdihNymwzMJztblgNN2LoPxz7y64dcD4SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769332500; c=relaxed/simple;
	bh=tRQ/mNWRLdpsXNh3zOjHtc8eCVNp+FtEhTz9agG1KtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mk3qUS8nylLv/eR0l9DfjMGEqNjrP4AdJJyjM2400Hj5b7VPqHjrw4X9xB6n8JoCsibOASgXxwzr+RcnWvDF7TEsHm0uIyf1GuLr8LNR+6WZBlc7tUj7MA4GjVmurp8iMNr1EsfSoNcUK7e+W6y4i7iJQhuPDjAslBjwvtJUHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cM3eFRIq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM3eFRIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769332499; x=1800868499;
  h=date:from:to:cc:subject:message-id;
  bh=tRQ/mNWRLdpsXNh3zOjHtc8eCVNp+FtEhTz9agG1KtE=;
  b=cM3eFRIq8zkjKnG72MuKfWCtXaVi+7WqD11qmhSZp4edUy43A3fuk32u
   9sjMcEFpVpnixZAnZf9z04GsPyz37EOKaTW2qOt1Lpu+w5lNBn7V0ogM4
   a8Qpq5DUYtHqaMvX3tbgjyKnqIfzxpMPb44ddo3NGjmobvwFoPcG2Z0TA
   nUBb4tmFMAiRdcNjWiL7YNZTCNfTnyjzNHdEwVcs0rgJshaDXwM9bZ30y
   bbx55K9S+VzBAJZdE2JG8gFlhYW6cBHsRoeDhCQKv++5TP7vM3CyBIO8P
   JiwBA5/VzrSTQHTM5E7Kxtl0IOA7hbL5tgN2wGGN30gqQrVJRNeJtLz0s
   g==;
X-CSE-ConnectionGUID: p3ygbZf9Tl6a5L9u5dOPjA==
X-CSE-MsgGUID: bj5z/Qw4QXy3SHK+Q3+qkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70588131"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70588131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 01:14:58 -0800
X-CSE-ConnectionGUID: hxI5loUTQoukr+CCElArpg==
X-CSE-MsgGUID: wtN48MFcRaaSp0VO3jUtdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="206665316"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2026 01:14:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjwCs-00000000Vuo-1qPJ;
	Sun, 25 Jan 2026 09:14:54 +0000
Date: Sun, 25 Jan 2026 17:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 131/131]
 drivers/net/phy/as21xxx.c:432:20: warning: variable 'ret' set but not used
Message-ID: <202601251752.35sO5l6y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   b99e3f4753537bac1067bdaa28a34cdb01cc5308
commit: 2a3cf4947bd4995558a9fd1b4df4556bf94f06b3 [131/131] net: phy: as21: try the driver from mtk-sdk
config: parisc-randconfig-001-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251752.35sO5l6y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251752.35sO5l6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251752.35sO5l6y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xxx.c:432:20: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int pos = 0, val, ret = 0, remaining;
                       ^~~
   drivers/net/phy/as21xxx.c: At top level:
   drivers/net/phy/as21xxx.c:1331:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1331:18: note: (near initialization for 'as21xxx_drivers[2].read_status')
   drivers/net/phy/as21xxx.c:1348:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1348:18: note: (near initialization for 'as21xxx_drivers[3].read_status')
   drivers/net/phy/as21xxx.c:1365:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1365:18: note: (near initialization for 'as21xxx_drivers[4].read_status')
   drivers/net/phy/as21xxx.c:1382:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1382:18: note: (near initialization for 'as21xxx_drivers[5].read_status')
   drivers/net/phy/as21xxx.c:1399:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1399:18: note: (near initialization for 'as21xxx_drivers[6].read_status')
   drivers/net/phy/as21xxx.c:1416:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1416:18: note: (near initialization for 'as21xxx_drivers[7].read_status')
   drivers/net/phy/as21xxx.c:1433:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1433:18: note: (near initialization for 'as21xxx_drivers[8].read_status')
   drivers/net/phy/as21xxx.c:1450:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1450:18: note: (near initialization for 'as21xxx_drivers[9].read_status')
   drivers/net/phy/as21xxx.c:1467:18: warning: initialized field overwritten [-Woverride-init]
      .read_status = as21xxx_read_status,
                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/phy/as21xxx.c:1467:18: note: (near initialization for 'as21xxx_drivers[10].read_status')


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
