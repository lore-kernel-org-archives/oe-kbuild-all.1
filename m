Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0E25785D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592756; cv=none; b=ArPD0r2+e180/91oDDOGoQPxgF7fdAYJ+vm0pWmJBSxJEJ2WzqoxS/3uC03v2ALQNThcTBPwa9dbyeQUBsLOzuoEDqLPkjps7JKhU0h5aCUShBVFx+huEWCvwuGDayeigMa+1rFTtWirCbqjnt8LpyHYl5OWu99mL6aZ3y6KEHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592756; c=relaxed/simple;
	bh=dBECmhkeokGQu7cx2vbSimB0pHKqGnGcQyRXBlDKdp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSKfWAR+LFJ28H8oOLisxA8cG7QaPqLQlR8oAVH45mMBFTy3F/pVxxTzCvJnFy0FCfUf5/qxbei2kNtGnTHcjZgqD0zQDE3jlU7EnttQ0Qqe4EajeemddzfIJA31u7ghzK1v9AmAz5EX+u4U6cMebGle4rw6JFXP3hS3/CT6gcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YweKeawK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YweKeawK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592754; x=1797128754;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dBECmhkeokGQu7cx2vbSimB0pHKqGnGcQyRXBlDKdp8=;
  b=YweKeawK1wyAZ/4AIQIcfAFe4LZZhXxFxx9A3RMZZtkzsyhytFxRrt+8
   /W6TS5lio6ZhKo/dfuf2uJLteXrvL0OZHQE/KxXckDvgP+x98PNSwZs5J
   rCj8/XhtmZRtHGAM84uS13K3q8RDO8VAGzm3lxXElq4Dt43YgZZfhImsR
   +C7s0EtOENyY3G2yV1zHNVkWfWZMyNJ9DeRF1oXcjlxRO2BLYG8AnWUjQ
   3+bOFsyDDY41ZzvctXFCQzyqJtx1U0s+oesZlVlYDYkwyaEwj9GVDoB6a
   bSbSya6lAIq3P1yJX/okB9AJaHm3RjtbNXxqPBUzwU468gVsVJobOMcb3
   w==;
X-CSE-ConnectionGUID: JzShw4/yQfiRt+FE0JpP6w==
X-CSE-MsgGUID: 5nOdFX+pTgeDU3lNIEAQIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66768506"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66768506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:25:52 -0800
X-CSE-ConnectionGUID: QQuddDtmSjK65ID9VpkdSQ==
X-CSE-MsgGUID: GxUxBppFQw+Tbk31crzs4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196305678"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 18:25:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFKO-000000006wB-1imE;
	Sat, 13 Dec 2025 02:25:48 +0000
Date: Sat, 13 Dec 2025 10:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/leds/leds-spi-byte.c:99:26: warning: variable 'child' is
 uninitialized when used here
Message-ID: <202512131020.PwKPBMVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: 36e2bc79af362bb81aa9916df4e4e0aae16b4f3e [0/1] leds: spi-byte: Call of_node_put() on error path
config: i386-randconfig-053-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131020.PwKPBMVL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131020.PwKPBMVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131020.PwKPBMVL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-spi-byte.c:99:26: warning: variable 'child' is uninitialized when used here [-Wuninitialized]
      99 |         of_property_read_string(child, "label", &name);
         |                                 ^~~~~
   drivers/leds/leds-spi-byte.c:83:27: note: initialize the variable 'child' to silence this warning
      83 |         struct device_node *child;
         |                                  ^
         |                                   = NULL
   1 warning generated.


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
e9a804d7a42843 Christian Mauderer 2019-05-13  100  	strlcpy(led->name, name, sizeof(led->name));
e9a804d7a42843 Christian Mauderer 2019-05-13  101  	led->spi = spi;
e9a804d7a42843 Christian Mauderer 2019-05-13  102  	mutex_init(&led->mutex);
2779f4724b2ff0 Marek Behún        2020-09-18  103  	led->cdef = device_get_match_data(dev);
e9a804d7a42843 Christian Mauderer 2019-05-13  104  	led->ldev.name = led->name;
e9a804d7a42843 Christian Mauderer 2019-05-13  105  	led->ldev.brightness = LED_OFF;
e9a804d7a42843 Christian Mauderer 2019-05-13  106  	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
e9a804d7a42843 Christian Mauderer 2019-05-13  107  	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
e9a804d7a42843 Christian Mauderer 2019-05-13  108  
36e2bc79af362b Andy Shevchenko    2024-06-06  109  	child = of_get_next_available_child(dev_of_node(dev), NULL);
e9a804d7a42843 Christian Mauderer 2019-05-13  110  	state = of_get_property(child, "default-state", NULL);
e9a804d7a42843 Christian Mauderer 2019-05-13  111  	if (state) {
e9a804d7a42843 Christian Mauderer 2019-05-13  112  		if (!strcmp(state, "on")) {
e9a804d7a42843 Christian Mauderer 2019-05-13  113  			led->ldev.brightness = led->ldev.max_brightness;
e9a804d7a42843 Christian Mauderer 2019-05-13  114  		} else if (strcmp(state, "off")) {
36e2bc79af362b Andy Shevchenko    2024-06-06  115  			of_node_put(child);
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
36e2bc79af362b Andy Shevchenko    2024-06-06  126  		of_node_put(child);
e9a804d7a42843 Christian Mauderer 2019-05-13  127  		mutex_destroy(&led->mutex);
e9a804d7a42843 Christian Mauderer 2019-05-13  128  		return ret;
e9a804d7a42843 Christian Mauderer 2019-05-13  129  	}
36e2bc79af362b Andy Shevchenko    2024-06-06  130  
36e2bc79af362b Andy Shevchenko    2024-06-06  131  	of_node_put(child);
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
