Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B18D333443
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641335; cv=none; b=F4tQQC/1TpgpOP7uctWa/tFI5FZO2nhcG17GBYcNB7wxncdsWNQHAcU2kYTqhvA3KBJoVTaMfZ7Qg0xBRLVYEoX8gdSSaD0rlHDpIvHzjmKAGEO75P8EOiwdk5dx6kMgCSUj+4xAWhhBivCEgBosKP+cBYd/W+lGlEz820L+7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641335; c=relaxed/simple;
	bh=bRRvpNG8HpJ+RIBo0TYu+rfxLJmdr2XpbVPdVdpzJa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t+hKECBVtrLJLqAebzCGUJ03C4nh29C8mzm169LjArau99tsom/RBdj/qPpJHPPZLNe9vrjCSMd+RJd6vQkFo7JB0rBVEWqkZL47phkurhs9RwYYTlqLONLDKdQB74o2Ry9Pt8x1G57bu3NE6EtRVywZAGE+GCD0mYOAehxjILg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VocqtkmF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VocqtkmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763641333; x=1795177333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bRRvpNG8HpJ+RIBo0TYu+rfxLJmdr2XpbVPdVdpzJa4=;
  b=VocqtkmFomdAyGkKvMlu/X1EStmU+BD49x15MNj1QQ+D0AQ2D4wsYUXh
   6+QpYYt79NycQoMR17zDou1Otsjj35Ov7H+ENw+XWg0rXdSU0Cg333gxM
   rKMuyOzLMU4gtGe0pggcdUfNvX1zjCicBVgsHcZTa0ev94Ja9dHP1QL9c
   v2kP5r5TYxd2F2Egu9IhMBnwd/LnfrZYk8CD0366OBaiCv6t/kgLDi+4h
   e3iKL6wjOnYGQHrLGvxonPeapYoJ/+lD1lbp1Ey1tPsVBKXX6D6A+W/Ni
   Yxb1kMzxUDDxwza07SohsnWQcA16NzwVkEf/tFDHSW/rEMKk3imeYTDA2
   Q==;
X-CSE-ConnectionGUID: lFC03LNhSOaCinQgNiRrDA==
X-CSE-MsgGUID: Fyzg2xYPQRi4TruEeiJHyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69563731"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69563731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:22:11 -0800
X-CSE-ConnectionGUID: T9ROtZYKSBm/CdwtoGAeAA==
X-CSE-MsgGUID: g70wN+rFQDuTrsYVdAME/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191029871"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2025 04:22:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM3fn-0003xr-1e;
	Thu, 20 Nov 2025 12:22:03 +0000
Date: Thu, 20 Nov 2025 20:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20251106_ckeepax_add_sdca_class_driver 321/322]
 sound/soc/sdca/sdca_device.c:36:6: error: redefinition of 'sdca_lookup_swft'
Message-ID: <202511202007.Fn4sbBus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20251106_ckeepax_add_sdca_class_driver
head:   782a3359140a882c5593256c7a8b1496ef50ec56
commit: a9afd4638fa2ae315e93079521388fb7421a5781 [321/322] ASoC: SDCA: Add basic SDCA class driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251120/202511202007.Fn4sbBus-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202007.Fn4sbBus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202007.Fn4sbBus-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sdca/sdca_functions.c: In function 'find_sdca_function':
>> sound/soc/sdca/sdca_functions.c:94:35: error: invalid use of undefined type 'struct acpi_device'
      94 |         struct device *dev = &adev->dev;
         |                                   ^~
>> sound/soc/sdca/sdca_functions.c:107:15: error: implicit declaration of function 'acpi_get_local_u64_address'; did you mean 'acpi_get_local_address'? [-Wimplicit-function-declaration]
     107 |         ret = acpi_get_local_u64_address(adev->handle, &addr);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |               acpi_get_local_address
   sound/soc/sdca/sdca_functions.c:107:46: error: invalid use of undefined type 'struct acpi_device'
     107 |         ret = acpi_get_local_u64_address(adev->handle, &addr);
         |                                              ^~
   sound/soc/sdca/sdca_functions.c: At top level:
>> sound/soc/sdca/sdca_functions.c:180:6: error: redefinition of 'sdca_lookup_functions'
     180 | void sdca_lookup_functions(struct sdw_slave *slave)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/soundwire/sdw.h:18,
                    from sound/soc/sdca/sdca_functions.c:16:
   include/sound/sdca.h:70:20: note: previous definition of 'sdca_lookup_functions' with type 'void(struct sdw_slave *)'
      70 | static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_functions.c: In function 'sdca_lookup_functions':
>> sound/soc/sdca/sdca_functions.c:190:9: error: implicit declaration of function 'acpi_dev_for_each_child'; did you mean 'device_for_each_child'? [-Wimplicit-function-declaration]
     190 |         acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         device_for_each_child
--
>> sound/soc/sdca/sdca_device.c:18:6: error: redefinition of 'sdca_lookup_interface_revision'
      18 | void sdca_lookup_interface_revision(struct sdw_slave *slave)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/soundwire/sdw.h:18,
                    from sound/soc/sdca/sdca_device.c:14:
   include/sound/sdca.h:72:20: note: previous definition of 'sdca_lookup_interface_revision' with type 'void(struct sdw_slave *)'
      72 | static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_device.c:36:6: error: redefinition of 'sdca_lookup_swft'
      36 | void sdca_lookup_swft(struct sdw_slave *slave)
         |      ^~~~~~~~~~~~~~~~
   include/sound/sdca.h:71:20: note: previous definition of 'sdca_lookup_swft' with type 'void(struct sdw_slave *)'
      71 | static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
         |                    ^~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_device.c:96:6: error: redefinition of 'sdca_device_quirk_match'
      96 | bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:73:20: note: previous definition of 'sdca_device_quirk_match' with type 'bool(struct sdw_slave *, enum sdca_quirk)' {aka '_Bool(struct sdw_slave *, enum sdca_quirk)'}
      73 | static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/sdca/sdca_function_device.c:89:5: error: redefinition of 'sdca_dev_register_functions'
      89 | int sdca_dev_register_functions(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/soundwire/sdw.h:18,
                    from sound/soc/sdca/sdca_function_device.c:11:
   include/sound/sdca.h:78:19: note: previous definition of 'sdca_dev_register_functions' with type 'int(struct sdw_slave *)'
      78 | static inline int sdca_dev_register_functions(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_function_device.c:109:6: error: redefinition of 'sdca_dev_unregister_functions'
     109 | void sdca_dev_unregister_functions(struct sdw_slave *slave)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:83:20: note: previous definition of 'sdca_dev_unregister_functions' with type 'void(struct sdw_slave *)'
      83 | static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && ACPI
   Selected by [y]:
   - SND_SOC_SDCA_CLASS [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y]


vim +/sdca_lookup_swft +36 sound/soc/sdca/sdca_device.c

3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  17  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16 @18  void sdca_lookup_interface_revision(struct sdw_slave *slave)
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  19  {
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  20  	struct fwnode_handle *fwnode = slave->dev.fwnode;
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  21  
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  22  	/*
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  23  	 * if this property is not present, then the sdca_interface_revision will
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  24  	 * remain zero, which will be considered as 'not defined' or 'invalid'.
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  25  	 */
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  26  	fwnode_property_read_u32(fwnode, "mipi-sdw-sdca-interface-revision",
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  27  				 &slave->sdca_data.interface_revision);
3a513da1ae3397 Pierre-Louis Bossart 2024-10-16  28  }
cdd30ebb1b9f36 Peter Zijlstra       2024-12-02  29  EXPORT_SYMBOL_NS(sdca_lookup_interface_revision, "SND_SOC_SDCA");
fdb22039917717 Pierre-Louis Bossart 2024-10-16  30  
c4d096c3ca4255 Maciej Strozek       2025-10-20  31  static void devm_acpi_table_put(void *ptr)
c4d096c3ca4255 Maciej Strozek       2025-10-20  32  {
c4d096c3ca4255 Maciej Strozek       2025-10-20  33  	acpi_put_table((struct acpi_table_header *)ptr);
c4d096c3ca4255 Maciej Strozek       2025-10-20  34  }
c4d096c3ca4255 Maciej Strozek       2025-10-20  35  
c4d096c3ca4255 Maciej Strozek       2025-10-20 @36  void sdca_lookup_swft(struct sdw_slave *slave)
c4d096c3ca4255 Maciej Strozek       2025-10-20  37  {
c4d096c3ca4255 Maciej Strozek       2025-10-20  38  	acpi_status status;
c4d096c3ca4255 Maciej Strozek       2025-10-20  39  
c4d096c3ca4255 Maciej Strozek       2025-10-20  40  	status = acpi_get_table(ACPI_SIG_SWFT, 0,
c4d096c3ca4255 Maciej Strozek       2025-10-20  41  				(struct acpi_table_header **)&slave->sdca_data.swft);
c4d096c3ca4255 Maciej Strozek       2025-10-20  42  	if (ACPI_FAILURE(status))
c4d096c3ca4255 Maciej Strozek       2025-10-20  43  		dev_info(&slave->dev, "SWFT not available\n");
c4d096c3ca4255 Maciej Strozek       2025-10-20  44  	else
c4d096c3ca4255 Maciej Strozek       2025-10-20  45  		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
c4d096c3ca4255 Maciej Strozek       2025-10-20  46  					 &slave->sdca_data.swft);
c4d096c3ca4255 Maciej Strozek       2025-10-20  47  }
c4d096c3ca4255 Maciej Strozek       2025-10-20  48  EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
c4d096c3ca4255 Maciej Strozek       2025-10-20  49  
fdb22039917717 Pierre-Louis Bossart 2024-10-16  50  static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
fdb22039917717 Pierre-Louis Bossart 2024-10-16  51  {
fdb22039917717 Pierre-Louis Bossart 2024-10-16  52  	struct sdw_slave_id *id = &slave->id;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  53  	int i;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  54  
fdb22039917717 Pierre-Louis Bossart 2024-10-16  55  	/*
fdb22039917717 Pierre-Louis Bossart 2024-10-16  56  	 * The RT712_VA relies on the v06r04 draft, and the
fdb22039917717 Pierre-Louis Bossart 2024-10-16  57  	 * RT712_VB on a more recent v08r01 draft.
fdb22039917717 Pierre-Louis Bossart 2024-10-16  58  	 */
fdb22039917717 Pierre-Louis Bossart 2024-10-16  59  	if (slave->sdca_data.interface_revision < 0x0801)
fdb22039917717 Pierre-Louis Bossart 2024-10-16  60  		return false;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  61  
fdb22039917717 Pierre-Louis Bossart 2024-10-16  62  	if (id->mfg_id != 0x025d)
fdb22039917717 Pierre-Louis Bossart 2024-10-16  63  		return false;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  64  
fdb22039917717 Pierre-Louis Bossart 2024-10-16  65  	if (id->part_id != 0x712 &&
fdb22039917717 Pierre-Louis Bossart 2024-10-16  66  	    id->part_id != 0x713 &&
fdb22039917717 Pierre-Louis Bossart 2024-10-16  67  	    id->part_id != 0x716 &&
fdb22039917717 Pierre-Louis Bossart 2024-10-16  68  	    id->part_id != 0x717)
fdb22039917717 Pierre-Louis Bossart 2024-10-16  69  		return false;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  70  
fdb22039917717 Pierre-Louis Bossart 2024-10-16  71  	for (i = 0; i < slave->sdca_data.num_functions; i++) {
629dd55cf77bd3 Charles Keepax       2025-02-05  72  		if (slave->sdca_data.function[i].type == SDCA_FUNCTION_TYPE_SMART_MIC)
fdb22039917717 Pierre-Louis Bossart 2024-10-16  73  			return true;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  74  	}
fdb22039917717 Pierre-Louis Bossart 2024-10-16  75  
fdb22039917717 Pierre-Louis Bossart 2024-10-16  76  	return false;
fdb22039917717 Pierre-Louis Bossart 2024-10-16  77  }
fdb22039917717 Pierre-Louis Bossart 2024-10-16  78  
28edfaa10ca1b3 Maciej Strozek       2025-09-01  79  static bool sdca_device_quirk_skip_func_type_patching(struct sdw_slave *slave)
28edfaa10ca1b3 Maciej Strozek       2025-09-01  80  {
28edfaa10ca1b3 Maciej Strozek       2025-09-01  81  	const char *vendor, *sku;
28edfaa10ca1b3 Maciej Strozek       2025-09-01  82  
28edfaa10ca1b3 Maciej Strozek       2025-09-01  83  	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
28edfaa10ca1b3 Maciej Strozek       2025-09-01  84  	sku = dmi_get_system_info(DMI_PRODUCT_SKU);
28edfaa10ca1b3 Maciej Strozek       2025-09-01  85  
28edfaa10ca1b3 Maciej Strozek       2025-09-01  86  	if (vendor && sku &&
28edfaa10ca1b3 Maciej Strozek       2025-09-01  87  	    !strcmp(vendor, "Dell Inc.") &&
28edfaa10ca1b3 Maciej Strozek       2025-09-01  88  	    (!strcmp(sku, "0C62") || !strcmp(sku, "0C63") || !strcmp(sku, "0C6B")) &&
28edfaa10ca1b3 Maciej Strozek       2025-09-01  89  	    slave->sdca_data.interface_revision == 0x061c &&
28edfaa10ca1b3 Maciej Strozek       2025-09-01  90  	    slave->id.mfg_id == 0x01fa && slave->id.part_id == 0x4243)
28edfaa10ca1b3 Maciej Strozek       2025-09-01  91  		return true;
28edfaa10ca1b3 Maciej Strozek       2025-09-01  92  
28edfaa10ca1b3 Maciej Strozek       2025-09-01  93  	return false;
28edfaa10ca1b3 Maciej Strozek       2025-09-01  94  }
28edfaa10ca1b3 Maciej Strozek       2025-09-01  95  
fdb22039917717 Pierre-Louis Bossart 2024-10-16 @96  bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)

:::::: The code at line 36 was first introduced by commit
:::::: c4d096c3ca425562192a3626c30e82651d0f2c1c ASoC: SDCA: Add SDCA FDL data parsing

:::::: TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
