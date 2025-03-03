Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E91D8DEE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032579; cv=none; b=NCE4SdRkXsOnDN9K3LqzAwvYsDmmK4LvwI2CSe53rZl/+afG4Se70H6I/ofkAidNCPMHKrxDAk4swKRNAz49o08pZ0/rxEjCaRF2MbOM2TOUbtKRkEHIVmatisHDOwhLVfvTu/R2ayFfhvItBMzX9Kadx1wBztvlJ/1FfVyW8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032579; c=relaxed/simple;
	bh=6iXpJFGgQVk1rjjSg4wDzdRMcqiFL6IltKo+76U+efk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbAwOGRiX1KRia9xqQgmw2K9UaCxrcidQEcjm2s1c7tnlauVhEbZomoxE7sSx8C7HybHk56ndhPivadsGpk+KxGMyT4q3LCRz5HdkNjqjGm5yMv/5d4w1tSBsVgk9MCJmJHLHLEqjQgmiQlK3c5wk5YZl8+/UfM+q7+xgd240Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UImRqpsi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UImRqpsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741032577; x=1772568577;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6iXpJFGgQVk1rjjSg4wDzdRMcqiFL6IltKo+76U+efk=;
  b=UImRqpsiYJrE/qU/VTwxPr5dyusNzWceV25Vr6k7u02UwYqdUzhjbHE6
   V0+wgsrIuA/Mr8q+V2wss1VbBiiqAHqXpHi9nmE/8qyHA/xHLrx8kN883
   KRlCzD71w7yOkkc98OPPF/AlS0OrKdivGf1BEZLu7mZ1JzRanfHi64s3n
   nuhn/txQreK9v9LN2BWKyr+h4VK/zwMbftCPYRZxhYL0MCNWVCnalOjq1
   ldMGeWdxV4zAUKc9NYOcKfdjlM6HJGZ1o7A+OkwSf3qQbXUeWvlEaMegE
   gwf0Rjma6CBM8xEgIDT3xZG54W6WUr1g3uv4OcHWKR4PLrv0nyXG+RHgB
   g==;
X-CSE-ConnectionGUID: xOd+i/N2RkGSY6LjUbCrFQ==
X-CSE-MsgGUID: HI8Fe21ZT8i8XaE2Knm0UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45851673"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="45851673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 12:09:31 -0800
X-CSE-ConnectionGUID: 04ykws9RQ1OACoX7UUd42w==
X-CSE-MsgGUID: x6Nm/nwpTp6ybSb5TvRNyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123155211"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2025 12:09:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpC6S-000IuA-0P
	for oe-kbuild-all@lists.linux.dev;
	Mon, 03 Mar 2025 20:09:28 +0000
Date: Tue, 4 Mar 2025 04:09:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/iio/imu/bmi160/bmi160_core.c:578:54:
 warning: 'int_out_ctrl_shift' may be used uninitialized
Message-ID: <202503040420.Ze6l4ZwC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 895bf81e6bbfbcd37442aca87ad6ae44be34c54d [1/1] iio:bmi160: add drdy interrupt support
config: riscv-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250304/202503040420.Ze6l4ZwC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040420.Ze6l4ZwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040420.Ze6l4ZwC-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In function 'bmi160_config_pin',
       inlined from 'bmi160_config_device_irq' at drivers/iio/imu/bmi160/bmi160_core.c:681:9,
       inlined from 'bmi160_setup_irq' at drivers/iio/imu/bmi160/bmi160_core.c:700:8:
>> drivers/iio/imu/bmi160/bmi160_core.c:578:54: warning: 'int_out_ctrl_shift' may be used uninitialized [-Wmaybe-uninitialized]
     578 |         int_out_ctrl_mask = BMI160_INT_OUT_CTRL_MASK << int_out_ctrl_shift;
         |                                                      ^
   drivers/iio/imu/bmi160/bmi160_core.c: In function 'bmi160_setup_irq':
   drivers/iio/imu/bmi160/bmi160_core.c:559:12: note: 'int_out_ctrl_shift' was declared here
     559 |         u8 int_out_ctrl_shift;
         |            ^~~~~~~~~~~~~~~~~~
   In function 'bmi160_config_pin',
       inlined from 'bmi160_config_device_irq' at drivers/iio/imu/bmi160/bmi160_core.c:681:9,
       inlined from 'bmi160_setup_irq' at drivers/iio/imu/bmi160/bmi160_core.c:700:8:
>> drivers/iio/imu/bmi160/bmi160_core.c:600:15: warning: 'int_latch_mask' may be used uninitialized [-Wmaybe-uninitialized]
     600 |         ret = bmi160_write_conf_reg(regmap, BMI160_REG_INT_LATCH,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     601 |                                     int_latch_mask, int_latch_mask,
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     602 |                                     write_usleep);
         |                                     ~~~~~~~~~~~~~
   drivers/iio/imu/bmi160/bmi160_core.c: In function 'bmi160_setup_irq':
   drivers/iio/imu/bmi160/bmi160_core.c:560:12: note: 'int_latch_mask' was declared here
     560 |         u8 int_latch_mask;
         |            ^~~~~~~~~~~~~~
   In function 'bmi160_config_pin',
       inlined from 'bmi160_config_device_irq' at drivers/iio/imu/bmi160/bmi160_core.c:681:9,
       inlined from 'bmi160_setup_irq' at drivers/iio/imu/bmi160/bmi160_core.c:700:8:
>> drivers/iio/imu/bmi160/bmi160_core.c:607:15: warning: 'int_map_mask' may be used uninitialized [-Wmaybe-uninitialized]
     607 |         ret = bmi160_write_conf_reg(regmap, BMI160_REG_INT_MAP,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     608 |                                     int_map_mask, int_map_mask,
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     609 |                                     write_usleep);
         |                                     ~~~~~~~~~~~~~
   drivers/iio/imu/bmi160/bmi160_core.c: In function 'bmi160_setup_irq':
   drivers/iio/imu/bmi160/bmi160_core.c:561:12: note: 'int_map_mask' was declared here
     561 |         u8 int_map_mask;
         |            ^~~~~~~~~~~~
   In file included from include/linux/acpi.h:27,
                    from drivers/iio/imu/bmi160/bmi160_core.c:14:
   In function 'bmi160_config_pin',
       inlined from 'bmi160_config_device_irq' at drivers/iio/imu/bmi160/bmi160_core.c:681:9,
       inlined from 'bmi160_setup_irq' at drivers/iio/imu/bmi160/bmi160_core.c:700:8:
>> include/linux/device.h:1463:9: warning: 'pin_name' may be used uninitialized [-Wmaybe-uninitialized]
    1463 |         _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/bmi160/bmi160_core.c:619:17: note: in expansion of macro 'dev_err'
     619 |                 dev_err(dev, "Failed to configure %s IRQ pin", pin_name);
         |                 ^~~~~~~
   drivers/iio/imu/bmi160/bmi160_core.c: In function 'bmi160_setup_irq':
   drivers/iio/imu/bmi160/bmi160_core.c:564:21: note: 'pin_name' was declared here
     564 |         const char *pin_name;
         |                     ^~~~~~~~


vim +/int_out_ctrl_shift +578 drivers/iio/imu/bmi160/bmi160_core.c

   552	
   553	static int bmi160_config_pin(struct regmap *regmap, enum bmi160_int_pin pin,
   554				     bool open_drain, u8 irq_mask,
   555				     unsigned long write_usleep)
   556	{
   557		int ret;
   558		struct device *dev = regmap_get_device(regmap);
   559		u8 int_out_ctrl_shift;
   560		u8 int_latch_mask;
   561		u8 int_map_mask;
   562		u8 int_out_ctrl_mask;
   563		u8 int_out_ctrl_bits;
   564		const char *pin_name;
   565	
   566		switch (pin) {
   567		case BMI160_PIN_INT1:
   568			int_out_ctrl_shift = BMI160_INT1_OUT_CTRL_SHIFT;
   569			int_latch_mask = BMI160_INT1_LATCH_MASK;
   570			int_map_mask = BMI160_INT1_MAP_DRDY_EN;
   571			break;
   572		case BMI160_PIN_INT2:
   573			int_out_ctrl_shift = BMI160_INT2_OUT_CTRL_SHIFT;
   574			int_latch_mask = BMI160_INT2_LATCH_MASK;
   575			int_map_mask = BMI160_INT2_MAP_DRDY_EN;
   576			break;
   577		}
 > 578		int_out_ctrl_mask = BMI160_INT_OUT_CTRL_MASK << int_out_ctrl_shift;
   579	
   580		/*
   581		 * Enable the requested pin with the right settings:
   582		 * - Push-pull/open-drain
   583		 * - Active low/high
   584		 * - Edge/level triggered
   585		 */
   586		int_out_ctrl_bits = BMI160_OUTPUT_EN;
   587		if (open_drain)
   588			/* Default is push-pull. */
   589			int_out_ctrl_bits |= BMI160_OPEN_DRAIN;
   590		int_out_ctrl_bits |= irq_mask;
   591		int_out_ctrl_bits <<= int_out_ctrl_shift;
   592	
   593		ret = bmi160_write_conf_reg(regmap, BMI160_REG_INT_OUT_CTRL,
   594					    int_out_ctrl_mask, int_out_ctrl_bits,
   595					    write_usleep);
   596		if (ret)
   597			return ret;
   598	
   599		/* Set the pin to input mode with no latching. */
 > 600		ret = bmi160_write_conf_reg(regmap, BMI160_REG_INT_LATCH,
   601					    int_latch_mask, int_latch_mask,
   602					    write_usleep);
   603		if (ret)
   604			return ret;
   605	
   606		/* Map interrupts to the requested pin. */
 > 607		ret = bmi160_write_conf_reg(regmap, BMI160_REG_INT_MAP,
   608					    int_map_mask, int_map_mask,
   609					    write_usleep);
   610		if (ret) {
   611			switch (pin) {
   612			case BMI160_PIN_INT1:
   613				pin_name = "INT1";
   614				break;
   615			case BMI160_PIN_INT2:
   616				pin_name = "INT2";
   617				break;
   618			}
   619			dev_err(dev, "Failed to configure %s IRQ pin", pin_name);
   620		}
   621	
   622		return ret;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
