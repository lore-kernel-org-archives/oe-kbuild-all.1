Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263B415F1F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776417; cv=none; b=sWoFID/Kzxir7PFxuyYrZfdY+AoeBzqFHrDUb55hF6xC3Eh8CRhX1QPjXWn/mezpfrBHE8n+Zyhd2OY1TlHwEiJZX1xOvMxwcLT2/aGxhoU6l3/jyen1vRD3f3O++o7c7gqLh/g4nf01ETzoQ2En1nVFMvJXt+QNDMgPcEqmsn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776417; c=relaxed/simple;
	bh=bNcGdcWESX8PRHI1ccOIpGto1Y48VOW5BfT32huH4fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q12vOdB0Q2t7i/CV/bx/SjmXZlco/gcZY6AAuCdShPrLyRTHm7ngRU9QBnPmJfvXz+gdH1Ez49OsfLwwstmPF1UnZ/TCSbipCJ6VdjLaaoP0RVRT9jHv4LkAx+/cbLrI5Whk3fil+xt9X9X9oR7oMgFYvFBlYfmRSHX8FvJsL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1McbOi/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1McbOi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785776415; x=1817312415;
  h=date:from:to:cc:subject:message-id;
  bh=bNcGdcWESX8PRHI1ccOIpGto1Y48VOW5BfT32huH4fI=;
  b=K1McbOi/tH7rZX03e3QomfSTTAp40ZlVfjpHrCTSZXLdUPEDEAYjb3/7
   16OrT4eH9NVyvfcEHpGbq2zTyWJHQNv4nyCT/LBLE8Q449GLKRYPldiRV
   D4oUbru45kgOwCd8tD7CV00B1ssGiy4fJSTFJ0wiOl4clhzMZzm2cBlxI
   MGq5evoBv/T0aPyaYrwsd2bZlaA4udbr49fDYs8H3XuqRBmMgEHhJbidO
   9xNf4+03SlGTwZzLq6ia1fcD7MJvFXJxqjoDgBsWytt24ofD+5PSKHq56
   YFnI7juUfAST3u1D6oNo9RWVTxPL9xZXWjoSGBMhLpnzPu2Yys/sa9r5a
   w==;
X-CSE-ConnectionGUID: /yicS606TAeQTGmz5VzD3g==
X-CSE-MsgGUID: +IniwU31QcWkzNQz91kNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86266387"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86266387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 10:00:15 -0700
X-CSE-ConnectionGUID: d4iBZyktSZu3/AYyip3iww==
X-CSE-MsgGUID: iUmCLFzSSyuj+U480/Mptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="256949920"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Aug 2026 09:59:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqw10-000000007P3-0ECw;
	Mon, 03 Aug 2026 16:59:50 +0000
Date: Tue, 04 Aug 2026 00:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 534/700]
 drivers/gpio/gpio-ip6xxx.c:82:15: error: 'struct ip6xxx' has no member named
 'gpiochip'
Message-ID: <202608040020.RMpTkeT7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: f2dd72fc7b939c43d6cfccbc91bd5af1cda3af6f [534/700] ip6303: gpio
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040020.RMpTkeT7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040020.RMpTkeT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040020.RMpTkeT7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-ip6xxx.c: In function 'ip6xxx_gpio_get':
>> drivers/gpio/gpio-ip6xxx.c:34:24: warning: unused variable 'ip6xxx' [-Wunused-variable]
      34 |         struct ip6xxx *ip6xxx = gpiochip_get_data(chip);
         |                        ^~~~~~
   drivers/gpio/gpio-ip6xxx.c: In function 'ip6xxx_gpio_probe':
>> drivers/gpio/gpio-ip6xxx.c:82:15: error: 'struct ip6xxx' has no member named 'gpiochip'
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
   include/linux/mfd/ip6xxx.h:130:31: warning: 'ip6303_io8_mfp' defined but not used [-Wunused-const-variable=]
     130 | static const struct reg_field ip6303_io8_mfp = {
         |                               ^~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:124:31: warning: 'ip6303_chg_en' defined but not used [-Wunused-const-variable=]
     124 | static const struct reg_field ip6303_chg_en = {
         |                               ^~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:118:31: warning: 'ip6303_batext_ok' defined but not used [-Wunused-const-variable=]
     118 | static const struct reg_field ip6303_batext_ok = {
         |                               ^~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:112:31: warning: 'ip6303_charge_state' defined but not used [-Wunused-const-variable=]
     112 | static const struct reg_field ip6303_charge_state = {
         |                               ^~~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:106:31: warning: 'ip6303_r_chgis' defined but not used [-Wunused-const-variable=]
     106 | static const struct reg_field ip6303_r_chgis = {
         |                               ^~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:100:31: warning: 'ip6303_adc_data_vbat' defined but not used [-Wunused-const-variable=]
     100 | static const struct reg_field ip6303_adc_data_vbat = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:94:31: warning: 'ip6303_ichg_adc_en' defined but not used [-Wunused-const-variable=]
      94 | static const struct reg_field ip6303_ichg_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:88:31: warning: 'ip6303_ibat_adc_en' defined but not used [-Wunused-const-variable=]
      88 | static const struct reg_field ip6303_ibat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/ip6xxx.h:82:31: warning: 'ip6303_vbat_adc_en' defined but not used [-Wunused-const-variable=]
      82 | static const struct reg_field ip6303_vbat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~


vim +82 drivers/gpio/gpio-ip6xxx.c

    31	
    32	static int ip6xxx_gpio_get(struct gpio_chip *chip, unsigned offset)
    33	{
  > 34		struct ip6xxx *ip6xxx = gpiochip_get_data(chip);
    35		return 0;
    36	}
    37	
    38	static int ip6xxx_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
    39	{
    40		struct ip6xxx *ip6xxx = gpiochip_get_data(chip);
    41	
    42		ip6xxx_gpio_set_gpiobit(ip6xxx, IP6303_GPIO_OE1,
    43				IP6303_GPIO_OE0, offset, 0);
    44		ip6xxx_gpio_set_gpiobit(ip6xxx, IP6303_GPIO_IE1,
    45				IP6303_GPIO_IE0, offset, 1);
    46	
    47		return 0;
    48	}
    49	
    50	static int ip6xxx_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
    51						int value)
    52	{
    53		struct ip6xxx *ip6xxx = gpiochip_get_data(chip);
    54	
    55		ip6xxx_gpio_set_gpiobit(ip6xxx, IP6303_GPIO_IE1,
    56				IP6303_GPIO_IE0, offset, 0);
    57		ip6xxx_gpio_set_gpiobit(ip6xxx, IP6303_GPIO_OE1,
    58				IP6303_GPIO_OE0, offset, 1);
    59	
    60		return 0;
    61	}
    62	
    63	static const char* names[] = {
    64			"gpio1",
    65			"gpio2",
    66			"gpio3",
    67			"gpio4",
    68			"gpio5",
    69			"gpio6",
    70			"gpio7",
    71			"gpio8",
    72			"gpio9",
    73			"gpio10",
    74			"gpio11",
    75	};
    76	
    77	static int ip6xxx_gpio_probe(struct platform_device *pdev)
    78	{
    79		struct ip6xxx *ip6xxx = dev_get_drvdata(pdev->dev.parent);
    80		int ret;
    81	
  > 82		ip6xxx->gpiochip.label            = DRIVER_NAME;
    83		ip6xxx->gpiochip.parent           = &pdev->dev;
    84		ip6xxx->gpiochip.request          = gpiochip_generic_request;
    85		ip6xxx->gpiochip.free             = gpiochip_generic_free;
    86		ip6xxx->gpiochip.direction_input  = ip6xxx_gpio_direction_input;
    87		ip6xxx->gpiochip.get              = ip6xxx_gpio_get;
    88		ip6xxx->gpiochip.direction_output = ip6xxx_gpio_direction_output;
    89		ip6xxx->gpiochip.set              = ip6xxx_gpio_set;
    90		ip6xxx->gpiochip.base             = -1;
    91		ip6xxx->gpiochip.ngpio            = 11;
    92		ip6xxx->gpiochip.names            = names;
    93	
    94		ret = gpiochip_add_data(&ip6xxx->gpiochip, ip6xxx);
    95		if (ret < 0) {
    96			dev_err(pdev->dev.parent,"failed to register gpio chip");
    97			return ret;
    98		}
    99	
   100		return ret;
   101	}
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
