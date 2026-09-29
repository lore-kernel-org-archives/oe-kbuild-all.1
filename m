Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D87729BDB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641756; cv=none; b=c0Zmnc0tVSqNlMsxbu7HT/kk0Xoomwt0GARMy1r2fVhGadjWTj+aWNzR/pVX4vxAxSXRaNXGs1ZuR17QMMfSrmKDWJsnEiU3Ri6S+UA5bvTJ43aACMYZs9MeCwJShFyR5tTf0/ZtAlfMiFIM+kIXgSH3Bym2NLO0HgWnXBlmRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641756; c=relaxed/simple;
	bh=FP6q+MBz0iQwEi6bjEI8aGrz8Ypm9KgXCzBLTiqMXiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vger21WgOoLYvLHQwYPJNebx2jpg+DVV2LGAqZ+Db2kcBkFswEe56OdyCRaj5sbNiB6L/E4saM32eFLhFLFI0tAXW2O3H9iQV8sdrqTYjods/Rb7yVNWuQxeJGmBW/ZXvo61o+S5TnQ2hypRa4lCl+JxC9d/YAe99xFrut0fZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/tcBPeO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/tcBPeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790641755; x=1822177755;
  h=date:from:to:cc:subject:message-id;
  bh=FP6q+MBz0iQwEi6bjEI8aGrz8Ypm9KgXCzBLTiqMXiI=;
  b=S/tcBPeOmAW4Mn/RT+yoY7s5Yrei9YuN9gp9c5a64qUn6om3XYOMDfY8
   9RQaMlsrGIQ3P2klS+c6HYv/fgrwLh6u3bav+mO6hrYS4BZtjmr5xnsrW
   iRnlrWM/ktnryA0aU4Bj5zBb+7yFiT696qtsQX0Um7i46xK6XIIWMSOWD
   pJLZekQ5rmw2U/tQWqgnxvACmKCvZfn9xlr5IPvescEDH9fsIkva0h6E+
   Nmc2UPhCMH+4/kvaPnJ196V8rkJorz+k+68UARkBRu1mposJw1KTsfq92
   j9OUziiWCbUFP1Pusv78uP8oFZ1jyUibJezPFkcESn5VHSTCyCXIOV3zz
   g==;
X-CSE-ConnectionGUID: GDQFcQ6ZS8WDklCd9htRpw==
X-CSE-MsgGUID: yuoRE+IMQzCe6f6QKEruvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90571945"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90571945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 17:29:14 -0700
X-CSE-ConnectionGUID: fYE40NcRSe65HIpvL7h6CQ==
X-CSE-MsgGUID: WBTqlwNTRISbBvvb5mCfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="303151103"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2026 17:29:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBLiX-000000001Dn-2nRx;
	Tue, 29 Sep 2026 00:29:09 +0000
Date: Tue, 29 Sep 2026 02:28:10 +0200
From: kernel test robot <lkp@intel.com>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 16/83]
 drivers/hwmon/sht4x.c:434:1: error: version control conflict marker in file
Message-ID: <202609290209.8mUhiIon-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   0ae25ee99babb894654414865fad473ecc902fde
commit: 4182f70ba9298a678543473c6f0a9a44ed6a79e3 [16/83] hwmon: (sht4x) Add support for Sensirion STS4x temperature sensors
config: sh-randconfig-r2201-20260929 (https://download.01.org/0day-ci/archive/20260929/202609290209.8mUhiIon-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290209.8mUhiIon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290209.8mUhiIon-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/sht4x.c: In function 'sht4x_probe':
>> drivers/hwmon/sht4x.c:434:1: error: version control conflict marker in file
     434 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/hwmon/sht4x.c:438:1: error: version control conflict marker in file
     438 | =======
         | ^~~~~~~
   drivers/hwmon/sht4x.c:445:1: error: version control conflict marker in file
     445 | >>>>>>> 3a4bf85531c5 (hwmon: (sht4x) Add support for Sensirion STS4x temperature sensors)
         | ^~~~~~~
>> drivers/hwmon/sht4x.c:445:9: error: invalid suffix 'a4bf85531c5' on integer constant
     445 | >>>>>>> 3a4bf85531c5 (hwmon: (sht4x) Add support for Sensirion STS4x temperature sensors)
         |         ^~~~~~~~~~~~


vim +434 drivers/hwmon/sht4x.c

   409	
   410	static int sht4x_probe(struct i2c_client *client)
   411	{
   412		const struct attribute_group **groups = NULL;
   413		struct device *device = &client->dev;
   414		struct device *hwmon_dev;
   415		struct sht4x_data *data;
   416		u8 cmd[] = {SHT4X_CMD_RESET};
   417		int ret;
   418	
   419		/*
   420		 * we require full i2c support since the sht4x uses multi-byte read and
   421		 * writes as well as multi-byte commands which are not supported by
   422		 * the smbus protocol
   423		 */
   424		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
   425			return -EOPNOTSUPP;
   426	
   427		data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
   428		if (!data)
   429			return -ENOMEM;
   430	
   431		data->chip_id = (uintptr_t)i2c_get_match_data(client);
   432		data->update_interval = SHT4X_MIN_POLL_INTERVAL;
   433		data->client = client;
 > 434	<<<<<<< HEAD
   435		data->heater_power = 200;
   436		data->heater_time = 1000;
   437		data->heating_complete = get_jiffies_64();
   438	=======
   439		data->heating_complete = jiffies;
   440		if (data->chip_id != sts4x) {
   441			data->heater_power = 200;
   442			data->heater_time = 1000;
   443			groups = sht4x_groups;
   444		}
 > 445	>>>>>>> 3a4bf85531c5 (hwmon: (sht4x) Add support for Sensirion STS4x temperature sensors)
   446	
   447		crc8_populate_msb(sht4x_crc8_table, SHT4X_CRC8_POLYNOMIAL);
   448	
   449		ret = i2c_master_send(client, cmd, SHT4X_CMD_LEN);
   450		if (ret < 0)
   451			return ret;
   452		if (ret != SHT4X_CMD_LEN)
   453			return -EIO;
   454	
   455		hwmon_dev = devm_hwmon_device_register_with_info(device,
   456								 client->name,
   457								 data,
   458								 &sht4x_chip_info,
   459								 groups);
   460	
   461		return PTR_ERR_OR_ZERO(hwmon_dev);
   462	}
   463	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
