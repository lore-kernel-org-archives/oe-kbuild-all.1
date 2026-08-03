Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E8320A00
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796611; cv=none; b=k/tvsOclPtOiizdTce/EV/pCaEyZLnoI7e7QE2++PiiZwyuMKDTPuoXlIL9Wu0YwrzsXp1YfiYPPC3TFdCCf80dKS7aku8mVYgB1f1SLykA3YpLaIFwx0jaMD5n45WgWH5HGbI2yjdcJxRAe8QeI2OmikjXLstvgG8SaUDi06n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796611; c=relaxed/simple;
	bh=QfOB/6jy/N5Arg5AI0Nc883QDtwCG68pXdCro5yR5z0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d3fC+PkTLOw5qxOflH9jSOtgezHOcViu3JxgQBlwlLT8JiTvkz/6xAqRSTt4w32IZVDXXjQe65IwnzxRyGzn06TF+QmB89qZAm6p17PTv4jtxVXP7BvWGDKWq4Xip20RXX/AZBHOjfhkjqZre7n3gE2qSxxHmorztZvFEzdI1qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JepSameD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JepSameD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785796609; x=1817332609;
  h=date:from:to:cc:subject:message-id;
  bh=QfOB/6jy/N5Arg5AI0Nc883QDtwCG68pXdCro5yR5z0=;
  b=JepSameDp8l6A3ziZWZT2dAtQeXxZyKwpD3mn1KrNKA9F2ZAX9bFHSYJ
   HZfmoMsqON2xDMILhThgrAsE5KhrebGfu2kF9WTst3ym8h26zEpR0cQJ9
   NMp9rNgbFwsihnk2jBqTZqnFEg4HG0QaCI/bn9xOTvid6zmvO0nmRFgXw
   sT7U6qt7gu6dmEPzSkBosexlf1xYeb+Xro9l8wDCoDqPCrKFZPGmmyVRP
   SoZkeHcWExaiQ+NLOaTL0sIEsxkQOkwjSjH5dZ7mpm5P2EKgivOJJsYDu
   mKK25h4xcrAlWj3DbtGPuZlci5KkBStfvnA5Zr15DZ1sRtPCdvMotBurI
   Q==;
X-CSE-ConnectionGUID: ExK0gGNERUeEjB/ySS1tEA==
X-CSE-MsgGUID: ivwQQzrFTiG34kKoo341Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85474325"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="85474325"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 15:36:48 -0700
X-CSE-ConnectionGUID: GygWAJrHQfWGLoFBeYyEjQ==
X-CSE-MsgGUID: +Jpl5KDYQDWZ+fKN9BQMSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="263324270"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2026 15:36:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr1H2-000000008AF-1md2;
	Mon, 03 Aug 2026 22:36:44 +0000
Date: Tue, 04 Aug 2026 06:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 535/700]
 drivers/rtc/rtc-ip6xxx.c:28:33: error: 'struct ip6xxx' has no member named
 'rtc_wday'
Message-ID: <202608040646.YLMq0kWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: ba8f5a8c7c85339370ddf7edfc6b512a3e758e28 [535/700] ip6303: rtc
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040646.YLMq0kWe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040646.YLMq0kWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040646.YLMq0kWe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-ip6xxx.c: In function 'ip6xxx_gpio_get':
   drivers/gpio/gpio-ip6xxx.c:34:24: warning: unused variable 'ip6xxx' [-Wunused-variable]
      34 |         struct ip6xxx *ip6xxx = gpiochip_get_data(chip);
         |                        ^~~~~~
   drivers/gpio/gpio-ip6xxx.c: In function 'ip6xxx_gpio_probe':
   drivers/gpio/gpio-ip6xxx.c:82:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      82 |         ip6xxx->gpiochip.label            = DRIVER_NAME;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:83:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      83 |         ip6xxx->gpiochip.parent           = &pdev->dev;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:84:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      84 |         ip6xxx->gpiochip.request          = gpiochip_generic_request;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:85:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      85 |         ip6xxx->gpiochip.free             = gpiochip_generic_free;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:86:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      86 |         ip6xxx->gpiochip.direction_input  = ip6xxx_gpio_direction_input;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:87:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      87 |         ip6xxx->gpiochip.get              = ip6xxx_gpio_get;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:88:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      88 |         ip6xxx->gpiochip.direction_output = ip6xxx_gpio_direction_output;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:89:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      89 |         ip6xxx->gpiochip.set              = ip6xxx_gpio_set;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:90:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      90 |         ip6xxx->gpiochip.base             = -1;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:91:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      91 |         ip6xxx->gpiochip.ngpio            = 11;
         |               ^~
   drivers/gpio/gpio-ip6xxx.c:92:15: error: 'struct ip6xxx' has no member named 'gpiochip'
      92 |         ip6xxx->gpiochip.names            = names;
         |               ^~
   In file included from drivers/gpio/gpio-ip6xxx.c:8:
   drivers/gpio/gpio-ip6xxx.c:94:40: error: 'struct ip6xxx' has no member named 'gpiochip'
      94 |         ret = gpiochip_add_data(&ip6xxx->gpiochip, ip6xxx);
         |                                        ^~
   include/linux/gpio/driver.h:593:64: note: in definition of macro 'gpiochip_add_data'
     593 | #define gpiochip_add_data(gc, data) gpiochip_add_data_with_key(gc, data, NULL, NULL)
         |                                                                ^~
   In file included from drivers/gpio/gpio-ip6xxx.c:10:
   At top level:
>> include/linux/mfd/ip6xxx.h:183:31: warning: 'ip6303_rtc_year' defined but not used [-Wunused-const-variable=]
     183 | static const struct reg_field ip6303_rtc_year = {
         |                               ^~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:177:31: warning: 'ip6303_rtc_mon' defined but not used [-Wunused-const-variable=]
     177 | static const struct reg_field ip6303_rtc_mon = {
         |                               ^~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:171:31: warning: 'ip6303_rtc_wday' defined but not used [-Wunused-const-variable=]
     171 | static const struct reg_field ip6303_rtc_wday = {
         |                               ^~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:150:31: warning: 'ip6303_io8_mfp' defined but not used [-Wunused-const-variable=]
     150 | static const struct reg_field ip6303_io8_mfp = {
         |                               ^~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:144:31: warning: 'ip6303_chg_en' defined but not used [-Wunused-const-variable=]
     144 | static const struct reg_field ip6303_chg_en = {
         |                               ^~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:138:31: warning: 'ip6303_batext_ok' defined but not used [-Wunused-const-variable=]
     138 | static const struct reg_field ip6303_batext_ok = {
         |                               ^~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:132:31: warning: 'ip6303_charge_state' defined but not used [-Wunused-const-variable=]
     132 | static const struct reg_field ip6303_charge_state = {
         |                               ^~~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:126:31: warning: 'ip6303_r_chgis' defined but not used [-Wunused-const-variable=]
     126 | static const struct reg_field ip6303_r_chgis = {
         |                               ^~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:120:31: warning: 'ip6303_adc_data_vbat' defined but not used [-Wunused-const-variable=]
     120 | static const struct reg_field ip6303_adc_data_vbat = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:114:31: warning: 'ip6303_ichg_adc_en' defined but not used [-Wunused-const-variable=]
     114 | static const struct reg_field ip6303_ichg_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:108:31: warning: 'ip6303_ibat_adc_en' defined but not used [-Wunused-const-variable=]
     108 | static const struct reg_field ip6303_ibat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:102:31: warning: 'ip6303_vbat_adc_en' defined but not used [-Wunused-const-variable=]
     102 | static const struct reg_field ip6303_vbat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
--
   drivers/rtc/rtc-ip6xxx.c: In function 'ip6xxx_rtc_read_time':
>> drivers/rtc/rtc-ip6xxx.c:28:33: error: 'struct ip6xxx' has no member named 'rtc_wday'
      28 |         regmap_field_read(ip6xxx->rtc_wday, &reg);
         |                                 ^~
>> drivers/rtc/rtc-ip6xxx.c:30:33: error: 'struct ip6xxx' has no member named 'rtc_mon'
      30 |         regmap_field_read(ip6xxx->rtc_mon, &reg);
         |                                 ^~
>> drivers/rtc/rtc-ip6xxx.c:32:33: error: 'struct ip6xxx' has no member named 'rtc_year'
      32 |         regmap_field_read(ip6xxx->rtc_year, &reg);
         |                                 ^~
   drivers/rtc/rtc-ip6xxx.c: In function 'ip6xxx_rtc_set_time':
   drivers/rtc/rtc-ip6xxx.c:46:34: error: 'struct ip6xxx' has no member named 'rtc_wday'
      46 |         regmap_field_write(ip6xxx->rtc_wday, tm->tm_wday);
         |                                  ^~
   drivers/rtc/rtc-ip6xxx.c:47:34: error: 'struct ip6xxx' has no member named 'rtc_mon'
      47 |         regmap_field_write(ip6xxx->rtc_mon, tm->tm_mon);
         |                                  ^~
   drivers/rtc/rtc-ip6xxx.c:48:34: error: 'struct ip6xxx' has no member named 'rtc_year'
      48 |         regmap_field_write(ip6xxx->rtc_year, tm->tm_year - 100);
         |                                  ^~
   drivers/rtc/rtc-ip6xxx.c: In function 'ip6xxx_rtc_probe':
   drivers/rtc/rtc-ip6xxx.c:62:15: error: 'struct ip6xxx' has no member named 'rtc_wday'
      62 |         ip6xxx->rtc_wday = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/rtc/rtc-ip6xxx.c:65:15: error: 'struct ip6xxx' has no member named 'rtc_mon'
      65 |         ip6xxx->rtc_mon = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/rtc/rtc-ip6xxx.c:68:15: error: 'struct ip6xxx' has no member named 'rtc_year'
      68 |         ip6xxx->rtc_year = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
>> drivers/rtc/rtc-ip6xxx.c:71:15: error: 'struct ip6xxx' has no member named 'rtc_dev'
      71 |         ip6xxx->rtc_dev = devm_rtc_device_register(pdev->dev.parent,
         |               ^~
   drivers/rtc/rtc-ip6xxx.c:75:26: error: 'struct ip6xxx' has no member named 'rtc_dev'
      75 |         if (IS_ERR(ip6xxx->rtc_dev)) {
         |                          ^~
   drivers/rtc/rtc-ip6xxx.c:76:38: error: 'struct ip6xxx' has no member named 'rtc_dev'
      76 |                 return PTR_ERR(ip6xxx->rtc_dev);
         |                                      ^~
   In file included from drivers/rtc/rtc-ip6xxx.c:11:
   At top level:
   include/linux/mfd/ip6xxx.h:150:31: warning: 'ip6303_io8_mfp' defined but not used [-Wunused-const-variable=]
     150 | static const struct reg_field ip6303_io8_mfp = {
         |                               ^~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:144:31: warning: 'ip6303_chg_en' defined but not used [-Wunused-const-variable=]
     144 | static const struct reg_field ip6303_chg_en = {
         |                               ^~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:138:31: warning: 'ip6303_batext_ok' defined but not used [-Wunused-const-variable=]
     138 | static const struct reg_field ip6303_batext_ok = {
         |                               ^~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:132:31: warning: 'ip6303_charge_state' defined but not used [-Wunused-const-variable=]
     132 | static const struct reg_field ip6303_charge_state = {
         |                               ^~~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:126:31: warning: 'ip6303_r_chgis' defined but not used [-Wunused-const-variable=]
     126 | static const struct reg_field ip6303_r_chgis = {
         |                               ^~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:120:31: warning: 'ip6303_adc_data_vbat' defined but not used [-Wunused-const-variable=]
     120 | static const struct reg_field ip6303_adc_data_vbat = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:114:31: warning: 'ip6303_ichg_adc_en' defined but not used [-Wunused-const-variable=]
     114 | static const struct reg_field ip6303_ichg_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:108:31: warning: 'ip6303_ibat_adc_en' defined but not used [-Wunused-const-variable=]
     108 | static const struct reg_field ip6303_ibat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:102:31: warning: 'ip6303_vbat_adc_en' defined but not used [-Wunused-const-variable=]
     102 | static const struct reg_field ip6303_vbat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~


vim +28 drivers/rtc/rtc-ip6xxx.c

    14	
    15	static int ip6xxx_rtc_read_time(struct device *dev, struct rtc_time *tm)
    16	{
    17		struct ip6xxx *ip6xxx = dev_get_drvdata(dev);
    18		unsigned reg;
    19	
    20		regmap_read(ip6xxx->regmap, IP6303_RTC_SEC, &reg);
    21		tm->tm_sec = reg;
    22		regmap_read(ip6xxx->regmap, IP6303_RTC_MIN, &reg);
    23		tm->tm_min = reg;
    24		regmap_read(ip6xxx->regmap, IP6303_RTC_HOUR, &reg);
    25		tm->tm_hour = reg;
    26		regmap_read(ip6xxx->regmap, IP6303_RTC_DATE, &reg);
    27		tm->tm_mday = reg;
  > 28		regmap_field_read(ip6xxx->rtc_wday, &reg);
    29		tm->tm_wday = reg;
  > 30		regmap_field_read(ip6xxx->rtc_mon, &reg);
    31		tm->tm_mon = reg;
  > 32		regmap_field_read(ip6xxx->rtc_year, &reg);
    33		tm->tm_year = reg + 100;
    34	
    35		return rtc_valid_tm(tm);
    36	}
    37	
    38	static int ip6xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
    39	{
    40		struct ip6xxx *ip6xxx = dev_get_drvdata(dev);
    41	
    42		regmap_write(ip6xxx->regmap, IP6303_RTC_SEC, tm->tm_sec);
    43		regmap_write(ip6xxx->regmap, IP6303_RTC_MIN, tm->tm_min);
    44		regmap_write(ip6xxx->regmap, IP6303_RTC_HOUR, tm->tm_hour);
    45		regmap_write(ip6xxx->regmap, IP6303_RTC_DATE, tm->tm_mday);
    46		regmap_field_write(ip6xxx->rtc_wday, tm->tm_wday);
    47		regmap_field_write(ip6xxx->rtc_mon, tm->tm_mon);
    48		regmap_field_write(ip6xxx->rtc_year, tm->tm_year - 100);
    49	
    50		return 0;
    51	}
    52	
    53	static const struct rtc_class_ops ip6xxx_rtc_ops = {
    54		.read_time = ip6xxx_rtc_read_time,
    55		.set_time = ip6xxx_rtc_set_time,
    56	};
    57	
    58	static int ip6xxx_rtc_probe(struct platform_device *pdev)
    59	{
    60		struct ip6xxx *ip6xxx = dev_get_drvdata(pdev->dev.parent);
    61	
    62		ip6xxx->rtc_wday = devm_regmap_field_alloc(pdev->dev.parent,
    63			ip6xxx->regmap, ip6303_rtc_wday);
    64	
    65		ip6xxx->rtc_mon = devm_regmap_field_alloc(pdev->dev.parent,
    66			ip6xxx->regmap, ip6303_rtc_mon);
    67	
    68		ip6xxx->rtc_year = devm_regmap_field_alloc(pdev->dev.parent,
    69			ip6xxx->regmap, ip6303_rtc_year);
    70	
  > 71		ip6xxx->rtc_dev = devm_rtc_device_register(pdev->dev.parent,
    72				dev_name(pdev->dev.parent), &ip6xxx_rtc_ops,
    73				THIS_MODULE);
    74	
    75		if (IS_ERR(ip6xxx->rtc_dev)) {
    76			return PTR_ERR(ip6xxx->rtc_dev);
    77		}
    78	
    79		return 0;
    80	}
    81	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
