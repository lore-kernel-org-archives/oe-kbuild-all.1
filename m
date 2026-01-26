Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE483EBF21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769388190; cv=none; b=e0pDXM4AwQRpJxfvzl5ChNBuX6UgHSJOTUwaUnQeQpyWWuXSVYlyIe3CrYy9N9Wuh53xWkljG7aCKR1UpX7RuvBF84zGX89+q9JUOMIFBbzh1fpEsiLC40lOP/UE+LpGdPCSEfX6sUQDVSRnWIbHyLJIb4IsWG8a0S8aVsxBgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769388190; c=relaxed/simple;
	bh=VnxwiVUQbo6wPLW63sXQQ2Jx2CtCVrn7KJKx/EQfvbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sybu+re56XWFNQ4MMkKUN/CGt8NL8zeUFG9rvn8Tpglro1jZpUyg1t0ViLL80zQOruLTiN0CNesCmIVMOqXFKoGGuLGQcaUIjOhllV7amUe5kPuZgSNy/QXfVGswhx4I3pC/OJsZwh9ga16iZfnDwbNEQ9CvQ7QDzlza+J/DXB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKbXOf6o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKbXOf6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769388189; x=1800924189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VnxwiVUQbo6wPLW63sXQQ2Jx2CtCVrn7KJKx/EQfvbI=;
  b=lKbXOf6oW9GGfOYTCgbgG5Htr70UO1V3oW6yB0OO4ctcrEYX/KFJPCdM
   cObddqvsauOKRK9imxjK5IHrpcB57KpVykhVjdydtJxSESYYbQwZXxrJr
   rWhu79sNvP9J1drbQ6Qd/sMcYPz4rS8+j7pHvSKAku7vwMzWdIDlXnAzN
   vv90GNtaGBl9GhMmFJTNJ02ehpeA4b7HWn6iUAOLP1yaBwWC2eHAKdmXK
   jFUpQ26cxOi9BtNVuSy4UmIOtK5DvEnUcGig/2q7MdEnUCC8BbLq2I/9N
   nL2y8GkO2Dzw42PP/BkDumfDh17+pmJGJn5R0VTvT1P1OcfAZk9vt9ICk
   Q==;
X-CSE-ConnectionGUID: Ds5eg6NtSziJCl+/bHlsEg==
X-CSE-MsgGUID: 4w0pyVBGRJ2y7zx3nkHHBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70537636"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70537636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 16:43:08 -0800
X-CSE-ConnectionGUID: 6xeDyHp5RYOBD9ApLh5SYQ==
X-CSE-MsgGUID: pAYEhxp4QFCVdUk0SvLB3Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2026 16:43:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkAh5-00000000WlW-42aJ;
	Mon, 26 Jan 2026 00:43:03 +0000
Date: Mon, 26 Jan 2026 08:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] leds: add delay_on, delay_off and invert
 attributes to disk trigger
Message-ID: <202601260838.SQV9xW9Z-lkp@intel.com>
References: <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>

Hi Markus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/leds-dt-bindings-add-disk-trigger-led-pattern/20260124-030650
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260123-ledtrig_disk_-v1-3-07004756467b%40posteo.de
patch subject: [PATCH RFC 3/4] leds: add delay_on, delay_off and invert attributes to disk trigger
config: xtensa-randconfig-001-20260126 (https://download.01.org/0day-ci/archive/20260126/202601260838.SQV9xW9Z-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260838.SQV9xW9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260838.SQV9xW9Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/trigger/ledtrig-disk.c: In function 'pattern_init':
   drivers/leds/trigger/ledtrig-disk.c:119:2: error: cleanup argument not a function
     u32 *pattern __free(kfree) = led_get_default_pattern(led_cdev, &size);
     ^~~
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_activate':
   drivers/leds/trigger/ledtrig-disk.c:139:14: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
     disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
                 ^~~~~~~
                 xa_alloc
>> drivers/leds/trigger/ledtrig-disk.c:139:12: warning: assignment to 'struct ledtrig_disk_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
               ^
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_blink_oneshot':
   drivers/leds/trigger/ledtrig-disk.c:184:2: error: implicit declaration of function 'list_for_each_entry_rcu'; did you mean 'list_for_each_entry_from'? [-Werror=implicit-function-declaration]
     list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
     ^~~~~~~~~~~~~~~~~~~~~~~
     list_for_each_entry_from
   drivers/leds/trigger/ledtrig-disk.c:184:54: error: 'trig_list' undeclared (first use in this function); did you mean 'lru_list'?
     list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
                                                         ^~~~~~~~~
                                                         lru_list
   drivers/leds/trigger/ledtrig-disk.c:184:54: note: each undeclared identifier is reported only once for each function it appears in
   drivers/leds/trigger/ledtrig-disk.c:184:64: error: expected ';' before '{' token
     list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
                                                                   ^~
                                                                   ;
   drivers/leds/trigger/ledtrig-disk.c:181:28: warning: unused variable 'disk_data' [-Wunused-variable]
     struct ledtrig_disk_data *disk_data;
                               ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +139 drivers/leds/trigger/ledtrig-disk.c

   134	
   135	static int ledtrig_disk_activate(struct led_classdev *led_cdev)
   136	{
   137		struct ledtrig_disk_data *disk_data;
   138	
 > 139		disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
   140		if (!disk_data)
   141			return -ENOMEM;
   142	
   143		disk_data->delay_on = DEFAULT_BLINK_DELAY;
   144		disk_data->delay_off = DEFAULT_BLINK_DELAY;
   145	
   146		led_set_trigger_data(led_cdev, disk_data);
   147	
   148		if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
   149			pattern_init(led_cdev, disk_data);
   150			/*
   151			 * Mark as initialized even on pattern_init() error because
   152			 * any consecutive call to it would produce the same error.
   153			 */
   154			led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
   155		}
   156	
   157		led_set_brightness_nosleep(led_cdev, disk_data->invert ? LED_FULL : LED_OFF);
   158	
   159		return 0;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
