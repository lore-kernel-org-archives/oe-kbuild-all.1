Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839C1DFF0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727645778; cv=none; b=p15OaShUII69TMkW+OAQ4c5nAJqtofXuSAjqiUCJjzownSeRkRpTX0YaguniEJdKyzuhzCfp3oJT6y93Q06k1iFwQHPbpodKymkvOLjKyk+rgVJzZKBl84s6lcw3SncSHtzeGbyWUOYBidjNDYooodG0mtNGxCx36zckjctywHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727645778; c=relaxed/simple;
	bh=2Oah62k61/Z7+3bSJsRiNchYwabNxNfjYnNzt1SPscs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvZQXg2BcX9ig6KPTv2OkyV6pvwBcvawBbYMFTd5+ejExZ3n4HQIMvNMt9au6uwv9OACMpnuoLkyADBcoq2L/vCoFo5S0uMEoBpxEkOGUZIb3HFcxy6CTiwzNUS8oSKpWPAPvXSSl4GYKZXncdWdKLzP3KCdVMFalciz8dD/llA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EazTYr6p; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EazTYr6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727645777; x=1759181777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Oah62k61/Z7+3bSJsRiNchYwabNxNfjYnNzt1SPscs=;
  b=EazTYr6pn6f6qv10Pe3Lu9bi0iDtOKEi1EAV1A9ftD4E0mVyecimHHD2
   WJ2qdmWsWw2Mbww0Yyt12ENqde93X7Fi62e8bGIofPOxxmdGmVRxYtq43
   0sxgSWnD6bcnDMPsLfBToGV7NNMLj0JsYOm1JZhIE0wLqD7iR5XnjchjS
   YZ+5if6kFdUM3w/woCNPgTMc75oQPEr1Cwgh4e+WvIrinlrTG4pwf2ccY
   IsFcy5UvLv/DKI3elLDT/HAT9WLAuLW2i1L9rpU4mk48B4AuFOCgDB9KN
   Gp0C83M8MCNDq1UXKAsQ/a/Sme4OWHyGMH9g5GLGKmpOrro0CtzIySy6s
   Q==;
X-CSE-ConnectionGUID: MwNvv3YtTeeYq2jIkyqEzg==
X-CSE-MsgGUID: u3PJduZkTKeh6SwbmWFlBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30424172"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="30424172"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 14:36:16 -0700
X-CSE-ConnectionGUID: JQ397xI4SYe8jUGwF4gC8w==
X-CSE-MsgGUID: VrDvV5CQQgmyra+Gxev8SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73888311"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2024 14:36:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv1aO-000Ojh-1N;
	Sun, 29 Sep 2024 21:36:12 +0000
Date: Mon, 30 Sep 2024 05:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw-conversion 7/14]
 drivers/input/keyboard/adp5589-keys.c:999:39: warning: format '%zu' expects
 argument of type 'size_t', but argument 4 has type 'u32' {aka 'unsigned
 int'}
Message-ID: <202409300535.JfZTCmCi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw-conversion
head:   d8f775093f32be0f662a6093041d941d372d4830
commit: b6abc9f63f6e47bc7ed2772edeb85381a0f5da67 [7/14] Input: adp5589-keys: add support for fw properties
config: x86_64-buildonly-randconfig-004-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300535.JfZTCmCi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300535.JfZTCmCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300535.JfZTCmCi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/keyboard/adp5589-keys.c:17:
   drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpiomap_get_hwirq':
   include/linux/irq.h:1300:25: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
    1300 | #define INVALID_HWIRQ   (~0UL)
         |                         ^
   drivers/input/keyboard/adp5589-keys.c:763:16: note: in expansion of macro 'INVALID_HWIRQ'
     763 |         return INVALID_HWIRQ;
         |                ^~~~~~~~~~~~~
   drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_validate_key':
   drivers/input/keyboard/adp5589-keys.c:970:35: error: 'const struct adp5589_info' has no member named 'col_shift'
     970 |             BIT(col) << kpad->info->col_shift & kpad->keypad_en_mask)
         |                                   ^~
   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from drivers/input/keyboard/adp5589-keys.c:23:
   drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_parse_key_array':
>> drivers/input/keyboard/adp5589-keys.c:999:39: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     999 |                 dev_err(&client->dev, "Invalid number of keys(%u > %zu) for %s\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/input/keyboard/adp5589-keys.c:999:17: note: in expansion of macro 'dev_err'
     999 |                 dev_err(&client->dev, "Invalid number of keys(%u > %zu) for %s\n",
         |                 ^~~~~~~
   drivers/input/keyboard/adp5589-keys.c:999:70: note: format string is defined here
     999 |                 dev_err(&client->dev, "Invalid number of keys(%u > %zu) for %s\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long unsigned int
         |                                                                    %u


vim +999 drivers/input/keyboard/adp5589-keys.c

   978	
   979	static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
   980					   u32 *keys, u32 *n_keys, u32 max_keys,
   981					   bool reset_key)
   982	{
   983		struct i2c_client *client = kpad->client;
   984		unsigned int key, max_keypad;
   985		int ret;
   986	
   987		ret = device_property_count_u32(&client->dev, prop);
   988		if (ret < 0)
   989			return 0;
   990	
   991		*n_keys = ret;
   992	
   993		if (kpad->info->is_adp5585 && !reset_key) {
   994			dev_err(&client->dev, "Unlock keys not supported for adp5585\n");
   995			return -EOPNOTSUPP;
   996		}
   997	
   998		if (*n_keys  > max_keys) {
 > 999			dev_err(&client->dev, "Invalid number of keys(%u > %zu) for %s\n",
  1000				*n_keys, max_keys, prop);
  1001			return -EINVAL;
  1002		}
  1003	
  1004		ret = device_property_read_u32_array(&client->dev, prop, keys, *n_keys);
  1005		if (ret)
  1006			return ret;
  1007	
  1008		max_keypad = (kpad->info->var->max_row_num + 1) * (kpad->info->var->max_col_num + 1);
  1009	
  1010		for (key = 0; key < *n_keys; key++) {
  1011			/* part of the keypad... */
  1012			if (in_range(keys[key], 1, max_keypad)) {
  1013				/* is it part of the keypad?! */
  1014				ret = adp5589_validate_key(kpad, keys[key], false);
  1015				if (ret)
  1016					return ret;
  1017	
  1018				continue;
  1019			}
  1020	
  1021			/* part of gpio-keys... */
  1022			if (in_range(keys[key], kpad->info->var->gpi_pin_base,
  1023				     kpad->info->var->maxgpio)) {
  1024				/* is the GPI being used as part of the keypad?! */
  1025				ret = adp5589_validate_key(kpad, keys[key], true);
  1026				if (ret)
  1027					return ret;
  1028	
  1029				continue;
  1030			}
  1031	
  1032			/* wildcard unlock event... */
  1033			if (!reset_key && keys[key] == 127)
  1034				continue;
  1035	
  1036			dev_err(&client->dev, "Invalid key(%u) for %s\n", keys[key],
  1037				prop);
  1038	
  1039			return -EINVAL;
  1040		}
  1041	
  1042		return 0;
  1043	}
  1044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
