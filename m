Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF31F1921
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 04:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747197168; cv=none; b=Sfr+XAEi+1DIyUaVVJ8qf89j8ZMFCyLMjHirxRDb3LlcAO5RZRbNT18D96a4BUg9C23TEWDpgZhaLJGvbwqqeiCrkdt5uDdzu7W4+zHuEDloFuXT0gtZbLhJGbeVX/lAT/ewNdJexcMw3sPNLfXuKj6Q53v5JfKIoKrim9ZF+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747197168; c=relaxed/simple;
	bh=kZFs7p8kp3QH8hCrg4UB4whqXv4+PBSg8+0Vu4mo4/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stCHTodzWT43BGliia4uWrg6ZOea0ht5A/s0I/T1qwuvxVB6SisHFDO7wn2YBDvj7w3X/uazaZ9vDiMqiX6m1IoI8mLQbnR/wQk9nFXX+ck6zB8s6pGLSDY9rW1Zl1TKqYgg+8JgqmeTAn0GZoOzSy5UWG42ZU7nDWwfmbWSuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcCFYK4O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcCFYK4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747197165; x=1778733165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZFs7p8kp3QH8hCrg4UB4whqXv4+PBSg8+0Vu4mo4/c=;
  b=dcCFYK4OUjaumTvK5TGqAc/j+dH1ZN+5PiGgVCT/dkfNYW824S3JT4hH
   h2Z7+NzhrptieK6VCdD8/vlzYqXyBnR984U0krLRzec94tZhBRkguSjOK
   2NhRE7yWNFy2W9KET/zuCb5B9WT1i/4yGZ71MnBDORLd5ZBvjJ5WLsJdL
   SsW3Rmfb75TcAwkV/t+bWfC1Tt0fCx5Wvmvj7Qpw3SO0KhoN+HGM9TtbU
   SLd9JlIDXumZJCDCGub/Ufs7CCeUzAhRYZluZIqxFhagv7oeWklk9y42L
   39P4be5SH+QJr5Znkkn8Im3gc6RxsVgmbbKs+tm1FypXkiXPi2qbNUFW2
   w==;
X-CSE-ConnectionGUID: 6NeShrOzSmaKjIVlYYgkBA==
X-CSE-MsgGUID: DGUwNjeyRnaPL9qZp3MAFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48182585"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48182585"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 21:32:42 -0700
X-CSE-ConnectionGUID: 7tino5bKTGm1WqZL0kq3Dg==
X-CSE-MsgGUID: dHxmqwMIQYiWuwEaAyi4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="161217838"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2025 21:32:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF3nL-000Gff-1m;
	Wed, 14 May 2025 04:32:39 +0000
Date: Wed, 14 May 2025 12:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>
Subject: [linux-next:master 9847/10774] extcon-max14526.c:undefined reference
 to `i2c_register_driver'
Message-ID: <202505141248.faRUM6Fb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
commit: c2aeb8647e53c49874429bdb0bf132ce25bd8c63 [9847/10774] extcon: Add basic support for Maxim MAX14526 MUIC
config: arm64-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141248.faRUM6Fb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141248.faRUM6Fb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141248.faRUM6Fb-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/leds/leds-lp50xx.o: in function `lp50xx_driver_init':
>> leds-lp50xx.c:(.init.text+0x24): undefined reference to `i2c_register_driver'
   aarch64-linux-ld: drivers/leds/leds-lp50xx.o: in function `lp50xx_driver_exit':
>> leds-lp50xx.c:(.exit.text+0x10): undefined reference to `i2c_del_driver'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_read':
>> regmap-i2c.c:(.text+0x2c4): undefined reference to `i2c_smbus_read_byte_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_write':
>> regmap-i2c.c:(.text+0x314): undefined reference to `i2c_smbus_write_byte_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_read':
>> regmap-i2c.c:(.text+0x354): undefined reference to `i2c_smbus_read_word_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_read_swapped':
   regmap-i2c.c:(.text+0x3a4): undefined reference to `i2c_smbus_read_word_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_write_swapped':
>> regmap-i2c.c:(.text+0x410): undefined reference to `i2c_smbus_write_word_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_write':
   regmap-i2c.c:(.text+0x454): undefined reference to `i2c_smbus_write_word_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read_reg16':
   regmap-i2c.c:(.text+0x4ac): undefined reference to `i2c_smbus_write_byte_data'
>> aarch64-linux-ld: regmap-i2c.c:(.text+0x4d8): undefined reference to `i2c_smbus_read_byte'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write_reg16':
>> regmap-i2c.c:(.text+0x568): undefined reference to `i2c_smbus_write_i2c_block_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write':
   regmap-i2c.c:(.text+0x5ac): undefined reference to `i2c_smbus_write_i2c_block_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read':
>> regmap-i2c.c:(.text+0x5f8): undefined reference to `i2c_smbus_read_i2c_block_data'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_read':
>> regmap-i2c.c:(.text+0x684): undefined reference to `i2c_transfer'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_gather_write':
   regmap-i2c.c:(.text+0x738): undefined reference to `i2c_transfer'
   aarch64-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_write':
>> regmap-i2c.c:(.text+0x7b0): undefined reference to `i2c_transfer_buffer_flags'
   aarch64-linux-ld: drivers/extcon/extcon-max14526.o: in function `max14526_driver_init':
>> extcon-max14526.c:(.init.text+0x24): undefined reference to `i2c_register_driver'
   aarch64-linux-ld: drivers/extcon/extcon-max14526.o: in function `max14526_driver_exit':
>> extcon-max14526.c:(.exit.text+0x10): undefined reference to `i2c_del_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_I2C
   Depends on [m]: I2C [=m]
   Selected by [y]:
   - EXTCON_MAX14526 [=y] && EXTCON [=y]
   Selected by [m]:
   - EEPROM_AT24 [=m] && I2C [=m] && SYSFS [=y]
   - TOUCHSCREEN_AD7879_I2C [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && TOUCHSCREEN_AD7879 [=y] && I2C [=m]
   - TOUCHSCREEN_CYTTSP5 [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && I2C [=m]
   - TOUCHSCREEN_GOODIX_BERLIN_I2C [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && I2C [=m]
   - TOUCHSCREEN_HIDEEP [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && I2C [=m]
   - TOUCHSCREEN_HYCON_HY46XX [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && I2C [=m]
   - TOUCHSCREEN_EDT_FT5X06 [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && I2C [=m]
   - TOUCHSCREEN_TSC2004 [=m] && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && I2C [=m]
   - SERIAL_MAX310X [=m] && TTY [=y] && HAS_IOMEM [=y] && SPI_MASTER [=y] && I2C [=m]
   - I2C_MUX_LTC4306 [=m] && I2C [=m] && I2C_MUX [=m]
   - PINCTRL_AW9523 [=m] && PINCTRL [=y] && OF [=y] && I2C [=m]
   - GPIO_DS4520 [=m] && GPIOLIB [=y] && I2C [=m]
   - GPIO_PCA953X [=m] && GPIOLIB [=y] && I2C [=m]
   - IP5XXX_POWER [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - CHARGER_ADP5061 [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - BATTERY_CW2015 [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - CHARGER_SBS [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - BATTERY_MAX1720X [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - CHARGER_MAX77976 [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - CHARGER_BQ24257 [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
   - CHARGER_BQ2515X [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
   - CHARGER_BQ25980 [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
   - CHARGER_BQ256XX [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
   - CHARGER_SMB347 [=m] && POWER_SUPPLY [=y] && I2C [=m] && REGULATOR [=y]
   - CHARGER_RT9455 [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
   - CHARGER_RT9467 [=m] && POWER_SUPPLY [=y] && I2C [=m] && GPIOLIB [=y] && REGULATOR [=y]
   - CHARGER_UCS1002 [=m] && POWER_SUPPLY [=y] && I2C [=m] && OF [=y] && REGULATOR [=y]
   - FUEL_GAUGE_MM8013 [=m] && POWER_SUPPLY [=y] && I2C [=m]
   - SENSORS_ADT7470 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_ISL28022 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_JC42 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_LTC2947_I2C [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_LTC2991 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_LTC4260 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_MAX1668 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_MAX31760 [=m] && HWMON [=y] && I2C [=m]
   - MAX31827 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_MAX6621 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_MAX6639 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_MC34VR500 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_LM92 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_LM95234 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_NCT7363 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_NCT7802 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_AMC6821 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_INA2XX [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_INA238 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_INA3221 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_TMP102 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_TMP103 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_TMP464 [=m] && HWMON [=y] && I2C [=m]
   - SENSORS_W83773G [=m] && HWMON [=y] && I2C [=m]
   - MFD_ADP5585 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_ACT8945A [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_SMPRO [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_BCM590XX [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_BD9571MWV [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_AXP20X_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_CS42L43_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_DA9063 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_DA9150 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_GATEWORKS_GSC [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_MP2629 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_88PM805 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_MAX14577 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_MAX77650 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_MAX77686 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_MAX77693 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_MT6360 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_MT6370 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_RT5033 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_RT5120 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_RN5T618 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_SIMPLE_MFD_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_SKY81452 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_LP3943 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - TPS6105X [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_TPS65086 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_TPS65217 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_TPS65218 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_TPS65219 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_TPS65912_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_TPS6594_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_ARIZONA_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_WM8994 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_STMFX [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_KHADAS_MCU [=m] && HAS_IOMEM [=y] && I2C [=m] && (ARCH_MESON [=y] || ARCH_ROCKCHIP [=y] || COMPILE_TEST [=y])
   - MFD_QCOM_PM8008 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
   - MFD_CS40L50_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
   - REGULATOR_88PG86X [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_ACT8865 [=m] && REGULATOR [=y] && I2C [=m] && POWER_SUPPLY [=y]
   - REGULATOR_AW37503 [=m] && REGULATOR [=y] && I2C [=m] && GPIOLIB [=y]
   - REGULATOR_DA9121 [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_FAN53555 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_FAN53880 [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_ISL9305 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_LP8755 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_LTC3676 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_MAX8893 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_MAX20086 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_MAX20411 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_MCP16502 [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_MP5416 [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_MP886X [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_MPQ7920 [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_MT6311 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_PF9453 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_PFUZE100 [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_PV88080 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RAA215300 [=m] && REGULATOR [=y] && COMMON_CLK [=y] && I2C [=m]
   - REGULATOR_RT4801 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RT4803 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RT5759 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RT6160 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RT6190 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RT6245 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RTQ2134 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RTMV20 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_RTQ2208 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_SY8824X [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_TPS51632 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_TPS62360 [=m] && REGULATOR [=y] && I2C [=m]
   - REGULATOR_TPS6286X [=m] && REGULATOR [=y] && I2C [=m] && OF [=y]
   - REGULATOR_TPS65023 [=m] && REGULATOR [=y] && I2C [=m]
   - MAX6959 [=m] && AUXDISPLAY [=y] && I2C [=m]
   - BACKLIGHT_KTZ8866 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m] && I2C [=m]
   - BACKLIGHT_LM3509 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m] && I2C [=m]
   - BACKLIGHT_LM3639 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m] && I2C [=m]
   - USB_HSIC_USB3503 [=m] && USB_SUPPORT [=y] && USB [=y] && I2C [=m]
   - TYPEC_TPS6598X [=m] && USB_SUPPORT [=y] && TYPEC [=m] && I2C [=m]
   - TYPEC_STUSB160X [=m] && USB_SUPPORT [=y] && TYPEC [=m] && (USB_ROLE_SWITCH [=y] || !USB_ROLE_SWITCH [=y]) && I2C [=m]
   - TYPEC_WUSB3801 [=m] && USB_SUPPORT [=y] && TYPEC [=m] && I2C [=m]
   - TYPEC_MUX_IT5205 [=m] && USB_SUPPORT [=y] && TYPEC [=m] && I2C [=m]
   - TYPEC_MUX_NB7VPQ904M [=m] && USB_SUPPORT [=y] && TYPEC [=m] && I2C [=m] && (DRM [=n] || DRM [=n]=n [=n])
   - TYPEC_MUX_PTN36502 [=m] && USB_SUPPORT [=y] && TYPEC [=m] && I2C [=m] && (DRM [=n] || DRM [=n]=n [=n])
   - LEDS_AW2013 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m] && OF [=y]
   - LEDS_LM3532 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m]
   - LEDS_LM3642 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m]
   - LEDS_LM3692X [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m] && OF [=y]
   - LEDS_LP8860 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m] && OF [=y]
   - LEDS_LP8864 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m] && OF [=y]
   - LEDS_TLC591XX [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m]
   - LEDS_LM355x [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m]
   - LEDS_IS31FL319X [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=m]
   - LEDS_LM3601X [=m] && NEW_LEDS [=y] && LEDS_CLASS_FLASH [=m] && LEDS_CLASS [=y] && I2C [=m]
   - LEDS_RT4505 [=m] && NEW_LEDS [=y] && LEDS_CLASS_FLASH [=m] && I2C [=m] && OF [=y] && (V4L2_FLASH_LED_CLASS [=n] || !V4L2_FLASH_LED_CLASS [=n])
   - NVSW_SN2201 [=m] && MELLANOX_PLATFORM [=y] && HWMON [=y] && I2C [=m] && (ACPI [=n] || COMPILE_TEST [=y])
   - COMMON_CLK_SI5341 [=m] && COMMON_CLK [=y] && I2C [=m]
   - COMMON_CLK_SI544 [=m] && COMMON_CLK [=y] && I2C [=m]
   - COMMON_CLK_SI570 [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
   - COMMON_CLK_TPS68470 [=m] && COMMON_CLK [=y] && I2C [=m] && (INTEL_SKL_INT3472 [=n] || COMPILE_TEST [=y])
   - COMMON_CLK_CS2000_CP [=m] && COMMON_CLK [=y] && I2C [=m]
   - COMMON_CLK_RS9_PCIE [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
   - COMMON_CLK_SI521XX [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
   - COMMON_CLK_VC3 [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
   - EXTCON_MAX14577 [=m] && EXTCON [=y] && MFD_MAX14577 [=m]
   - EXTCON_RT8973A [=m] && EXTCON [=y] && I2C [=m]
   - EXTCON_SM5502 [=m] && EXTCON [=y] && I2C [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
