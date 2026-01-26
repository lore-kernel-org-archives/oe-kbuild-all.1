Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320483EBF12
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397856; cv=none; b=cXHL9jiVDZCV+OqB802Kpi4uUdX1Gym8QZ99sKcbRsX+p0Is9ady19TtEROb5Bvg5wESUQlTGaok/tAZraQRABw9lYaDACW7m6XkuhnJUxunsHbxqecTnTgwJrC0hLg4FUh0FXWl/Ypcx0MfBvfFhlwH5B7UuXcjdIvcRSNamZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397856; c=relaxed/simple;
	bh=snOps6ePjjpo61jQX56OtZXXFjLlaCDCUEgd0h3IGRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WqJOu+xPPaOqgA895xm6f9DCnAi9lAp86DMi2ptuLNRh6KvT4FqnSG07oTsCOafdFEBLQOGjtCz0vbFW/sahS261m5DxjS54gnQMv5lWWHf613tWnCIEOOkxZHt1xyX/23T3Yyq/MwPfHIcccGcf/5PTygYf2Y/jDUtrkYLtsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfBr37+v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfBr37+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769397854; x=1800933854;
  h=date:from:to:cc:subject:message-id;
  bh=snOps6ePjjpo61jQX56OtZXXFjLlaCDCUEgd0h3IGRg=;
  b=EfBr37+v6SELCaHrhEMmq5bbwxhs0cwCsDn+ankTtI1z0xXCZPY0rDPy
   k7BAN44Y7npejqAI74HZjT42JQfp4VXr4TZ+M6oZjZLZWcZAZehrZPnHu
   Qm6pCTUWn7mootQ1CzNYRHZVDjzF3AAG90+8XBEcNSj1xbyuc9vYf0/fH
   Bd3gNEk5IX4Tb8y9Iuur6j2IwFUp3C8SPfISqN/elGFlpdK3tMnVSOZET
   i7CUuwHvZw2uHDhNu2yWpHaK9S2KKb2nwFDvSPtKbEH1rl4QqWPGWF5Kf
   7qM+m9FsbdsOB/E+Po/PB3op6ALiwePP8oa3tbYIrasFMSIaMaZr7h9fz
   A==;
X-CSE-ConnectionGUID: +kGheBgqSeq0kJm4px9EAQ==
X-CSE-MsgGUID: BBoFgTjpTgCub1DaN8WOQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81209969"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="81209969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 19:24:14 -0800
X-CSE-ConnectionGUID: +q40/S75Tiulto3hrhXaUw==
X-CSE-MsgGUID: LUi7FnP6RGeEXxNcn+ilmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="238825964"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jan 2026 19:24:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkDCz-00000000WqM-2zRy;
	Mon, 26 Jan 2026 03:24:09 +0000
Date: Mon, 26 Jan 2026 11:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1949/9539]
 sound/soc/codecs/rt1320-sdw.c:1572:1: warning: the frame size of 1336 bytes
 is larger than 1280 bytes
Message-ID: <202601261144.Etx561zb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shuming,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 8db50f0fa43efe8799fd40b872dcdd39a90d7549 [1949/9539] ASoC: rt1320: fix the warning the string may be truncated
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601261144.Etx561zb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261144.Etx561zb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261144.Etx561zb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:13,
                    from sound/soc/codecs/rt1320-sdw.c:8:
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_rae_load':
   sound/soc/codecs/rt1320-sdw.c:1492:30: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1492 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   sound/soc/codecs/rt1320-sdw.c:1492:17: note: in expansion of macro 'dev_dbg'
    1492 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
         |                 ^~~~~~~
   sound/soc/codecs/rt1320-sdw.c:1492:51: note: format string is defined here
    1492 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
         |                                                 ~~^
         |                                                   |
         |                                                   long unsigned int
         |                                                 %x
>> sound/soc/codecs/rt1320-sdw.c:1572:1: warning: the frame size of 1336 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1572 | }
         | ^
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_dspfw_load_code':
   sound/soc/codecs/rt1320-sdw.c:1789:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1789 | }
         | ^


vim +1572 sound/soc/codecs/rt1320-sdw.c

da1682d5e8b53a Shuming Fan   2025-12-16  1421  
22937af75abb32 Shuming Fan   2025-12-16  1422  static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
22937af75abb32 Shuming Fan   2025-12-16  1423  {
22937af75abb32 Shuming Fan   2025-12-16  1424  	struct device *dev = &rt1320->sdw_slave->dev;
22937af75abb32 Shuming Fan   2025-12-16  1425  	static const char func_tag[] = "FUNC";
22937af75abb32 Shuming Fan   2025-12-16  1426  	static const char xu_tag[] = "XU";
22937af75abb32 Shuming Fan   2025-12-16  1427  	const struct firmware *rae_fw = NULL;
22937af75abb32 Shuming Fan   2025-12-16  1428  	unsigned int fw_offset;
22937af75abb32 Shuming Fan   2025-12-16  1429  	unsigned char *fw_data;
22937af75abb32 Shuming Fan   2025-12-16  1430  	unsigned char *param_data;
22937af75abb32 Shuming Fan   2025-12-16  1431  	unsigned int addr, size;
22937af75abb32 Shuming Fan   2025-12-16  1432  	unsigned int func, value;
22937af75abb32 Shuming Fan   2025-12-16  1433  	const char *dmi_vendor, *dmi_product, *dmi_sku;
22937af75abb32 Shuming Fan   2025-12-16  1434  	char vendor[128], product[128], sku[128];
22937af75abb32 Shuming Fan   2025-12-16  1435  	char *ptr_vendor, *ptr_product, *ptr_sku;
8db50f0fa43efe Shuming Fan   2025-12-22  1436  	char rae_filename[512];
22937af75abb32 Shuming Fan   2025-12-16  1437  	char tag[5];
22937af75abb32 Shuming Fan   2025-12-16  1438  	int ret = 0;
22937af75abb32 Shuming Fan   2025-12-16  1439  	int retry = 200;
22937af75abb32 Shuming Fan   2025-12-16  1440  
22937af75abb32 Shuming Fan   2025-12-16  1441  	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
22937af75abb32 Shuming Fan   2025-12-16  1442  	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
22937af75abb32 Shuming Fan   2025-12-16  1443  	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
22937af75abb32 Shuming Fan   2025-12-16  1444  
22937af75abb32 Shuming Fan   2025-12-16  1445  	if (dmi_vendor && dmi_product && dmi_sku) {
22937af75abb32 Shuming Fan   2025-12-16  1446  		strscpy(vendor, dmi_vendor);
22937af75abb32 Shuming Fan   2025-12-16  1447  		strscpy(product, dmi_product);
22937af75abb32 Shuming Fan   2025-12-16  1448  		strscpy(sku, dmi_sku);
22937af75abb32 Shuming Fan   2025-12-16  1449  		ptr_vendor = &vendor[0];
22937af75abb32 Shuming Fan   2025-12-16  1450  		ptr_product = &product[0];
22937af75abb32 Shuming Fan   2025-12-16  1451  		ptr_sku = &sku[0];
22937af75abb32 Shuming Fan   2025-12-16  1452  		ptr_vendor = strsep(&ptr_vendor, " ");
22937af75abb32 Shuming Fan   2025-12-16  1453  		ptr_product = strsep(&ptr_product, " ");
22937af75abb32 Shuming Fan   2025-12-16  1454  		ptr_sku = strsep(&ptr_sku, " ");
22937af75abb32 Shuming Fan   2025-12-16  1455  
22937af75abb32 Shuming Fan   2025-12-16  1456  		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
22937af75abb32 Shuming Fan   2025-12-16  1457  			vendor, product, sku);
22937af75abb32 Shuming Fan   2025-12-16  1458  
22937af75abb32 Shuming Fan   2025-12-16  1459  		snprintf(rae_filename, sizeof(rae_filename),
22937af75abb32 Shuming Fan   2025-12-16  1460  			 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
22937af75abb32 Shuming Fan   2025-12-16  1461  		dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
22937af75abb32 Shuming Fan   2025-12-16  1462  	} else {
22937af75abb32 Shuming Fan   2025-12-16  1463  		dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
22937af75abb32 Shuming Fan   2025-12-16  1464  		return -EINVAL;
22937af75abb32 Shuming Fan   2025-12-16  1465  	}
22937af75abb32 Shuming Fan   2025-12-16  1466  
22937af75abb32 Shuming Fan   2025-12-16  1467  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan   2025-12-16  1468  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan   2025-12-16  1469  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
22937af75abb32 Shuming Fan   2025-12-16  1470  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
22937af75abb32 Shuming Fan   2025-12-16  1471  
22937af75abb32 Shuming Fan   2025-12-16  1472  	request_firmware(&rae_fw, rae_filename, dev);
22937af75abb32 Shuming Fan   2025-12-16  1473  	if (rae_fw) {
22937af75abb32 Shuming Fan   2025-12-16  1474  
22937af75abb32 Shuming Fan   2025-12-16  1475  		/* RAE CRC clear */
22937af75abb32 Shuming Fan   2025-12-16  1476  		regmap_write(rt1320->regmap, 0xe80b, 0x0f);
22937af75abb32 Shuming Fan   2025-12-16  1477  
22937af75abb32 Shuming Fan   2025-12-16  1478  		/* RAE stop & CRC disable */
22937af75abb32 Shuming Fan   2025-12-16  1479  		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
22937af75abb32 Shuming Fan   2025-12-16  1480  
c6bca73d699cfe Dan Carpenter 2025-12-20  1481  		while (--retry) {
22937af75abb32 Shuming Fan   2025-12-16  1482  			regmap_read(rt1320->regmap, 0xe83f, &value);
22937af75abb32 Shuming Fan   2025-12-16  1483  			if (value & 0x40)
22937af75abb32 Shuming Fan   2025-12-16  1484  				break;
22937af75abb32 Shuming Fan   2025-12-16  1485  			usleep_range(1000, 1100);
22937af75abb32 Shuming Fan   2025-12-16  1486  		}
22937af75abb32 Shuming Fan   2025-12-16  1487  		if (!retry && !(value & 0x40)) {
22937af75abb32 Shuming Fan   2025-12-16  1488  			dev_err(dev, "%s: RAE is not ready to load\n", __func__);
22937af75abb32 Shuming Fan   2025-12-16  1489  			return -ETIMEDOUT;
22937af75abb32 Shuming Fan   2025-12-16  1490  		}
22937af75abb32 Shuming Fan   2025-12-16  1491  
22937af75abb32 Shuming Fan   2025-12-16 @1492  		dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
22937af75abb32 Shuming Fan   2025-12-16  1493  		regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan   2025-12-16  1494  		for (fw_offset = 0; fw_offset < rae_fw->size;) {
22937af75abb32 Shuming Fan   2025-12-16  1495  
22937af75abb32 Shuming Fan   2025-12-16  1496  			dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
22937af75abb32 Shuming Fan   2025-12-16  1497  
22937af75abb32 Shuming Fan   2025-12-16  1498  			fw_data = (unsigned char *)&rae_fw->data[fw_offset];
22937af75abb32 Shuming Fan   2025-12-16  1499  
22937af75abb32 Shuming Fan   2025-12-16  1500  			memcpy(tag, fw_data, 4);
22937af75abb32 Shuming Fan   2025-12-16  1501  			tag[4] = '\0';
22937af75abb32 Shuming Fan   2025-12-16  1502  			dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
22937af75abb32 Shuming Fan   2025-12-16  1503  			if (strcmp(tag, xu_tag) == 0) {
22937af75abb32 Shuming Fan   2025-12-16  1504  				dev_dbg(dev, "%s: This is a XU tag", __func__);
22937af75abb32 Shuming Fan   2025-12-16  1505  				memcpy(&addr, (fw_data + 4), 4);
22937af75abb32 Shuming Fan   2025-12-16  1506  				memcpy(&size, (fw_data + 8), 4);
22937af75abb32 Shuming Fan   2025-12-16  1507  				param_data = (unsigned char *)(fw_data + 12);
22937af75abb32 Shuming Fan   2025-12-16  1508  
22937af75abb32 Shuming Fan   2025-12-16  1509  				dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
22937af75abb32 Shuming Fan   2025-12-16  1510  
22937af75abb32 Shuming Fan   2025-12-16  1511  				/*
22937af75abb32 Shuming Fan   2025-12-16  1512  				 * UI register ranges from 0x1000d000 to 0x1000d7ff
22937af75abb32 Shuming Fan   2025-12-16  1513  				 * UI registers should be accessed by tuning tool.
22937af75abb32 Shuming Fan   2025-12-16  1514  				 * So, there registers should be cached.
22937af75abb32 Shuming Fan   2025-12-16  1515  				 */
22937af75abb32 Shuming Fan   2025-12-16  1516  				if (addr <= 0x1000d7ff && addr >= 0x1000d000)
22937af75abb32 Shuming Fan   2025-12-16  1517  					regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan   2025-12-16  1518  
22937af75abb32 Shuming Fan   2025-12-16  1519  				rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
22937af75abb32 Shuming Fan   2025-12-16  1520  
22937af75abb32 Shuming Fan   2025-12-16  1521  				regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan   2025-12-16  1522  
22937af75abb32 Shuming Fan   2025-12-16  1523  				fw_offset += (size + 12);
22937af75abb32 Shuming Fan   2025-12-16  1524  			} else if (strcmp(tag, func_tag) == 0) {
22937af75abb32 Shuming Fan   2025-12-16  1525  				dev_err(dev, "%s: This is a FUNC tag", __func__);
22937af75abb32 Shuming Fan   2025-12-16  1526  
22937af75abb32 Shuming Fan   2025-12-16  1527  				memcpy(&func, (fw_data + 4), 4);
22937af75abb32 Shuming Fan   2025-12-16  1528  				memcpy(&value, (fw_data + 8), 4);
22937af75abb32 Shuming Fan   2025-12-16  1529  
22937af75abb32 Shuming Fan   2025-12-16  1530  				dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
22937af75abb32 Shuming Fan   2025-12-16  1531  				if (func == 1)  //DelayMs
22937af75abb32 Shuming Fan   2025-12-16  1532  					msleep(value);
22937af75abb32 Shuming Fan   2025-12-16  1533  
22937af75abb32 Shuming Fan   2025-12-16  1534  				fw_offset += 12;
22937af75abb32 Shuming Fan   2025-12-16  1535  			} else {
22937af75abb32 Shuming Fan   2025-12-16  1536  				dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
22937af75abb32 Shuming Fan   2025-12-16  1537  				break;
22937af75abb32 Shuming Fan   2025-12-16  1538  			}
22937af75abb32 Shuming Fan   2025-12-16  1539  		}
22937af75abb32 Shuming Fan   2025-12-16  1540  
22937af75abb32 Shuming Fan   2025-12-16  1541  		regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan   2025-12-16  1542  		release_firmware(rae_fw);
22937af75abb32 Shuming Fan   2025-12-16  1543  
22937af75abb32 Shuming Fan   2025-12-16  1544  	} else {
22937af75abb32 Shuming Fan   2025-12-16  1545  		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
22937af75abb32 Shuming Fan   2025-12-16  1546  		ret = -EINVAL;
22937af75abb32 Shuming Fan   2025-12-16  1547  		goto _exit_;
22937af75abb32 Shuming Fan   2025-12-16  1548  	}
22937af75abb32 Shuming Fan   2025-12-16  1549  
22937af75abb32 Shuming Fan   2025-12-16  1550  	/* RAE CRC enable */
22937af75abb32 Shuming Fan   2025-12-16  1551  	regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
22937af75abb32 Shuming Fan   2025-12-16  1552  
22937af75abb32 Shuming Fan   2025-12-16  1553  	/* RAE update */
22937af75abb32 Shuming Fan   2025-12-16  1554  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
22937af75abb32 Shuming Fan   2025-12-16  1555  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
22937af75abb32 Shuming Fan   2025-12-16  1556  
22937af75abb32 Shuming Fan   2025-12-16  1557  	/* RAE run */
22937af75abb32 Shuming Fan   2025-12-16  1558  	regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
22937af75abb32 Shuming Fan   2025-12-16  1559  
22937af75abb32 Shuming Fan   2025-12-16  1560  	regmap_read(rt1320->regmap, 0xe80b, &value);
22937af75abb32 Shuming Fan   2025-12-16  1561  	dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
22937af75abb32 Shuming Fan   2025-12-16  1562  
22937af75abb32 Shuming Fan   2025-12-16  1563  	rt1320->rae_update_done = true;
22937af75abb32 Shuming Fan   2025-12-16  1564  
22937af75abb32 Shuming Fan   2025-12-16  1565  _exit_:
22937af75abb32 Shuming Fan   2025-12-16  1566  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan   2025-12-16  1567  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan   2025-12-16  1568  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
22937af75abb32 Shuming Fan   2025-12-16  1569  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
22937af75abb32 Shuming Fan   2025-12-16  1570  
22937af75abb32 Shuming Fan   2025-12-16  1571  	return ret;
22937af75abb32 Shuming Fan   2025-12-16 @1572  }
22937af75abb32 Shuming Fan   2025-12-16  1573  

:::::: The code at line 1572 was first introduced by commit
:::::: 22937af75abb3260c2d563739181f4b61ddac2c1 ASoC: rt1320: support RAE parameters loading

:::::: TO: Shuming Fan <shumingf@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
