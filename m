Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694E41B279
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ9jK283"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700492168; x=1732028168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+hKLW10thwhyA5EkcyqrBZP2b4gkjD/oPTdC7F1Au4=;
  b=gZ9jK283C2Ayo1U2RDSKh5PiuhSMiWAj9Ww5iDes9WHPtwnrurQHrhsT
   7lFujR2KQ+4tvDWLphnnnIX3r8sDiQLVf+7QxZ6Tjgo2UjxXyCVV+o5zo
   5wm7EWxGsXmbbzzKlfIl0wy5RKJylz1kNWddEHJhw6INfFzF1+8lAPT6U
   3Qv6W/F9RNApkPFvUcXfBMYci4sgjoIecDlvjtv5zkL8noOXKC1OMfYaV
   o5AGMz5UwlcLvD60as6DlmHP9lpjsR6p5faZTZQnJiGGD+O1PlTr8GDCq
   8z5RFM+k5/oX2yzy+8UbJ3DQMvpKocd8+aR2cGA8seCMzCYzuFFC1u6Gf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477839307"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="477839307"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="795493231"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="795493231"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Nov 2023 06:56:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r55fb-0006Xx-2W;
	Mon, 20 Nov 2023 14:55:13 +0000
Date: Mon, 20 Nov 2023 22:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.6 27/58] drivers/hwmon/pmbus/max31785.c:322:38:
 warning: '%s' directive argument is null
Message-ID: <202311202220.jaBwJUGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.6
head:   9fd3fe525544779d6bc28fa948759535ff7232db
commit: 00783d5ee2916278eae8283a7547a95c37506cc7 [27/58] pmbus (max31785): Add support for devicetree configuration
config: i386-randconfig-013-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202220.jaBwJUGt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202220.jaBwJUGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202220.jaBwJUGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/hwmon/pmbus/max31785.c:10:
   drivers/hwmon/pmbus/max31785.c: In function 'max31785_of_fan_config':
>> drivers/hwmon/pmbus/max31785.c:322:38: warning: '%s' directive argument is null [-Wformat-overflow=]
     322 |                         dev_err(dev, "maxim,fan-lock-polarity has invalid value for fan %d: %s\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hwmon/pmbus/max31785.c:322:25: note: in expansion of macro 'dev_err'
     322 |                         dev_err(dev, "maxim,fan-lock-polarity has invalid value for fan %d: %s\n",
         |                         ^~~~~~~
   drivers/hwmon/pmbus/max31785.c:322:93: note: format string is defined here
     322 |                         dev_err(dev, "maxim,fan-lock-polarity has invalid value for fan %d: %s\n",
         |                                                                                             ^~


vim +322 drivers/hwmon/pmbus/max31785.c

   248	
   249	/*
   250	 * Returns negative error codes if an unrecoverable problem is detected, 0 if a
   251	 * recoverable problem is detected, or a positive value on success.
   252	 */
   253	static int max31785_of_fan_config(struct i2c_client *client,
   254					  struct pmbus_driver_info *info,
   255					  struct device_node *child)
   256	{
   257		int mfr_cfg = 0, mfr_fault_resp = 0, pb_cfg;
   258		struct device *dev = &client->dev;
   259		char *lock_polarity = NULL;
   260		const char *sval;
   261		u32 page;
   262		u32 uval;
   263		int ret;
   264	
   265		if (!of_device_is_compatible(child, "pmbus-fan"))
   266			return 0;
   267	
   268		ret = of_property_read_u32(child, "reg", &page);
   269		if (ret < 0) {
   270			dev_err(&client->dev, "Missing valid reg property\n");
   271			return ret;
   272		}
   273	
   274		if (!(info->func[page] & PMBUS_HAVE_FAN12)) {
   275			dev_err(dev, "Page %d does not have fan capabilities\n", page);
   276			return -ENXIO;
   277		}
   278	
   279		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
   280		if (ret < 0)
   281			return ret;
   282	
   283		pb_cfg = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
   284		if (pb_cfg < 0)
   285			return pb_cfg;
   286	
   287		if (of_property_read_bool(child->parent, "use-stored-presence")) {
   288			if (!(pb_cfg & PB_FAN_1_INSTALLED))
   289				dev_info(dev, "Fan %d is configured but not installed\n",
   290					 page);
   291		} else {
   292			pb_cfg |= PB_FAN_1_INSTALLED;
   293		}
   294	
   295		ret = of_property_read_string(child, "maxim,fan-rotor-input", &sval);
   296		if (ret < 0) {
   297			dev_err(dev, "Missing valid maxim,fan-rotor-input property for fan %d\n",
   298					page);
   299			return ret;
   300		}
   301	
   302		if (strcmp("tach", sval) && strcmp("lock", sval)) {
   303			dev_err(dev, "maxim,fan-rotor-input has invalid value for fan %d: %s\n",
   304					page, sval);
   305			return -EINVAL;
   306		} else if (!strcmp("lock", sval)) {
   307			mfr_cfg |= MFR_FAN_CONFIG_ROTOR;
   308	
   309			ret = i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
   310			if (ret < 0)
   311				return ret;
   312	
   313			ret = of_property_read_string(child, "maxim,fan-lock-polarity",
   314						      &sval);
   315			if (ret < 0) {
   316				dev_err(dev, "Missing valid maxim,fan-lock-polarity property for fan %d\n",
   317						page);
   318				return ret;
   319			}
   320	
   321			if (strcmp("low", sval) && strcmp("high", sval)) {
 > 322				dev_err(dev, "maxim,fan-lock-polarity has invalid value for fan %d: %s\n",
   323						page, lock_polarity);
   324				return -EINVAL;
   325			} else if (!strcmp("high", sval))
   326				mfr_cfg |= MFR_FAN_CONFIG_ROTOR_HI_LO;
   327		}
   328	
   329		if (!of_property_read_string(child, "fan-mode", &sval)) {
   330			if (!strcmp("rpm", sval))
   331				pb_cfg |= PB_FAN_1_RPM;
   332			else if (!strcmp("pwm", sval))
   333				pb_cfg &= ~PB_FAN_1_RPM;
   334			else {
   335				dev_err(dev, "fan-mode has invalid value for fan %d: %s\n",
   336						page, sval);
   337				return -EINVAL;
   338			}
   339		}
   340	
   341		ret = of_property_read_u32(child, "tach-pulses", &uval);
   342		if (ret < 0) {
   343			pb_cfg &= ~PB_FAN_1_PULSE_MASK;
   344		} else if (uval && (uval - 1) < 4) {
   345			pb_cfg = ((pb_cfg & ~PB_FAN_1_PULSE_MASK) | ((uval - 1) << 4));
   346		} else {
   347			dev_err(dev, "tach-pulses has invalid value for fan %d: %u\n",
   348					page, uval);
   349			return -EINVAL;
   350		}
   351	
   352		if (of_property_read_bool(child, "maxim,fan-health"))
   353			mfr_cfg |= MFR_FAN_CONFIG_HEALTH;
   354	
   355		if (of_property_read_bool(child, "maxim,fan-no-watchdog") ||
   356			of_property_read_bool(child, "maxim,tmp-no-fault-ramp"))
   357			mfr_cfg |= MFR_FAN_CONFIG_TSFO;
   358	
   359		if (of_property_read_bool(child, "maxim,fan-dual-tach"))
   360			mfr_cfg |= MFR_FAN_CONFIG_DUAL_TACH;
   361	
   362		if (of_property_read_bool(child, "maxim,fan-no-fault-ramp"))
   363			mfr_cfg |= MFR_FAN_CONFIG_TACHO;
   364	
   365		if (!of_property_read_u32(child, "maxim,fan-startup", &uval)) {
   366			uval /= 2;
   367			if (uval < 5) {
   368				mfr_cfg |= uval;
   369			} else {
   370				dev_err(dev, "maxim,fan-startup has invalid value for fan %d: %u\n",
   371						page, uval);
   372				return -EINVAL;
   373			}
   374		}
   375	
   376		if (!of_property_read_u32(child, "maxim,fan-ramp", &uval)) {
   377			if (uval < 8) {
   378				mfr_cfg |= uval << 5;
   379			} else {
   380				dev_err(dev, "maxim,fan-ramp has invalid value for fan %d: %u\n",
   381						page, uval);
   382				return -EINVAL;
   383			}
   384		}
   385	
   386		if (!of_property_read_u32(child, "maxim,tmp-hysteresis", &uval)) {
   387			uval /= 2;
   388			uval -= 1;
   389			if (uval < 4) {
   390				mfr_cfg |= uval << 10;
   391			} else {
   392				dev_err(dev, "maxim,tmp-hysteresis has invalid value for fan %d, %u\n",
   393						page, uval);
   394				return -EINVAL;
   395			}
   396		}
   397	
   398		if (!of_property_read_u32(child, "maxim,fan-pwm-freq", &uval)) {
   399			u16 val;
   400	
   401			if (uval == 30) {
   402				val = 0;
   403			} else if (uval == 50) {
   404				val = 1;
   405			} else if (uval == 100) {
   406				val = 2;
   407			} else if (uval == 150) {
   408				val = 3;
   409			} else if (uval == 25000) {
   410				val = 7;
   411			} else {
   412				dev_err(dev, "maxim,fan-pwm-freq has invalid value for fan %d: %u\n",
   413						page, uval);
   414				return -EINVAL;
   415			}
   416	
   417			mfr_cfg |= val << 13;
   418		}
   419	
   420		if (of_property_read_bool(child, "maxim,fan-fault-pin-mon"))
   421			mfr_fault_resp |= MFR_FAULT_RESPONSE_MONITOR;
   422	
   423		ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
   424						pb_cfg & ~PB_FAN_1_INSTALLED);
   425		if (ret < 0)
   426			return ret;
   427	
   428		ret = i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
   429		if (ret < 0)
   430			return ret;
   431	
   432		ret = i2c_smbus_write_byte_data(client, MFR_FAULT_RESPONSE,
   433						mfr_fault_resp);
   434		if (ret < 0)
   435			return ret;
   436	
   437		ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12, pb_cfg);
   438		if (ret < 0)
   439			return ret;
   440	
   441		/*
   442		 * Fans are on pages 0 - 5. If the page property of a fan node is
   443		 * greater than 5 we will have errored in checks above out above.
   444		 * Therefore we don't need to cope with values up to 31, and the int
   445		 * return type is enough.
   446		 *
   447		 * The bit mask return value is used to populate a bitfield of fans
   448		 * who are both configured in the devicetree _and_ reported as
   449		 * installed by the hardware. Any fans that are not configured in the
   450		 * devicetree but are reported as installed by the hardware will have
   451		 * their hardware configuration updated to unset the installed bit.
   452		 */
   453		return BIT(page);
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
