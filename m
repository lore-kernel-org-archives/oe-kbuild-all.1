Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26622578
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681684521; x=1713220521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFK46YB6E35nvSSk0+nSN9JswojJ0KiPbXj/Zv0Yx34=;
  b=GYT4GmoxagEKDmzZo/4KpvghHStJ3oYs2gQr1JKgxXZhFAKvSUxJiFgp
   fttyXNzMiClKodUp4xR/YTI80LLcvNII2U4653IOs/xdtEF2onUP1k2Ew
   x807aYGdAZxps4zxwjT5Wv/DxFYG29JA00hUnha210sA6rkutM50B9Gek
   wywGOYSdBIkysAoyGJGbLpK1UphGnmb9n83GYcsKyaKS/q+DEBLiJ0e+z
   UoQg5nQDEqtPbCvMbesLMJrprM63j5epL6D2gpz897QXqe57zXap/sHy2
   /T3+oleXWfz5srEVG7F4+G66G0mt6Dwv3ukpE2axshpGXQpX/9LcrC3Vu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333560140"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="333560140"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 15:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="693059234"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="693059234"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2023 15:35:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poAxq-000bsV-30;
	Sun, 16 Apr 2023 22:35:18 +0000
Date: Mon, 17 Apr 2023 06:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Ruslan V. Sushko" <ruslan.sushko@zii.aero>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [lunn:v6.3-rc6-net-next-zii 7/14]
 drivers/platform/x86/scu.c:1733:17: warning: suggest braces around empty
 body in an 'if' statement
Message-ID: <202304170616.ulhw4wVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc6-net-next-zii
head:   22f16af6fd80efa023ad3545ae6b1cf34516d51a
commit: 1ffad1170a4ee6d401e6c42631dcc590b2178e76 [7/14] Initial support for SCU platform
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230417/202304170616.ulhw4wVg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/lunn/linux/commit/1ffad1170a4ee6d401e6c42631dcc590b2178e76
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc6-net-next-zii
        git checkout 1ffad1170a4ee6d401e6c42631dcc590b2178e76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170616.ulhw4wVg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/scu.c:182:15: warning: no previous prototype for 'scu_get_checksum' [-Wmissing-prototypes]
     182 | unsigned char scu_get_checksum(unsigned char *ptr, int len)
         |               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c:1149:6: warning: no previous prototype for 'pca9538_ext0_teardown' [-Wmissing-prototypes]
    1149 | void pca9538_ext0_teardown(struct i2c_client *client,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c:1156:6: warning: no previous prototype for 'pca9538_ext1_teardown' [-Wmissing-prototypes]
    1156 | void pca9538_ext1_teardown(struct i2c_client *client,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c:1163:6: warning: no previous prototype for 'pca9538_ext2_teardown' [-Wmissing-prototypes]
    1163 | void pca9538_ext2_teardown(struct i2c_client *client,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c:1170:6: warning: no previous prototype for 'pca9538_ext3_teardown' [-Wmissing-prototypes]
    1170 | void pca9538_ext3_teardown(struct i2c_client *client,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c:1177:6: warning: no previous prototype for 'pca9557_teardown' [-Wmissing-prototypes]
    1177 | void pca9557_teardown(struct i2c_client *client,
         |      ^~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c:1184:6: warning: no previous prototype for 'pca9554_teardown' [-Wmissing-prototypes]
    1184 | void pca9554_teardown(struct i2c_client *client,
         |      ^~~~~~~~~~~~~~~~
   drivers/platform/x86/scu.c: In function 'populate_unit_info':
>> drivers/platform/x86/scu.c:1733:17: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1733 |                 ;
         |                 ^
   drivers/platform/x86/scu.c:1736:17: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1736 |                 ;
         |                 ^
   drivers/platform/x86/scu.c: At top level:
   drivers/platform/x86/scu.c:1821:5: warning: no previous prototype for 'nvmem_match' [-Wmissing-prototypes]
    1821 | int nvmem_match(struct device *dev, const void *data)
         |     ^~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from drivers/platform/x86/scu.c:24:
   In function 'strncpy',
       inlined from 'scu_object_store' at drivers/platform/x86/scu.c:268:2:
   include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy' output may be truncated copying between 7 and 11 bytes from a string of length 11 [-Wstringop-truncation]
      68 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:151:16: note: in expansion of macro '__underlying_strncpy'
     151 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~


vim +/if +1733 drivers/platform/x86/scu.c

  1615	
  1616	/*
  1617	 * This is the callback function when a a specifc at24 eeprom is found.
  1618	 * Its reads out the eeprom contents via the read function passed back in via
  1619	 * struct memory_accessor. It then calls part_number_proc, serial_number_proc,
  1620	 * and dom_proc to populate the procfs entries for each specific field.
  1621	 */
  1622	static void populate_unit_info(struct nvmem_device *nvmem,
  1623				       void *context)
  1624	{
  1625		const struct scu_platform_data *pdata = &scu_platform_data[unknown];
  1626		struct scu_data *data = context;
  1627		unsigned char *ptr;
  1628		int i, len;
  1629	
  1630		data->nvmem = nvmem;
  1631	
  1632		ptr = (unsigned char *)&data->eeprom;
  1633		/* Read Data structure from EEPROM */
  1634		if (nvmem_device_read(nvmem, 0x300, sizeof(data->eeprom), ptr) <= 0) {
  1635			dev_err(data->dev, "Failed to read eeprom data\n");
  1636			goto error;
  1637		}
  1638	
  1639		/* EEPROM is accessible, permit write access to it */
  1640		data->eeprom_accessible = true;
  1641	
  1642		/* Special case - eeprom not programmed */
  1643		if (data->eeprom.length == 0xffff && data->eeprom.checksum == 0xff) {
  1644			/* Assume it is SCU3, but report different board type */
  1645			memset(&data->eeprom, '\0', sizeof(data->eeprom));
  1646			data->eeprom.length = cpu_to_le16(SCU_EEPROM_LEN_EEPROM);
  1647			goto unprogrammed;
  1648		}
  1649	
  1650		/* Sanity check */
  1651		if (le16_to_cpu(data->eeprom.length) != SCU_EEPROM_LEN_EEPROM) {
  1652			dev_err(data->dev,
  1653				"Bad eeprom data length: Expected %d, got %d\n",
  1654				SCU_EEPROM_LEN_EEPROM,
  1655				le16_to_cpu(data->eeprom.length));
  1656			goto error;
  1657		}
  1658	
  1659		/* Update platform data based on part number retrieved from EEPROM */
  1660		for (i = 0; i < ARRAY_SIZE(scu_platform_data); i++) {
  1661			const struct scu_platform_data *tpdata = &scu_platform_data[i];
  1662	
  1663			if (tpdata->lru_part_number == NULL)
  1664				continue;
  1665			if (!strncmp(data->eeprom.lru_part_number,
  1666				     tpdata->lru_part_number,
  1667				     strlen(tpdata->lru_part_number))) {
  1668				pdata = tpdata;
  1669				break;
  1670			}
  1671		}
  1672	
  1673		/* Check if we have an SCU2 with a Zii mainboard and update the struct if yes */
  1674		if (pdata->version == scu2 &&
  1675			strnstr(data->eeprom.board_part_number,
  1676				SCU_ZII_BOARD_PARTNUM,
  1677				strlen(SCU_ZII_BOARD_PARTNUM)) != NULL) {
  1678				struct scu_platform_data *newSCU2pdata = &scu_platform_data[scu3];
  1679			newSCU2pdata->board_type = "SCU2 x86";
  1680			newSCU2pdata->lru_part_number = SCU_LRU_PARTNUM_GEN2,
  1681			newSCU2pdata->version = scu2,
  1682			newSCU2pdata->spi_board_info = NULL;
  1683			newSCU2pdata->num_spi_board_info = 0;
  1684			newSCU2pdata->board_part_number = SCU_ZII_BOARD_PARTNUM;
  1685			newSCU2pdata->init = scu3_init;
  1686			newSCU2pdata->remove = scu3_remove;
  1687			pdata = newSCU2pdata;
  1688		}
  1689	
  1690	unprogrammed:
  1691		data->pdata = pdata;
  1692		/*
  1693		 * We know as much as we will ever find out about the platform.
  1694		 * Perform final platform initialization and instantiate additional
  1695		 * I2C devices as well as SPI devices now, prior to validating
  1696		 * the EEPROM checksum.
  1697		 */
  1698		if (pdata->init)
  1699			pdata->init(data);
  1700	
  1701		if (pdata->i2c_board_info)
  1702			scu_instantiate_i2c(data, ARRAY_SIZE(scu_i2c_info_common),
  1703					    pdata->i2c_board_info,
  1704					    pdata->num_i2c_board_info);
  1705	
  1706	#if 0
  1707		if (pdata->spi_board_info)
  1708			scu_instantiate_spi(data, pdata->spi_board_info,
  1709					    pdata->num_spi_board_info);
  1710	#endif
  1711		len = data->pdata->eeprom_len;
  1712	
  1713		/* Validate checksum */
  1714		if (scu_get_checksum(ptr, len)) {
  1715			dev_err(data->dev,
  1716				"EEPROM data checksum error: expected 0, got 0x%x [len=%d]\n",
  1717				scu_get_checksum(ptr, len), len);
  1718			/* TBD: Do we want to clear the eeprom in this case ? */
  1719			goto error_noclean;
  1720		}
  1721	
  1722		/* Create sysfs attributes based on retrieved platform data */
  1723		data->eeprom_valid = true;
  1724		goto done;
  1725	
  1726	error:
  1727		memset(&data->eeprom, '\0', sizeof(data->eeprom));
  1728		data->eeprom.length = cpu_to_le16(SCU_EEPROM_LEN_EEPROM);
  1729	error_noclean:
  1730		data->eeprom_valid = false;
  1731	done:
  1732		if (sysfs_create_group(&data->dev->kobj, &scu_eeprom_group))
> 1733			;
  1734		if (sysfs_create_bin_file(&data->dev->kobj,
  1735					  &scu_eeprom_test_scratchpad_file))
  1736			;
  1737	}
  1738	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
