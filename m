Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7711343D66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801359; cv=none; b=BvmaD/1dqzcAWRhWRUANnrCU5Nd7Xapqz7GOsZxVGQQ18mCBnx9NcaQ3cWoha+4/EwfjANgIEtkVIvlQs13zMz1IQiTY2U5t23+fgKE3PZTQlWbJ2prmBN5fck/km6NMjndwSI/ugMVvYptbXgTd7V5oIyW2gv0zcVEGwSARodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801359; c=relaxed/simple;
	bh=8tH+QDRCGHslccNcQfnqVQApFQvui5y5VuGJiQpdPKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8oUaUaywh5U8gay1awWKt9wSR0jggnIKP7A3cvYfqT/NtLqCrjuClE+3XhB3s2upHsfWFWyqIGMhNK4ZzKTdrZx7o5iI1Me8cJLeMlF81yJ+GObzEsdKJ+M+KCaaHdNM1vT8kyyB9GYp0mBsGOsvI0IhY/7rxTuJtgldo5CNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jclPC6oo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jclPC6oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782801351; x=1814337351;
  h=date:from:to:cc:subject:message-id;
  bh=8tH+QDRCGHslccNcQfnqVQApFQvui5y5VuGJiQpdPKs=;
  b=jclPC6oo83oxBCaoDJ3CxIpjEF0zzEXaOaueWnNodFjlpwziDEPhRnJu
   9ednseFNp+8GTJiikCtUhkBK7g5xJnz7qnrcibOJLunc0Zbg9YOUdcxKA
   JK8+TSTT56XAM/sHMeN0qhDi1LBfhRi15bSZMN0OEP0+Epd1zfpwXaXui
   7tPYtmrpPt/vqYxYBUopcvfItoAZSkIPI+rD8cQDWv47yTmAhahqMxx9R
   FEk6YAqlXPu5jsZHQOWQOLCVeih8ApiGykSNLjE3cB3Z6MSzIOwtRVxIe
   YErJz/cXxJ/mN6fqM1yx0SQ0IzCZgTmGETnly892NFsWK58/MbxAeAFQx
   Q==;
X-CSE-ConnectionGUID: jxIi5IDpTUaiZHi3XalDfQ==
X-CSE-MsgGUID: 8G3l2yOjQpGL78LGVWiVGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83563066"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83563066"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 23:35:49 -0700
X-CSE-ConnectionGUID: pTWf/z/ySFmFFOKk6sTWKQ==
X-CSE-MsgGUID: gD94AVEuSW2LQLgaaRyrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="249539658"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jun 2026 23:35:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weS4P-0000000083F-1kOU;
	Tue, 30 Jun 2026 06:35:45 +0000
Date: Tue, 30 Jun 2026 14:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 137/160]
 drivers/net/phy/as21xx_1.9.1/as21xxx.c:664:40: sparse: sparse: cast to
 restricted __le16
Message-ID: <202606301450.VnloERVb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: e423349afa350a784a8c5293ef243e13a60b61c6 [137/160] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: powerpc64-randconfig-r131-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301450.VnloERVb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301450.VnloERVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301450.VnloERVb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/as21xx_1.9.1/as21xxx.c:664:40: sparse: sparse: cast to restricted __le16
   drivers/net/phy/as21xx_1.9.1/as21xxx.c:665:40: sparse: sparse: cast to restricted __le16
   drivers/net/phy/as21xx_1.9.1/as21xxx.c:674:48: sparse: sparse: cast to restricted __le16
   drivers/net/phy/as21xx_1.9.1/as21xxx.c:675:48: sparse: sparse: cast to restricted __le16
>> drivers/net/phy/as21xx_1.9.1/as21xxx.c:779:15: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/phy/as21xx_1.9.1/as21xxx.c:779:15: sparse: signed value source
   drivers/net/phy/as21xx_1.9.1/as21xxx.c:787:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/phy/as21xx_1.9.1/as21xxx.c:779:15: sparse: signed value source

vim +664 drivers/net/phy/as21xx_1.9.1/as21xxx.c

b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  637  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  638  static int aeon_set_default_value(struct phy_device *phydev)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  639  {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  640  	static const unsigned char base_data[] = {0x32, 0x30, 0x32, 0x33, 0x30, 0x37, 0x31, 0x34};
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  641  	unsigned char bytebuf[16];
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  642  	unsigned short *wdata;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  643  	unsigned int mask;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  644  	int byte_count, wdata_count = 0;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  645  	int pos = 0, val, ret = 0, remaining;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  646  	unsigned char padded_bytes[MEM_WORD_SIZE] = {0};
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  647  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  648  	mask = param1 | 14;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  649  	memcpy(bytebuf, base_data, sizeof(base_data));
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  650  	bytebuf[8] = mask & 0xff;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  651  	bytebuf[9] = (mask >> 8) & 0xff;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  652  	byte_count = 10;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  653  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  654  	wdata = kmalloc(MAX_WDATA_SIZE * sizeof(unsigned short), GFP_KERNEL);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  655  	if (!wdata)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  656  		return -ENOMEM;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  657  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  658  	while (pos + MEM_WORD_SIZE <= byte_count) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  659  		if (wdata_count + 2 > MAX_WDATA_SIZE) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  660  			pr_err("wdata array overflow\n");
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  661  			ret = -ENOSPC;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  662  			goto cleanup;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  663  		}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07 @664  		wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos]);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  665  		wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos + 2]);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  666  		pos += MEM_WORD_SIZE;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  667  	}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  668  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  669  	remaining = byte_count - pos;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  670  	if (remaining > 0) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  671  		if (wdata_count + 2 <= MAX_WDATA_SIZE) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  672  			// Here we just need padded_bytes once, otherwise we need to read from mem
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  673  			memcpy(padded_bytes, &bytebuf[pos], remaining);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  674  			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[0]);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  675  			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[2]);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  676  		}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  677  	}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  678  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  679  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  680  	val |= 0x12;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  681  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  682  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_FW_START_ADDR,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  683  			(u16)(AEON_MEM_DEFAULT_ADDR & 0xFFFF));
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  684  	phy_modify_mmd(phydev, MDIO_MMD_VEND1,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  685  			VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  686  			0x3ffc, 0xc000);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  687  	aeon_cl45_write_burst(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_LOAD,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  688  			(unsigned char *)wdata, wdata_count*2);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  689  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  690  			VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD); //GLB_REG_MDIO_INDIRECT_ADDRCMD
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  691  	val &= 0x3FFF;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  692  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD, val);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  693  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  694  	val &= 0xFFED;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  695  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  696  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  697  cleanup:
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  698  	kfree(wdata);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  699  	return 0;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  700  }
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  701  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  702  static void aeon_set_fast_mdc_timing(struct phy_device *phydev)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  703  {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  704  	if (param1) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  705  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x53, 0xFFFF);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  706  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x54, 0xFFFF);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  707  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x55, 0xFFFF);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  708  	} else {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  709  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x53, 0);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  710  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x54, 0);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  711  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x55, 0);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  712  	}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  713  }
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  714  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  715  static int aeon_firmware_load(struct phy_device *phydev)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  716  {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  717  	struct device *dev = &phydev->mdio.dev;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  718  	const struct firmware *fw;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  719  	const char *fw_name;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  720  	int ret;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  721  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  722  	ret = of_property_read_string(dev->of_node, "firmware-name",
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  723  				      &fw_name);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  724  	if (ret) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  725  		phydev_err(phydev, "missing DT property 'firmware-name' (%d)\n",
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  726  			   ret);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  727  		return ret;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  728  	}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  729  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  730  	ret = request_firmware(&fw, fw_name, dev);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  731  	if (ret) {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  732  		phydev_err(phydev, "failed to find FW file %s (%d)\n",
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  733  			   fw_name, ret);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  734  		return ret;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  735  	}
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  736  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  737  	ret = aeon_firmware_boot(phydev, fw->data, fw->size);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  738  	release_firmware(fw);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  739  	if (ret)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  740  		phydev_err(phydev, "firmware boot failed for %s (%d)\n",
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  741  			   fw_name, ret);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  742  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  743  	return ret;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  744  }
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  745  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  746  static int aeon_ipc_send_cmd(struct phy_device *phydev,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  747  			     struct as21xxx_priv *priv,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  748  			     u16 cmd, u16 *ret_sts)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  749  {
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  750  	bool curr_parity;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  751  	int ret;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  752  	unsigned int val;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  753  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  754  	/* The IPC sync by using a single parity bit.
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  755  	 * Each CMD have alternately this bit set or clear
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  756  	 * to understand correct flow and packet order.
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  757  	 */
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  758  	curr_parity = priv->parity_status;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  759  	if (priv->parity_status)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  760  		cmd |= AEON_IPC_CMD_PARITY;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  761  	/* Always update parity for next packet */
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  762  	priv->parity_status = !priv->parity_status;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  763  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  764  	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_IPC_CMD, cmd);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  765  	if (ret)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  766  		return ret;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  767  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  768  	/* Wait for packet to be processed */
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  769  	usleep_range(AEON_IPC_DELAY, AEON_IPC_DELAY + 5000);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  770  	/* With no ret_sts, ignore waiting for packet completion
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  771  	 * (ipc parity bit sync)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  772  	 */
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  773  	if (!ret_sts)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  774  		return 0;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  775  	/* Exit condition logic:
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  776  	 * - Wait for parity bit equal
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  777  	 * - Wait for status success, error OR ready
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  778  	 */
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07 @779  	ret = read_poll_timeout(phy_read_mmd, val,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  780  				(FIELD_GET(AEON_IPC_STS_PARITY, val) == curr_parity &&
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  781  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_RCVD &&
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  782  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_PROCESS &&
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  783  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_BUSY) ||
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  784  				(val < 0),
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  785  				10000, 2000000, false,
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  786  				phydev, MDIO_MMD_VEND1, VEND1_IPC_STS);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  787  	if (val < 0)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  788  		ret = val;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  789  	if (ret)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  790  		phydev_err(phydev, "%s fail to polling status failed: %d\n", __func__, ret);
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  791  	*ret_sts = val;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  792  	if ((val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_SUCCESS)
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  793  		return -EINVAL;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  794  
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  795  	return 0;
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  796  }
b730d693792d69 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  797  

:::::: The code at line 664 was first introduced by commit
:::::: b730d693792d69a7614babcf39fbfa4188a06f88 net: phy: add as21xx downstream driver from 6.19 (1.9.1)

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
