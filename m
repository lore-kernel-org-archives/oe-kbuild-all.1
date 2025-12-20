Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8526FA67
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243479; cv=none; b=ejB9ct9FYxydtf0oRnxarKxrRwL75+hgcFGW2E6pRSwXgy5Yh/4znC8Ve1tjvypu0dVBS2WQV+BCFsHrJ01UTp/rSHk9rt/E8XzHUPmOXgRYT6Rn8cOWxD2cEMF/oE/gPdW8dr8XxJXBWtv0BMUR1x9LhirrCb8DIeq0/jnr2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243479; c=relaxed/simple;
	bh=W9Sv5/z748s5cgzcvHrOgzu0xrueV0psZqn/Fo1EOU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBrQJr9ohPb6uNAVXsG6vkvLSOgqmK3+Z+98AzBhVwnz9cTY8vSa+HUxFwZV+ZOl0GL+KJy/KG7aWwheUZTNSmscavlYg7nI3ZBfhPM2t2P3TJkClZoES+6OzsndfTxEDkVj0ib03SrWpPz2NPEKoRPHgdoKcX/pwoSbxRTEooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYaDZ/bH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYaDZ/bH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243477; x=1797779477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9Sv5/z748s5cgzcvHrOgzu0xrueV0psZqn/Fo1EOU0=;
  b=KYaDZ/bHa96Y36eqDKprukTO2paS92OLdLKUKqkoZDNtIpxtG0JYElJI
   7OdsBIT2fsIlToPZmtoNovoag5NA2l+MlkySg2jiw5LzYVUDT8QQNzaGh
   6yMewpCXNAlFb6mVR8RA5GqcNDw6yObXy+pzzLKLpR6VgjZhUIkFSNzqA
   m21lS1LyvX99m+GzdgwPrg3ikQp2nK8PwSApex06+XOZtmzTDW/6wT5Lb
   aVnFwJrgjyBklUf/6U76/cuYB7fyApfd8DS5PmvJntu/8+yMbexqO+sVo
   N9B0ER0yg9IbvT0NVqjV5JqxwAM11mfRYMQBqr6H3iL51XU1gylXlaQyz
   w==;
X-CSE-ConnectionGUID: o3Ou9jMBQyaySAfNJeCFQQ==
X-CSE-MsgGUID: 1ydJx/9DTMqXtYI35Ybf1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68255134"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68255134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:11:14 -0800
X-CSE-ConnectionGUID: 8jrl8cxoS7OLasNdMXNXBw==
X-CSE-MsgGUID: Lqh65yQjQhqXXsw8omFZ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199103072"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 07:11:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWybu-000000004io-0uzW;
	Sat, 20 Dec 2025 15:11:10 +0000
Date: Sat, 20 Dec 2025 23:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-6.20 21/38]
 sound/soc/codecs/rt1320-sdw.c:1496:30: warning: format '%lx' expects
 argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka
 'unsigned int'}
Message-ID: <202512202349.KaqcoBGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.20
head:   dc8d1ba537c0bb4da91695b473dbe9a404f7ed7e
commit: 22937af75abb3260c2d563739181f4b61ddac2c1 [21/38] ASoC: rt1320: support RAE parameters loading
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251220/202512202349.KaqcoBGY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202349.KaqcoBGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202349.KaqcoBGY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:13,
                    from sound/soc/codecs/rt1320-sdw.c:8:
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_rae_load':
>> sound/soc/codecs/rt1320-sdw.c:1496:30: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1496 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
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
   sound/soc/codecs/rt1320-sdw.c:1496:17: note: in expansion of macro 'dev_dbg'
    1496 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
         |                 ^~~~~~~
   sound/soc/codecs/rt1320-sdw.c:1496:51: note: format string is defined here
    1496 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
         |                                                 ~~^
         |                                                   |
         |                                                   long unsigned int
         |                                                 %x


vim +1496 sound/soc/codecs/rt1320-sdw.c

  1425	
  1426	static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
  1427	{
  1428		struct device *dev = &rt1320->sdw_slave->dev;
  1429		static const char func_tag[] = "FUNC";
  1430		static const char xu_tag[] = "XU";
  1431		const struct firmware *rae_fw = NULL;
  1432		unsigned int fw_offset;
  1433		unsigned char *fw_data;
  1434		unsigned char *param_data;
  1435		unsigned int addr, size;
  1436		unsigned int func, value;
  1437		const char *dmi_vendor, *dmi_product, *dmi_sku;
  1438		char vendor[128], product[128], sku[128];
  1439		char *ptr_vendor, *ptr_product, *ptr_sku;
  1440		char rae_filename[128];
  1441		char tag[5];
  1442		int ret = 0;
  1443		int retry = 200;
  1444	
  1445		dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
  1446		dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
  1447		dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
  1448	
  1449		if (dmi_vendor && dmi_product && dmi_sku) {
  1450			strscpy(vendor, dmi_vendor);
  1451			strscpy(product, dmi_product);
  1452			strscpy(sku, dmi_sku);
  1453			ptr_vendor = &vendor[0];
  1454			ptr_product = &product[0];
  1455			ptr_sku = &sku[0];
  1456			ptr_vendor = strsep(&ptr_vendor, " ");
  1457			ptr_product = strsep(&ptr_product, " ");
  1458			ptr_sku = strsep(&ptr_sku, " ");
  1459	
  1460			dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
  1461				vendor, product, sku);
  1462	
  1463			snprintf(rae_filename, sizeof(rae_filename),
  1464				 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
  1465			dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
  1466		} else {
  1467			dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
  1468			return -EINVAL;
  1469		}
  1470	
  1471		regmap_write(rt1320->regmap,
  1472				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1473					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
  1474		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
  1475	
  1476		request_firmware(&rae_fw, rae_filename, dev);
  1477		if (rae_fw) {
  1478	
  1479			/* RAE CRC clear */
  1480			regmap_write(rt1320->regmap, 0xe80b, 0x0f);
  1481	
  1482			/* RAE stop & CRC disable */
  1483			regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
  1484	
  1485			while (retry--) {
  1486				regmap_read(rt1320->regmap, 0xe83f, &value);
  1487				if (value & 0x40)
  1488					break;
  1489				usleep_range(1000, 1100);
  1490			}
  1491			if (!retry && !(value & 0x40)) {
  1492				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
  1493				return -ETIMEDOUT;
  1494			}
  1495	
> 1496			dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
  1497			regcache_cache_bypass(rt1320->regmap, true);
  1498			for (fw_offset = 0; fw_offset < rae_fw->size;) {
  1499	
  1500				dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
  1501	
  1502				fw_data = (unsigned char *)&rae_fw->data[fw_offset];
  1503	
  1504				memcpy(tag, fw_data, 4);
  1505				tag[4] = '\0';
  1506				dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
  1507				if (strcmp(tag, xu_tag) == 0) {
  1508					dev_dbg(dev, "%s: This is a XU tag", __func__);
  1509					memcpy(&addr, (fw_data + 4), 4);
  1510					memcpy(&size, (fw_data + 8), 4);
  1511					param_data = (unsigned char *)(fw_data + 12);
  1512	
  1513					dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
  1514	
  1515					/*
  1516					 * UI register ranges from 0x1000d000 to 0x1000d7ff
  1517					 * UI registers should be accessed by tuning tool.
  1518					 * So, there registers should be cached.
  1519					 */
  1520					if (addr <= 0x1000d7ff && addr >= 0x1000d000)
  1521						regcache_cache_bypass(rt1320->regmap, false);
  1522	
  1523					rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
  1524	
  1525					regcache_cache_bypass(rt1320->regmap, true);
  1526	
  1527					fw_offset += (size + 12);
  1528				} else if (strcmp(tag, func_tag) == 0) {
  1529					dev_err(dev, "%s: This is a FUNC tag", __func__);
  1530	
  1531					memcpy(&func, (fw_data + 4), 4);
  1532					memcpy(&value, (fw_data + 8), 4);
  1533	
  1534					dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
  1535					if (func == 1)  //DelayMs
  1536						msleep(value);
  1537	
  1538					fw_offset += 12;
  1539				} else {
  1540					dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
  1541					break;
  1542				}
  1543			}
  1544	
  1545			regcache_cache_bypass(rt1320->regmap, false);
  1546			release_firmware(rae_fw);
  1547	
  1548		} else {
  1549			dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
  1550			ret = -EINVAL;
  1551			goto _exit_;
  1552		}
  1553	
  1554		/* RAE CRC enable */
  1555		regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
  1556	
  1557		/* RAE update */
  1558		regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
  1559		regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
  1560	
  1561		/* RAE run */
  1562		regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
  1563	
  1564		regmap_read(rt1320->regmap, 0xe80b, &value);
  1565		dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
  1566	
  1567		rt1320->rae_update_done = true;
  1568	
  1569	_exit_:
  1570		regmap_write(rt1320->regmap,
  1571				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1572					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
  1573		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
  1574	
  1575		return ret;
  1576	}
  1577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
