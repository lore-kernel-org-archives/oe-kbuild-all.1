Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2884B1A5B90
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 01:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944232; cv=none; b=kOwZLq4yZJnFjhMq9TAiQCLsCim8AS4k2AlzVH+ziPlZuZh4Q2tdRKuUsL+AQcqcjs848U2p705A/8mnmAYQ94V49rOO5cIdNI7XwXz/GgfRWTK+3q4vZRm0AfO4r1IjAa6BhMa4d6IepKFXWQhin8MLXJRPLLKyOT3M1IfC/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944232; c=relaxed/simple;
	bh=HaKBOWBgJEvEuQMnT6LLL79NHbb9ZpiMGfPSi3xCnsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sv59Z7LxVFWUUzItTr8ruqHtISizER+Sylb5si3QTxvkWcfnQIq6mYOPtvJOBPpDSm/0OuCuFu/Tky+YuRnUMv6A8FsPTGu0+DsvxFNJDp3iyDICZZlo14wr4W+Q6vA4rJvPKMkcdCBma02Vwr+9oSPrKAILJgSBdTZxlgcxMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKzLjKPc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKzLjKPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777944231; x=1809480231;
  h=date:from:to:cc:subject:message-id;
  bh=HaKBOWBgJEvEuQMnT6LLL79NHbb9ZpiMGfPSi3xCnsA=;
  b=bKzLjKPcnHfiwhOloNDbLbxc020/EFojgilX+agxDl5jzHZdVWsdFkVS
   hESMjBnWJMiD9YVrMFZzjejz2EKaYbhkpD2MhJRKp2u1vrGhvnWlemx7h
   ESGHFI+K8VhS6cz/pg4HF7HtOn/EGdWFCNs1UJJ2yPaB1m3LCamsGT904
   MYpSirQ5PWD9HEuz7WapiydRY5zta8Kn01lsVemJ538VfKbPDHtezTJNJ
   36RgpJP8wTrpDojv3Pae6ZzFblG28nfx/cvFlWVPeE6f1jmydOtZwcaxs
   BbVEfdvDYx7QRgYV4Q0kJNOLNCu/3LDdYXbna2f3hS1g7CtXDS/OiwRjj
   A==;
X-CSE-ConnectionGUID: +ZXnLRzCSFG0N10QSIYJ/A==
X-CSE-MsgGUID: q9FhpUV1RVOoZATenG+WwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="104258162"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="104258162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 18:23:51 -0700
X-CSE-ConnectionGUID: YfeVTVanSxqKYUma6ccQng==
X-CSE-MsgGUID: jea98nYWRAydGdc1Pwn8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="231078768"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 May 2026 18:23:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK4Vn-0000000063V-20BG;
	Tue, 05 May 2026 01:23:47 +0000
Date: Tue, 05 May 2026 03:23:25 +0200
From: kernel test robot <lkp@intel.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/leds/leds-is31fl32xx.c:425:32: error: implicit
 declaration of function 'devm_gpiod_get_optional'; did you mean
 'devm_of_led_get_optional'?
Message-ID: <202605050356.vYbjKZr6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jun-Yan/dt-bindings-leds-is31fl32xx-convert-the-binding-to-yaml/20260430-225214
head:   f27392dfdcb0de460ed4763169fd9ba7e9db0035
commit: 11612cb7ec953422c7d0a8f327a4a704dfb38b29 leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
date:   4 days ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260505/202605050356.vYbjKZr6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050356.vYbjKZr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050356.vYbjKZr6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-is31fl32xx.c: In function 'is31fl32xx_parse_dt':
>> drivers/leds/leds-is31fl32xx.c:425:32: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_of_led_get_optional'? [-Wimplicit-function-declaration]
     425 |         priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                devm_of_led_get_optional
>> drivers/leds/leds-is31fl32xx.c:425:74: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
     425 |         priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
         |                                                                          ^~~~~~~~~~~~~
   drivers/leds/leds-is31fl32xx.c:425:74: note: each undeclared identifier is reported only once for each function it appears in


vim +425 drivers/leds/leds-is31fl32xx.c

   418	
   419	static int is31fl32xx_parse_dt(struct device *dev,
   420				       struct is31fl32xx_priv *priv)
   421	{
   422		const struct is31fl32xx_chipdef *cdef = priv->cdef;
   423		int ret = 0;
   424	
 > 425		priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
   426		if (IS_ERR(priv->powerdown_gpio))
   427			return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
   428					"Failed to get powerdown gpio\n");
   429	
   430		if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
   431		    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
   432	
   433			ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
   434					       IS31FL32XX_PWM_FREQUENCY_22KHZ);
   435	
   436			if (ret) {
   437				dev_err(dev, "Failed to write output PWM frequency register\n");
   438				return ret;
   439			}
   440		}
   441	
   442		for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
   443			struct led_init_data init_data = {};
   444			struct is31fl32xx_led_data *led_data =
   445				&priv->leds[priv->num_leds];
   446			const struct is31fl32xx_led_data *other_led_data;
   447	
   448			led_data->priv = priv;
   449			led_data->cdev.max_brightness = priv->cdef->brightness_steps - 1;
   450	
   451			ret = is31fl32xx_parse_child_dt(dev, child, led_data);
   452			if (ret)
   453				return ret;
   454	
   455			/* Detect if channel is already in use by another child */
   456			other_led_data = is31fl32xx_find_led_data(priv,
   457								  led_data->channel);
   458			if (other_led_data) {
   459				dev_err(dev,
   460					"Node %pOF 'reg' conflicts with another LED\n",
   461					child);
   462				return -EINVAL;
   463			}
   464	
   465			init_data.fwnode = of_fwnode_handle(child);
   466	
   467			ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
   468							     &init_data);
   469			if (ret) {
   470				dev_err(dev, "Failed to register LED for %pOF: %d\n",
   471					child, ret);
   472				return ret;
   473			}
   474	
   475			priv->num_leds++;
   476		}
   477	
   478		return 0;
   479	}
   480	static const struct is31fl32xx_chipdef is31fl3236_cdef = {
   481		.channels				= 36,
   482		.shutdown_reg				= 0x00,
   483		.pwm_update_reg				= 0x25,
   484		.global_control_reg			= 0x4a,
   485		.reset_reg				= 0x4f,
   486		.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
   487		.pwm_register_base			= 0x01,
   488		.led_control_register_base		= 0x26,
   489		.enable_bits_per_led_control_register	= 1,
   490	};
   491	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
