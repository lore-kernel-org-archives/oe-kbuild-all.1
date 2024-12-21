Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15817C68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 01:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734744162; cv=none; b=uQFg4lvrT+WoUZZpJJkfVSSU1cZqz5x1qqGWF8lxYKt/gPjqmwBeTyTxz/+6/xXfPrDESKH3vv4BhlBZruKK0aqo1cnfEnegnBaiBm5mWz3KDiOUxiimVqHH4jJ1DtPLj1sjPKU3hh2VX+hPNLkYNxf1IFQw6IPoPdc1JG3zeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734744162; c=relaxed/simple;
	bh=aYSu/W5+rCWWnlEFml2d6alccneCmIlAQhXYuTWTK0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wf84Zi7uVtrcd8vURoKKuyXiepzjZKlH/O7vM68mujCcJ4TbMirT4b5pkjA7cdJNUGYen/BGp5YL4iqTfab2AlxbismHv0WEV9jzjC+l3jKmxHSc7mIzR+qy15yLl/Acj2rR7Zp1pC5y1mFQvTrcZJR3gb9RQrz1nT6Mh0azX74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJcfpmj7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJcfpmj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734744160; x=1766280160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYSu/W5+rCWWnlEFml2d6alccneCmIlAQhXYuTWTK0g=;
  b=bJcfpmj7Dvvpss6jF632BmuztW+IdSlgRDAt6SCH7YqTd34W0iWK3bev
   wWoUvIiA0bQWOTzhRBYugPiy6KCXcKzJuXrgczhYpw9idUdMFKVYhWL/u
   OpHmYeYrQLBnkIdC2efDk7ti7QOJdfWllsKwFrNIWJQqZr7j4a6G7zyaD
   WPeFg53RQyUbkIrXWEPkl/zdNPSqCt8OD7E96utIrIL1OERmL90VW5l1P
   Fzye7s5jtW0pu9s2w3Jxk8S2m15g+IrgYzx/A5N9b3GHz8gOuETBa5Dh7
   LHNbjj1bUtMaB4GKiIb9gjQ1gmLjgsbEjnMYR5t442XPn55SgMv/E9Bw/
   A==;
X-CSE-ConnectionGUID: Fud2FIQURx6X2BsxcEkk7w==
X-CSE-MsgGUID: oTVLB/jeRf+V2bpLPtPfgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46307866"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="46307866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:22:38 -0800
X-CSE-ConnectionGUID: DMfajBtAQBK5Kdi8+dZpGw==
X-CSE-MsgGUID: GtG+/SwwT9OEc+1EKjQgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="103522218"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2024 17:22:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOoCQ-0001pc-1x;
	Sat, 21 Dec 2024 01:22:34 +0000
Date: Sat, 21 Dec 2024 09:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/leds/led-core.c:461:78: warning: 'snprintf' output may be
 truncated before the last format character
Message-ID: <202412210924.TRBZsDii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: bb4e9af0348dfeafd66c7e7f82e8a0983fe5390c leds: core: Add support for composing LED class device names
date:   5 years ago
config: x86_64-randconfig-077-20241209 (https://download.01.org/0day-ci/archive/20241221/202412210924.TRBZsDii-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210924.TRBZsDii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210924.TRBZsDii-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/led-core.c: In function 'led_compose_name':
>> drivers/leds/led-core.c:461:78: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     461 |                         snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
         |                                                                              ^
   drivers/leds/led-core.c:461:25: note: 'snprintf' output 2 or more bytes (assuming 65) into a destination of size 64
     461 |                         snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     462 |                                  devicename, tmp_buf);
         |                                  ~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +461 drivers/leds/led-core.c

   421	
   422	int led_compose_name(struct device *dev, struct led_init_data *init_data,
   423			     char *led_classdev_name)
   424	{
   425		struct led_properties props = {};
   426		struct fwnode_handle *fwnode = init_data->fwnode;
   427		const char *devicename = init_data->devicename;
   428	
   429		if (!led_classdev_name)
   430			return -EINVAL;
   431	
   432		led_parse_fwnode_props(dev, fwnode, &props);
   433	
   434		if (props.label) {
   435			/*
   436			 * If init_data.devicename is NULL, then it indicates that
   437			 * DT label should be used as-is for LED class device name.
   438			 * Otherwise the label is prepended with devicename to compose
   439			 * the final LED class device name.
   440			 */
   441			if (!devicename) {
   442				strscpy(led_classdev_name, props.label,
   443					LED_MAX_NAME_SIZE);
   444			} else {
   445				snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
   446					 devicename, props.label);
   447			}
   448		} else if (props.function || props.color_present) {
   449			char tmp_buf[LED_MAX_NAME_SIZE];
   450	
   451			if (props.func_enum_present) {
   452				snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
   453					 props.color_present ? led_colors[props.color] : "",
   454					 props.function ?: "", props.func_enum);
   455			} else {
   456				snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
   457					 props.color_present ? led_colors[props.color] : "",
   458					 props.function ?: "");
   459			}
   460			if (init_data->devname_mandatory) {
 > 461				snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
