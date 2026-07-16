Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D033E075C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192052; cv=none; b=cJDjXWyu2j8p6KPPlKfVMkfNGmIRzrRMgg2zqqyd9JX2wQ7Oasq6id6SctxTJKchVKlPqQ498kKLdEGDC20VRLeMgn6emVwuDCsmNr5XYMHvn0BFm7PjXkAAQmtIThiUkJuhtQrXmGhHcQnBXadP2RnLg4EJ353stcQ1+dAAzUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192052; c=relaxed/simple;
	bh=noXy/SH4LcYj5JrrP3Jk9AcxIai7GNU7Fao1OOiD3PA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BLVkxjFbQNDfBuR2AeykAiGxCP1EhMT+e6TywDXy4YKiiET880P8qoR09UU1hD6JkR+LKi3/ePGnc+9cqoe7GlBv0tJIdq6MtBPmBzM6N5XCLRMZEyiKKEL0fPVTtmoi9Kv37TA4mEPWnoApgk4wIGmjVLJ9IbbI1Xl8Y9etfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGlKzLYd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGlKzLYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192050; x=1815728050;
  h=date:from:to:cc:subject:message-id;
  bh=noXy/SH4LcYj5JrrP3Jk9AcxIai7GNU7Fao1OOiD3PA=;
  b=bGlKzLYdAaJUZDr6miwFEJOLXa1J2+NFmG/cgoVEF7a3L4gD692raiTv
   yZmVAhu458vwrnAZOy8JuwfOETxgdlopSs9HrITs0ttBFeIkEkg8hxVnf
   8RtPJ1OeZYvcN3Dae+DtaSaclgHtv+PDeyh3a+k8csmf0qZCUXCTI72fq
   1V+xDqBV4gtEEHhzO9jvVasnDwwHfYKejfARgufMXOZ1H3kFfvuAG/LhI
   I9QoMCPwGRtU20aHnlCaU3x96yTBl7afFuFJeM/hxDxRNclE8Fn3OkYYA
   lYvDs2f1yXZDo/Ko3ac1ru4XYLMu880/KHFMdyFifTIni2Modu47VDXJ0
   g==;
X-CSE-ConnectionGUID: MFQXERlyQCmx+o+ly3h9Ow==
X-CSE-MsgGUID: 9DbTh4cBRcy5hPoE3cVHYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88748045"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88748045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:54:09 -0700
X-CSE-ConnectionGUID: NBLiDqU+SCmzCULR6uSeXA==
X-CSE-MsgGUID: mQHuCsYWSEyAki0dOTQV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255304630"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2026 01:54:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHr1-00000000OaU-3plm;
	Thu, 16 Jul 2026 08:54:03 +0000
Date: Thu, 16 Jul 2026 16:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/rt1320-sdw.c:1439 rt1320_dspfw_load_code()
 warn: inconsistent indenting
Message-ID: <202607161641.MODaAlAh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: da1682d5e8b53a51072552844c551b1b784e52c2 ASoC: rt1320: support calibration and temperature/r0 loading
date:   7 months ago
config: sparc-randconfig-r073-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161641.MODaAlAh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: da1682d5e8b5 ("ASoC: rt1320: support calibration and temperature/r0 loading")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161641.MODaAlAh-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1439 rt1320_dspfw_load_code() warn: inconsistent indenting

vim +1439 sound/soc/codecs/rt1320-sdw.c

  1438	
> 1439		struct snd_soc_dapm_context *dapm =
  1440			snd_soc_component_get_dapm(rt1320->component);
  1441		struct device *dev = &rt1320->sdw_slave->dev;
  1442		unsigned int val, i, fw_offset, fw_ready;
  1443		unsigned int fw_status_addr;
  1444		struct rt1320_dspfwheader *fwheader;
  1445		struct rt1320_imageinfo *ptr_img;
  1446		struct sdw_bpt_section sec[10];
  1447		const struct firmware *fw = NULL;
  1448		unsigned char *fw_data;
  1449		bool dev_fw_match = false;
  1450		static const char hdr_sig[] = "AFX";
  1451		unsigned int hdr_size = 0;
  1452		const char *dmi_vendor, *dmi_product, *dmi_sku;
  1453		char vendor[128], product[128], sku[128];
  1454		char *ptr_vendor, *ptr_product, *ptr_sku;
  1455		char filename[128];
  1456	
  1457		switch (rt1320->dev_id) {
  1458		case RT1320_DEV_ID:
  1459			fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
  1460			break;
  1461		case RT1321_DEV_ID:
  1462			fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
  1463			break;
  1464		default:
  1465			dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
  1466			return;
  1467		}
  1468	
  1469		dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
  1470		dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
  1471		dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
  1472	
  1473		if (dmi_vendor && dmi_product && dmi_sku) {
  1474			strscpy(vendor, dmi_vendor);
  1475			strscpy(product, dmi_product);
  1476			strscpy(sku, dmi_sku);
  1477			ptr_vendor = &vendor[0];
  1478			ptr_product = &product[0];
  1479			ptr_sku = &sku[0];
  1480			ptr_vendor = strsep(&ptr_vendor, " ");
  1481			ptr_product = strsep(&ptr_product, " ");
  1482			ptr_sku = strsep(&ptr_sku, " ");
  1483	
  1484			dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
  1485				vendor, product, sku);
  1486	
  1487			snprintf(filename, sizeof(filename),
  1488				 "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
  1489			dev_dbg(dev, "%s: try to load FW file %s\n", __func__, filename);
  1490		} else if (rt1320->dspfw_name) {
  1491			snprintf(filename, sizeof(filename), "rt1320_%s.dat",
  1492				 rt1320->dspfw_name);
  1493			dev_dbg(dev, "%s: try to load FW file %s\n", __func__, filename);
  1494		} else {
  1495			dev_warn(dev, "%s: Can't find proper FW file name\n", __func__);
  1496			return;
  1497		}
  1498	
  1499		snd_soc_dapm_mutex_lock(dapm);
  1500		regmap_write(rt1320->regmap,
  1501				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1502					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
  1503		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
  1504	
  1505		regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
  1506		fw_ready &= 0x1;
  1507		if (fw_ready) {
  1508			dev_dbg(dev, "%s, DSP FW was already\n", __func__);
  1509			rt1320->fw_load_done = true;
  1510			goto _exit_;
  1511		}
  1512	
  1513		/* change to IRAM */
  1514		regmap_update_bits(rt1320->regmap, 0xf01e, 0x80, 0x00);
  1515	
  1516		request_firmware(&fw, filename, dev);
  1517		if (fw) {
  1518			fwheader = (struct rt1320_dspfwheader *)fw->data;
  1519			dev_dbg(dev, "%s, fw sync = 0x%x, num=%d, crc=0x%x\n", __func__,
  1520				fwheader->sync, fwheader->num, fwheader->crc);
  1521	
  1522			if (fwheader->sync != 0x0a1c5679) {
  1523				dev_err(dev, "%s: FW sync error\n", __func__);
  1524				release_firmware(fw);
  1525				goto _exit_;
  1526			}
  1527	
  1528			fw_offset = sizeof(struct rt1320_dspfwheader) + (sizeof(struct rt1320_imageinfo) * fwheader->num);
  1529			dev_dbg(dev, "%s, fw_offset = 0x%x\n", __func__, fw_offset);
  1530	
  1531			regcache_cache_bypass(rt1320->regmap, true);
  1532	
  1533			for (i = 0; i < fwheader->num; i++) {
  1534				ptr_img = (struct rt1320_imageinfo *)&fw->data[sizeof(struct rt1320_dspfwheader) + (sizeof(struct rt1320_imageinfo) * i)];
  1535	
  1536				dev_dbg(dev, "%s, fw_offset=0x%x, load fw addr=0x%x, size=%d\n", __func__,
  1537					fw_offset, ptr_img->addr, ptr_img->size);
  1538	
  1539				fw_data = (unsigned char *)&fw->data[fw_offset];
  1540	
  1541				/* The binary file has a header of 64 bytes */
  1542				if (memcmp(fw_data, hdr_sig, sizeof(hdr_sig)) == 0)
  1543					hdr_size = 64;
  1544				else
  1545					hdr_size = 0;
  1546	
  1547				sec[i].addr = ptr_img->addr;
  1548				sec[i].len = ptr_img->size - hdr_size;
  1549				sec[i].buf = fw_data + hdr_size;
  1550	
  1551				dev_dbg(dev, "%s, hdr_size=%d, sec[%d].buf[0]=0x%x\n",
  1552					__func__, hdr_size, i, sec[i].buf[0]);
  1553	
  1554				switch (rt1320->dev_id) {
  1555				case RT1320_DEV_ID:
  1556					if (ptr_img->addr == 0x3fc29d80)
  1557						if (fw_data[9] == '0')
  1558							dev_fw_match = true;
  1559					break;
  1560				case RT1321_DEV_ID:
  1561					if (ptr_img->addr == 0x3fc00000)
  1562						if (fw_data[9] == '1')
  1563							dev_fw_match = true;
  1564					break;
  1565				default:
  1566					dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
  1567					goto _exit_;
  1568				}
  1569	
  1570				fw_offset += ptr_img->size;
  1571			}
  1572	
  1573			if (dev_fw_match) {
  1574				dev_dbg(dev, "%s, starting BRA downloading FW..\n", __func__);
  1575				rt1320->bra_msg.dev_num = rt1320->sdw_slave->dev_num;
  1576				rt1320->bra_msg.flags = SDW_MSG_FLAG_WRITE;
  1577				rt1320->bra_msg.sections = fwheader->num;
  1578				rt1320->bra_msg.sec = &sec[0];
  1579				rt1320_data_rw(rt1320, 0, NULL, 0, RT1320_BRA_WRITE);
  1580				dev_dbg(dev, "%s, BRA downloading FW done..\n", __func__);
  1581			}
  1582	
  1583			regcache_cache_bypass(rt1320->regmap, false);
  1584			release_firmware(fw);
  1585	
  1586			if (!dev_fw_match) {
  1587				dev_err(dev, "%s: FW file doesn't match to device\n", __func__);
  1588				goto _exit_;
  1589			}
  1590		} else {
  1591			dev_err(dev, "%s: Failed to load %s firmware\n", __func__, filename);
  1592			goto _exit_;
  1593		}
  1594	
  1595		/* run RAM code */
  1596		regmap_read(rt1320->regmap, 0x3fc2bfc0, &val);
  1597		val |= 0x8;
  1598		regmap_write(rt1320->regmap, 0x3fc2bfc0, val);
  1599	
  1600		/* clear frame counter */
  1601		switch (rt1320->dev_id) {
  1602		case RT1320_DEV_ID:
  1603			regmap_write(rt1320->regmap, 0x3fc2bfcb, 0x00);
  1604			regmap_write(rt1320->regmap, 0x3fc2bfca, 0x00);
  1605			regmap_write(rt1320->regmap, 0x3fc2bfc9, 0x00);
  1606			regmap_write(rt1320->regmap, 0x3fc2bfc8, 0x00);
  1607			break;
  1608		case RT1321_DEV_ID:
  1609			regmap_write(rt1320->regmap, 0x3fc2dfcb, 0x00);
  1610			regmap_write(rt1320->regmap, 0x3fc2dfca, 0x00);
  1611			regmap_write(rt1320->regmap, 0x3fc2dfc9, 0x00);
  1612			regmap_write(rt1320->regmap, 0x3fc2dfc8, 0x00);
  1613			break;
  1614		}
  1615	
  1616		/* enable DSP FW */
  1617		regmap_write(rt1320->regmap, 0xc081, 0xfc);
  1618		regmap_update_bits(rt1320->regmap, 0xf01e, 0x1, 0x0);
  1619	
  1620		/* RsRatio should restore into DSP FW when FW was ready */
  1621		rt1320_invrs_load(rt1320);
  1622	
  1623		/* DSP clock switches to PLL */
  1624		regmap_write(rt1320->regmap, 0xc081, 0xfc);
  1625		/* pass DSP settings */
  1626		regmap_write(rt1320->regmap, 0xc5c3, 0xf3);
  1627		regmap_write(rt1320->regmap, 0xc5c8, 0x05);
  1628	
  1629		rt1320->fw_load_done = true;
  1630	
  1631		pm_runtime_set_autosuspend_delay(dev, 3000);
  1632		pm_runtime_mark_last_busy(dev);
  1633	
  1634	_exit_:
  1635		regmap_write(rt1320->regmap,
  1636				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1637					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
  1638		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
  1639	
  1640		snd_soc_dapm_mutex_unlock(dapm);
  1641	}
  1642	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
