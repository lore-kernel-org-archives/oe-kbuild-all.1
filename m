Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3356CA937
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754246529; cv=none; b=Yj33TnHKPc+7DrmFc3PMlSJ8QKBf/rR06346kjUYjGGAgYo3qulL0nNgJPXRDfp84A7pvbmyMCjzODmonuqzbU1ubTVoqNIalNAtMDTErz+Sll/RqP7sU0TbZatqagDOUNVwcYyLEoTH7RZPpuvc4zt2MWXmZvnPRK9tSGoKlKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754246529; c=relaxed/simple;
	bh=nnKnIvi1y4K+ikuaUNlRjqDgX0PRLih4V1JWRP/wulk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUcnni1e2pc2h9uG41TDX8DyIXxwu7NtqaBZ6ZV0n8cCuK6FcFeS0H5eBQrxh4amVNxsYzTcra1g9Kc3rO1ao97J+qC1CRgFHrSll0+a8JVR5KppvGJus43x1qMkVYyq9jMpQq2qW2VPgL9Req/npMVBwAM46wXRzTRC1FoUz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IowhSHsV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IowhSHsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754246527; x=1785782527;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nnKnIvi1y4K+ikuaUNlRjqDgX0PRLih4V1JWRP/wulk=;
  b=IowhSHsVCeRcYNuUekh2iEVBCZAIvzgR42fDz+q1aJwCHX4pYjE8cCXV
   oe9utMqJusJeDVjN4H0gh48bPks1O7rMNGECJ2tKy3aTdn8Cqj0r2FGlX
   iN+gZUZ9Zg8j/ewNDhYNjifwEmxyNHmwLPhdbS7pMeeQ8C2g4+h7h5kW8
   XW9dnOnlBZu6tuMd6UKEZYwjVWMw3mR8koV119tdpI6ZuG7ss6uwwobac
   FW6/Ntk2dWcV3qFsDD+71mEL0uoK+4woVn4uGWlK7CHfC13xVQrMDP6uv
   UlLDu28Ut2ccC/I2fZKfX+eplMia3/D80/HgwOHsnrlVI+xQsG0LUp5JC
   Q==;
X-CSE-ConnectionGUID: w28/Z/eaR4iRyCt6XTS6+g==
X-CSE-MsgGUID: sCFKPoIxRFW0kLY6xNQd2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56652534"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56652534"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 11:42:06 -0700
X-CSE-ConnectionGUID: 9MKpRgDZTK+k6e6ywSMUZQ==
X-CSE-MsgGUID: YN3Rau1cThucl/AOpcTxhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168166461"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2025 11:42:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uidek-0001fP-37;
	Sun, 03 Aug 2025 18:42:02 +0000
Date: Sun, 3 Aug 2025 20:41:44 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/leds/leds-spi-byte.c:99:26: warning: variable 'child' is
 uninitialized when used here
Message-ID: <202508032024.W56TVmXc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c1a4113af4ffd59599729ba53e1fdc4b44429bc7
commit: 56b7104b823bda22b379cca7d140f67a476de6d5 [1/1] leds: spi-byte: Call of_node_put() on error path
config: arm-randconfig-2003-20250803 (https://download.01.org/0day-ci/archive/20250803/202508032024.W56TVmXc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508032024.W56TVmXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508032024.W56TVmXc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-spi-byte.c:34:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/leds/leds-spi-byte.c:99:26: warning: variable 'child' is uninitialized when used here [-Wuninitialized]
      99 |         of_property_read_string(child, "label", &name);
         |                                 ^~~~~
   drivers/leds/leds-spi-byte.c:83:27: note: initialize the variable 'child' to silence this warning
      83 |         struct device_node *child;
         |                                  ^
         |                                   = NULL
   2 warnings generated.


vim +/child +99 drivers/leds/leds-spi-byte.c

e9a804d7a42843 Christian Mauderer 2019-05-13   80  
e9a804d7a42843 Christian Mauderer 2019-05-13   81  static int spi_byte_probe(struct spi_device *spi)
e9a804d7a42843 Christian Mauderer 2019-05-13   82  {
e9a804d7a42843 Christian Mauderer 2019-05-13   83  	struct device_node *child;
e9a804d7a42843 Christian Mauderer 2019-05-13   84  	struct device *dev = &spi->dev;
e9a804d7a42843 Christian Mauderer 2019-05-13   85  	struct spi_byte_led *led;
e9a804d7a42843 Christian Mauderer 2019-05-13   86  	const char *name = "leds-spi-byte::";
e9a804d7a42843 Christian Mauderer 2019-05-13   87  	const char *state;
e9a804d7a42843 Christian Mauderer 2019-05-13   88  	int ret;
e9a804d7a42843 Christian Mauderer 2019-05-13   89  
99a013c840a050 Marek Behún        2020-09-18   90  	if (of_get_available_child_count(dev_of_node(dev)) != 1) {
e9a804d7a42843 Christian Mauderer 2019-05-13   91  		dev_err(dev, "Device must have exactly one LED sub-node.");
e9a804d7a42843 Christian Mauderer 2019-05-13   92  		return -EINVAL;
e9a804d7a42843 Christian Mauderer 2019-05-13   93  	}
e9a804d7a42843 Christian Mauderer 2019-05-13   94  
e9a804d7a42843 Christian Mauderer 2019-05-13   95  	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
e9a804d7a42843 Christian Mauderer 2019-05-13   96  	if (!led)
e9a804d7a42843 Christian Mauderer 2019-05-13   97  		return -ENOMEM;
e9a804d7a42843 Christian Mauderer 2019-05-13   98  
e9a804d7a42843 Christian Mauderer 2019-05-13  @99  	of_property_read_string(child, "label", &name);
bf4a35e9201d30 Azeem Shaikh       2023-05-23  100  	strscpy(led->name, name, sizeof(led->name));
e9a804d7a42843 Christian Mauderer 2019-05-13  101  	led->spi = spi;
e9a804d7a42843 Christian Mauderer 2019-05-13  102  	mutex_init(&led->mutex);
2779f4724b2ff0 Marek Behún        2020-09-18  103  	led->cdef = device_get_match_data(dev);
e9a804d7a42843 Christian Mauderer 2019-05-13  104  	led->ldev.name = led->name;
e9a804d7a42843 Christian Mauderer 2019-05-13  105  	led->ldev.brightness = LED_OFF;
e9a804d7a42843 Christian Mauderer 2019-05-13  106  	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
e9a804d7a42843 Christian Mauderer 2019-05-13  107  	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
e9a804d7a42843 Christian Mauderer 2019-05-13  108  
56b7104b823bda Andy Shevchenko    2024-06-06  109  	child = of_get_next_available_child(dev_of_node(dev), NULL);
e9a804d7a42843 Christian Mauderer 2019-05-13  110  	state = of_get_property(child, "default-state", NULL);
e9a804d7a42843 Christian Mauderer 2019-05-13  111  	if (state) {
e9a804d7a42843 Christian Mauderer 2019-05-13  112  		if (!strcmp(state, "on")) {
e9a804d7a42843 Christian Mauderer 2019-05-13  113  			led->ldev.brightness = led->ldev.max_brightness;
e9a804d7a42843 Christian Mauderer 2019-05-13  114  		} else if (strcmp(state, "off")) {
56b7104b823bda Andy Shevchenko    2024-06-06  115  			of_node_put(child);
e9a804d7a42843 Christian Mauderer 2019-05-13  116  			/* all other cases except "off" */
e9a804d7a42843 Christian Mauderer 2019-05-13  117  			dev_err(dev, "default-state can only be 'on' or 'off'");
e9a804d7a42843 Christian Mauderer 2019-05-13  118  			return -EINVAL;
e9a804d7a42843 Christian Mauderer 2019-05-13  119  		}
e9a804d7a42843 Christian Mauderer 2019-05-13  120  	}
e9a804d7a42843 Christian Mauderer 2019-05-13  121  	spi_byte_brightness_set_blocking(&led->ldev,
e9a804d7a42843 Christian Mauderer 2019-05-13  122  					 led->ldev.brightness);
e9a804d7a42843 Christian Mauderer 2019-05-13  123  
e9a804d7a42843 Christian Mauderer 2019-05-13  124  	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
e9a804d7a42843 Christian Mauderer 2019-05-13  125  	if (ret) {
56b7104b823bda Andy Shevchenko    2024-06-06  126  		of_node_put(child);
e9a804d7a42843 Christian Mauderer 2019-05-13  127  		mutex_destroy(&led->mutex);
e9a804d7a42843 Christian Mauderer 2019-05-13  128  		return ret;
e9a804d7a42843 Christian Mauderer 2019-05-13  129  	}
56b7104b823bda Andy Shevchenko    2024-06-06  130  
56b7104b823bda Andy Shevchenko    2024-06-06  131  	of_node_put(child);
e9a804d7a42843 Christian Mauderer 2019-05-13  132  	spi_set_drvdata(spi, led);
e9a804d7a42843 Christian Mauderer 2019-05-13  133  
e9a804d7a42843 Christian Mauderer 2019-05-13  134  	return 0;
e9a804d7a42843 Christian Mauderer 2019-05-13  135  }
e9a804d7a42843 Christian Mauderer 2019-05-13  136  

:::::: The code at line 99 was first introduced by commit
:::::: e9a804d7a428432d8ad0bc7984f459daf0cc4da3 leds: spi-byte: add single byte SPI LED driver

:::::: TO: Christian Mauderer <oss@c-mauderer.de>
:::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
