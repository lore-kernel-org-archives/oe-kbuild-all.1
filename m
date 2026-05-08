Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914F637BE9A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224581; cv=none; b=ErwJh0I6E7SKEnw8k3beCD6rE12J3RCXgerxWZd+x0dVJMV+CeqEeNs1E+NlDQALNDhUPn5aLxt+4aB5dKYmhlUuhtmtnzHfCWOYSMuMtF/oLCRINmHCYRowwKzKDDVvHIVk2qRG+ODDQnB/sYEzAVVXlGa6twMQA3jHahRiXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224581; c=relaxed/simple;
	bh=xfIkiiy0rB3TwNZCY5k6PHYEUJoWBmnF+Y1RXiR1KK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NzFD0dShPubtiqifj6ZeOaberIcQyKo/TgKAq/fTXIxyambRfwVzAQMwUoZtDZMQErPM0/5EuuCPeRH6M3S/a1R7K9NGlUDsekwN2b2YHqrFakQJLdvVm5ZCz+1s1rupPcpkN+d6TQbC6dsGwJlzwq33FKF0zaN45zOk9EZL7tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAJL+1fs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAJL+1fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778224575; x=1809760575;
  h=date:from:to:cc:subject:message-id;
  bh=xfIkiiy0rB3TwNZCY5k6PHYEUJoWBmnF+Y1RXiR1KK0=;
  b=GAJL+1fs70BQfwBVYP3my62sdNovfu7nnZ2hm2cWCrGwZ71vsm10lA4i
   oFTXxrmjEv+XuAKxystWHy3O5AM0U+GjHm/Lj9ngZkkcl4aK9zdpN250t
   hEKeKTAS8+hQYLChJ/Ws/ifYwNq4x+B73d5g1M7ILeecDxfFJ4za25YLS
   vxSzW+8Mxe5DDObnSf5STJzbzyHyjQ2Pb1vRrcACCEr8hwHl8HPeXhlE1
   gJLiPhcsahyv9XT35SLAvFLd7mWY+VdzwyHFQ6E3gTuwgQrXNtfULshn7
   6nDRrCyPBuFTySe1nRwOx+s5vTwSMThVaVZHLSPAmLL2yS/4SJruvjvuR
   w==;
X-CSE-ConnectionGUID: OLjL87mvTrSb32TfspHPng==
X-CSE-MsgGUID: pZM+q9hGRZSis3HBZe2z9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78912439"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78912439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:16:14 -0700
X-CSE-ConnectionGUID: nxFjbpWiRcazwvd7oKntHQ==
X-CSE-MsgGUID: plqLuvg4SEeRDOnOJrWbsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="234032310"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 May 2026 00:16:12 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLFRR-000000000pB-2YzA;
	Fri, 08 May 2026 07:16:09 +0000
Date: Fri, 08 May 2026 15:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 152/157]
 drivers/net/phy/as21xx_1.9.1/as21xxx.c:664:40: sparse: sparse: cast to
 restricted __le16
Message-ID: <202605081533.vFKrzpyq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: 3b3c9c1c9610d3d9dc993bcdd5e1228369cdb213 [152/157] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: mips-randconfig-r131-20260507 (https://download.01.org/0day-ci/archive/20260508/202605081533.vFKrzpyq-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081533.vFKrzpyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081533.vFKrzpyq-lkp@intel.com/

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

ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  637  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  638  static int aeon_set_default_value(struct phy_device *phydev)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  639  {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  640  	static const unsigned char base_data[] = {0x32, 0x30, 0x32, 0x33, 0x30, 0x37, 0x31, 0x34};
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  641  	unsigned char bytebuf[16];
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  642  	unsigned short *wdata;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  643  	unsigned int mask;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  644  	int byte_count, wdata_count = 0;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  645  	int pos = 0, val, ret = 0, remaining;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  646  	unsigned char padded_bytes[MEM_WORD_SIZE] = {0};
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  647  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  648  	mask = param1 | 14;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  649  	memcpy(bytebuf, base_data, sizeof(base_data));
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  650  	bytebuf[8] = mask & 0xff;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  651  	bytebuf[9] = (mask >> 8) & 0xff;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  652  	byte_count = 10;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  653  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  654  	wdata = kmalloc(MAX_WDATA_SIZE * sizeof(unsigned short), GFP_KERNEL);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  655  	if (!wdata)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  656  		return -ENOMEM;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  657  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  658  	while (pos + MEM_WORD_SIZE <= byte_count) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  659  		if (wdata_count + 2 > MAX_WDATA_SIZE) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  660  			pr_err("wdata array overflow\n");
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  661  			ret = -ENOSPC;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  662  			goto cleanup;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  663  		}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07 @664  		wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos]);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  665  		wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos + 2]);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  666  		pos += MEM_WORD_SIZE;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  667  	}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  668  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  669  	remaining = byte_count - pos;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  670  	if (remaining > 0) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  671  		if (wdata_count + 2 <= MAX_WDATA_SIZE) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  672  			// Here we just need padded_bytes once, otherwise we need to read from mem
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  673  			memcpy(padded_bytes, &bytebuf[pos], remaining);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  674  			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[0]);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  675  			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[2]);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  676  		}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  677  	}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  678  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  679  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  680  	val |= 0x12;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  681  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  682  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_FW_START_ADDR,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  683  			(u16)(AEON_MEM_DEFAULT_ADDR & 0xFFFF));
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  684  	phy_modify_mmd(phydev, MDIO_MMD_VEND1,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  685  			VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  686  			0x3ffc, 0xc000);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  687  	aeon_cl45_write_burst(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_LOAD,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  688  			(unsigned char *)wdata, wdata_count*2);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  689  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  690  			VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD); //GLB_REG_MDIO_INDIRECT_ADDRCMD
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  691  	val &= 0x3FFF;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  692  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD, val);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  693  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  694  	val &= 0xFFED;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  695  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  696  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  697  cleanup:
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  698  	kfree(wdata);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  699  	return 0;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  700  }
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  701  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  702  static void aeon_set_fast_mdc_timing(struct phy_device *phydev)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  703  {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  704  	if (param1) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  705  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x53, 0xFFFF);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  706  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x54, 0xFFFF);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  707  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x55, 0xFFFF);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  708  	} else {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  709  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x53, 0);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  710  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x54, 0);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  711  		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x55, 0);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  712  	}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  713  }
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  714  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  715  static int aeon_firmware_load(struct phy_device *phydev)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  716  {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  717  	struct device *dev = &phydev->mdio.dev;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  718  	const struct firmware *fw;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  719  	const char *fw_name;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  720  	int ret;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  721  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  722  	ret = of_property_read_string(dev->of_node, "firmware-name",
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  723  				      &fw_name);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  724  	if (ret) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  725  		phydev_err(phydev, "missing DT property 'firmware-name' (%d)\n",
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  726  			   ret);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  727  		return ret;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  728  	}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  729  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  730  	ret = request_firmware(&fw, fw_name, dev);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  731  	if (ret) {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  732  		phydev_err(phydev, "failed to find FW file %s (%d)\n",
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  733  			   fw_name, ret);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  734  		return ret;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  735  	}
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  736  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  737  	ret = aeon_firmware_boot(phydev, fw->data, fw->size);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  738  	release_firmware(fw);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  739  	if (ret)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  740  		phydev_err(phydev, "firmware boot failed for %s (%d)\n",
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  741  			   fw_name, ret);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  742  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  743  	return ret;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  744  }
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  745  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  746  static int aeon_ipc_send_cmd(struct phy_device *phydev,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  747  			     struct as21xxx_priv *priv,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  748  			     u16 cmd, u16 *ret_sts)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  749  {
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  750  	bool curr_parity;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  751  	int ret;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  752  	unsigned int val;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  753  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  754  	/* The IPC sync by using a single parity bit.
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  755  	 * Each CMD have alternately this bit set or clear
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  756  	 * to understand correct flow and packet order.
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  757  	 */
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  758  	curr_parity = priv->parity_status;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  759  	if (priv->parity_status)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  760  		cmd |= AEON_IPC_CMD_PARITY;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  761  	/* Always update parity for next packet */
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  762  	priv->parity_status = !priv->parity_status;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  763  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  764  	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_IPC_CMD, cmd);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  765  	if (ret)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  766  		return ret;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  767  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  768  	/* Wait for packet to be processed */
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  769  	usleep_range(AEON_IPC_DELAY, AEON_IPC_DELAY + 5000);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  770  	/* With no ret_sts, ignore waiting for packet completion
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  771  	 * (ipc parity bit sync)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  772  	 */
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  773  	if (!ret_sts)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  774  		return 0;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  775  	/* Exit condition logic:
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  776  	 * - Wait for parity bit equal
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  777  	 * - Wait for status success, error OR ready
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  778  	 */
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07 @779  	ret = read_poll_timeout(phy_read_mmd, val,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  780  				(FIELD_GET(AEON_IPC_STS_PARITY, val) == curr_parity &&
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  781  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_RCVD &&
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  782  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_PROCESS &&
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  783  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_BUSY) ||
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  784  				(val < 0),
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  785  				10000, 2000000, false,
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  786  				phydev, MDIO_MMD_VEND1, VEND1_IPC_STS);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  787  	if (val < 0)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  788  		ret = val;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  789  	if (ret)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  790  		phydev_err(phydev, "%s fail to polling status failed: %d\n", __func__, ret);
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  791  	*ret_sts = val;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  792  	if ((val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_SUCCESS)
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  793  		return -EINVAL;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  794  
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  795  	return 0;
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  796  }
ef9b1544f8f1e1a drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  797  

:::::: The code at line 664 was first introduced by commit
:::::: ef9b1544f8f1e1ac322564fb4931af5e5dd9aa70 net: phy: add as21xx downstream driver from 6.19 (1.9.1)

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
