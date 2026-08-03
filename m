Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28B396572
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746404; cv=none; b=eSVmLR5/6DZAHtYEGUeCpLXGN8wzkCpX3lZQLVLFh8SEVhMjhmmcaFfCRR1lOxEUhQRMZJhBNEjVnyXOTS+zcjhxFkMRnGkR19580CmP6E4G/Wc7/MJ4zVXnjKmB7ds7CQeNCJE/Y/gnCq1BBg5Q68M7rdDpqZeHfbrb5BiGJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746404; c=relaxed/simple;
	bh=vPZcRPTPRJzbUHm/7XGlR/I6U12FilzQyMCk/q3ZEOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YCv6EYg004uGCnmQaVzgkO0I5T3l22wTwrSnZDzgbAFHQLWYTfJjuyeQtfb8ZpjtxMjX7pBBnav3vHRJp9Nzc+5DZiFP0/Bk3tlbTBHgZlc6L2A5x/6P8cZZqnlmwDhziaJgt9gPAFR14MwhRC80trbhGhUT2x/XaQE6hDF4nFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngQZNUV8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngQZNUV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785746400; x=1817282400;
  h=date:from:to:cc:subject:message-id;
  bh=vPZcRPTPRJzbUHm/7XGlR/I6U12FilzQyMCk/q3ZEOg=;
  b=ngQZNUV8XCLZK50An0JSmOT1E4aHJOP9//iSmhwQ8EAC9RLDG/J8oiPk
   gw+ntbvz9tNCQYW35tL2CshTi9WWhCbB4ky3Vwd/VhOFP+vK2nM0UUX/m
   yMf+xbEDlQPFvS48kht9vHU2EokAPOPNX2omVbUFIRYJv0IxGFxQfRjR5
   lm3N27ovycs4qR6Pmwv+h6cSKPnLCTCBhPweJNk8rrsvbxgsM3bTJ1Azs
   90wGoB8wBqmbj5lKik9fR1FNcI0FSP2qr7CVNy8/CY1LfLtjWdwXkx6cj
   ESiXsWpeRRgwezwWlUgdV/aNXY99lcrxr2ZRj5+QM1JsILvKtTPUSL6dh
   w==;
X-CSE-ConnectionGUID: ePfapl9DQ++99/iNuYktMw==
X-CSE-MsgGUID: VBZ55BMRRKqn9lqPIiuPlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86360934"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86360934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 01:40:00 -0700
X-CSE-ConnectionGUID: zuUbMf4oQ3yUhvCp0CTa/Q==
X-CSE-MsgGUID: JotUAAajTy6VcUALAaTcgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="264634694"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2026 01:39:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqoDD-000000006YH-4BY2;
	Mon, 03 Aug 2026 08:39:55 +0000
Date: Mon, 03 Aug 2026 16:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 533/700]
 drivers/mfd/ip6xxx.c:82:26: error: 'i2c_device_id' undeclared here (not in a
 function)
Message-ID: <202608031643.BVZlXqQG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 2b98b69c0553e63ab0a875f2a14b7f2e1cd10c5e [533/700] regulator: basic driver for the injoinic ip6303
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608031643.BVZlXqQG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031643.BVZlXqQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031643.BVZlXqQG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/mfd/ip6xxx.c:9:
>> drivers/mfd/ip6xxx.c:82:26: error: 'i2c_device_id' undeclared here (not in a function)
      82 | MODULE_DEVICE_TABLE(i2c, i2c_device_id);
         |                          ^~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_i2c__i2c_device_id_device_table' aliased to undefined symbol 'i2c_device_id'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/mfd/ip6xxx.c:82:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
      82 | MODULE_DEVICE_TABLE(i2c, i2c_device_id);
         | ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/mfd/ip6xxx.c:16:
>> include/linux/mfd/ip6xxx.h:119:31: warning: 'ip6303_io8_mfp' defined but not used [-Wunused-const-variable=]
     119 | static const struct reg_field ip6303_io8_mfp = {
         |                               ^~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:113:31: warning: 'ip6303_chg_en' defined but not used [-Wunused-const-variable=]
     113 | static const struct reg_field ip6303_chg_en = {
         |                               ^~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:107:31: warning: 'ip6303_batext_ok' defined but not used [-Wunused-const-variable=]
     107 | static const struct reg_field ip6303_batext_ok = {
         |                               ^~~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:101:31: warning: 'ip6303_charge_state' defined but not used [-Wunused-const-variable=]
     101 | static const struct reg_field ip6303_charge_state = {
         |                               ^~~~~~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:95:31: warning: 'ip6303_r_chgis' defined but not used [-Wunused-const-variable=]
      95 | static const struct reg_field ip6303_r_chgis = {
         |                               ^~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:89:31: warning: 'ip6303_adc_data_vbat' defined but not used [-Wunused-const-variable=]
      89 | static const struct reg_field ip6303_adc_data_vbat = {
         |                               ^~~~~~~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:83:31: warning: 'ip6303_ichg_adc_en' defined but not used [-Wunused-const-variable=]
      83 | static const struct reg_field ip6303_ichg_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:77:31: warning: 'ip6303_ibat_adc_en' defined but not used [-Wunused-const-variable=]
      77 | static const struct reg_field ip6303_ibat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:71:31: warning: 'ip6303_vbat_adc_en' defined but not used [-Wunused-const-variable=]
      71 | static const struct reg_field ip6303_vbat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
--
   drivers/power/supply/ip6xxx-charger.c: In function 'ip6xxx_charger_get_property':
>> drivers/power/supply/ip6xxx-charger.c:41:33: error: 'struct ip6xxx' has no member named 'chg_en'
      41 |         regmap_field_read(ip6xxx->chg_en, &chg_en);
         |                                 ^~
>> drivers/power/supply/ip6xxx-charger.c:42:33: error: 'struct ip6xxx' has no member named 'batext_ok'
      42 |         regmap_field_read(ip6xxx->batext_ok, &batext_ok);
         |                                 ^~
>> drivers/power/supply/ip6xxx-charger.c:43:33: error: 'struct ip6xxx' has no member named 'vbat_adc_en'
      43 |         regmap_field_read(ip6xxx->vbat_adc_en, &vbat_adc_en);
         |                                 ^~
>> drivers/power/supply/ip6xxx-charger.c:48:33: error: 'struct ip6xxx' has no member named 'adc_data_vbat'
      48 |         regmap_field_read(ip6xxx->adc_data_vbat, &vbat);
         |                                 ^~
>> drivers/power/supply/ip6xxx-charger.c:54:41: error: 'struct ip6xxx' has no member named 'charge_state'
      54 |                 regmap_field_read(ip6xxx->charge_state, &regval);
         |                                         ^~
   drivers/power/supply/ip6xxx-charger.c:72:41: error: 'struct ip6xxx' has no member named 'charge_state'
      72 |                 regmap_field_read(ip6xxx->charge_state, &regval);
         |                                         ^~
>> drivers/power/supply/ip6xxx-charger.c:86:41: error: 'struct ip6xxx' has no member named 'r_chgis'
      86 |                 regmap_field_read(ip6xxx->r_chgis, &regval);
         |                                         ^~
   drivers/power/supply/ip6xxx-charger.c: In function 'ip6xxx_charger_probe':
>> drivers/power/supply/ip6xxx-charger.c:111:15: error: 'struct ip6xxx' has no member named 'charger_desc'
     111 |         ip6xxx->charger_desc.properties = ip6xxx_charger_properties;
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:112:15: error: 'struct ip6xxx' has no member named 'charger_desc'
     112 |         ip6xxx->charger_desc.num_properties = ARRAY_SIZE(ip6xxx_charger_properties);
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:113:15: error: 'struct ip6xxx' has no member named 'charger_desc'
     113 |         ip6xxx->charger_desc.get_property = ip6xxx_charger_get_property;
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:114:15: error: 'struct ip6xxx' has no member named 'charger_desc'
     114 |         ip6xxx->charger_desc.name = pdev->dev.parent->of_node->name;
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:115:15: error: 'struct ip6xxx' has no member named 'charger_desc'
     115 |         ip6xxx->charger_desc.type = 0;
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:120:15: error: 'struct ip6xxx' has no member named 'vbat_adc_en'
     120 |         ip6xxx->vbat_adc_en = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:123:15: error: 'struct ip6xxx' has no member named 'adc_data_vbat'
     123 |         ip6xxx->adc_data_vbat = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:126:15: error: 'struct ip6xxx' has no member named 'r_chgis'
     126 |         ip6xxx->r_chgis = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:129:15: error: 'struct ip6xxx' has no member named 'charge_state'
     129 |         ip6xxx->charge_state = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:132:15: error: 'struct ip6xxx' has no member named 'batext_ok'
     132 |         ip6xxx->batext_ok = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:135:15: error: 'struct ip6xxx' has no member named 'chg_en'
     135 |         ip6xxx->chg_en = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
>> drivers/power/supply/ip6xxx-charger.c:138:15: error: 'struct ip6xxx' has no member named 'io8_mfp'
     138 |         ip6xxx->io8_mfp = devm_regmap_field_alloc(pdev->dev.parent,
         |               ^~
>> drivers/power/supply/ip6xxx-charger.c:141:15: error: 'struct ip6xxx' has no member named 'charger'
     141 |         ip6xxx->charger = devm_power_supply_register(pdev->dev.parent,
         |               ^~
   drivers/power/supply/ip6xxx-charger.c:142:32: error: 'struct ip6xxx' has no member named 'charger_desc'
     142 |                         &ip6xxx->charger_desc, &psy_cfg);
         |                                ^~
   drivers/power/supply/ip6xxx-charger.c:144:34: error: 'struct ip6xxx' has no member named 'r_chgis'
     144 |         regmap_field_write(ip6xxx->r_chgis, 0x8);
         |                                  ^~
   drivers/power/supply/ip6xxx-charger.c:145:34: error: 'struct ip6xxx' has no member named 'chg_en'
     145 |         regmap_field_write(ip6xxx->chg_en, 0x1);
         |                                  ^~
   drivers/power/supply/ip6xxx-charger.c:146:34: error: 'struct ip6xxx' has no member named 'vbat_adc_en'
     146 |         regmap_field_write(ip6xxx->vbat_adc_en, 0x1);
         |                                  ^~
   drivers/power/supply/ip6xxx-charger.c:147:34: error: 'struct ip6xxx' has no member named 'io8_mfp'
     147 |         regmap_field_write(ip6xxx->io8_mfp, 0x2);
         |                                  ^~
   drivers/power/supply/ip6xxx-charger.c:149:26: error: 'struct ip6xxx' has no member named 'charger'
     149 |         if (IS_ERR(ip6xxx->charger)) {
         |                          ^~
   drivers/power/supply/ip6xxx-charger.c:150:37: error: 'struct ip6xxx' has no member named 'charger'
     150 |                 ret = PTR_ERR(ip6xxx->charger);
         |                                     ^~
>> drivers/power/supply/ip6xxx-charger.c:106:43: warning: unused variable 'charger_data' [-Wunused-variable]
     106 |         const struct ip6xxx_charger_data *charger_data =
         |                                           ^~~~~~~~~~~~
   In file included from drivers/power/supply/ip6xxx-charger.c:13:
   At top level:
>> include/linux/mfd/ip6xxx.h:83:31: warning: 'ip6303_ichg_adc_en' defined but not used [-Wunused-const-variable=]
      83 | static const struct reg_field ip6303_ichg_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~
>> include/linux/mfd/ip6xxx.h:77:31: warning: 'ip6303_ibat_adc_en' defined but not used [-Wunused-const-variable=]
      77 | static const struct reg_field ip6303_ibat_adc_en = {
         |                               ^~~~~~~~~~~~~~~~~~


vim +/i2c_device_id +82 drivers/mfd/ip6xxx.c

    77	
    78	static const struct i2c_device_id ip6xxx_i2c_id[] = {
    79		{ "ip6303", 0 },
    80		{ },
    81	};
  > 82	MODULE_DEVICE_TABLE(i2c, i2c_device_id);
    83	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
